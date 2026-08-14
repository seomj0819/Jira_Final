import os
import io
import sys
from google import genai
from google.cloud import vision

# --- [0. 인코딩] ---
if sys.stdout.encoding != 'utf-8':
    sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding='utf-8')
    sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding='utf-8')

# --- [1. 설정] ---
# key.json 은 이 py 파일과 같은 폴더(scripts/)에 둔다
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = os.path.join(BASE_DIR, 'key.json')

MY_API_KEY = os.environ.get('GEMINI_API_KEY')
if not MY_API_KEY:
    print('{"tasks":[], "error":"GEMINI_API_KEY missing"}')
    sys.exit(1)


def run_total_process(img_path):
    # --- [2. OCR] ---
    vision_client = vision.ImageAnnotatorClient()

    with io.open(img_path, 'rb') as image_file:
        content = image_file.read()

    image = vision.Image(content=content)
    response = vision_client.text_detection(image=image)

    if not response.text_annotations:
        print('{"tasks":[]}')
        return

    raw_text = response.text_annotations[0].description

    # 로그는 stderr (Java 결과 파싱에 안 섞임)
    print("--- [OCR Raw Text] ---", file=sys.stderr)
    print(raw_text, file=sys.stderr)

    # --- [3. Gemini] ---
    client = genai.Client(api_key=MY_API_KEY)

    prompt = f"""
당신은 협업 툴의 태스크 생성 엔진입니다.
입력된 OCR 텍스트를 분석하여 DB의 TASK 테이블 구조에 맞는 데이터를 생성하세요.

[분석 및 매핑 규칙]
1. 유기적 상태 파악:
   - '해야할 일', '작업중', '한일' 등 상태를 나타내는 헤더를 기준으로 하위 항목들의 'status'를 결정하세요.
   - 매핑: '해야할 일' -> '해야 할 일', '작업중' -> '진행중', '한일' -> '완료'.

2. 데이터 추출 필드:
   - task_title: 업무의 제목 (핵심 요약)
   - task_describe: 업무에 수반된 구체적 설명이나 감정 표현을 제외한 상세 내용
   - due_date: 날짜 형식의 텍스트가 있다면 'YYYY-MM-DD'로 변환
   - label_title: 업무와 연관된 특정 키워드나 분류 (예: DB, Java, UI 등)

3. 사용자 개입 (무결성):
   - 텍스트에서 명확히 식별되지 않는 필드는 무조건 빈 문자열("")로 응답하세요.
   - 인식 불분명한 단어를 억지로 추측하여 채우지 마세요.

4. 필터링: 'ㅜ', '하기싫어', 'mona' 등 업무와 무관한 노이즈는 제거하세요.

[출력 JSON 스키마]
{{
  "tasks": [
    {{
      "task_title": "",
      "task_describe": "",
      "due_date": "",
      "label_title": "",
      "status": ""
    }}
  ]
}}

OCR 데이터:
{raw_text}
"""

    target_model = "gemini-3-flash-preview"
    print(f"--- [Gemini Analysis (Model: {target_model})] ---", file=sys.stderr)

    try:
        ai_response = client.models.generate_content(
            model=target_model,
            contents=prompt
        )

        text = (ai_response.text or "").strip()

        # ```json ... ``` 형태면 제거
        if text.startswith("```"):
            lines = text.splitlines()
            if lines and lines[0].startswith("```"):
                lines = lines[1:]
            if lines and lines[-1].startswith("```"):
                lines = lines[:-1]
            text = "\n".join(lines).strip()

        # stdout에는 JSON만 출력 (Java가 읽음)
        print(text)

    except Exception as e:
        print('{"tasks":[]}', file=sys.stdout)
        print(f"Error: {e}", file=sys.stderr)


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print('{"tasks":[]}')
        sys.exit(1)
    run_total_process(sys.argv[1])