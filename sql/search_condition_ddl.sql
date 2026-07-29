-- ============================================================
-- Search Condition 관련 Oracle DDL
-- 상위: search_condition
-- 하위: sc_detail_*, search_condition_access
-- 핵심: 상위 삭제 시 하위 전부 ON DELETE CASCADE
--
-- ※ 기존 MyBatis(SearchConditionMapper.xml) 테이블/시퀀스명에 맞춤
-- ※ space / users / status 테이블이 먼저 존재해야 함
-- ============================================================

------------------------------------------------------------
-- 1. Sequences
------------------------------------------------------------
CREATE SEQUENCE seq_condition_no
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_scd_space_no
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_scd_worker_no
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_scd_creator_no
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_scd_priority_no
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_scd_status_no
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE seq_scd_due_date_no
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

------------------------------------------------------------
-- 2. 상위 테이블: search_condition
------------------------------------------------------------
CREATE TABLE search_condition (
    search_condition_no          NUMBER         NOT NULL,
    search_condition_title       VARCHAR2(100)  NOT NULL,
    search_condition_description VARCHAR2(255),
    operator_space               CHAR(3),
    operator_worker              CHAR(3),
    operator_creator             CHAR(3),
    operator_priority            CHAR(3),
    operator_status              CHAR(3),
    operator_due_date            CHAR(3),
    favorite                     CHAR(1)        DEFAULT 'N' NOT NULL,
    CONSTRAINT pk_search_condition PRIMARY KEY (search_condition_no),
    CONSTRAINT chk_sc_favorite CHECK (favorite IN ('Y', 'N'))
);

------------------------------------------------------------
-- 3. 하위 상세 테이블들 (부모 삭제 시 CASCADE)
------------------------------------------------------------

-- 3-1. Space 조건
CREATE TABLE sc_detail_space (
    sc_detail_space_no  NUMBER        NOT NULL,
    search_condition_no NUMBER        NOT NULL,
    space_key           VARCHAR2(20)  NOT NULL,
    CONSTRAINT pk_sc_detail_space PRIMARY KEY (sc_detail_space_no),
    CONSTRAINT fk_scds_condition FOREIGN KEY (search_condition_no)
        REFERENCES search_condition (search_condition_no)
        ON DELETE CASCADE,
    CONSTRAINT fk_scds_space FOREIGN KEY (space_key)
        REFERENCES space (space_key)
);

-- 3-2. Worker 조건
CREATE TABLE sc_detail_worker (
    sc_detail_worker_no NUMBER NOT NULL,
    search_condition_no NUMBER NOT NULL,
    worker_no           NUMBER NOT NULL,
    CONSTRAINT pk_sc_detail_worker PRIMARY KEY (sc_detail_worker_no),
    CONSTRAINT fk_scdw_condition FOREIGN KEY (search_condition_no)
        REFERENCES search_condition (search_condition_no)
        ON DELETE CASCADE,
    CONSTRAINT fk_scdw_user FOREIGN KEY (worker_no)
        REFERENCES users (user_no)
);

-- 3-3. Creator 조건
CREATE TABLE sc_detail_creator (
    sc_detail_creator_no NUMBER NOT NULL,
    search_condition_no  NUMBER NOT NULL,
    creator_no           NUMBER NOT NULL,
    CONSTRAINT pk_sc_detail_creator PRIMARY KEY (sc_detail_creator_no),
    CONSTRAINT fk_scdc_condition FOREIGN KEY (search_condition_no)
        REFERENCES search_condition (search_condition_no)
        ON DELETE CASCADE,
    CONSTRAINT fk_scdc_user FOREIGN KEY (creator_no)
        REFERENCES users (user_no)
);

-- 3-4. Priority 조건
-- priority는 task.priority 값(High/Medium 등)을 담는 필터 값이라
-- task 테이블에 UNIQUE가 아니므로 FK는 걸지 않음
CREATE TABLE sc_detail_priority (
    sc_detail_priority_no NUMBER       NOT NULL,
    search_condition_no   NUMBER       NOT NULL,
    priority              VARCHAR2(20) NOT NULL,
    CONSTRAINT pk_sc_detail_priority PRIMARY KEY (sc_detail_priority_no),
    CONSTRAINT fk_scdp_condition FOREIGN KEY (search_condition_no)
        REFERENCES search_condition (search_condition_no)
        ON DELETE CASCADE
);

-- 3-5. Status 조건
CREATE TABLE sc_detail_status (
    sc_detail_status_no NUMBER NOT NULL,
    search_condition_no NUMBER NOT NULL,
    status_no           NUMBER NOT NULL,
    CONSTRAINT pk_sc_detail_status PRIMARY KEY (sc_detail_status_no),
    CONSTRAINT fk_scdst_condition FOREIGN KEY (search_condition_no)
        REFERENCES search_condition (search_condition_no)
        ON DELETE CASCADE,
    CONSTRAINT fk_scdst_status FOREIGN KEY (status_no)
        REFERENCES status (status_no)
);

-- 3-6. Due Date 조건
-- due_date도 필터 값 저장용이라 task.due_date에 FK 불가 (UNIQUE 아님)
CREATE TABLE sc_detail_due_date (
    sc_detail_due_date_no NUMBER NOT NULL,
    search_condition_no   NUMBER NOT NULL,
    due_date              DATE   NOT NULL,
    CONSTRAINT pk_sc_detail_due_date PRIMARY KEY (sc_detail_due_date_no),
    CONSTRAINT fk_scdd_condition FOREIGN KEY (search_condition_no)
        REFERENCES search_condition (search_condition_no)
        ON DELETE CASCADE
);

------------------------------------------------------------
-- 4. 접근 권한 테이블
-- user_no / space_key 배타적 관계:
--   - 사용자 공유: user_no NOT NULL, space_key NULL
--   - 스페이스 공유: space_key NOT NULL, user_no NULL
------------------------------------------------------------
CREATE TABLE search_condition_access (
    search_condition_no NUMBER       NOT NULL,
    user_no             NUMBER,
    space_key           VARCHAR2(20),
    access_type         VARCHAR2(20) NOT NULL,
    CONSTRAINT fk_sca_condition FOREIGN KEY (search_condition_no)
        REFERENCES search_condition (search_condition_no)
        ON DELETE CASCADE,
    CONSTRAINT fk_sca_user FOREIGN KEY (user_no)
        REFERENCES users (user_no),
    CONSTRAINT fk_sca_space FOREIGN KEY (space_key)
        REFERENCES space (space_key),
    CONSTRAINT chk_sca_access_type CHECK (access_type IN ('owner', 'editor', 'viewer')),
    CONSTRAINT chk_sca_exclusive CHECK (
        (user_no IS NOT NULL AND space_key IS NULL)
        OR (user_no IS NULL AND space_key IS NOT NULL)
    )
);

-- user 공유 / space 공유 각각 중복 방지 (NULL은 UNIQUE에서 무시됨)
CREATE UNIQUE INDEX uk_sca_user
    ON search_condition_access (search_condition_no, user_no);

CREATE UNIQUE INDEX uk_sca_space
    ON search_condition_access (search_condition_no, space_key);

------------------------------------------------------------
-- 사용 예)
-- DELETE FROM search_condition WHERE search_condition_no = 1;
-- → sc_detail_* / search_condition_access 관련 행 전부 자동 삭제
------------------------------------------------------------
