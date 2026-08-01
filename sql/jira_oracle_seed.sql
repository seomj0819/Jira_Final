-- ============================================================
-- Sample seed data from JIRA_DataBase spreadsheet
-- Run after jira_oracle_schema.sql
-- ============================================================
SET DEFINE OFF;
WHENEVER SQLERROR CONTINUE

-- clean previous partial seed (keep color/image from schema)
DELETE FROM task;
DELETE FROM label;
DELETE FROM status;
DELETE FROM space_members;
DELETE FROM space;
DELETE FROM users;
-- reset sequences used by seed
DROP SEQUENCE seq_user_no;
DROP SEQUENCE seq_space_order;
DROP SEQUENCE seq_task_no;
DROP SEQUENCE seq_status_no;
CREATE SEQUENCE seq_user_no         START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_space_order     START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_task_no         START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_status_no       START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

WHENEVER SQLERROR EXIT SQL.SQLCODE

-- USERS (sheet samples)
INSERT INTO users (user_no, email, pw, google_api, user_name, image_no)
VALUES (seq_user_no.NEXTVAL, 'abcd44@naver.com', '1234qwer', NULL, 'mem1', 2);
INSERT INTO users (user_no, email, pw, google_api, user_name, image_no)
VALUES (seq_user_no.NEXTVAL, 'asdf123@gmail.com', NULL, 'google&api0', 'mem2', 2);
INSERT INTO users (user_no, email, pw, google_api, user_name, image_no)
VALUES (seq_user_no.NEXTVAL, 'seomj081923@gmail.com', NULL, 'google&api1', 'MJ', 2);
INSERT INTO users (user_no, email, pw, google_api, user_name, image_no)
VALUES (seq_user_no.NEXTVAL, 'khska44@gmail.com', NULL, 'google&api2', 'SK', 2);

-- SPACE
INSERT INTO space (space_key, space_title, space_order, space_status, image_no)
VALUES ('XKLT', 'ㅁㄴㅇㄹ', seq_space_order.NEXTVAL, 'Y', 1);
INSERT INTO space (space_key, space_title, space_order, space_status, image_no)
VALUES ('GAC1', '프로젝트 스페이스', seq_space_order.NEXTVAL, 'Y', 1);

-- SPACE_MEMBERS (app uses admin/editor/viewer)
INSERT INTO space_members (space_key, user_no, user_role) VALUES ('XKLT', 3, 'admin');
INSERT INTO space_members (space_key, user_no, user_role) VALUES ('XKLT', 4, 'editor');
INSERT INTO space_members (space_key, user_no, user_role) VALUES ('GAC1', 3, 'admin');
INSERT INTO space_members (space_key, user_no, user_role) VALUES ('GAC1', 4, 'editor');

-- STATUS defaults per space
INSERT INTO status VALUES (seq_status_no.NEXTVAL, 'XKLT', 1, '해야 할 일', 'red');
INSERT INTO status VALUES (seq_status_no.NEXTVAL, 'XKLT', 2, '진행중', 'blue');
INSERT INTO status VALUES (seq_status_no.NEXTVAL, 'XKLT', 3, '완료', 'green');
INSERT INTO status VALUES (seq_status_no.NEXTVAL, 'GAC1', 1, '해야 할 일', 'red');
INSERT INTO status VALUES (seq_status_no.NEXTVAL, 'GAC1', 2, '진행중', 'blue');
INSERT INTO status VALUES (seq_status_no.NEXTVAL, 'GAC1', 3, '완료', 'green');

-- LABEL
INSERT INTO label (label_title, space_key) VALUES ('오류', 'XKLT');
INSERT INTO label (label_title, space_key) VALUES ('오류', 'GAC1');
INSERT INTO label (label_title, space_key) VALUES ('ㅁㅅㄷㅎㄷㅅ호', 'GAC1');

-- TASK
INSERT INTO task (space_key, task_no, creator_no, worker_no, task_title, task_description,
                  due_date, label_title, status_no, priority, upper_task_no, task_order, image_no, summary)
VALUES ('XKLT', seq_task_no.NEXTVAL, 4, NULL, '가ㅓㅇㄹ', NULL, NULL, NULL, 1, 'Medium', NULL, 3, NULL, NULL);

INSERT INTO task (space_key, task_no, creator_no, worker_no, task_title, task_description,
                  due_date, label_title, status_no, priority, upper_task_no, task_order, image_no, summary)
VALUES ('XKLT', seq_task_no.NEXTVAL, 4, NULL, '닋ㅍ ㄹ', NULL, NULL, NULL, 1, 'Medium', NULL, 1, NULL, 'summary1');

INSERT INTO task (space_key, task_no, creator_no, worker_no, task_title, task_description,
                  due_date, label_title, status_no, priority, upper_task_no, task_order, image_no, summary)
VALUES ('GAC1', seq_task_no.NEXTVAL, 4, NULL, '혹ㅁㅎ램', 'ㅜ갶ㄱ먀헝ㄷㄱ머ㅣ',
        TO_DATE('2026-04-28','YYYY-MM-DD'), 'ㅁㅅㄷㅎㄷㅅ호', 4, 'Low', NULL, 2, NULL, NULL);

INSERT INTO task (space_key, task_no, creator_no, worker_no, task_title, task_description,
                  due_date, label_title, status_no, priority, upper_task_no, task_order, image_no, summary)
VALUES ('GAC1', seq_task_no.NEXTVAL, 4, NULL, 'ㄻㄴ어ㅏㅣㄷ곳', NULL, NULL, NULL, 4, 'High', NULL, 1, NULL, NULL);

COMMIT;

SELECT 'users' AS t, COUNT(*) AS cnt FROM users
UNION ALL SELECT 'space', COUNT(*) FROM space
UNION ALL SELECT 'space_members', COUNT(*) FROM space_members
UNION ALL SELECT 'status', COUNT(*) FROM status
UNION ALL SELECT 'label', COUNT(*) FROM label
UNION ALL SELECT 'task', COUNT(*) FROM task
UNION ALL SELECT 'color', COUNT(*) FROM color
UNION ALL SELECT 'image', COUNT(*) FROM image;
EXIT;
