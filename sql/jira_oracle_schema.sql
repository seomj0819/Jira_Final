-- ============================================================
-- JIRA_Final Oracle 11g XE Schema
-- Source: Google Sheet "JIRA_DataBase"
-- Notes:
--   - Column types/constraints follow the spreadsheet
--   - Search-condition detail table names use MyBatis names
--     (sc_detail_*) so the existing mappers work
--   - Some sheet typos fixed (google -> google_api, log -> history,
--     VACHAR -> VARCHAR2, REFERRECES -> REFERENCES)
-- ============================================================

------------------------------------------------------------
-- 0. Drop (safe re-run)
------------------------------------------------------------
BEGIN
  FOR t IN (
    SELECT table_name FROM user_tables WHERE table_name IN (
      'ALARMCHK','FILES','HISTORY','MENTION','REPLY','TASK','LABEL',
      'STATUS','SPACE_MEMBERS','SC_DETAIL_SPACE','SC_DETAIL_WORKER',
      'SC_DETAIL_CREATOR','SC_DETAIL_PRIORITY','SC_DETAIL_STATUS',
      'SC_DETAIL_DUE_DATE','SEARCH_CONDITION_ACCESS','SEARCH_CONDITION',
      'SPACE','USERS','IMAGE','COLOR'
    )
  ) LOOP
    EXECUTE IMMEDIATE 'DROP TABLE '||t.table_name||' CASCADE CONSTRAINTS';
  END LOOP;

  FOR s IN (
    SELECT sequence_name FROM user_sequences WHERE sequence_name IN (
      'SEQ_USER_NO','SEQ_SPACE_ORDER','SEQ_TASK_NO','SEQ_STATUS_NO',
      'SEQ_FILE_NO','SEQ_HISTORY_NO','SEQ_IMAGE_NO','SEQ_REPLY_NO',
      'SEQ_MENTION_NO','SEQ_CONDITION_NO','SEQ_SCD_SPACE_NO',
      'SEQ_SCD_WORKER_NO','SEQ_SCD_CREATOR_NO','SEQ_SCD_PRIORITY_NO',
      'SEQ_SCD_STATUS_NO','SEQ_SCD_DUE_DATE_NO'
    )
  ) LOOP
    EXECUTE IMMEDIATE 'DROP SEQUENCE '||s.sequence_name;
  END LOOP;
END;
/

------------------------------------------------------------
-- 1. Sequences
------------------------------------------------------------
CREATE SEQUENCE seq_user_no         START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_space_order     START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_task_no         START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_status_no       START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_file_no         START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_history_no      START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_image_no        START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_reply_no        START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_mention_no      START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_condition_no    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_scd_space_no    START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_scd_worker_no   START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_scd_creator_no  START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_scd_priority_no START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_scd_status_no   START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE seq_scd_due_date_no START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;

------------------------------------------------------------
-- 2. Independent tables
------------------------------------------------------------
CREATE TABLE color (
    color_name VARCHAR2(20) NOT NULL,
    color_code VARCHAR2(20) NOT NULL,
    CONSTRAINT pk_color PRIMARY KEY (color_name),
    CONSTRAINT uk_color_code UNIQUE (color_code)
);

CREATE TABLE image (
    image_no       NUMBER         NOT NULL,
    image_title    VARCHAR2(1000) NOT NULL,
    image_category VARCHAR2(20)   NOT NULL,
    expire_date    DATE,
    CONSTRAINT pk_image PRIMARY KEY (image_no),
    CONSTRAINT uk_image_title UNIQUE (image_title),
    CONSTRAINT chk_image_category CHECK (
        image_category IN ('SPACE','USER','TASK','COMMENT')
    )
);

------------------------------------------------------------
-- 3. USERS
------------------------------------------------------------
CREATE TABLE users (
    user_no            NUMBER         NOT NULL,
    email              VARCHAR2(255)  NOT NULL,
    pw                 VARCHAR2(255),
    google_api         VARCHAR2(255),
    user_name          VARCHAR2(50)   NOT NULL,
    image_no           NUMBER         DEFAULT 1 NOT NULL,
    verification_code  VARCHAR2(100),
    expire_date        DATE,
    CONSTRAINT pk_users PRIMARY KEY (user_no),
    CONSTRAINT uk_users_email UNIQUE (email),
    CONSTRAINT fk_users_image FOREIGN KEY (image_no)
        REFERENCES image (image_no),
    -- local: pw only / google: google_api only (sheet chklogin)
    CONSTRAINT chk_users_login CHECK (
        (pw IS NOT NULL AND google_api IS NULL)
        OR (pw IS NULL AND google_api IS NOT NULL)
    )
);

------------------------------------------------------------
-- 4. SPACE / SPACE_MEMBERS
------------------------------------------------------------
CREATE TABLE space (
    space_key    VARCHAR2(15) NOT NULL,
    space_title  VARCHAR2(50) NOT NULL,
    space_order  NUMBER       NOT NULL,
    space_status CHAR(1)      NOT NULL,
    image_no     NUMBER       DEFAULT 1 NOT NULL,
    CONSTRAINT pk_space PRIMARY KEY (space_key),
    CONSTRAINT fk_space_image FOREIGN KEY (image_no)
        REFERENCES image (image_no),
    CONSTRAINT chk_space_status CHECK (space_status IN ('Y','N'))
);

CREATE TABLE space_members (
    space_key    VARCHAR2(15)  NOT NULL,
    user_no      NUMBER        NOT NULL,
    user_role    VARCHAR2(20)  NOT NULL,
    invite_code  VARCHAR2(100),
    expire_date  DATE,
    CONSTRAINT pk_space_members PRIMARY KEY (space_key, user_no),
    CONSTRAINT fk_sm_space FOREIGN KEY (space_key)
        REFERENCES space (space_key) ON DELETE CASCADE,
    CONSTRAINT fk_sm_user FOREIGN KEY (user_no)
        REFERENCES users (user_no),
    CONSTRAINT chk_sm_role CHECK (
        user_role IN ('admin','editor','viewer','관리자','구성원','조회자')
    )
);

------------------------------------------------------------
-- 5. STATUS / LABEL
------------------------------------------------------------
CREATE TABLE status (
    status_no    NUMBER       NOT NULL,
    space_key    VARCHAR2(15) NOT NULL,
    status_order NUMBER       NOT NULL,
    status_title VARCHAR2(20) NOT NULL,
    status_color VARCHAR2(20) NOT NULL,
    CONSTRAINT pk_status PRIMARY KEY (status_no),
    CONSTRAINT fk_status_space FOREIGN KEY (space_key)
        REFERENCES space (space_key) ON DELETE CASCADE,
    CONSTRAINT fk_status_color FOREIGN KEY (status_color)
        REFERENCES color (color_name)
);

CREATE TABLE label (
    -- sheet: VARCHAR2(20); use CHAR semantics so Korean labels fit
    label_title VARCHAR2(100 CHAR) NOT NULL,
    space_key   VARCHAR2(15) NOT NULL,
    CONSTRAINT pk_label PRIMARY KEY (label_title, space_key),
    CONSTRAINT fk_label_space FOREIGN KEY (space_key)
        REFERENCES space (space_key) ON DELETE CASCADE
);

------------------------------------------------------------
-- 6. TASK
--    virtual UI key: space_key || '-' || task_no
--    upper_task_no / task_order are mutually exclusive in app logic
------------------------------------------------------------
CREATE TABLE task (
    space_key        VARCHAR2(15)   NOT NULL,
    task_no          NUMBER         NOT NULL,
    creator_no       NUMBER         NOT NULL,
    worker_no        NUMBER,
    task_title       VARCHAR2(1000) NOT NULL,
    task_description VARCHAR2(4000),
    due_date         DATE,
    label_title      VARCHAR2(100),
    status_no        NUMBER         DEFAULT 1 NOT NULL,
    priority         VARCHAR2(6)    DEFAULT 'Medium' NOT NULL,
    upper_task_no    NUMBER,
    task_order       NUMBER,
    image_no         NUMBER,
    summary          VARCHAR2(1000),
    CONSTRAINT pk_task PRIMARY KEY (space_key, task_no),
    CONSTRAINT fk_task_space FOREIGN KEY (space_key)
        REFERENCES space (space_key) ON DELETE CASCADE,
    CONSTRAINT fk_task_creator FOREIGN KEY (creator_no)
        REFERENCES users (user_no),
    CONSTRAINT fk_task_worker FOREIGN KEY (worker_no)
        REFERENCES users (user_no),
    CONSTRAINT fk_task_status FOREIGN KEY (status_no)
        REFERENCES status (status_no),
    CONSTRAINT fk_task_label FOREIGN KEY (label_title, space_key)
        REFERENCES label (label_title, space_key),
    CONSTRAINT fk_task_image FOREIGN KEY (image_no)
        REFERENCES image (image_no),
    CONSTRAINT fk_task_upper FOREIGN KEY (space_key, upper_task_no)
        REFERENCES task (space_key, task_no),
    CONSTRAINT chk_task_priority CHECK (priority IN ('High','Medium','Low')),
    CONSTRAINT chk_task_order_xor CHECK (
        (upper_task_no IS NULL AND task_order IS NOT NULL)
        OR (upper_task_no IS NOT NULL AND task_order IS NULL)
        OR (upper_task_no IS NULL AND task_order IS NULL)
    )
);

------------------------------------------------------------
-- 7. REPLY / MENTION
------------------------------------------------------------
CREATE TABLE reply (
    reply_no      NUMBER         NOT NULL,
    space_key     VARCHAR2(15)   NOT NULL,
    task_no       NUMBER         NOT NULL,
    writer_no     NUMBER         NOT NULL,
    reply_content VARCHAR2(4000) NOT NULL,
    image_no      NUMBER,
    created_at    DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT pk_reply PRIMARY KEY (reply_no),
    CONSTRAINT fk_reply_task FOREIGN KEY (space_key, task_no)
        REFERENCES task (space_key, task_no) ON DELETE CASCADE,
    CONSTRAINT fk_reply_writer FOREIGN KEY (writer_no)
        REFERENCES users (user_no),
    CONSTRAINT fk_reply_image FOREIGN KEY (image_no)
        REFERENCES image (image_no)
);

CREATE TABLE mention (
    mention_no   NUMBER       NOT NULL,
    sender_no    NUMBER       NOT NULL,
    receiver_no  NUMBER       NOT NULL,
    space_at     VARCHAR2(15) NOT NULL,
    target_type  VARCHAR2(20) NOT NULL,
    task_no      NUMBER,
    reply_no     NUMBER,
    is_read      NUMBER       DEFAULT 0 NOT NULL,
    created_at   DATE         DEFAULT SYSDATE NOT NULL,
    CONSTRAINT pk_mention PRIMARY KEY (mention_no),
    CONSTRAINT fk_mention_sender FOREIGN KEY (sender_no)
        REFERENCES users (user_no),
    CONSTRAINT fk_mention_receiver FOREIGN KEY (receiver_no)
        REFERENCES users (user_no),
    CONSTRAINT fk_mention_space FOREIGN KEY (space_at)
        REFERENCES space (space_key) ON DELETE CASCADE,
    CONSTRAINT fk_mention_reply FOREIGN KEY (reply_no)
        REFERENCES reply (reply_no) ON DELETE CASCADE,
    CONSTRAINT chk_mention_type CHECK (target_type IN ('task','reply')),
    CONSTRAINT chk_mention_read CHECK (is_read IN (0,1)),
    CONSTRAINT chk_mention_target CHECK (
        (target_type = 'task'  AND task_no  IS NOT NULL AND reply_no IS NULL)
        OR (target_type = 'reply' AND reply_no IS NOT NULL)
    )
);

------------------------------------------------------------
-- 8. HISTORY / ALARMCHK / FILES
------------------------------------------------------------
CREATE TABLE history (
    history_no  NUMBER         NOT NULL,
    space_key   VARCHAR2(15)   NOT NULL,
    task_no     NUMBER         NOT NULL,
    reply_no    NUMBER,
    user_no     NUMBER         NOT NULL,
    field_name  VARCHAR2(20)   NOT NULL,
    action_type CHAR(6)        NOT NULL,
    created_at  DATE DEFAULT SYSDATE NOT NULL,
    old_value   VARCHAR2(4000),
    new_value   VARCHAR2(4000),
    CONSTRAINT pk_history PRIMARY KEY (history_no),
    CONSTRAINT fk_history_space FOREIGN KEY (space_key)
        REFERENCES space (space_key) ON DELETE CASCADE,
    CONSTRAINT fk_history_user FOREIGN KEY (user_no)
        REFERENCES users (user_no),
    CONSTRAINT fk_history_reply FOREIGN KEY (reply_no)
        REFERENCES reply (reply_no) ON DELETE SET NULL,
    CONSTRAINT chk_history_action CHECK (
        TRIM(action_type) IN ('create','update','delete')
    )
);

CREATE TABLE alarmchk (
    history_no NUMBER NOT NULL,
    user_no    NUMBER NOT NULL,
    CONSTRAINT pk_alarmchk PRIMARY KEY (history_no, user_no),
    CONSTRAINT fk_alarmchk_history FOREIGN KEY (history_no)
        REFERENCES history (history_no) ON DELETE CASCADE,
    CONSTRAINT fk_alarmchk_user FOREIGN KEY (user_no)
        REFERENCES users (user_no)
);

CREATE TABLE files (
    file_no       NUMBER         NOT NULL,
    space_key     VARCHAR2(20)   NOT NULL,
    task_no       NUMBER         NOT NULL,
    reply_no      NUMBER,
    file_name     VARCHAR2(255)  NOT NULL,
    file_path     VARCHAR2(4000) NOT NULL,
    created_at    DATE DEFAULT SYSDATE NOT NULL,
    expired_date  DATE,
    CONSTRAINT pk_files PRIMARY KEY (file_no),
    CONSTRAINT fk_files_space FOREIGN KEY (space_key)
        REFERENCES space (space_key) ON DELETE CASCADE,
    CONSTRAINT fk_files_reply FOREIGN KEY (reply_no)
        REFERENCES reply (reply_no) ON DELETE SET NULL
);

------------------------------------------------------------
-- 9. SEARCH_CONDITION (+ detail / access)
--    Sheet names SEARCH_CONDITION_DETAIL_* map to sc_detail_*
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
    favorite                     CHAR(1) DEFAULT 'N' NOT NULL,
    CONSTRAINT pk_search_condition PRIMARY KEY (search_condition_no),
    CONSTRAINT chk_sc_favorite CHECK (favorite IN ('Y','N'))
);

CREATE TABLE sc_detail_space (
    sc_detail_space_no  NUMBER       NOT NULL,
    search_condition_no NUMBER       NOT NULL,
    space_key           VARCHAR2(20) NOT NULL,
    CONSTRAINT pk_sc_detail_space PRIMARY KEY (sc_detail_space_no),
    CONSTRAINT fk_scds_condition FOREIGN KEY (search_condition_no)
        REFERENCES search_condition (search_condition_no) ON DELETE CASCADE,
    CONSTRAINT fk_scds_space FOREIGN KEY (space_key)
        REFERENCES space (space_key)
);

CREATE TABLE sc_detail_worker (
    sc_detail_worker_no NUMBER NOT NULL,
    search_condition_no NUMBER NOT NULL,
    worker_no           NUMBER NOT NULL,
    CONSTRAINT pk_sc_detail_worker PRIMARY KEY (sc_detail_worker_no),
    CONSTRAINT fk_scdw_condition FOREIGN KEY (search_condition_no)
        REFERENCES search_condition (search_condition_no) ON DELETE CASCADE,
    CONSTRAINT fk_scdw_user FOREIGN KEY (worker_no)
        REFERENCES users (user_no)
);

CREATE TABLE sc_detail_creator (
    sc_detail_creator_no NUMBER NOT NULL,
    search_condition_no  NUMBER NOT NULL,
    creator_no           NUMBER NOT NULL,
    CONSTRAINT pk_sc_detail_creator PRIMARY KEY (sc_detail_creator_no),
    CONSTRAINT fk_scdc_condition FOREIGN KEY (search_condition_no)
        REFERENCES search_condition (search_condition_no) ON DELETE CASCADE,
    CONSTRAINT fk_scdc_user FOREIGN KEY (creator_no)
        REFERENCES users (user_no)
);

CREATE TABLE sc_detail_priority (
    sc_detail_priority_no NUMBER       NOT NULL,
    search_condition_no   NUMBER       NOT NULL,
    priority              VARCHAR2(20) NOT NULL,
    CONSTRAINT pk_sc_detail_priority PRIMARY KEY (sc_detail_priority_no),
    CONSTRAINT fk_scdp_condition FOREIGN KEY (search_condition_no)
        REFERENCES search_condition (search_condition_no) ON DELETE CASCADE
);

CREATE TABLE sc_detail_status (
    sc_detail_status_no NUMBER NOT NULL,
    search_condition_no NUMBER NOT NULL,
    status_no           NUMBER NOT NULL,
    CONSTRAINT pk_sc_detail_status PRIMARY KEY (sc_detail_status_no),
    CONSTRAINT fk_scdst_condition FOREIGN KEY (search_condition_no)
        REFERENCES search_condition (search_condition_no) ON DELETE CASCADE,
    CONSTRAINT fk_scdst_status FOREIGN KEY (status_no)
        REFERENCES status (status_no)
);

CREATE TABLE sc_detail_due_date (
    sc_detail_due_date_no NUMBER NOT NULL,
    search_condition_no   NUMBER NOT NULL,
    due_date              DATE   NOT NULL,
    CONSTRAINT pk_sc_detail_due_date PRIMARY KEY (sc_detail_due_date_no),
    CONSTRAINT fk_scdd_condition FOREIGN KEY (search_condition_no)
        REFERENCES search_condition (search_condition_no) ON DELETE CASCADE
);

CREATE TABLE search_condition_access (
    search_condition_no NUMBER       NOT NULL,
    user_no             NUMBER,
    space_key           VARCHAR2(20),
    access_type         VARCHAR2(20) NOT NULL,
    CONSTRAINT fk_sca_condition FOREIGN KEY (search_condition_no)
        REFERENCES search_condition (search_condition_no) ON DELETE CASCADE,
    CONSTRAINT fk_sca_user FOREIGN KEY (user_no)
        REFERENCES users (user_no),
    CONSTRAINT fk_sca_space FOREIGN KEY (space_key)
        REFERENCES space (space_key),
    CONSTRAINT chk_sca_access_type CHECK (
        access_type IN ('owner','editor','viewer')
    ),
    CONSTRAINT chk_sca_exclusive CHECK (
        (user_no IS NOT NULL AND space_key IS NULL)
        OR (user_no IS NULL AND space_key IS NOT NULL)
    )
);

CREATE UNIQUE INDEX uk_sca_user
    ON search_condition_access (search_condition_no, user_no);
CREATE UNIQUE INDEX uk_sca_space
    ON search_condition_access (search_condition_no, space_key);

------------------------------------------------------------
-- 10. Seed: colors + default images (sheet IMAGE/COLOR)
------------------------------------------------------------
INSERT INTO color (color_name, color_code) VALUES ('blue',   '#669DF1');
INSERT INTO color (color_name, color_code) VALUES ('grey',   '#B7B9BE');
INSERT INTO color (color_name, color_code) VALUES ('green',  '#94C748');
INSERT INTO color (color_name, color_code) VALUES ('red',    '#E26363');
INSERT INTO color (color_name, color_code) VALUES ('yellow', '#F6F693');
INSERT INTO color (color_name, color_code) VALUES ('orange', '#FFC79E');
INSERT INTO color (color_name, color_code) VALUES ('purple', '#D8AAFF');
INSERT INTO color (color_name, color_code) VALUES ('brown',  '#BE9B9B');

-- image_no=1 used as SPACE default in SpaceMapper (hardcoded)
INSERT INTO image (image_no, image_title, image_category, expire_date)
VALUES (seq_image_no.NEXTVAL, 'uuid_default_space_image.png', 'SPACE', SYSDATE + 30);
INSERT INTO image (image_no, image_title, image_category, expire_date)
VALUES (seq_image_no.NEXTVAL, 'uuid_default_user_image1.jpg', 'USER', SYSDATE + 30);

COMMIT;

------------------------------------------------------------
-- 11. Verification
------------------------------------------------------------
SELECT table_name FROM user_tables ORDER BY 1;
SELECT sequence_name FROM user_sequences ORDER BY 1;
SELECT color_name, color_code FROM color ORDER BY 1;
SELECT image_no, image_title, image_category FROM image ORDER BY 1;
