/*
 Navicat Premium Dump SQL

 Source Server         : 101.65 pg
 Source Server Type    : PostgreSQL
 Source Server Version : 170000 (170000)
 Source Host           : 192.168.101.65:5432
 Source Catalog        : postgres
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 170000 (170000)
 File Encoding         : 65001

 Date: 25/03/2025 16:00:23
*/


-- ----------------------------
-- Sequence structure for t_exam_paper_answer_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_exam_paper_answer_id_seq";
CREATE SEQUENCE "public"."t_exam_paper_answer_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_exam_paper_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_exam_paper_id_seq";
CREATE SEQUENCE "public"."t_exam_paper_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_exam_paper_question_customer_answer_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_exam_paper_question_customer_answer_id_seq";
CREATE SEQUENCE "public"."t_exam_paper_question_customer_answer_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_message_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_message_id_seq";
CREATE SEQUENCE "public"."t_message_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_message_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_message_user_id_seq";
CREATE SEQUENCE "public"."t_message_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_question_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_question_id_seq";
CREATE SEQUENCE "public"."t_question_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_subject_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_subject_id_seq";
CREATE SEQUENCE "public"."t_subject_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_task_exam_customer_answer_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_task_exam_customer_answer_id_seq";
CREATE SEQUENCE "public"."t_task_exam_customer_answer_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_task_exam_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_task_exam_id_seq";
CREATE SEQUENCE "public"."t_task_exam_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_text_content_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_text_content_id_seq";
CREATE SEQUENCE "public"."t_text_content_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_user_event_log_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_user_event_log_id_seq";
CREATE SEQUENCE "public"."t_user_event_log_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_user_id_seq";
CREATE SEQUENCE "public"."t_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for t_user_token_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."t_user_token_id_seq";
CREATE SEQUENCE "public"."t_user_token_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for t_exam_paper
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_exam_paper";
CREATE TABLE "public"."t_exam_paper" (
  "id" int4 NOT NULL DEFAULT nextval('t_exam_paper_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "subject_id" int4,
  "paper_type" int4,
  "grade_level" int4,
  "score" int4,
  "question_count" int4,
  "suggest_time" int4,
  "limit_start_time" timestamp(6),
  "limit_end_time" timestamp(6),
  "frame_text_content_id" int4,
  "create_user" int4,
  "create_time" timestamp(6),
  "deleted" bool,
  "task_exam_id" int4
)
;

-- ----------------------------
-- Records of t_exam_paper
-- ----------------------------
INSERT INTO "public"."t_exam_paper" VALUES (2, '语文七年级上册期末复习练习题', 20, 1, 7, 300, 10, 10, NULL, NULL, 15, 8, '2025-03-25 15:36:31.452', 'f', NULL);
INSERT INTO "public"."t_exam_paper" VALUES (3, '语文七年级下册期末复习练习题', 20, 1, 7, 300, 10, 10, NULL, NULL, 16, 8, '2025-03-25 15:37:33.98', 'f', NULL);
INSERT INTO "public"."t_exam_paper" VALUES (4, '语文七年级清明节小练', 20, 4, 7, 300, 10, 10, '2025-03-26 00:00:00', '2025-04-15 00:00:00', 17, 8, '2025-03-25 15:38:52.634', 'f', NULL);
INSERT INTO "public"."t_exam_paper" VALUES (5, '语文七年级上册清明节作业', 20, 6, 7, 300, 10, 10, NULL, NULL, 18, 8, '2025-03-25 15:39:47.613', 'f', 2);

-- ----------------------------
-- Table structure for t_exam_paper_answer
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_exam_paper_answer";
CREATE TABLE "public"."t_exam_paper_answer" (
  "id" int4 NOT NULL DEFAULT nextval('t_exam_paper_answer_id_seq'::regclass),
  "exam_paper_id" int4,
  "paper_name" varchar(255) COLLATE "pg_catalog"."default",
  "paper_type" int4,
  "subject_id" int4,
  "system_score" int4,
  "user_score" int4,
  "paper_score" int4,
  "question_correct" int4,
  "question_count" int4,
  "do_time" int4,
  "status" int4,
  "create_user" int4,
  "create_time" timestamp(6),
  "task_exam_id" int4
)
;

-- ----------------------------
-- Records of t_exam_paper_answer
-- ----------------------------
INSERT INTO "public"."t_exam_paper_answer" VALUES (2, 5, '语文七年级上册清明节作业', 6, 20, 60, 60, 300, 2, 10, 12, 2, 6, '2025-03-25 15:43:49.548', 2);
INSERT INTO "public"."t_exam_paper_answer" VALUES (3, 3, '语文七年级下册期末复习练习题', 1, 20, 90, 90, 300, 3, 10, 10, 2, 6, '2025-03-25 15:44:05.583', NULL);

-- ----------------------------
-- Table structure for t_exam_paper_question_customer_answer
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_exam_paper_question_customer_answer";
CREATE TABLE "public"."t_exam_paper_question_customer_answer" (
  "id" int4 NOT NULL DEFAULT nextval('t_exam_paper_question_customer_answer_id_seq'::regclass),
  "question_id" int4,
  "exam_paper_id" int4,
  "exam_paper_answer_id" int4,
  "question_type" int4,
  "subject_id" int4,
  "customer_score" int4,
  "question_score" int4,
  "question_text_content_id" int4,
  "answer" varchar(255) COLLATE "pg_catalog"."default",
  "text_content_id" int4,
  "do_right" bool,
  "create_user" int4,
  "create_time" timestamp(6),
  "item_order" int4
)
;

-- ----------------------------
-- Records of t_exam_paper_question_customer_answer
-- ----------------------------
INSERT INTO "public"."t_exam_paper_question_customer_answer" VALUES (2, 8, 5, 2, 1, 20, 0, 30, 8, 'A', NULL, 'f', 6, '2025-03-25 15:43:49.548', 1);
INSERT INTO "public"."t_exam_paper_question_customer_answer" VALUES (3, 6, 5, 2, 1, 20, 0, 30, 6, 'A', NULL, 'f', 6, '2025-03-25 15:43:49.548', 2);
INSERT INTO "public"."t_exam_paper_question_customer_answer" VALUES (4, 9, 5, 2, 1, 20, 0, 30, 9, 'B', NULL, 'f', 6, '2025-03-25 15:43:49.548', 3);
INSERT INTO "public"."t_exam_paper_question_customer_answer" VALUES (5, 7, 5, 2, 1, 20, 0, 30, 7, 'C', NULL, 'f', 6, '2025-03-25 15:43:49.548', 4);
INSERT INTO "public"."t_exam_paper_question_customer_answer" VALUES (6, 5, 5, 2, 1, 20, 0, 30, 5, 'C', NULL, 'f', 6, '2025-03-25 15:43:49.548', 5);
INSERT INTO "public"."t_exam_paper_question_customer_answer" VALUES (7, 10, 5, 2, 1, 20, 0, 30, 10, 'C', NULL, 'f', 6, '2025-03-25 15:43:49.548', 6);
INSERT INTO "public"."t_exam_paper_question_customer_answer" VALUES (8, 13, 5, 2, 1, 20, 30, 30, 13, 'D', NULL, 't', 6, '2025-03-25 15:43:49.548', 7);
INSERT INTO "public"."t_exam_paper_question_customer_answer" VALUES (9, 12, 5, 2, 1, 20, 30, 30, 12, 'A', NULL, 't', 6, '2025-03-25 15:43:49.548', 8);
INSERT INTO "public"."t_exam_paper_question_customer_answer" VALUES (10, 11, 5, 2, 1, 20, 0, 30, 11, 'C', NULL, 'f', 6, '2025-03-25 15:43:49.548', 9);
INSERT INTO "public"."t_exam_paper_question_customer_answer" VALUES (11, 14, 5, 2, 1, 20, 0, 30, 14, 'B', NULL, 'f', 6, '2025-03-25 15:43:49.548', 10);
INSERT INTO "public"."t_exam_paper_question_customer_answer" VALUES (12, 8, 3, 3, 1, 20, 30, 30, 8, 'B', NULL, 't', 6, '2025-03-25 15:44:05.583', 1);
INSERT INTO "public"."t_exam_paper_question_customer_answer" VALUES (13, 5, 3, 3, 1, 20, 0, 30, 5, 'A', NULL, 'f', 6, '2025-03-25 15:44:05.583', 2);
INSERT INTO "public"."t_exam_paper_question_customer_answer" VALUES (14, 6, 3, 3, 1, 20, 0, 30, 6, 'B', NULL, 'f', 6, '2025-03-25 15:44:05.583', 3);
INSERT INTO "public"."t_exam_paper_question_customer_answer" VALUES (15, 7, 3, 3, 1, 20, 0, 30, 7, 'B', NULL, 'f', 6, '2025-03-25 15:44:05.583', 4);
INSERT INTO "public"."t_exam_paper_question_customer_answer" VALUES (16, 2, 3, 3, 1, 20, 30, 30, 2, 'C', NULL, 't', 6, '2025-03-25 15:44:05.583', 5);
INSERT INTO "public"."t_exam_paper_question_customer_answer" VALUES (17, 3, 3, 3, 1, 20, 30, 30, 3, 'C', NULL, 't', 6, '2025-03-25 15:44:05.583', 6);
INSERT INTO "public"."t_exam_paper_question_customer_answer" VALUES (18, 13, 3, 3, 1, 20, 0, 30, 13, 'C', NULL, 'f', 6, '2025-03-25 15:44:05.583', 7);
INSERT INTO "public"."t_exam_paper_question_customer_answer" VALUES (19, 10, 3, 3, 1, 20, 0, 30, 10, 'B', NULL, 'f', 6, '2025-03-25 15:44:05.583', 8);
INSERT INTO "public"."t_exam_paper_question_customer_answer" VALUES (20, 11, 3, 3, 1, 20, 0, 30, 11, 'C', NULL, 'f', 6, '2025-03-25 15:44:05.583', 9);
INSERT INTO "public"."t_exam_paper_question_customer_answer" VALUES (21, 12, 3, 3, 1, 20, 0, 30, 12, 'B', NULL, 'f', 6, '2025-03-25 15:44:05.583', 10);

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_message";
CREATE TABLE "public"."t_message" (
  "id" int4 NOT NULL DEFAULT nextval('t_message_id_seq'::regclass),
  "title" varchar(255) COLLATE "pg_catalog"."default",
  "content" varchar(500) COLLATE "pg_catalog"."default",
  "send_user_id" int4,
  "send_user_name" varchar(255) COLLATE "pg_catalog"."default",
  "send_real_name" varchar(255) COLLATE "pg_catalog"."default",
  "read_count" int4,
  "receive_user_count" int4,
  "create_time" timestamp(6)
)
;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO "public"."t_message" VALUES (2, '七年级清明节作业发布', '七年级清明节作业已发布！', 8, 'teacher', '教师1', 0, 1, '2025-03-25 15:41:06.647');

-- ----------------------------
-- Table structure for t_message_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_message_user";
CREATE TABLE "public"."t_message_user" (
  "id" int4 NOT NULL DEFAULT nextval('t_message_user_id_seq'::regclass),
  "message_id" int4,
  "receive_user_id" int4,
  "receive_user_name" varchar(255) COLLATE "pg_catalog"."default",
  "receive_real_name" varchar(255) COLLATE "pg_catalog"."default",
  "readed" bool,
  "read_time" timestamp(6),
  "create_time" timestamp(6)
)
;

-- ----------------------------
-- Records of t_message_user
-- ----------------------------
INSERT INTO "public"."t_message_user" VALUES (2, 2, 6, 'mianmian', NULL, 'f', NULL, '2025-03-25 15:41:06.647');

-- ----------------------------
-- Table structure for t_question
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_question";
CREATE TABLE "public"."t_question" (
  "id" int4 NOT NULL DEFAULT nextval('t_question_id_seq'::regclass),
  "question_type" int4,
  "subject_id" int4,
  "score" int4,
  "grade_level" int4,
  "difficult" int4,
  "correct" text COLLATE "pg_catalog"."default",
  "info_text_content_id" int4,
  "create_user" int4,
  "status" int4,
  "create_time" timestamp(6),
  "deleted" bool
)
;

-- ----------------------------
-- Records of t_question
-- ----------------------------
INSERT INTO "public"."t_question" VALUES (2, 1, 20, 30, 7, 4, 'C', 2, 8, 1, '2025-03-24 18:08:59.465', 'f');
INSERT INTO "public"."t_question" VALUES (3, 1, 20, 30, 7, 4, 'C', 3, 8, 1, '2025-03-24 18:16:06.377', 'f');
INSERT INTO "public"."t_question" VALUES (4, 1, 20, 30, 7, 3, 'C', 4, 8, 1, '2025-03-25 15:22:24.115', 't');
INSERT INTO "public"."t_question" VALUES (5, 1, 20, 30, 7, 2, 'B', 5, 8, 1, '2025-03-25 15:23:26.187', 'f');
INSERT INTO "public"."t_question" VALUES (6, 1, 20, 30, 7, 3, 'C', 6, 8, 1, '2025-03-25 15:25:08.446', 'f');
INSERT INTO "public"."t_question" VALUES (7, 1, 20, 30, 7, 5, 'A', 7, 8, 1, '2025-03-25 15:25:55.301', 'f');
INSERT INTO "public"."t_question" VALUES (8, 1, 20, 30, 7, 2, 'B', 8, 8, 1, '2025-03-25 15:26:42.153', 'f');
INSERT INTO "public"."t_question" VALUES (9, 1, 20, 30, 7, 4, 'C', 9, 8, 1, '2025-03-25 15:27:29.545', 'f');
INSERT INTO "public"."t_question" VALUES (10, 1, 20, 30, 7, 3, 'D', 10, 8, 1, '2025-03-25 15:28:19.116', 'f');
INSERT INTO "public"."t_question" VALUES (11, 1, 20, 30, 7, 4, 'B', 11, 8, 1, '2025-03-25 15:29:18.619', 'f');
INSERT INTO "public"."t_question" VALUES (12, 1, 20, 30, 7, 3, 'A', 12, 8, 1, '2025-03-25 15:30:01.794', 'f');
INSERT INTO "public"."t_question" VALUES (13, 1, 20, 30, 7, 4, 'D', 13, 8, 1, '2025-03-25 15:31:07.617', 'f');
INSERT INTO "public"."t_question" VALUES (14, 1, 20, 30, 7, 3, 'C', 14, 8, 1, '2025-03-25 15:31:57.619', 'f');

-- ----------------------------
-- Table structure for t_subject
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_subject";
CREATE TABLE "public"."t_subject" (
  "id" int4 NOT NULL DEFAULT nextval('t_subject_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default",
  "level" int4,
  "level_name" varchar(255) COLLATE "pg_catalog"."default",
  "item_order" int4,
  "deleted" bool
)
;

-- ----------------------------
-- Records of t_subject
-- ----------------------------
INSERT INTO "public"."t_subject" VALUES (2, '语文', 1, '一年级', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (3, '数学', 1, '一年级', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (4, '英语', 1, '一年级', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (5, '语文', 2, '二年级', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (6, '数学', 2, '二年级', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (7, '英语', 2, '二年级', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (8, '语文', 3, '三年级', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (9, '数学', 3, '三年级', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (10, '英语', 3, '三年级', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (11, '语文', 4, '四年级', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (12, '数学', 4, '四年级', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (13, '英语', 4, '四年级', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (14, '语文', 5, '五年级', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (15, '数学', 5, '五年级', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (16, '英语', 5, '五年级', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (17, '语文', 6, '六年级', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (18, '数学', 6, '六年级', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (19, '英语', 6, '六年级', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (20, '语文', 7, '初一', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (21, '数学', 7, '初一', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (22, '英语', 7, '初一', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (23, '语文', 8, '初二', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (24, '数学', 8, '初二', NULL, 'f');
INSERT INTO "public"."t_subject" VALUES (25, '英语', 8, '初二', NULL, 'f');

-- ----------------------------
-- Table structure for t_task_exam
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_task_exam";
CREATE TABLE "public"."t_task_exam" (
  "id" int4 NOT NULL DEFAULT nextval('t_task_exam_id_seq'::regclass),
  "title" varchar(255) COLLATE "pg_catalog"."default",
  "grade_level" int4,
  "frame_text_content_id" int4,
  "create_user" int4,
  "create_user_name" varchar(255) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "deleted" bool
)
;

-- ----------------------------
-- Records of t_task_exam
-- ----------------------------
INSERT INTO "public"."t_task_exam" VALUES (2, '七年级清明学习作业', 7, 19, 8, 'teacher', '2025-03-25 15:40:29.698', 'f');

-- ----------------------------
-- Table structure for t_task_exam_customer_answer
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_task_exam_customer_answer";
CREATE TABLE "public"."t_task_exam_customer_answer" (
  "id" int4 NOT NULL DEFAULT nextval('t_task_exam_customer_answer_id_seq'::regclass),
  "task_exam_id" int4,
  "text_content_id" int4,
  "create_user" int4,
  "create_time" timestamp(6)
)
;

-- ----------------------------
-- Records of t_task_exam_customer_answer
-- ----------------------------
INSERT INTO "public"."t_task_exam_customer_answer" VALUES (2, 2, 20, 6, '2025-03-25 15:43:49.56');

-- ----------------------------
-- Table structure for t_text_content
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_text_content";
CREATE TABLE "public"."t_text_content" (
  "id" int4 NOT NULL DEFAULT nextval('t_text_content_id_seq'::regclass),
  "content" text COLLATE "pg_catalog"."default",
  "create_time" timestamp(6)
)
;

-- ----------------------------
-- Records of t_text_content
-- ----------------------------
INSERT INTO "public"."t_text_content" VALUES (2, '{"titleContent":"<p class=\"ueditor-p\"><span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">王先生的QQ签名档最近改成了“庆祝弄璋之喜”，王先生近来的喜事是：</span></span></p>","analyze":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\"><span style=\"color: #333333; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: 14px; text-indent: 28px; text-wrap-mode: wrap; background-color: #FFFFFF;\">古人把璋给男孩玩，希望他将来有玉一样的品德。旧时常用以祝贺人家生男孩。</span></span></span>","questionItemObjects":[{"prefix":"A","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">新婚</span>","score":null,"itemUuid":null},{"prefix":"B","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">搬家</span>","score":null,"itemUuid":null},{"prefix":"C","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">妻子生了个男孩</span>","score":null,"itemUuid":null},{"prefix":"D","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">考试通过</span>","score":null,"itemUuid":null}],"correct":"C"}', '2025-03-24 18:08:59.465');
INSERT INTO "public"."t_text_content" VALUES (3, '{"titleContent":"<p class=\"ueditor-p\"><span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">“爆竹声中一岁除，春风送暖入屠苏”，这里的“屠苏”指的是：</span></span></p>","analyze":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">C</span></span>","questionItemObjects":[{"prefix":"A","content":"<p class=\"ueditor-p\"><span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">苏州</span></p>","score":null,"itemUuid":null},{"prefix":"B","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">房屋</span>","score":null,"itemUuid":null},{"prefix":"C","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">酒</span>","score":null,"itemUuid":null},{"prefix":"D","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">庄稼</span>","score":null,"itemUuid":null}],"correct":"C"}', '2025-03-24 18:16:06.377');
INSERT INTO "public"."t_text_content" VALUES (4, '{"titleContent":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">“爆竹声中一岁除，春风送暖入屠苏”，这里的“屠苏”指的是：</span></span>","analyze":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">C</span></span>","questionItemObjects":[{"prefix":"A","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">苏州</span>","score":null,"itemUuid":null},{"prefix":"B","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">房屋</span>","score":null,"itemUuid":null},{"prefix":"C","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">酒</span>","score":null,"itemUuid":null},{"prefix":"D","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">庄稼</span>","score":null,"itemUuid":null}],"correct":"C"}', '2025-03-25 15:22:24.115');
INSERT INTO "public"."t_text_content" VALUES (5, '{"titleContent":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">《三十六计》是体现我国古代卓越军事思想的一部兵书，下列不属于《三十六计》的是：</span></span>","analyze":"B","questionItemObjects":[{"prefix":"A","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">浑水摸鱼</span>","score":null,"itemUuid":null},{"prefix":"B","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">反戈一击</span>","score":null,"itemUuid":null},{"prefix":"C","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">笑里藏刀</span>","score":null,"itemUuid":null},{"prefix":"D","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">反客为主</span>","score":null,"itemUuid":null}],"correct":"B"}', '2025-03-25 15:23:26.187');
INSERT INTO "public"."t_text_content" VALUES (6, '{"titleContent":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">“床前明月光”是李白的千古名句，其中 “床”指的是什么?</span></span>","analyze":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">C</span></span>","questionItemObjects":[{"prefix":"A","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">窗户</span>","score":null,"itemUuid":null},{"prefix":"B","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">卧具</span>","score":null,"itemUuid":null},{"prefix":"C","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">井上的围栏</span>","score":null,"itemUuid":null}],"correct":"C"}', '2025-03-25 15:25:08.446');
INSERT INTO "public"."t_text_content" VALUES (7, '{"titleContent":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">1932年，清华大学招生试题中有一道对对子题，上联“孙行者”，下面下联中最合适的是：</span></span>","analyze":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">A</span></span>","questionItemObjects":[{"prefix":"A","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">胡适之</span>","score":null,"itemUuid":null},{"prefix":"B","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">周作人</span>","score":null,"itemUuid":null},{"prefix":"C","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">郁达夫</span>","score":null,"itemUuid":null},{"prefix":"D","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">唐三藏</span>","score":null,"itemUuid":null}],"correct":"A"}', '2025-03-25 15:25:55.301');
INSERT INTO "public"."t_text_content" VALUES (8, '{"titleContent":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">“月上柳梢头，人约黄昏后”描写的是哪个传统节日?&nbsp;</span></span>","analyze":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">B</span></span>","questionItemObjects":[{"prefix":"A","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">中秋节</span>","score":null,"itemUuid":null},{"prefix":"B","content":"<p class=\"ueditor-p\"><span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">元宵节</span></p>","score":null,"itemUuid":null},{"prefix":"C","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">端午节</span>","score":null,"itemUuid":null},{"prefix":"D","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">七夕节</span>","score":null,"itemUuid":null}],"correct":"B"}', '2025-03-25 15:26:42.153');
INSERT INTO "public"."t_text_content" VALUES (9, '{"titleContent":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">下列哪一句诗描写的场景最适合采用水墨画来表现?</span></span>","analyze":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">C</span></span>","questionItemObjects":[{"prefix":"A","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">落霞与孤鹜齐飞，秋水共长天一色</span>","score":null,"itemUuid":null},{"prefix":"B","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">&nbsp;返景入深林，复照青苔上</span>","score":null,"itemUuid":null},{"prefix":"C","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">孤舟蓑笠翁，独钓寒江雪</span>","score":null,"itemUuid":null},{"prefix":"D","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">接天莲叶无穷碧，映日荷花别样红</span>","score":null,"itemUuid":null}],"correct":"C"}', '2025-03-25 15:27:29.545');
INSERT INTO "public"."t_text_content" VALUES (10, '{"titleContent":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">下列哪个成语典故与项羽有关?</span></span>","analyze":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">D</span></span>","questionItemObjects":[{"prefix":"A","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">隔岸观火</span>","score":null,"itemUuid":null},{"prefix":"B","content":"<p class=\"ueditor-p\"><span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">暗度陈仓</span></p>","score":null,"itemUuid":null},{"prefix":"C","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">背水一战</span>","score":null,"itemUuid":null},{"prefix":"D","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">破釜沉舟</span>","score":null,"itemUuid":null}],"correct":"D"}', '2025-03-25 15:28:19.116');
INSERT INTO "public"."t_text_content" VALUES (11, '{"titleContent":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">京剧《贵妃醉酒》是根据哪部古代戏曲改编而成的?</span></span>","analyze":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">B</span></span>","questionItemObjects":[{"prefix":"A","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">《桃花扇》</span>","score":null,"itemUuid":null},{"prefix":"B","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">《长生殿》</span>","score":null,"itemUuid":null},{"prefix":"C","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">《牡丹亭》</span>","score":null,"itemUuid":null},{"prefix":"D","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">《南柯梦》</span>","score":null,"itemUuid":null}],"correct":"B"}', '2025-03-25 15:29:18.619');
INSERT INTO "public"."t_text_content" VALUES (12, '{"titleContent":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">道家思想在我国影响深远，请问历史中的哪一时期最接近道家所主张的无为而治?</span></span>","analyze":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">A</span></span>","questionItemObjects":[{"prefix":"A","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">文景之治</span>","score":null,"itemUuid":null},{"prefix":"B","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">光武中兴</span>","score":null,"itemUuid":null},{"prefix":"C","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">贞观之治</span>","score":null,"itemUuid":null},{"prefix":"D","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">开元盛世</span>","score":null,"itemUuid":null}],"correct":"A"}', '2025-03-25 15:30:01.794');
INSERT INTO "public"."t_text_content" VALUES (13, '{"titleContent":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">下面哪句话出自《孟子》?</span></span>","analyze":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">D</span></span>","questionItemObjects":[{"prefix":"A","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">水能载舟，亦能覆舟</span>","score":null,"itemUuid":null},{"prefix":"B","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">先天下之忧而忧，后天下之乐而乐</span>","score":null,"itemUuid":null},{"prefix":"C","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">民惟邦本，本固邦宁</span>","score":null,"itemUuid":null},{"prefix":"D","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">独乐乐，与人乐乐，熟乐?</span>","score":null,"itemUuid":null}],"correct":"D"}', '2025-03-25 15:31:07.617');
INSERT INTO "public"."t_text_content" VALUES (14, '{"titleContent":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">下列哪个不是北京的别称?</span></span>","analyze":"<span style=\"font-weight: 700; border: 0px; margin: 0px; padding: 0px; color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\"><span style=\"border: 0px; margin: 0px; padding: 0px;\">C</span></span>","questionItemObjects":[{"prefix":"A","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">大都</span>","score":null,"itemUuid":null},{"prefix":"B","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">中都</span>","score":null,"itemUuid":null},{"prefix":"C","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">上都</span>","score":null,"itemUuid":null},{"prefix":"D","content":"<span style=\"color: #191919; font-family: &quot;PingFang SC&quot;, Arial, 微软雅黑, 宋体, simsun, sans-serif; text-align: justify; text-wrap-mode: wrap; background-color: #FFFFFF;\">南京</span>","score":null,"itemUuid":null}],"correct":"C"}', '2025-03-25 15:31:57.619');
INSERT INTO "public"."t_text_content" VALUES (15, '[{"name":"常识选择题","questionItems":[{"id":5,"itemOrder":1},{"id":6,"itemOrder":2},{"id":2,"itemOrder":3},{"id":3,"itemOrder":4},{"id":10,"itemOrder":5},{"id":13,"itemOrder":6},{"id":12,"itemOrder":7},{"id":11,"itemOrder":8},{"id":14,"itemOrder":9},{"id":9,"itemOrder":10}]}]', '2025-03-25 15:36:31.452');
INSERT INTO "public"."t_text_content" VALUES (16, '[{"name":"常识选择题","questionItems":[{"id":8,"itemOrder":1},{"id":5,"itemOrder":2},{"id":6,"itemOrder":3},{"id":7,"itemOrder":4},{"id":2,"itemOrder":5},{"id":3,"itemOrder":6},{"id":13,"itemOrder":7},{"id":10,"itemOrder":8},{"id":11,"itemOrder":9},{"id":12,"itemOrder":10}]}]', '2025-03-25 15:37:33.98');
INSERT INTO "public"."t_text_content" VALUES (17, '[{"name":"选择小练习","questionItems":[{"id":14,"itemOrder":1},{"id":11,"itemOrder":2},{"id":12,"itemOrder":3},{"id":10,"itemOrder":4},{"id":13,"itemOrder":5},{"id":7,"itemOrder":6},{"id":5,"itemOrder":7},{"id":6,"itemOrder":8},{"id":8,"itemOrder":9},{"id":9,"itemOrder":10}]}]', '2025-03-25 15:38:52.634');
INSERT INTO "public"."t_text_content" VALUES (18, '[{"name":"选择题","questionItems":[{"id":8,"itemOrder":1},{"id":6,"itemOrder":2},{"id":9,"itemOrder":3},{"id":7,"itemOrder":4},{"id":5,"itemOrder":5},{"id":10,"itemOrder":6},{"id":13,"itemOrder":7},{"id":12,"itemOrder":8},{"id":11,"itemOrder":9},{"id":14,"itemOrder":10}]}]', '2025-03-25 15:39:47.613');
INSERT INTO "public"."t_text_content" VALUES (19, '[{"examPaperId":5,"examPaperName":"语文七年级上册清明节作业","itemOrder":null}]', '2025-03-25 15:40:29.698');
INSERT INTO "public"."t_text_content" VALUES (20, '[{"examPaperId":5,"examPaperAnswerId":2,"status":2}]', '2025-03-25 15:43:49.56');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_user";
CREATE TABLE "public"."t_user" (
  "id" int4 NOT NULL DEFAULT nextval('t_user_id_seq'::regclass),
  "user_uuid" uuid,
  "user_name" varchar(255) COLLATE "pg_catalog"."default",
  "password" varchar(255) COLLATE "pg_catalog"."default",
  "real_name" varchar(255) COLLATE "pg_catalog"."default",
  "age" int4,
  "sex" int4,
  "birth_day" timestamp(6),
  "user_level" int4,
  "phone" varchar(255) COLLATE "pg_catalog"."default",
  "role" int4,
  "status" int4,
  "image_path" varchar(255) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "modify_time" timestamp(6),
  "last_active_time" timestamp(6),
  "deleted" bool,
  "wx_open_id" varchar COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO "public"."t_user" VALUES (8, '8ca26d7d-c5f4-4728-bcc4-25ab3e29efdf', 'teacher', 'IPsi0zGCgRzb7i1a9K0uznXOlYmdD7Z4RW86L0d1HMzpVTO/3DXSjH8YDkWHN78nXzU5df4qnhZhfrLHVyjMQA7PQJ+RheRDt/NGxmbb9zd5HNjCaPVduL+VNwXTE/o/ym+bg7BvICaDehy6LZ0mT/61l5vnLYdcw9lyKD0MISo=', '教师1', 40, 2, '2025-03-11 00:00:00', NULL, '18888888888', 3, 1, NULL, '2025-03-24 16:01:58.434', NULL, '2025-03-24 16:01:58.434', 'f', NULL);
INSERT INTO "public"."t_user" VALUES (6, 'e9a0dc17-d5ad-4106-9560-6a81fe8b8b90', 'mianmian', 'RIlylJZDVkqs7OC73wihnFG5yBV4jjm0Os1SaZ0Ss8GcEjcIEPHJlfxqjYlKqURbxautbd1oxZI68ZG8/V1N6ywEB1hdi346qH9cdUE7b0Whz+V9z3BgZUH9wa/gPN0xntbarHgmVLT0Fw1g71l4oyu0t5oqy3Yq+68kCFiPIbM=', '绵绵', 15, 1, '2016-03-25 00:00:00', 7, '18888888888', 1, 1, '/assets/default-avatar.jpg', '2025-03-20 15:44:26.379', '2025-03-25 15:44:35.548', '2025-03-20 15:44:26.379', 'f', NULL);
INSERT INTO "public"."t_user" VALUES (1, 'b41eaab1-926a-4824-94e8-da9259986ab6', 'student', 'RA6atJcbedAQUA/3jTcC85RuVuedZEgkeWUCiagtwhz6SjEKerC4IvFQe1OGSvbk+tPZGfkInRrmipPgHU6tzcpaQfdJkV9cXSGoxyldrWSFxblfpGGDxVisQrtrH7N1AEyi6u3h4iYrwkf4sPV8xoU8ZpOhlKmLEjDEq/an6rQ=', '学生', 16, 1, '1979-06-05 00:00:00', 1, '19171171610', 1, 1, '/assets/default-avatar.jpg', '2019-07-23 05:02:29.027', '2025-03-07 11:17:57.953', '2019-07-23 05:02:29.027', 't', NULL);
INSERT INTO "public"."t_user" VALUES (4, '265c532f-a4b4-404f-a557-c058bf4a8da3', 'student2', 'IqRMT+Jcdzg6EdkSryk6VjDbseguKHbHRnMG8mfjRD6NLSSYDYVhr2Drus+Ic6XqVkxjt0n5emA9sy1hCKP7AspI8JggY0JghweaD7dFYs/mnDlXnmGS2jSq8B+PkPteHJyhwP3OEbO90K/JQ72cw/NAt2ruT7Db8d3knSRNy3E=', NULL, NULL, NULL, NULL, 2, NULL, 1, 1, '/assets/default-avatar.jpg', '2025-03-07 11:47:57.475', '2025-03-20 15:22:21.696', '2025-03-07 11:47:57.475', 't', NULL);
INSERT INTO "public"."t_user" VALUES (5, '06110a9f-d8d0-4499-8f14-bc993eb4592d', 'student3', 'Dzldg5zGJXNWlMzWERBGB7aArrHgE4X5eGKV232BqEofNJ4KFlw/vdlM8p2JCKxRGb5SiCKhfgbT2fKoPscWZGLuDj8LNGWR1g57lInTjTiLzvDbvVvTCK3XzdSlYLzgzC2A5KyIC014Pfh62bf3Fy9ecr7FmB7YY1PNgbuRExA=', NULL, NULL, NULL, NULL, 4, NULL, 1, 1, '/assets/default-avatar.jpg', '2025-03-20 15:27:43.761', '2025-03-20 15:44:17.044', '2025-03-20 15:27:43.761', 't', NULL);
INSERT INTO "public"."t_user" VALUES (2, '55bad52c-cdf7-4321-87b8-e37d958b24cf', 'admin', 'D1AGFL+Gx37t0NPG4d6biYP5Z31cNbwhK5w1lUeiHB2zagqbk8efYfSjYoh1Z/j1dkiRjHU+b0EpwzCh8IGsksJjzD65ci5LsnodQVf4Uj6D3pwoscXGqmkjjpzvSJbx42swwNTA+QoDU8YLo7JhtbUK2X0qCjFGpd+8eJ5BGvk=', '管理员', 18, 1, '2019-09-02 00:00:00', 13, '1561651651616156', 3, 1, '/assets/default-avatar.jpg', '2019-07-23 07:17:16.923', '2024-11-13 15:59:56.795', '2019-07-23 07:17:16.923', 't', NULL);
INSERT INTO "public"."t_user" VALUES (7, 'fcd44f4e-9383-4c77-a4c4-9db8b03b15bd', 'admin', 'gLhdNaTXu9rDVRAJF7nlEM+SN+Od+GN82hhjof2mak/OqbAY6PCIAHTXE7OI2WYP4RRZ1YYoJxGP0jrZwYk9WRJPMXaS1HH651nawBQwouXWgV0jV8c+TyRWMs6VjzGbHpTDEMhbAlDtkkdAcAkeeXU6+TMicdUcHjsKjvpr2R8=', '超级管理员', NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, '2025-03-20 15:51:42.519', '2025-03-20 15:52:10.268', '2025-03-20 15:51:42.519', 'f', NULL);

-- ----------------------------
-- Table structure for t_user_event_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_user_event_log";
CREATE TABLE "public"."t_user_event_log" (
  "id" int4 NOT NULL DEFAULT nextval('t_user_event_log_id_seq'::regclass),
  "user_id" int4,
  "user_name" varchar(255) COLLATE "pg_catalog"."default",
  "real_name" varchar(255) COLLATE "pg_catalog"."default",
  "content" text COLLATE "pg_catalog"."default",
  "create_time" timestamp(6)
)
;

-- ----------------------------
-- Records of t_user_event_log
-- ----------------------------
INSERT INTO "public"."t_user_event_log" VALUES (2, 1, 'student', '学生', 'student 更新了个人资料', '2025-03-03 10:57:11.499');
INSERT INTO "public"."t_user_event_log" VALUES (3, 4, 'student2', NULL, '欢迎 student2 注册来到学习岛在线学习系统', '2025-03-07 11:47:57.485');
INSERT INTO "public"."t_user_event_log" VALUES (4, 2, 'admin', '管理员', 'admin 登录了学习岛在线学习系统', '2025-03-07 16:26:24.439');
INSERT INTO "public"."t_user_event_log" VALUES (5, 5, 'student3', NULL, '欢迎 student3 注册来到学习岛在线学习系统', '2025-03-20 15:27:43.77');
INSERT INTO "public"."t_user_event_log" VALUES (6, 6, 'mianmian', NULL, '欢迎 mianmian 注册来到学习岛在线学习系统', '2025-03-20 15:44:26.441');
INSERT INTO "public"."t_user_event_log" VALUES (7, 2, 'admin', '管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 15:50:14.352');
INSERT INTO "public"."t_user_event_log" VALUES (8, 7, 'admin1', '超级管理员', 'admin1 登录了学习岛在线学习系统', '2025-03-20 15:51:59.392');
INSERT INTO "public"."t_user_event_log" VALUES (9, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 15:54:23.683');
INSERT INTO "public"."t_user_event_log" VALUES (10, 7, 'admin', '超级管理员', 'admin 登出了学习岛在线学习系统', '2025-03-20 16:11:02.549');
INSERT INTO "public"."t_user_event_log" VALUES (11, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:11:06.822');
INSERT INTO "public"."t_user_event_log" VALUES (12, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:11:09.814');
INSERT INTO "public"."t_user_event_log" VALUES (13, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:11:14.892');
INSERT INTO "public"."t_user_event_log" VALUES (14, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:11:27.85');
INSERT INTO "public"."t_user_event_log" VALUES (15, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:11:30.462');
INSERT INTO "public"."t_user_event_log" VALUES (16, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:11:38.679');
INSERT INTO "public"."t_user_event_log" VALUES (17, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:11:42.404');
INSERT INTO "public"."t_user_event_log" VALUES (18, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:12:14.889');
INSERT INTO "public"."t_user_event_log" VALUES (19, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:12:33.317');
INSERT INTO "public"."t_user_event_log" VALUES (20, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:12:40.845');
INSERT INTO "public"."t_user_event_log" VALUES (21, 7, 'admin', '超级管理员', 'admin 登出了学习岛在线学习系统', '2025-03-20 16:16:09.804');
INSERT INTO "public"."t_user_event_log" VALUES (22, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:16:20.059');
INSERT INTO "public"."t_user_event_log" VALUES (23, 7, 'admin', '超级管理员', 'admin 登出了学习岛在线学习系统', '2025-03-20 16:16:53.891');
INSERT INTO "public"."t_user_event_log" VALUES (24, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:16:58.429');
INSERT INTO "public"."t_user_event_log" VALUES (25, 7, 'admin', '超级管理员', 'admin 登出了学习岛在线学习系统', '2025-03-20 16:21:55.79');
INSERT INTO "public"."t_user_event_log" VALUES (26, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:22:01.984');
INSERT INTO "public"."t_user_event_log" VALUES (27, 7, 'admin', '超级管理员', 'admin 登出了学习岛在线学习系统', '2025-03-20 16:23:04.301');
INSERT INTO "public"."t_user_event_log" VALUES (28, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:23:12.73');
INSERT INTO "public"."t_user_event_log" VALUES (29, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:23:15.966');
INSERT INTO "public"."t_user_event_log" VALUES (30, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:23:24.853');
INSERT INTO "public"."t_user_event_log" VALUES (31, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:23:49.696');
INSERT INTO "public"."t_user_event_log" VALUES (32, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:23:55.233');
INSERT INTO "public"."t_user_event_log" VALUES (33, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:24:21.421');
INSERT INTO "public"."t_user_event_log" VALUES (34, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:24:22.195');
INSERT INTO "public"."t_user_event_log" VALUES (35, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:24:22.779');
INSERT INTO "public"."t_user_event_log" VALUES (36, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:24:36.154');
INSERT INTO "public"."t_user_event_log" VALUES (37, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:24:39.432');
INSERT INTO "public"."t_user_event_log" VALUES (38, 7, 'admin', '超级管理员', 'admin 登出了学习岛在线学习系统', '2025-03-20 16:24:42.919');
INSERT INTO "public"."t_user_event_log" VALUES (39, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:25:32.608');
INSERT INTO "public"."t_user_event_log" VALUES (40, 7, 'admin', '超级管理员', 'admin 登出了学习岛在线学习系统', '2025-03-20 16:25:35.536');
INSERT INTO "public"."t_user_event_log" VALUES (41, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:26:03.18');
INSERT INTO "public"."t_user_event_log" VALUES (42, 7, 'admin', '超级管理员', 'admin 登出了学习岛在线学习系统', '2025-03-20 16:26:19.974');
INSERT INTO "public"."t_user_event_log" VALUES (43, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:26:21.818');
INSERT INTO "public"."t_user_event_log" VALUES (44, 7, 'admin', '超级管理员', 'admin 登出了学习岛在线学习系统', '2025-03-20 16:26:46.893');
INSERT INTO "public"."t_user_event_log" VALUES (45, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:26:52.786');
INSERT INTO "public"."t_user_event_log" VALUES (46, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:26:55.431');
INSERT INTO "public"."t_user_event_log" VALUES (47, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:27:33.139');
INSERT INTO "public"."t_user_event_log" VALUES (48, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:29:11.077');
INSERT INTO "public"."t_user_event_log" VALUES (49, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:29:13.059');
INSERT INTO "public"."t_user_event_log" VALUES (50, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:29:15.289');
INSERT INTO "public"."t_user_event_log" VALUES (51, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:29:25.534');
INSERT INTO "public"."t_user_event_log" VALUES (52, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 16:29:27.477');
INSERT INTO "public"."t_user_event_log" VALUES (53, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 18:13:04.138');
INSERT INTO "public"."t_user_event_log" VALUES (54, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 18:13:07.081');
INSERT INTO "public"."t_user_event_log" VALUES (55, 7, 'admin', '超级管理员', 'admin 登出了学习岛在线学习系统', '2025-03-20 18:14:53.673');
INSERT INTO "public"."t_user_event_log" VALUES (56, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 18:14:54.931');
INSERT INTO "public"."t_user_event_log" VALUES (57, 7, 'admin', '超级管理员', 'admin 登出了学习岛在线学习系统', '2025-03-20 18:16:13.061');
INSERT INTO "public"."t_user_event_log" VALUES (58, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 18:16:14.167');
INSERT INTO "public"."t_user_event_log" VALUES (59, 7, 'admin', '超级管理员', 'admin 登出了学习岛在线学习系统', '2025-03-20 18:16:24.596');
INSERT INTO "public"."t_user_event_log" VALUES (60, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-20 18:16:25.601');
INSERT INTO "public"."t_user_event_log" VALUES (61, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-24 15:56:47.865');
INSERT INTO "public"."t_user_event_log" VALUES (62, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-24 15:56:50.684');
INSERT INTO "public"."t_user_event_log" VALUES (63, 7, 'admin', '超级管理员', 'admin 登出了学习岛在线学习系统', '2025-03-24 16:02:04.257');
INSERT INTO "public"."t_user_event_log" VALUES (64, 8, 'teacher', '教师1', 'teacher 登录了学习岛在线学习系统', '2025-03-24 16:02:06.624');
INSERT INTO "public"."t_user_event_log" VALUES (65, 8, 'teacher', '教师1', 'teacher 登出了学习岛在线学习系统', '2025-03-24 16:07:26.528');
INSERT INTO "public"."t_user_event_log" VALUES (66, 8, 'teacher', '教师1', 'teacher 登录了学习岛在线学习系统', '2025-03-24 16:09:55.04');
INSERT INTO "public"."t_user_event_log" VALUES (67, 7, 'admin', '超级管理员', 'admin 登录了学习岛在线学习系统', '2025-03-24 16:12:21.608');
INSERT INTO "public"."t_user_event_log" VALUES (68, 6, 'mianmian', '绵绵', 'mianmian 更新了个人资料', '2025-03-25 15:43:14.991');
INSERT INTO "public"."t_user_event_log" VALUES (69, 6, 'mianmian', '绵绵', 'mianmian 提交试卷：语文七年级上册清明节作业 得分：6 耗时：12 秒', '2025-03-25 15:43:49.559');
INSERT INTO "public"."t_user_event_log" VALUES (70, 6, 'mianmian', '绵绵', 'mianmian 提交试卷：语文七年级下册期末复习练习题 得分：9 耗时：10 秒', '2025-03-25 15:44:05.586');

-- ----------------------------
-- Table structure for t_user_token
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_user_token";
CREATE TABLE "public"."t_user_token" (
  "id" int4 NOT NULL DEFAULT nextval('t_user_token_id_seq'::regclass),
  "token" uuid,
  "user_id" int4,
  "wx_open_id" varchar(255) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6),
  "end_time" timestamp(6),
  "user_name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of t_user_token
-- ----------------------------
INSERT INTO "public"."t_user_token" VALUES (3, 'fc91cd41-2231-4b3d-b286-e670f5ae6616', 1, 'osjns60ai_zgesp918PS0RsIgVD0', '2024-11-13 16:00:11.072', '2024-11-14 04:00:11.072', 'student');
INSERT INTO "public"."t_user_token" VALUES (5, '6bef4cd2-b14f-4ba7-8276-de196d1f1015', 1, 'osjns60ai_zgesp918PS0RsIgVD0', '2024-12-10 12:04:18.51', '2024-12-11 00:04:18.51', 'student');
INSERT INTO "public"."t_user_token" VALUES (6, '4715ea53-20e8-4015-bbcd-cad85a709298', 1, 'osjns60ai_zgesp918PS0RsIgVD0', '2025-03-03 10:56:11.048', '2025-03-03 22:56:11.048', 'student');
INSERT INTO "public"."t_user_token" VALUES (7, 'dd443782-3c3e-42ee-9f0e-9e95c929c925', 1, 'osjns60ai_zgesp918PS0RsIgVD0', '2025-03-03 10:56:11.052', '2025-03-03 22:56:11.052', 'student');
INSERT INTO "public"."t_user_token" VALUES (9, '563efe47-2a95-4684-afaf-c1363943ec68', 4, 'osjns60ai_zgesp918PS0RsIgVD0', '2025-03-07 11:48:03.586', '2025-03-07 23:48:03.586', 'student2');
INSERT INTO "public"."t_user_token" VALUES (10, 'a41c7fce-d211-43da-91cb-809904798c18', 4, 'osjns60ai_zgesp918PS0RsIgVD0', '2025-03-10 15:12:16.66', '2025-03-11 03:12:16.66', 'student2');
INSERT INTO "public"."t_user_token" VALUES (11, '0087011c-010e-47d0-934c-07aeb2417e1c', 4, 'osjns60ai_zgesp918PS0RsIgVD0', '2025-03-10 15:12:16.66', '2025-03-11 03:12:16.66', 'student2');
INSERT INTO "public"."t_user_token" VALUES (12, '2070d46b-5e67-4015-8b86-a372bd330646', 4, 'osjns60ai_zgesp918PS0RsIgVD0', '2025-03-16 20:02:16.937', '2025-03-17 08:02:16.937', 'student2');
INSERT INTO "public"."t_user_token" VALUES (13, '2be84936-c2b6-4788-b5b9-e9edf02b627b', 4, 'osjns60ai_zgesp918PS0RsIgVD0', '2025-03-16 20:02:16.937', '2025-03-17 08:02:16.937', 'student2');
INSERT INTO "public"."t_user_token" VALUES (20, '90debd8b-35a9-482a-a122-7b2180327bea', 6, 'osjns60ai_zgesp918PS0RsIgVD0', '2025-03-20 16:10:23.738', '2025-03-21 04:10:23.738', 'mianmian');
INSERT INTO "public"."t_user_token" VALUES (21, 'c6371cc9-c8a4-482f-a673-beca0c69c68d', 6, 'osjns60ai_zgesp918PS0RsIgVD0', '2025-03-24 18:16:44.832', '2025-03-25 06:16:44.832', 'mianmian');
INSERT INTO "public"."t_user_token" VALUES (22, 'c8c55dd5-a761-4b0e-a767-35ce883a9680', 6, 'osjns60ai_zgesp918PS0RsIgVD0', '2025-03-24 18:16:44.837', '2025-03-25 06:16:44.837', 'mianmian');
INSERT INTO "public"."t_user_token" VALUES (23, 'f8c6d685-abd0-4373-bd23-cdc0be494f66', 6, 'osjns60ai_zgesp918PS0RsIgVD0', '2025-03-25 15:41:44.885', '2025-03-26 03:41:44.885', 'mianmian');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_exam_paper_answer_id_seq"
OWNED BY "public"."t_exam_paper_answer"."id";
SELECT setval('"public"."t_exam_paper_answer_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_exam_paper_id_seq"
OWNED BY "public"."t_exam_paper"."id";
SELECT setval('"public"."t_exam_paper_id_seq"', 5, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_exam_paper_question_customer_answer_id_seq"
OWNED BY "public"."t_exam_paper_question_customer_answer"."id";
SELECT setval('"public"."t_exam_paper_question_customer_answer_id_seq"', 21, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_message_id_seq"
OWNED BY "public"."t_message"."id";
SELECT setval('"public"."t_message_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_message_user_id_seq"
OWNED BY "public"."t_message_user"."id";
SELECT setval('"public"."t_message_user_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_question_id_seq"
OWNED BY "public"."t_question"."id";
SELECT setval('"public"."t_question_id_seq"', 14, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_subject_id_seq"
OWNED BY "public"."t_subject"."id";
SELECT setval('"public"."t_subject_id_seq"', 25, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_task_exam_customer_answer_id_seq"
OWNED BY "public"."t_task_exam_customer_answer"."id";
SELECT setval('"public"."t_task_exam_customer_answer_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_task_exam_id_seq"
OWNED BY "public"."t_task_exam"."id";
SELECT setval('"public"."t_task_exam_id_seq"', 2, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_text_content_id_seq"
OWNED BY "public"."t_text_content"."id";
SELECT setval('"public"."t_text_content_id_seq"', 20, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_user_event_log_id_seq"
OWNED BY "public"."t_user_event_log"."id";
SELECT setval('"public"."t_user_event_log_id_seq"', 70, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_user_id_seq"
OWNED BY "public"."t_user"."id";
SELECT setval('"public"."t_user_id_seq"', 8, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."t_user_token_id_seq"
OWNED BY "public"."t_user_token"."id";
SELECT setval('"public"."t_user_token_id_seq"', 25, true);

-- ----------------------------
-- Primary Key structure for table t_exam_paper
-- ----------------------------
ALTER TABLE "public"."t_exam_paper" ADD CONSTRAINT "t_exam_paper_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_exam_paper_answer
-- ----------------------------
ALTER TABLE "public"."t_exam_paper_answer" ADD CONSTRAINT "t_exam_paper_answer_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_exam_paper_question_customer_answer
-- ----------------------------
ALTER TABLE "public"."t_exam_paper_question_customer_answer" ADD CONSTRAINT "t_exam_paper_question_customer_answer_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_message
-- ----------------------------
ALTER TABLE "public"."t_message" ADD CONSTRAINT "t_message_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_message_user
-- ----------------------------
ALTER TABLE "public"."t_message_user" ADD CONSTRAINT "t_message_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_question
-- ----------------------------
ALTER TABLE "public"."t_question" ADD CONSTRAINT "t_question_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_subject
-- ----------------------------
ALTER TABLE "public"."t_subject" ADD CONSTRAINT "t_subject_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_task_exam
-- ----------------------------
ALTER TABLE "public"."t_task_exam" ADD CONSTRAINT "t_task_exam_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_task_exam_customer_answer
-- ----------------------------
ALTER TABLE "public"."t_task_exam_customer_answer" ADD CONSTRAINT "t_task_exam_customer_answer_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_text_content
-- ----------------------------
ALTER TABLE "public"."t_text_content" ADD CONSTRAINT "t_text_content_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_user
-- ----------------------------
ALTER TABLE "public"."t_user" ADD CONSTRAINT "t_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_user_event_log
-- ----------------------------
ALTER TABLE "public"."t_user_event_log" ADD CONSTRAINT "t_user_event_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table t_user_token
-- ----------------------------
ALTER TABLE "public"."t_user_token" ADD CONSTRAINT "t_user_token_pkey" PRIMARY KEY ("id");
