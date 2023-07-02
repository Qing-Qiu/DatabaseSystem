/*
 Navicat Premium Data Transfer

 Source Server         : 1
 Source Server Type    : PostgreSQL
 Source Server Version : 90204
 Source Host           : 192.168.182.136:26000
 Source Catalog        : JiangyMIS10
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90204
 File Encoding         : 65001

 Date: 02/07/2023 21:47:03
*/


-- ----------------------------
-- Table structure for jiangy_abstract_course10
-- ----------------------------
DROP TABLE IF EXISTS "public"."jiangy_abstract_course10";
CREATE TABLE "public"."jiangy_abstract_course10"
(
    "jy_number10"      text COLLATE "pg_catalog"."default" NOT NULL,
    "jy_name10"        text COLLATE "pg_catalog"."default" NOT NULL,
    "jy_credit10"      int4                                NOT NULL,
    "jy_period10"      int4                                NOT NULL,
    "jy_examination10" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of jiangy_abstract_course10
-- ----------------------------
INSERT INTO "public"."jiangy_abstract_course10"
VALUES ('G126088', '数据库原理及应用', 3, 48, '考试');

-- ----------------------------
-- Table structure for jiangy_adminpwd10
-- ----------------------------
DROP TABLE IF EXISTS "public"."jiangy_adminpwd10";
CREATE TABLE "public"."jiangy_adminpwd10"
(
    "jy_username10" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
    "jy_password10" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of jiangy_adminpwd10
-- ----------------------------
INSERT INTO "public"."jiangy_adminpwd10"
VALUES ('2222', '2222');
INSERT INTO "public"."jiangy_adminpwd10"
VALUES ('1111', '1111');

-- ----------------------------
-- Table structure for jiangy_class10
-- ----------------------------
DROP TABLE IF EXISTS "public"."jiangy_class10";
CREATE TABLE "public"."jiangy_class10"
(
    "jy_major_id10" text COLLATE "pg_catalog"."default" NOT NULL,
    "jy_grade10"    int4                                NOT NULL,
    "jy_name10"     text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of jiangy_class10
-- ----------------------------
INSERT INTO "public"."jiangy_class10"
VALUES ('080910', 2021, '大数据01');
INSERT INTO "public"."jiangy_class10"
VALUES ('计算机实验班', 2021, '计算机实验班01');

-- ----------------------------
-- Table structure for jiangy_course10
-- ----------------------------
DROP TABLE IF EXISTS "public"."jiangy_course10";
CREATE TABLE "public"."jiangy_course10"
(
    "jy_id10"            text COLLATE "pg_catalog"."default" NOT NULL,
    "jy_course_number10" text COLLATE "pg_catalog"."default",
    "jy_term10"          text COLLATE "pg_catalog"."default",
    "jy_teacher_id10"    text COLLATE "pg_catalog"."default",
    "jy_detail10"        text COLLATE "pg_catalog"."default",
    "jy_class_name10"    text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of jiangy_course10
-- ----------------------------
INSERT INTO "public"."jiangy_course10"
VALUES ('G126088-2', 'G126088', '大二下', '05077', '1-16:5,8-9', '大数据01');
INSERT INTO "public"."jiangy_course10"
VALUES ('G126088-1', 'G126088', '大二下', '02634', '1-16:5,6-7', '计算机实验班01');

-- ----------------------------
-- Table structure for jiangy_major10
-- ----------------------------
DROP TABLE IF EXISTS "public"."jiangy_major10";
CREATE TABLE "public"."jiangy_major10"
(
    "jy_id10"   text COLLATE "pg_catalog"."default" NOT NULL,
    "jy_name10" text COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of jiangy_major10
-- ----------------------------
INSERT INTO "public"."jiangy_major10"
VALUES ('080901', '计算机科学与技术');
INSERT INTO "public"."jiangy_major10"
VALUES ('计算机实验班', '计算机实验班');
INSERT INTO "public"."jiangy_major10"
VALUES ('080902', '软件工程');
INSERT INTO "public"."jiangy_major10"
VALUES ('080910', '数据科学与大数据技术');

-- ----------------------------
-- Table structure for jiangy_score10
-- ----------------------------
DROP TABLE IF EXISTS "public"."jiangy_score10";
CREATE TABLE "public"."jiangy_score10"
(
    "jy_course_id10"  text COLLATE "pg_catalog"."default",
    "jy_student_id10" text COLLATE "pg_catalog"."default",
    "jy_value10"      numeric
)
;

-- ----------------------------
-- Records of jiangy_score10
-- ----------------------------
INSERT INTO "public"."jiangy_score10"
VALUES ('G126088-1', '202103150209', 94);
INSERT INTO "public"."jiangy_score10"
VALUES ('G126088-2', '202103150212', 90);
INSERT INTO "public"."jiangy_score10"
VALUES ('G126088-1', '202103151211', 96);

-- ----------------------------
-- Table structure for jiangy_student10
-- ----------------------------
DROP TABLE IF EXISTS "public"."jiangy_student10";
CREATE TABLE "public"."jiangy_student10"
(
    "jy_id10"         text COLLATE "pg_catalog"."default" NOT NULL,
    "jy_major_id10"   text COLLATE "pg_catalog"."default",
    "jy_grade10"      int4,
    "jy_class_name10" text COLLATE "pg_catalog"."default",
    "jy_name10"       text COLLATE "pg_catalog"."default" NOT NULL,
    "jy_sex10"        bool                                NOT NULL,
    "jy_age10"        int4,
    "jy_region10"     text COLLATE "pg_catalog"."default" NOT NULL,
    "jy_credits10"    int4                                NOT NULL
)
;

-- ----------------------------
-- Records of jiangy_student10
-- ----------------------------
INSERT INTO "public"."jiangy_student10"
VALUES ('202103150209', '计算机实验班', 2021, '计算机实验班01', '刘高铨', 't', 20, '浙江温州', 125);
INSERT INTO "public"."jiangy_student10"
VALUES ('202103150322', '计算机实验班', 2021, '计算机实验班01', '徐洋', 't', 20, '浙江宁波', 124);
INSERT INTO "public"."jiangy_student10"
VALUES ('202103150212', '080910', 2021, '大数据01', '孟涛', 't', 20, '浙江绍兴', 115);
INSERT INTO "public"."jiangy_student10"
VALUES ('202103151211', '计算机实验班', 2021, '计算机实验班01', '江银', 't', 20, '浙江宁波', 122);
INSERT INTO "public"."jiangy_student10"
VALUES ('202103151216', '计算机实验班', 2021, '计算机实验班01', '吕扬涛', 't', 20, '浙江温州', 126);

-- ----------------------------
-- Table structure for jiangy_studentpwd10
-- ----------------------------
DROP TABLE IF EXISTS "public"."jiangy_studentpwd10";
CREATE TABLE "public"."jiangy_studentpwd10"
(
    "jy_username10" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
    "jy_password10" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of jiangy_studentpwd10
-- ----------------------------
INSERT INTO "public"."jiangy_studentpwd10"
VALUES ('202103151211', '123456');

-- ----------------------------
-- Table structure for jiangy_teacher10
-- ----------------------------
DROP TABLE IF EXISTS "public"."jiangy_teacher10";
CREATE TABLE "public"."jiangy_teacher10"
(
    "jy_id10"    text COLLATE "pg_catalog"."default" NOT NULL,
    "jy_name10"  text COLLATE "pg_catalog"."default" NOT NULL,
    "jy_sex10"   bool                                NOT NULL,
    "jy_age10"   int4,
    "jy_title10" text COLLATE "pg_catalog"."default",
    "jy_phone10" text COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of jiangy_teacher10
-- ----------------------------
INSERT INTO "public"."jiangy_teacher10"
VALUES ('02634', '范菁', 'f', NULL, '教授', '0571-85290116');
INSERT INTO "public"."jiangy_teacher10"
VALUES ('03412', '梁荣华', 't', NULL, '教授', '0571-85290071');
INSERT INTO "public"."jiangy_teacher10"
VALUES ('03904', '汤颖', 'f', NULL, '教授', '0571-85290086');
INSERT INTO "public"."jiangy_teacher10"
VALUES ('02633', '田贤忠', 'f', NULL, '教授', '13588458670');
INSERT INTO "public"."jiangy_teacher10"
VALUES ('05077', '范玉雷', 'f', NULL, '讲师', NULL);

-- ----------------------------
-- Table structure for jiangy_teacherpwd10
-- ----------------------------
DROP TABLE IF EXISTS "public"."jiangy_teacherpwd10";
CREATE TABLE "public"."jiangy_teacherpwd10"
(
    "jy_username10" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
    "jy_password10" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of jiangy_teacherpwd10
-- ----------------------------
INSERT INTO "public"."jiangy_teacherpwd10"
VALUES ('3333', '3333');

-- ----------------------------
-- Function structure for jiangy_addscore10
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."jiangy_addscore10"();
CREATE
OR REPLACE FUNCTION "public"."jiangy_addscore10"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
	DECLARE
tmp INT;
BEGIN
SELECT jy_credit10
INTO tmp
FROM jiangy_courseview10
WHERE jy_id10 = NEW.jy_course_id10;
UPDATE jiangy_student10
SET jy_credits10 = CASE WHEN NEW.jy_value10 >= 60 THEN jy_credits10 + tmp ELSE jy_credits10 END
WHERE jy_id10 = NEW.jy_student_id10;
RETURN NEW;
END $BODY$
LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for jiangy_addstu10
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."jiangy_addstu10"();
CREATE
OR REPLACE FUNCTION "public"."jiangy_addstu10"()
  RETURNS "pg_catalog"."trigger" AS $BODY$ DECLARE
BEGIN
INSERT INTO jiangy_studentpwd10
VALUES (NEW.jy_id10, '123456');
RETURN NEW;
END $BODY$
LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for jiangy_addtea10
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."jiangy_addtea10"();
CREATE
OR REPLACE FUNCTION "public"."jiangy_addtea10"()
  RETURNS "pg_catalog"."trigger" AS $BODY$ DECLARE
BEGIN
INSERT INTO jiangy_teacherpwd10
VALUES (NEW.jy_id10, '123456');
RETURN NEW;
END $BODY$
LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for jiangy_queryadminpwd10
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."jiangy_queryadminpwd10"("username" text, "password" text);
CREATE
OR REPLACE FUNCTION "public"."jiangy_queryadminpwd10"("username" text, "password" text)
  RETURNS "pg_catalog"."int4" AS $BODY$
DECLARE
flag INT:=0;
	tmp
TEXT;
BEGIN
SELECT jy_password10
INTO tmp
FROM jiangy_adminpwd10
WHERE jy_username10 = username;
IF
password=tmp THEN RETURN 1;
ELSE RETURN 0;
END IF;
END
$BODY$
LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for jiangy_querystudentpwd10
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."jiangy_querystudentpwd10"("username" text, "password" text);
CREATE
OR REPLACE FUNCTION "public"."jiangy_querystudentpwd10"("username" text, "password" text)
  RETURNS "pg_catalog"."int4" AS $BODY$
DECLARE
flag INT:=0;
	tmp
TEXT;
BEGIN
SELECT jy_password10
INTO tmp
FROM jiangy_studentpwd10
WHERE jy_username10 = username;
IF
password=tmp THEN RETURN 1;
ELSE RETURN 0;
END IF;
END
$BODY$
LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for jiangy_queryteacherpwd10
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."jiangy_queryteacherpwd10"("username" text, "password" text);
CREATE
OR REPLACE FUNCTION "public"."jiangy_queryteacherpwd10"("username" text, "password" text)
  RETURNS "pg_catalog"."int4" AS $BODY$
DECLARE
flag INT:=0;
	tmp
TEXT;
BEGIN
SELECT jy_password10
INTO tmp
FROM jiangy_teacherpwd10
WHERE jy_username10 = username;
IF
password=tmp THEN RETURN 1;
ELSE RETURN 0;
END IF;
END
$BODY$
LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- View structure for jiangy_teacherview10
-- ----------------------------
DROP VIEW IF EXISTS "public"."jiangy_teacherview10";
CREATE VIEW "public"."jiangy_teacherview10" AS
SELECT jiangy_teacher10.jy_id10,
       jiangy_teacher10.jy_name10,
       CASE WHEN (jiangy_teacher10.jy_sex10 = true) THEN '男'::text ELSE '女'::text END AS jy_sex10,
       jiangy_teacher10.jy_age10,
       jiangy_teacher10.jy_title10,
       jiangy_teacher10.jy_phone10
FROM jiangy_teacher10;

-- ----------------------------
-- View structure for jiangy_courseview10
-- ----------------------------
DROP VIEW IF EXISTS "public"."jiangy_courseview10";
CREATE VIEW "public"."jiangy_courseview10" AS
SELECT jiangy_abstract_course10.jy_name10,
       jiangy_abstract_course10.jy_credit10,
       jiangy_abstract_course10.jy_period10,
       jiangy_abstract_course10.jy_examination10,
       jiangy_course10.jy_course_number10,
       jiangy_course10.jy_id10,
       jiangy_course10.jy_term10,
       (SELECT jiangy_teacher10.jy_name10
        FROM jiangy_teacher10
        WHERE (jiangy_teacher10.jy_id10 = jiangy_course10.jy_teacher_id10)) AS jy_teacher10,
       jiangy_course10.jy_teacher_id10,
       jiangy_course10.jy_detail10,
       jiangy_course10.jy_class_name10
FROM jiangy_course10,
     jiangy_abstract_course10
WHERE (jiangy_course10.jy_course_number10 = jiangy_abstract_course10.jy_number10);

-- ----------------------------
-- View structure for jiangy_scoreview10
-- ----------------------------
DROP VIEW IF EXISTS "public"."jiangy_scoreview10";
CREATE VIEW "public"."jiangy_scoreview10" AS
SELECT jiangy_student10.jy_id10,
       jiangy_student10.jy_name10,
       (SELECT jiangy_abstract_course10.jy_name10
        FROM jiangy_abstract_course10
        WHERE (jiangy_course10.jy_course_number10 = jiangy_abstract_course10.jy_number10)) AS jy_course10,
       jiangy_score10.jy_value10,
       jiangy_teacher10.jy_name10                                                        AS jy_teacher10,
       jiangy_course10.jy_term10,
       jiangy_student10.jy_class_name10,
       jiangy_course10.jy_detail10,
       jiangy_course10.jy_id10                                                           AS jy_course_id10
FROM jiangy_student10,
     jiangy_teacher10,
     jiangy_course10,
     jiangy_score10
WHERE (((jiangy_student10.jy_id10 = jiangy_score10.jy_student_id10) AND
        (jiangy_teacher10.jy_id10 = jiangy_course10.jy_teacher_id10)) AND
       (jiangy_course10.jy_id10 = jiangy_score10.jy_course_id10));

-- ----------------------------
-- View structure for jiangy_studentview10
-- ----------------------------
DROP VIEW IF EXISTS "public"."jiangy_studentview10";
CREATE VIEW "public"."jiangy_studentview10" AS
SELECT jiangy_student10.jy_id10,
       (SELECT jiangy_major10.jy_name10
        FROM jiangy_major10
        WHERE (jiangy_major10.jy_id10 = jiangy_student10.jy_major_id10))                                                                                                                                                                                                                                                                                                                                                                                                                                            AS jy_major10,
       jiangy_student10.jy_grade10,
       jiangy_student10.jy_class_name10,
       jiangy_student10.jy_name10,
       CASE WHEN (jiangy_student10.jy_sex10 = true) THEN '男'::text ELSE '女'::text END                                                                                                                                                                                                                                                                                                                                                                                                                             AS jy_sex10,
       jiangy_student10.jy_age10,
       jiangy_student10.jy_region10,
       jiangy_student10.jy_credits10,
       round(((SELECT sum(CASE
                              WHEN (jiangy_scoreview10.jy_value10 >= (60)::numeric) THEN (
                                      ((jiangy_scoreview10.jy_value10 - (50)::numeric) / 10.0) *
                                      (jiangy_courseview10.jy_credit10)::
                          numeric) ELSE (0)::numeric END) AS sum FROM (jiangy_scoreview10 JOIN jiangy_courseview10 ON ((jiangy_courseview10.jy_id10 = jiangy_scoreview10.jy_course_id10))) WHERE (jiangy_scoreview10.jy_id10 = jiangy_student10.jy_id10)) / ((SELECT sum(jiangy_courseview10.jy_credit10) AS sum FROM jiangy_courseview10, jiangy_scoreview10 WHERE ((jiangy_courseview10.jy_id10 = jiangy_scoreview10.jy_course_id10) AND (jiangy_scoreview10.jy_id10 = jiangy_student10.jy_id10))))::numeric), 2) AS jy_gpa10
FROM jiangy_student10;

-- ----------------------------
-- View structure for jiangy_regionview10
-- ----------------------------
DROP VIEW IF EXISTS "public"."jiangy_regionview10";
CREATE VIEW "public"."jiangy_regionview10" AS
SELECT jiangy_student10.jy_region10, count(jiangy_student10.jy_region10) AS jy_count10
FROM jiangy_student10
GROUP BY jiangy_student10.jy_region10;

-- ----------------------------
-- View structure for jiangy_majorview10
-- ----------------------------
DROP VIEW IF EXISTS "public"."jiangy_majorview10";
CREATE VIEW "public"."jiangy_majorview10" AS
SELECT jiangy_major10.jy_id10, jiangy_major10.jy_name10 AS jy_major10
FROM jiangy_major10;

-- ----------------------------
-- View structure for jiangy_classview10
-- ----------------------------
DROP VIEW IF EXISTS "public"."jiangy_classview10";
CREATE VIEW "public"."jiangy_classview10" AS
SELECT (SELECT jiangy_major10.jy_name10
        FROM jiangy_major10
        WHERE (jiangy_major10.jy_id10 = jiangy_class10.jy_major_id10)) AS jy_major10,
       jiangy_class10.jy_grade10,
       jiangy_class10.jy_name10                                        AS jy_class10
FROM jiangy_class10;

-- ----------------------------
-- View structure for jiangy_creditview10
-- ----------------------------
DROP VIEW IF EXISTS "public"."jiangy_creditview10";
CREATE VIEW "public"."jiangy_creditview10" AS
SELECT jiangy_studentview10.jy_id10,
       jiangy_studentview10.jy_name10,
       jiangy_studentview10.jy_class_name10,
       jiangy_studentview10.jy_credits10,
       jiangy_courseview10.jy_name10 AS jy_course10,
       jiangy_courseview10.jy_credit10,
       jiangy_courseview10.jy_period10,
       jiangy_courseview10.jy_term10,
       jiangy_studentview10.jy_gpa10
FROM jiangy_studentview10,
     jiangy_courseview10
WHERE (jiangy_studentview10.jy_class_name10 = jiangy_courseview10.jy_class_name10);

-- ----------------------------
-- Primary Key structure for table jiangy_abstract_course10
-- ----------------------------
ALTER TABLE "public"."jiangy_abstract_course10"
    ADD CONSTRAINT "jiangy_abstract_course10_pkey" PRIMARY KEY ("jy_number10");

-- ----------------------------
-- Primary Key structure for table jiangy_adminpwd10
-- ----------------------------
ALTER TABLE "public"."jiangy_adminpwd10"
    ADD CONSTRAINT "jiangy_adminpwd10_pkey" PRIMARY KEY ("jy_username10");

-- ----------------------------
-- Primary Key structure for table jiangy_class10
-- ----------------------------
ALTER TABLE "public"."jiangy_class10"
    ADD CONSTRAINT "jiangy_class10_pkey" PRIMARY KEY ("jy_major_id10", "jy_grade10", "jy_name10");

-- ----------------------------
-- Primary Key structure for table jiangy_course10
-- ----------------------------
ALTER TABLE "public"."jiangy_course10"
    ADD CONSTRAINT "jiangy_course10_pkey" PRIMARY KEY ("jy_id10");

-- ----------------------------
-- Primary Key structure for table jiangy_major10
-- ----------------------------
ALTER TABLE "public"."jiangy_major10"
    ADD CONSTRAINT "jiangy_major10_pkey" PRIMARY KEY ("jy_id10");

-- ----------------------------
-- Triggers structure for table jiangy_score10
-- ----------------------------
CREATE TRIGGER "jiangy_addscore10"
    AFTER INSERT
    ON "public"."jiangy_score10"
    FOR EACH ROW
    EXECUTE PROCEDURE "public"."jiangy_addscore10"();

-- ----------------------------
-- Triggers structure for table jiangy_student10
-- ----------------------------
CREATE TRIGGER "jiangy_addstu10"
    AFTER INSERT
    ON "public"."jiangy_student10"
    FOR EACH ROW
    EXECUTE PROCEDURE "public"."jiangy_addstu10"();

-- ----------------------------
-- Primary Key structure for table jiangy_student10
-- ----------------------------
ALTER TABLE "public"."jiangy_student10"
    ADD CONSTRAINT "jiangy_student10_pkey" PRIMARY KEY ("jy_id10");

-- ----------------------------
-- Primary Key structure for table jiangy_studentpwd10
-- ----------------------------
ALTER TABLE "public"."jiangy_studentpwd10"
    ADD CONSTRAINT "jiangy_studentpwd10_pkey" PRIMARY KEY ("jy_username10");

-- ----------------------------
-- Triggers structure for table jiangy_teacher10
-- ----------------------------
CREATE TRIGGER "jiangy_addtea10"
    AFTER INSERT
    ON "public"."jiangy_teacher10"
    FOR EACH ROW
    EXECUTE PROCEDURE "public"."jiangy_addtea10"();

-- ----------------------------
-- Primary Key structure for table jiangy_teacher10
-- ----------------------------
ALTER TABLE "public"."jiangy_teacher10"
    ADD CONSTRAINT "jiangy_teacher10_pkey" PRIMARY KEY ("jy_id10");

-- ----------------------------
-- Primary Key structure for table jiangy_teacherpwd10
-- ----------------------------
ALTER TABLE "public"."jiangy_teacherpwd10"
    ADD CONSTRAINT "jiangy_teacherpwd10_pkey" PRIMARY KEY ("jy_username10");

-- ----------------------------
-- Foreign Keys structure for table jiangy_class10
-- ----------------------------
ALTER TABLE "public"."jiangy_class10"
    ADD CONSTRAINT "jiangy_class10_jy_major_id10_fkey" FOREIGN KEY ("jy_major_id10") REFERENCES "public"."jiangy_major10" ("jy_id10") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table jiangy_course10
-- ----------------------------
ALTER TABLE "public"."jiangy_course10"
    ADD CONSTRAINT "jiangy_course10_jy_course_number10_fkey" FOREIGN KEY ("jy_course_number10") REFERENCES "public"."jiangy_abstract_course10" ("jy_number10") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."jiangy_course10"
    ADD CONSTRAINT "jiangy_course10_jy_teacher_id10_fkey" FOREIGN KEY ("jy_teacher_id10") REFERENCES "public"."jiangy_teacher10" ("jy_id10") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table jiangy_score10
-- ----------------------------
ALTER TABLE "public"."jiangy_score10"
    ADD CONSTRAINT "jiangy_score10_jy_course_id10_fkey" FOREIGN KEY ("jy_course_id10") REFERENCES "public"."jiangy_course10" ("jy_id10") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."jiangy_score10"
    ADD CONSTRAINT "jiangy_score10_jy_student_id10_fkey" FOREIGN KEY ("jy_student_id10") REFERENCES "public"."jiangy_student10" ("jy_id10") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table jiangy_student10
-- ----------------------------
ALTER TABLE "public"."jiangy_student10"
    ADD CONSTRAINT "jiangy_student10_jy_major_id10_fkey" FOREIGN KEY ("jy_major_id10", "jy_grade10", "jy_class_name10") REFERENCES "public"."jiangy_class10" ("jy_major_id10", "jy_grade10", "jy_name10") ON DELETE NO ACTION ON UPDATE NO ACTION;
