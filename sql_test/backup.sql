--
-- PostgreSQL database dump
--

-- Dumped from database version 15.14
-- Dumped by pg_dump version 15.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.qrtz_triggers DROP CONSTRAINT "QRTZ_TRIGGERS_ibfk_1";
ALTER TABLE ONLY public.qrtz_simprop_triggers DROP CONSTRAINT "QRTZ_SIMPROP_TRIGGERS_ibfk_1";
ALTER TABLE ONLY public.qrtz_simple_triggers DROP CONSTRAINT "QRTZ_SIMPLE_TRIGGERS_ibfk_1";
ALTER TABLE ONLY public.qrtz_cron_triggers DROP CONSTRAINT "QRTZ_CRON_TRIGGERS_ibfk_1";
ALTER TABLE ONLY public.qrtz_blob_triggers DROP CONSTRAINT "QRTZ_BLOB_TRIGGERS_ibfk_1";
DROP INDEX public.sched_name;
DROP INDEX public.dict_type;
ALTER TABLE ONLY public.sys_user_role DROP CONSTRAINT sys_user_role_pkey;
ALTER TABLE ONLY public.sys_user_post DROP CONSTRAINT sys_user_post_pkey;
ALTER TABLE ONLY public.sys_user DROP CONSTRAINT sys_user_pkey;
ALTER TABLE ONLY public.sys_role DROP CONSTRAINT sys_role_pkey;
ALTER TABLE ONLY public.sys_role_menu DROP CONSTRAINT sys_role_menu_pkey;
ALTER TABLE ONLY public.sys_role_dept DROP CONSTRAINT sys_role_dept_pkey;
ALTER TABLE ONLY public.sys_post DROP CONSTRAINT sys_post_pkey;
ALTER TABLE ONLY public.sys_oper_log DROP CONSTRAINT sys_oper_log_pkey;
ALTER TABLE ONLY public.sys_notice DROP CONSTRAINT sys_notice_pkey;
ALTER TABLE ONLY public.sys_menu DROP CONSTRAINT sys_menu_pkey;
ALTER TABLE ONLY public.sys_logininfor DROP CONSTRAINT sys_logininfor_pkey;
ALTER TABLE ONLY public.sys_job DROP CONSTRAINT sys_job_pkey;
ALTER TABLE ONLY public.sys_job_log DROP CONSTRAINT sys_job_log_pkey;
ALTER TABLE ONLY public.sys_file DROP CONSTRAINT sys_file_pkey;
ALTER TABLE ONLY public.sys_dict_type DROP CONSTRAINT sys_dict_type_pkey;
ALTER TABLE ONLY public.sys_dict_data DROP CONSTRAINT sys_dict_data_pkey;
ALTER TABLE ONLY public.sys_dept DROP CONSTRAINT sys_dept_pkey;
ALTER TABLE ONLY public.sys_config DROP CONSTRAINT sys_config_pkey;
ALTER TABLE ONLY public.gen_table DROP CONSTRAINT gen_table_pkey;
ALTER TABLE ONLY public.gen_table_column DROP CONSTRAINT gen_table_column_pkey;
ALTER TABLE ONLY public.qrtz_triggers DROP CONSTRAINT "QRTZ_TRIGGERS_pkey";
ALTER TABLE ONLY public.qrtz_simprop_triggers DROP CONSTRAINT "QRTZ_SIMPROP_TRIGGERS_pkey";
ALTER TABLE ONLY public.qrtz_simple_triggers DROP CONSTRAINT "QRTZ_SIMPLE_TRIGGERS_pkey";
ALTER TABLE ONLY public.qrtz_scheduler_state DROP CONSTRAINT "QRTZ_SCHEDULER_STATE_pkey";
ALTER TABLE ONLY public.qrtz_paused_trigger_grps DROP CONSTRAINT "QRTZ_PAUSED_TRIGGER_GRPS_pkey";
ALTER TABLE ONLY public.qrtz_locks DROP CONSTRAINT "QRTZ_LOCKS_pkey";
ALTER TABLE ONLY public.qrtz_job_details DROP CONSTRAINT "QRTZ_JOB_DETAILS_pkey";
ALTER TABLE ONLY public.qrtz_fired_triggers DROP CONSTRAINT "QRTZ_FIRED_TRIGGERS_pkey";
ALTER TABLE ONLY public.qrtz_cron_triggers DROP CONSTRAINT "QRTZ_CRON_TRIGGERS_pkey";
ALTER TABLE ONLY public.qrtz_calendars DROP CONSTRAINT "QRTZ_CALENDARS_pkey";
ALTER TABLE ONLY public.qrtz_blob_triggers DROP CONSTRAINT "QRTZ_BLOB_TRIGGERS_pkey";
ALTER TABLE public.sys_user ALTER COLUMN user_id DROP DEFAULT;
ALTER TABLE public.sys_role ALTER COLUMN role_id DROP DEFAULT;
ALTER TABLE public.sys_post ALTER COLUMN post_id DROP DEFAULT;
ALTER TABLE public.sys_oper_log ALTER COLUMN oper_id DROP DEFAULT;
ALTER TABLE public.sys_notice ALTER COLUMN notice_id DROP DEFAULT;
ALTER TABLE public.sys_menu ALTER COLUMN menu_id DROP DEFAULT;
ALTER TABLE public.sys_logininfor ALTER COLUMN info_id DROP DEFAULT;
ALTER TABLE public.sys_job_log ALTER COLUMN job_log_id DROP DEFAULT;
ALTER TABLE public.sys_job ALTER COLUMN job_id DROP DEFAULT;
ALTER TABLE public.sys_file ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.sys_dict_type ALTER COLUMN dict_id DROP DEFAULT;
ALTER TABLE public.sys_dict_data ALTER COLUMN dict_code DROP DEFAULT;
ALTER TABLE public.sys_config ALTER COLUMN config_id DROP DEFAULT;
ALTER TABLE public.gen_table_column ALTER COLUMN column_id DROP DEFAULT;
ALTER TABLE public.gen_table ALTER COLUMN table_id DROP DEFAULT;
DROP TABLE public.unit_detail;
DROP SEQUENCE public.sys_user_user_id_seq;
DROP TABLE public.sys_user_role;
DROP TABLE public.sys_user_post;
DROP TABLE public.sys_user;
DROP SEQUENCE public.sys_role_role_id_seq;
DROP TABLE public.sys_role_menu;
DROP TABLE public.sys_role_dept;
DROP TABLE public.sys_role;
DROP SEQUENCE public.sys_post_post_id_seq;
DROP TABLE public.sys_post;
DROP SEQUENCE public.sys_oper_log_oper_id_seq;
DROP TABLE public.sys_oper_log;
DROP SEQUENCE public.sys_notice_notice_id_seq;
DROP TABLE public.sys_notice;
DROP SEQUENCE public.sys_menu_menu_id_seq;
DROP TABLE public.sys_menu;
DROP SEQUENCE public.sys_logininfor_info_id_seq;
DROP TABLE public.sys_logininfor;
DROP SEQUENCE public.sys_job_log_job_log_id_seq;
DROP TABLE public.sys_job_log;
DROP SEQUENCE public.sys_job_job_id_seq;
DROP TABLE public.sys_job;
DROP SEQUENCE public.sys_file_id_seq;
DROP TABLE public.sys_file;
DROP SEQUENCE public.sys_dict_type_dict_id_seq;
DROP TABLE public.sys_dict_type;
DROP SEQUENCE public.sys_dict_data_dict_code_seq;
DROP TABLE public.sys_dict_data;
DROP TABLE public.sys_dept;
DROP SEQUENCE public.sys_config_config_id_seq;
DROP TABLE public.sys_config;
DROP TABLE public.qrtz_triggers;
DROP TABLE public.qrtz_simprop_triggers;
DROP TABLE public.qrtz_simple_triggers;
DROP TABLE public.qrtz_scheduler_state;
DROP TABLE public.qrtz_paused_trigger_grps;
DROP TABLE public.qrtz_locks;
DROP TABLE public.qrtz_job_details;
DROP TABLE public.qrtz_fired_triggers;
DROP TABLE public.qrtz_cron_triggers;
DROP TABLE public.qrtz_calendars;
DROP TABLE public.qrtz_blob_triggers;
DROP TABLE public.order_info;
DROP VIEW public.list_table;
DROP VIEW public.list_column;
DROP SEQUENCE public.gen_table_table_id_seq;
DROP SEQUENCE public.gen_table_column_column_id_seq;
DROP TABLE public.gen_table_column;
DROP TABLE public.gen_table;
DROP TABLE public.data_info_detail;
DROP FUNCTION public.substring_index(character varying, character varying, integer);
DROP FUNCTION public.find_in_set(bigint, character varying);
--
-- Name: find_in_set(bigint, character varying); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION public.find_in_set(bigint, character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$
DECLARE
    STR ALIAS FOR $1;
    STRS ALIAS FOR $2;
    POS INTEGER;
    STATUS BOOLEAN;
BEGIN
    SELECT POSITION( ','||STR||',' IN ','||STRS||',') INTO POS;
    IF POS > 0 THEN
        STATUS = TRUE;
    ELSE
        STATUS = FALSE;
    END IF;
    RETURN STATUS;
END;
$_$;


ALTER FUNCTION public.find_in_set(bigint, character varying) OWNER TO root;

--
-- Name: substring_index(character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: root
--

CREATE FUNCTION public.substring_index(character varying, character varying, integer) RETURNS character varying
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $_$

DECLARE

tokens varchar[];

length integer ;

indexnum integer;

BEGIN

tokens := pg_catalog.string_to_array($1, $2);

length := pg_catalog.array_upper(tokens, 1);

indexnum := length - ($3 * -1) + 1;

IF $3 >= 0 THEN

RETURN pg_catalog.array_to_string(tokens[1:$3], $2);

ELSE

RETURN pg_catalog.array_to_string(tokens[indexnum:length], $2);

END IF;

END;

$_$;


ALTER FUNCTION public.substring_index(character varying, character varying, integer) OWNER TO root;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: data_info_detail; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.data_info_detail (
    month_no integer NOT NULL,
    sale_center_name character varying(20) NOT NULL,
    org_name character varying(20) NOT NULL,
    staff_code character varying(10) NOT NULL,
    staff_name character varying(20) NOT NULL,
    data_type character varying(50) NOT NULL,
    complete_num integer NOT NULL,
    activate_num integer NOT NULL
);


ALTER TABLE public.data_info_detail OWNER TO root;

--
-- Name: COLUMN data_info_detail.month_no; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.data_info_detail.month_no IS '月份';


--
-- Name: COLUMN data_info_detail.sale_center_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.data_info_detail.sale_center_name IS '经营单位';


--
-- Name: COLUMN data_info_detail.org_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.data_info_detail.org_name IS '支局';


--
-- Name: COLUMN data_info_detail.staff_code; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.data_info_detail.staff_code IS '工号';


--
-- Name: COLUMN data_info_detail.staff_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.data_info_detail.staff_name IS '姓名';


--
-- Name: COLUMN data_info_detail.data_type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.data_info_detail.data_type IS '类型';


--
-- Name: COLUMN data_info_detail.complete_num; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.data_info_detail.complete_num IS '竣工数';


--
-- Name: COLUMN data_info_detail.activate_num; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.data_info_detail.activate_num IS '激活数';


--
-- Name: gen_table; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.gen_table (
    table_id bigint NOT NULL,
    table_name character varying(200),
    table_comment character varying(500),
    sub_table_name character varying(64),
    sub_table_fk_name character varying(64),
    class_name character varying(100),
    tpl_category character varying(200),
    tpl_web_type character varying(30),
    package_name character varying(100),
    module_name character varying(30),
    business_name character varying(30),
    function_name character varying(50),
    function_author character varying(50),
    gen_type character(1),
    gen_path character varying(200),
    options character varying(1000),
    create_by character varying(64),
    create_time timestamp(6) without time zone,
    update_by character varying(64),
    update_time timestamp(6) without time zone,
    remark character varying(500)
);


ALTER TABLE public.gen_table OWNER TO root;

--
-- Name: TABLE gen_table; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.gen_table IS '代码生成业务表';


--
-- Name: COLUMN gen_table.table_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table.table_id IS '编号';


--
-- Name: COLUMN gen_table.table_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table.table_name IS '表名称';


--
-- Name: COLUMN gen_table.table_comment; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table.table_comment IS '表描述';


--
-- Name: COLUMN gen_table.sub_table_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table.sub_table_name IS '关联子表的表名';


--
-- Name: COLUMN gen_table.sub_table_fk_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table.sub_table_fk_name IS '子表关联的外键名';


--
-- Name: COLUMN gen_table.class_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table.class_name IS '实体类名称';


--
-- Name: COLUMN gen_table.tpl_category; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table.tpl_category IS '使用的模板（crud单表操作 tree树表操作）';


--
-- Name: COLUMN gen_table.tpl_web_type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table.tpl_web_type IS '前端模板类型（element-ui模版 element-plus模版）';


--
-- Name: COLUMN gen_table.package_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table.package_name IS '生成包路径';


--
-- Name: COLUMN gen_table.module_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table.module_name IS '生成模块名';


--
-- Name: COLUMN gen_table.business_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table.business_name IS '生成业务名';


--
-- Name: COLUMN gen_table.function_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table.function_name IS '生成功能名';


--
-- Name: COLUMN gen_table.function_author; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table.function_author IS '生成功能作者';


--
-- Name: COLUMN gen_table.gen_type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table.gen_type IS '生成代码方式（0zip压缩包 1自定义路径）';


--
-- Name: COLUMN gen_table.gen_path; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table.gen_path IS '生成路径（不填默认项目路径）';


--
-- Name: COLUMN gen_table.options; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table.options IS '其它生成选项';


--
-- Name: COLUMN gen_table.create_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table.create_by IS '创建者';


--
-- Name: COLUMN gen_table.create_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table.create_time IS '创建时间';


--
-- Name: COLUMN gen_table.update_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table.update_by IS '更新者';


--
-- Name: COLUMN gen_table.update_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table.update_time IS '更新时间';


--
-- Name: COLUMN gen_table.remark; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table.remark IS '备注';


--
-- Name: gen_table_column; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.gen_table_column (
    column_id bigint NOT NULL,
    table_id character varying(64),
    column_name character varying(200),
    column_comment character varying(500),
    column_type character varying(100),
    java_type character varying(500),
    java_field character varying(200),
    is_pk character(1),
    is_increment character(1),
    is_required character(1),
    is_insert character(1),
    is_edit character(1),
    is_list character(1),
    is_query character(1),
    query_type character varying(200),
    html_type character varying(200),
    dict_type character varying(200) DEFAULT ''::character varying,
    sort integer,
    create_by character varying(64),
    create_time timestamp(6) without time zone,
    update_by character varying(64),
    update_time timestamp(6) without time zone
);


ALTER TABLE public.gen_table_column OWNER TO root;

--
-- Name: TABLE gen_table_column; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.gen_table_column IS '代码生成业务表字段';


--
-- Name: COLUMN gen_table_column.column_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.column_id IS '编号';


--
-- Name: COLUMN gen_table_column.table_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.table_id IS '归属表编号';


--
-- Name: COLUMN gen_table_column.column_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.column_name IS '列名称';


--
-- Name: COLUMN gen_table_column.column_comment; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.column_comment IS '列描述';


--
-- Name: COLUMN gen_table_column.column_type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.column_type IS '列类型';


--
-- Name: COLUMN gen_table_column.java_type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.java_type IS 'JAVA类型';


--
-- Name: COLUMN gen_table_column.java_field; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.java_field IS 'JAVA字段名';


--
-- Name: COLUMN gen_table_column.is_pk; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.is_pk IS '是否主键（1是）';


--
-- Name: COLUMN gen_table_column.is_increment; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.is_increment IS '是否自增（1是）';


--
-- Name: COLUMN gen_table_column.is_required; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.is_required IS '是否必填（1是）';


--
-- Name: COLUMN gen_table_column.is_insert; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.is_insert IS '是否为插入字段（1是）';


--
-- Name: COLUMN gen_table_column.is_edit; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.is_edit IS '是否编辑字段（1是）';


--
-- Name: COLUMN gen_table_column.is_list; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.is_list IS '是否列表字段（1是）';


--
-- Name: COLUMN gen_table_column.is_query; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.is_query IS '是否查询字段（1是）';


--
-- Name: COLUMN gen_table_column.query_type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.query_type IS '查询方式（等于、不等于、大于、小于、范围）';


--
-- Name: COLUMN gen_table_column.html_type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.html_type IS '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）';


--
-- Name: COLUMN gen_table_column.dict_type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.dict_type IS '字典类型';


--
-- Name: COLUMN gen_table_column.sort; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.sort IS '排序';


--
-- Name: COLUMN gen_table_column.create_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.create_by IS '创建者';


--
-- Name: COLUMN gen_table_column.create_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.create_time IS '创建时间';


--
-- Name: COLUMN gen_table_column.update_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.update_by IS '更新者';


--
-- Name: COLUMN gen_table_column.update_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.gen_table_column.update_time IS '更新时间';


--
-- Name: gen_table_column_column_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.gen_table_column_column_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gen_table_column_column_id_seq OWNER TO root;

--
-- Name: gen_table_column_column_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.gen_table_column_column_id_seq OWNED BY public.gen_table_column.column_id;


--
-- Name: gen_table_table_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.gen_table_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gen_table_table_id_seq OWNER TO root;

--
-- Name: gen_table_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.gen_table_table_id_seq OWNED BY public.gen_table.table_id;


--
-- Name: list_column; Type: VIEW; Schema: public; Owner: root
--

CREATE VIEW public.list_column AS
 SELECT c.relname AS table_name,
    a.attname AS column_name,
    d.description AS column_comment,
        CASE
            WHEN (a.attnotnull AND (con.conname IS NULL)) THEN 1
            ELSE 0
        END AS is_required,
        CASE
            WHEN (con.conname IS NOT NULL) THEN 1
            ELSE 0
        END AS is_pk,
    a.attnum AS sort,
        CASE
            WHEN ("position"(pg_get_expr(ad.adbin, ad.adrelid), ((((c.relname)::text || '_'::text) || (a.attname)::text) || '_seq'::text)) > 0) THEN 1
            ELSE 0
        END AS is_increment,
    btrim(
        CASE
            WHEN ((t.typelem <> (0)::oid) AND (t.typlen = '-1'::integer)) THEN 'ARRAY'::text
            ELSE
            CASE
                WHEN (t.typtype = 'd'::"char") THEN format_type(t.typbasetype, NULL::integer)
                ELSE format_type(a.atttypid, NULL::integer)
            END
        END, '"'::text) AS column_type
   FROM (((((pg_attribute a
     JOIN (pg_class c
     JOIN pg_namespace n ON ((c.relnamespace = n.oid))) ON ((a.attrelid = c.oid)))
     LEFT JOIN pg_description d ON (((d.objoid = c.oid) AND (a.attnum = d.objsubid))))
     LEFT JOIN pg_constraint con ON (((con.conrelid = c.oid) AND (a.attnum = ANY (con.conkey)))))
     LEFT JOIN pg_attrdef ad ON (((a.attrelid = ad.adrelid) AND (a.attnum = ad.adnum))))
     LEFT JOIN pg_type t ON ((a.atttypid = t.oid)))
  WHERE ((c.relkind = ANY (ARRAY['r'::"char", 'p'::"char"])) AND (a.attnum > 0) AND (n.nspname = 'public'::name) AND (NOT a.attisdropped))
  ORDER BY c.relname, a.attnum;


ALTER TABLE public.list_column OWNER TO root;

--
-- Name: list_table; Type: VIEW; Schema: public; Owner: root
--

CREATE VIEW public.list_table AS
 SELECT c.relname AS table_name,
    obj_description(c.oid) AS table_comment,
    CURRENT_TIMESTAMP AS create_time,
    CURRENT_TIMESTAMP AS update_time
   FROM (pg_class c
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
  WHERE ((c.relkind = ANY (ARRAY['r'::"char", 'p'::"char"])) AND (c.relname !~~ 'spatial_%'::text) AND (n.nspname = 'public'::name) AND (n.nspname <> ''::name));


ALTER TABLE public.list_table OWNER TO root;

--
-- Name: order_info; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.order_info (
    month_no integer NOT NULL,
    data_type character varying(50) NOT NULL,
    phone_num character varying(32) NOT NULL,
    completed_at character varying(30) NOT NULL,
    user_id character varying(50) DEFAULT ''::character varying NOT NULL,
    sale_center_name character varying(30) NOT NULL,
    org_name character varying(30) NOT NULL,
    order_id character varying(50) NOT NULL,
    staff_code character varying(30) NOT NULL,
    staff_name character varying(30) NOT NULL,
    binding_at character varying(30) NOT NULL,
    online_at character varying(30) NOT NULL,
    aaa_flag character varying(10) NOT NULL,
    serial_code character varying(50) NOT NULL,
    device_name character varying(200) NOT NULL,
    activate_flag character varying(10) NOT NULL,
    unactivate_reason character varying(200) NOT NULL
);


ALTER TABLE public.order_info OWNER TO root;

--
-- Name: COLUMN order_info.month_no; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.order_info.month_no IS '月份';


--
-- Name: COLUMN order_info.data_type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.order_info.data_type IS '类型';


--
-- Name: COLUMN order_info.phone_num; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.order_info.phone_num IS '电话号码';


--
-- Name: COLUMN order_info.completed_at; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.order_info.completed_at IS '竣工时间';


--
-- Name: COLUMN order_info.user_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.order_info.user_id IS '用户ID';


--
-- Name: COLUMN order_info.sale_center_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.order_info.sale_center_name IS '经营单位';


--
-- Name: COLUMN order_info.org_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.order_info.org_name IS '支局';


--
-- Name: COLUMN order_info.order_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.order_info.order_id IS '工单ID';


--
-- Name: COLUMN order_info.staff_code; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.order_info.staff_code IS '工号';


--
-- Name: COLUMN order_info.staff_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.order_info.staff_name IS '姓名';


--
-- Name: COLUMN order_info.binding_at; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.order_info.binding_at IS '绑定时间';


--
-- Name: COLUMN order_info.online_at; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.order_info.online_at IS '最后上线时间';


--
-- Name: COLUMN order_info.aaa_flag; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.order_info.aaa_flag IS 'AAA标志';


--
-- Name: COLUMN order_info.serial_code; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.order_info.serial_code IS '串码';


--
-- Name: COLUMN order_info.device_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.order_info.device_name IS '设备名称';


--
-- Name: COLUMN order_info.activate_flag; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.order_info.activate_flag IS '激活标志';


--
-- Name: COLUMN order_info.unactivate_reason; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.order_info.unactivate_reason IS '未激活原因';


--
-- Name: qrtz_blob_triggers; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.qrtz_blob_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    blob_data bytea
);


ALTER TABLE public.qrtz_blob_triggers OWNER TO root;

--
-- Name: qrtz_calendars; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.qrtz_calendars (
    sched_name character varying(120) NOT NULL,
    calendar_name character varying(200) NOT NULL,
    calendar bytea NOT NULL
);


ALTER TABLE public.qrtz_calendars OWNER TO root;

--
-- Name: qrtz_cron_triggers; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.qrtz_cron_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    cron_expression character varying(200) NOT NULL,
    time_zone_id character varying(80)
);


ALTER TABLE public.qrtz_cron_triggers OWNER TO root;

--
-- Name: qrtz_fired_triggers; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.qrtz_fired_triggers (
    sched_name character varying(120) NOT NULL,
    entry_id character varying(95) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    instance_name character varying(200) NOT NULL,
    fired_time bigint NOT NULL,
    sched_time bigint NOT NULL,
    priority integer NOT NULL,
    state character varying(16) NOT NULL,
    job_name character varying(200),
    job_group character varying(200),
    is_nonconcurrent character varying(20),
    requests_recovery character varying(20)
);


ALTER TABLE public.qrtz_fired_triggers OWNER TO root;

--
-- Name: qrtz_job_details; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.qrtz_job_details (
    sched_name character varying(120) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    job_class_name character varying(250) NOT NULL,
    is_durable character varying(50) NOT NULL,
    is_nonconcurrent character varying(50) NOT NULL,
    is_update_data character varying(50) NOT NULL,
    requests_recovery character varying(50) NOT NULL,
    job_data bytea
);


ALTER TABLE public.qrtz_job_details OWNER TO root;

--
-- Name: qrtz_locks; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.qrtz_locks (
    sched_name character varying(120) NOT NULL,
    lock_name character varying(40) NOT NULL
);


ALTER TABLE public.qrtz_locks OWNER TO root;

--
-- Name: qrtz_paused_trigger_grps; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.qrtz_paused_trigger_grps (
    sched_name character varying(120) NOT NULL,
    trigger_group character varying(200) NOT NULL
);


ALTER TABLE public.qrtz_paused_trigger_grps OWNER TO root;

--
-- Name: qrtz_scheduler_state; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.qrtz_scheduler_state (
    sched_name character varying(120) NOT NULL,
    instance_name character varying(200) NOT NULL,
    last_checkin_time bigint NOT NULL,
    checkin_interval bigint NOT NULL
);


ALTER TABLE public.qrtz_scheduler_state OWNER TO root;

--
-- Name: qrtz_simple_triggers; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.qrtz_simple_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    repeat_count bigint NOT NULL,
    repeat_interval bigint NOT NULL,
    times_triggered bigint NOT NULL
);


ALTER TABLE public.qrtz_simple_triggers OWNER TO root;

--
-- Name: qrtz_simprop_triggers; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.qrtz_simprop_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    str_prop_1 character varying(512),
    str_prop_2 character varying(512),
    str_prop_3 character varying(512),
    int_prop_1 integer,
    int_prop_2 integer,
    long_prop_1 bigint,
    long_prop_2 bigint,
    dec_prop_1 numeric(13,4),
    dec_prop_2 numeric(13,4),
    bool_prop_1 character varying(2),
    bool_prop_2 character varying(2)
);


ALTER TABLE public.qrtz_simprop_triggers OWNER TO root;

--
-- Name: qrtz_triggers; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.qrtz_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    next_fire_time bigint,
    prev_fire_time bigint,
    priority integer,
    trigger_state character varying(16) NOT NULL,
    trigger_type character varying(8) NOT NULL,
    start_time bigint NOT NULL,
    end_time bigint,
    calendar_name character varying(200),
    misfire_instr smallint,
    job_data bytea
);


ALTER TABLE public.qrtz_triggers OWNER TO root;

--
-- Name: sys_config; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sys_config (
    config_id bigint NOT NULL,
    config_name character varying(100),
    config_key character varying(100),
    config_value character varying(500),
    config_type character(1),
    create_by character varying(64),
    create_time timestamp(6) without time zone,
    update_by character varying(64),
    update_time timestamp(6) without time zone,
    remark character varying(500)
);


ALTER TABLE public.sys_config OWNER TO root;

--
-- Name: TABLE sys_config; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.sys_config IS '参数配置表';


--
-- Name: COLUMN sys_config.config_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_config.config_id IS '参数主键';


--
-- Name: COLUMN sys_config.config_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_config.config_name IS '参数名称';


--
-- Name: COLUMN sys_config.config_key; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_config.config_key IS '参数键名';


--
-- Name: COLUMN sys_config.config_value; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_config.config_value IS '参数键值';


--
-- Name: COLUMN sys_config.config_type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_config.config_type IS '系统内置（Y是 N否）';


--
-- Name: COLUMN sys_config.create_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_config.create_by IS '创建者';


--
-- Name: COLUMN sys_config.create_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_config.create_time IS '创建时间';


--
-- Name: COLUMN sys_config.update_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_config.update_by IS '更新者';


--
-- Name: COLUMN sys_config.update_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_config.update_time IS '更新时间';


--
-- Name: COLUMN sys_config.remark; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_config.remark IS '备注';


--
-- Name: sys_config_config_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sys_config_config_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_config_config_id_seq OWNER TO root;

--
-- Name: sys_config_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sys_config_config_id_seq OWNED BY public.sys_config.config_id;


--
-- Name: sys_dept; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sys_dept (
    dept_id bigint NOT NULL,
    parent_id bigint DEFAULT 0,
    ancestors character varying(50),
    dept_name character varying(30),
    order_num integer,
    leader character varying(20),
    phone character varying(11),
    email character varying(50),
    status character(1),
    del_flag character(1) DEFAULT 0,
    create_by character varying(64),
    create_time timestamp(6) without time zone,
    update_by character varying(64),
    update_time timestamp(6) without time zone
);


ALTER TABLE public.sys_dept OWNER TO root;

--
-- Name: TABLE sys_dept; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.sys_dept IS '部门表';


--
-- Name: COLUMN sys_dept.dept_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dept.dept_id IS '部门id';


--
-- Name: COLUMN sys_dept.parent_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dept.parent_id IS '父部门id';


--
-- Name: COLUMN sys_dept.ancestors; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dept.ancestors IS '祖级列表';


--
-- Name: COLUMN sys_dept.dept_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dept.dept_name IS '部门名称';


--
-- Name: COLUMN sys_dept.order_num; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dept.order_num IS '显示顺序';


--
-- Name: COLUMN sys_dept.leader; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dept.leader IS '负责人';


--
-- Name: COLUMN sys_dept.phone; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dept.phone IS '联系电话';


--
-- Name: COLUMN sys_dept.email; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dept.email IS '邮箱';


--
-- Name: COLUMN sys_dept.status; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dept.status IS '部门状态（0正常 1停用）';


--
-- Name: COLUMN sys_dept.del_flag; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dept.del_flag IS '删除标志（0代表存在 2代表删除）';


--
-- Name: COLUMN sys_dept.create_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dept.create_by IS '创建者';


--
-- Name: COLUMN sys_dept.create_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dept.create_time IS '创建时间';


--
-- Name: COLUMN sys_dept.update_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dept.update_by IS '更新者';


--
-- Name: COLUMN sys_dept.update_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dept.update_time IS '更新时间';


--
-- Name: sys_dict_data; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sys_dict_data (
    dict_code bigint NOT NULL,
    dict_sort integer,
    dict_label character varying(100),
    dict_value character varying(100),
    dict_type character varying(100),
    css_class character varying(100),
    list_class character varying(100),
    is_default character(1),
    status character(1),
    create_by character varying(64),
    create_time timestamp(6) without time zone,
    update_by character varying(64),
    update_time timestamp(6) without time zone,
    remark character varying(500)
);


ALTER TABLE public.sys_dict_data OWNER TO root;

--
-- Name: TABLE sys_dict_data; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.sys_dict_data IS '字典数据表';


--
-- Name: COLUMN sys_dict_data.dict_code; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_data.dict_code IS '字典编码';


--
-- Name: COLUMN sys_dict_data.dict_sort; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_data.dict_sort IS '字典排序';


--
-- Name: COLUMN sys_dict_data.dict_label; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_data.dict_label IS '字典标签';


--
-- Name: COLUMN sys_dict_data.dict_value; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_data.dict_value IS '字典键值';


--
-- Name: COLUMN sys_dict_data.dict_type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_data.dict_type IS '字典类型';


--
-- Name: COLUMN sys_dict_data.css_class; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_data.css_class IS '样式属性（其他样式扩展）';


--
-- Name: COLUMN sys_dict_data.list_class; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_data.list_class IS '表格回显样式';


--
-- Name: COLUMN sys_dict_data.is_default; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_data.is_default IS '是否默认（Y是 N否）';


--
-- Name: COLUMN sys_dict_data.status; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_data.status IS '状态（0正常 1停用）';


--
-- Name: COLUMN sys_dict_data.create_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_data.create_by IS '创建者';


--
-- Name: COLUMN sys_dict_data.create_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_data.create_time IS '创建时间';


--
-- Name: COLUMN sys_dict_data.update_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_data.update_by IS '更新者';


--
-- Name: COLUMN sys_dict_data.update_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_data.update_time IS '更新时间';


--
-- Name: COLUMN sys_dict_data.remark; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_data.remark IS '备注';


--
-- Name: sys_dict_data_dict_code_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sys_dict_data_dict_code_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_dict_data_dict_code_seq OWNER TO root;

--
-- Name: sys_dict_data_dict_code_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sys_dict_data_dict_code_seq OWNED BY public.sys_dict_data.dict_code;


--
-- Name: sys_dict_type; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sys_dict_type (
    dict_id bigint NOT NULL,
    dict_name character varying(100),
    dict_type character varying(100),
    status character(1),
    create_by character varying(64),
    create_time timestamp(6) without time zone,
    update_by character varying(64),
    update_time timestamp(6) without time zone,
    remark character varying(500)
);


ALTER TABLE public.sys_dict_type OWNER TO root;

--
-- Name: TABLE sys_dict_type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.sys_dict_type IS '字典类型表';


--
-- Name: COLUMN sys_dict_type.dict_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_type.dict_id IS '字典主键';


--
-- Name: COLUMN sys_dict_type.dict_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_type.dict_name IS '字典名称';


--
-- Name: COLUMN sys_dict_type.dict_type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_type.dict_type IS '字典类型';


--
-- Name: COLUMN sys_dict_type.status; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_type.status IS '状态（0正常 1停用）';


--
-- Name: COLUMN sys_dict_type.create_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_type.create_by IS '创建者';


--
-- Name: COLUMN sys_dict_type.create_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_type.create_time IS '创建时间';


--
-- Name: COLUMN sys_dict_type.update_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_type.update_by IS '更新者';


--
-- Name: COLUMN sys_dict_type.update_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_type.update_time IS '更新时间';


--
-- Name: COLUMN sys_dict_type.remark; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_dict_type.remark IS '备注';


--
-- Name: sys_dict_type_dict_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sys_dict_type_dict_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_dict_type_dict_id_seq OWNER TO root;

--
-- Name: sys_dict_type_dict_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sys_dict_type_dict_id_seq OWNED BY public.sys_dict_type.dict_id;


--
-- Name: sys_file; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sys_file (
    id bigint NOT NULL,
    parent_id bigint DEFAULT 0,
    is_folder integer DEFAULT 0,
    file_name character varying(255),
    original_name character varying(255),
    file_type character varying(50),
    file_size bigint,
    file_path character varying(500),
    file_url character varying(500),
    content_hash character varying(100),
    mime_type character varying(100),
    business_type character varying(50),
    business_id bigint,
    status character varying(20),
    process_progress integer,
    error_message character varying(500),
    download_count integer,
    metadata text,
    create_by character varying(64),
    create_time timestamp(6) without time zone,
    update_by character varying(64),
    update_time timestamp(6) without time zone,
    remark character varying(500)
);


ALTER TABLE public.sys_file OWNER TO root;

--
-- Name: TABLE sys_file; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.sys_file IS '通用文件管理表';


--
-- Name: COLUMN sys_file.id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.id IS '文件id';


--
-- Name: COLUMN sys_file.parent_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.parent_id IS '父级ID';


--
-- Name: COLUMN sys_file.is_folder; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.is_folder IS '是否为文件夹';


--
-- Name: COLUMN sys_file.file_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.file_name IS '文件名称';


--
-- Name: COLUMN sys_file.original_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.original_name IS '原始文件名';


--
-- Name: COLUMN sys_file.file_type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.file_type IS '文件类型';


--
-- Name: COLUMN sys_file.file_size; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.file_size IS '文件大小';


--
-- Name: COLUMN sys_file.file_path; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.file_path IS '文件路径';


--
-- Name: COLUMN sys_file.file_url; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.file_url IS '文件URL';


--
-- Name: COLUMN sys_file.content_hash; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.content_hash IS '内容哈希值';


--
-- Name: COLUMN sys_file.mime_type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.mime_type IS 'MIME类型';


--
-- Name: COLUMN sys_file.business_type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.business_type IS '业务类型';


--
-- Name: COLUMN sys_file.business_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.business_id IS '业务ID';


--
-- Name: COLUMN sys_file.status; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.status IS '文件状态';


--
-- Name: COLUMN sys_file.process_progress; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.process_progress IS '处理进度';


--
-- Name: COLUMN sys_file.error_message; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.error_message IS '错误信息';


--
-- Name: COLUMN sys_file.download_count; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.download_count IS '下载次数';


--
-- Name: COLUMN sys_file.metadata; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.metadata IS '元数据';


--
-- Name: COLUMN sys_file.create_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.create_by IS '创建者';


--
-- Name: COLUMN sys_file.create_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.create_time IS '创建时间';


--
-- Name: COLUMN sys_file.update_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.update_by IS '更新者';


--
-- Name: COLUMN sys_file.update_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.update_time IS '更新时间';


--
-- Name: COLUMN sys_file.remark; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_file.remark IS '备注';


--
-- Name: sys_file_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sys_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_file_id_seq OWNER TO root;

--
-- Name: sys_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sys_file_id_seq OWNED BY public.sys_file.id;


--
-- Name: sys_job; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sys_job (
    job_id bigint NOT NULL,
    job_name character varying(64) NOT NULL,
    job_group character varying(64) NOT NULL,
    invoke_target character varying(500) NOT NULL,
    cron_expression character varying(255),
    misfire_policy character varying(20),
    concurrent character(1),
    status character(1),
    create_by character varying(64),
    create_time timestamp(6) without time zone,
    update_by character varying(64),
    update_time timestamp(6) without time zone,
    remark character varying(500)
);


ALTER TABLE public.sys_job OWNER TO root;

--
-- Name: TABLE sys_job; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.sys_job IS '定时任务调度表';


--
-- Name: COLUMN sys_job.job_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_job.job_id IS '任务ID';


--
-- Name: COLUMN sys_job.job_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_job.job_name IS '任务名称';


--
-- Name: COLUMN sys_job.job_group; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_job.job_group IS '任务组名';


--
-- Name: COLUMN sys_job.invoke_target; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_job.invoke_target IS '调用目标字符串';


--
-- Name: COLUMN sys_job.cron_expression; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_job.cron_expression IS 'cron执行表达式';


--
-- Name: COLUMN sys_job.misfire_policy; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_job.misfire_policy IS '计划执行错误策略（1立即执行 2执行一次 3放弃执行）';


--
-- Name: COLUMN sys_job.concurrent; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_job.concurrent IS '是否并发执行（0允许 1禁止）';


--
-- Name: COLUMN sys_job.status; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_job.status IS '状态（0正常 1暂停）';


--
-- Name: COLUMN sys_job.create_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_job.create_by IS '创建者';


--
-- Name: COLUMN sys_job.create_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_job.create_time IS '创建时间';


--
-- Name: COLUMN sys_job.update_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_job.update_by IS '更新者';


--
-- Name: COLUMN sys_job.update_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_job.update_time IS '更新时间';


--
-- Name: COLUMN sys_job.remark; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_job.remark IS '备注信息';


--
-- Name: sys_job_job_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sys_job_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_job_job_id_seq OWNER TO root;

--
-- Name: sys_job_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sys_job_job_id_seq OWNED BY public.sys_job.job_id;


--
-- Name: sys_job_log; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sys_job_log (
    job_log_id bigint NOT NULL,
    job_name character varying(64) NOT NULL,
    job_group character varying(64) NOT NULL,
    invoke_target character varying(500) NOT NULL,
    job_message character varying(500),
    status character(1),
    exception_info character varying(2000),
    create_time timestamp(6) without time zone
);


ALTER TABLE public.sys_job_log OWNER TO root;

--
-- Name: TABLE sys_job_log; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.sys_job_log IS '定时任务调度日志表';


--
-- Name: COLUMN sys_job_log.job_log_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_job_log.job_log_id IS '任务日志ID';


--
-- Name: COLUMN sys_job_log.job_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_job_log.job_name IS '任务名称';


--
-- Name: COLUMN sys_job_log.job_group; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_job_log.job_group IS '任务组名';


--
-- Name: COLUMN sys_job_log.invoke_target; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_job_log.invoke_target IS '调用目标字符串';


--
-- Name: COLUMN sys_job_log.job_message; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_job_log.job_message IS '日志信息';


--
-- Name: COLUMN sys_job_log.status; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_job_log.status IS '执行状态（0正常 1失败）';


--
-- Name: COLUMN sys_job_log.exception_info; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_job_log.exception_info IS '异常信息';


--
-- Name: COLUMN sys_job_log.create_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_job_log.create_time IS '创建时间';


--
-- Name: sys_job_log_job_log_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sys_job_log_job_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_job_log_job_log_id_seq OWNER TO root;

--
-- Name: sys_job_log_job_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sys_job_log_job_log_id_seq OWNED BY public.sys_job_log.job_log_id;


--
-- Name: sys_logininfor; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sys_logininfor (
    info_id bigint NOT NULL,
    user_name character varying(50),
    ipaddr character varying(128),
    login_location character varying(255),
    browser character varying(50),
    os character varying(50),
    status character(1),
    msg character varying(255),
    login_time timestamp(6) without time zone
);


ALTER TABLE public.sys_logininfor OWNER TO root;

--
-- Name: TABLE sys_logininfor; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.sys_logininfor IS '系统访问记录';


--
-- Name: COLUMN sys_logininfor.info_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_logininfor.info_id IS '访问ID';


--
-- Name: COLUMN sys_logininfor.user_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_logininfor.user_name IS '用户账号';


--
-- Name: COLUMN sys_logininfor.ipaddr; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_logininfor.ipaddr IS '登录IP地址';


--
-- Name: COLUMN sys_logininfor.login_location; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_logininfor.login_location IS '登录地点';


--
-- Name: COLUMN sys_logininfor.browser; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_logininfor.browser IS '浏览器类型';


--
-- Name: COLUMN sys_logininfor.os; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_logininfor.os IS '操作系统';


--
-- Name: COLUMN sys_logininfor.status; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_logininfor.status IS '登录状态（0成功 1失败）';


--
-- Name: COLUMN sys_logininfor.msg; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_logininfor.msg IS '提示消息';


--
-- Name: COLUMN sys_logininfor.login_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_logininfor.login_time IS '访问时间';


--
-- Name: sys_logininfor_info_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sys_logininfor_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_logininfor_info_id_seq OWNER TO root;

--
-- Name: sys_logininfor_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sys_logininfor_info_id_seq OWNED BY public.sys_logininfor.info_id;


--
-- Name: sys_menu; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sys_menu (
    menu_id bigint NOT NULL,
    menu_name character varying(50) NOT NULL,
    parent_id bigint DEFAULT 0,
    order_num integer,
    path character varying(200),
    component character varying(255),
    query character varying(255),
    route_name character varying(50) DEFAULT ''::character varying,
    is_frame integer,
    is_cache integer DEFAULT 0,
    menu_type character(1),
    visible character(1),
    status smallint,
    perms character varying(100),
    icon character varying(100),
    create_by character varying(64),
    create_time timestamp(6) without time zone,
    update_by character varying(64),
    update_time timestamp(6) without time zone,
    remark character varying(500)
);


ALTER TABLE public.sys_menu OWNER TO root;

--
-- Name: TABLE sys_menu; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.sys_menu IS '菜单权限表';


--
-- Name: COLUMN sys_menu.menu_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_menu.menu_id IS '菜单ID';


--
-- Name: COLUMN sys_menu.menu_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_menu.menu_name IS '菜单名称';


--
-- Name: COLUMN sys_menu.parent_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_menu.parent_id IS '父菜单ID';


--
-- Name: COLUMN sys_menu.order_num; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_menu.order_num IS '显示顺序';


--
-- Name: COLUMN sys_menu.path; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_menu.path IS '路由地址';


--
-- Name: COLUMN sys_menu.component; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_menu.component IS '组件路径';


--
-- Name: COLUMN sys_menu.query; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_menu.query IS '路由参数';


--
-- Name: COLUMN sys_menu.route_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_menu.route_name IS '路由名称';


--
-- Name: COLUMN sys_menu.is_frame; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_menu.is_frame IS '是否为外链（0是 1否）';


--
-- Name: COLUMN sys_menu.is_cache; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_menu.is_cache IS '是否缓存（0缓存 1不缓存）';


--
-- Name: COLUMN sys_menu.menu_type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_menu.menu_type IS '菜单类型（M目录 C菜单 F按钮）';


--
-- Name: COLUMN sys_menu.visible; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_menu.visible IS '菜单状态（0显示 1隐藏）';


--
-- Name: COLUMN sys_menu.status; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_menu.status IS '菜单状态（0正常 1停用）';


--
-- Name: COLUMN sys_menu.perms; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_menu.perms IS '权限标识';


--
-- Name: COLUMN sys_menu.icon; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_menu.icon IS '菜单图标';


--
-- Name: COLUMN sys_menu.create_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_menu.create_by IS '创建者';


--
-- Name: COLUMN sys_menu.create_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_menu.create_time IS '创建时间';


--
-- Name: COLUMN sys_menu.update_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_menu.update_by IS '更新者';


--
-- Name: COLUMN sys_menu.update_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_menu.update_time IS '更新时间';


--
-- Name: COLUMN sys_menu.remark; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_menu.remark IS '备注';


--
-- Name: sys_menu_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sys_menu_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_menu_menu_id_seq OWNER TO root;

--
-- Name: sys_menu_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sys_menu_menu_id_seq OWNED BY public.sys_menu.menu_id;


--
-- Name: sys_notice; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sys_notice (
    notice_id bigint NOT NULL,
    notice_title character varying(50) NOT NULL,
    notice_type character(1) NOT NULL,
    notice_content text,
    status character(1),
    create_by character varying(64),
    create_time timestamp(6) without time zone,
    update_by character varying(64),
    update_time timestamp(6) without time zone,
    remark character varying(255)
);


ALTER TABLE public.sys_notice OWNER TO root;

--
-- Name: TABLE sys_notice; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.sys_notice IS '通知公告表';


--
-- Name: COLUMN sys_notice.notice_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_notice.notice_id IS '公告ID';


--
-- Name: COLUMN sys_notice.notice_title; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_notice.notice_title IS '公告标题';


--
-- Name: COLUMN sys_notice.notice_type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_notice.notice_type IS '公告类型（1通知 2公告）';


--
-- Name: COLUMN sys_notice.notice_content; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_notice.notice_content IS '公告内容';


--
-- Name: COLUMN sys_notice.status; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_notice.status IS '公告状态（0正常 1关闭）';


--
-- Name: COLUMN sys_notice.create_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_notice.create_by IS '创建者';


--
-- Name: COLUMN sys_notice.create_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_notice.create_time IS '创建时间';


--
-- Name: COLUMN sys_notice.update_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_notice.update_by IS '更新者';


--
-- Name: COLUMN sys_notice.update_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_notice.update_time IS '更新时间';


--
-- Name: COLUMN sys_notice.remark; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_notice.remark IS '备注';


--
-- Name: sys_notice_notice_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sys_notice_notice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_notice_notice_id_seq OWNER TO root;

--
-- Name: sys_notice_notice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sys_notice_notice_id_seq OWNED BY public.sys_notice.notice_id;


--
-- Name: sys_oper_log; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sys_oper_log (
    oper_id bigint NOT NULL,
    title character varying(50),
    business_type integer,
    method character varying(100),
    request_method character varying(10),
    operator_type integer,
    oper_name character varying(50),
    dept_name character varying(50),
    oper_url character varying(255),
    oper_ip character varying(128),
    oper_location character varying(255),
    oper_param character varying(2000),
    json_result character varying(2000),
    status integer,
    error_msg character varying(2000),
    oper_time timestamp(6) without time zone,
    cost_time bigint DEFAULT 0
);


ALTER TABLE public.sys_oper_log OWNER TO root;

--
-- Name: TABLE sys_oper_log; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.sys_oper_log IS '操作日志记录';


--
-- Name: COLUMN sys_oper_log.oper_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_oper_log.oper_id IS '日志主键';


--
-- Name: COLUMN sys_oper_log.title; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_oper_log.title IS '模块标题';


--
-- Name: COLUMN sys_oper_log.business_type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_oper_log.business_type IS '业务类型（0其它 1新增 2修改 3删除）';


--
-- Name: COLUMN sys_oper_log.method; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_oper_log.method IS '方法名称';


--
-- Name: COLUMN sys_oper_log.request_method; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_oper_log.request_method IS '请求方式';


--
-- Name: COLUMN sys_oper_log.operator_type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_oper_log.operator_type IS '操作类别（0其它 1后台用户 2手机端用户）';


--
-- Name: COLUMN sys_oper_log.oper_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_oper_log.oper_name IS '操作人员';


--
-- Name: COLUMN sys_oper_log.dept_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_oper_log.dept_name IS '部门名称';


--
-- Name: COLUMN sys_oper_log.oper_url; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_oper_log.oper_url IS '请求URL';


--
-- Name: COLUMN sys_oper_log.oper_ip; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_oper_log.oper_ip IS '主机地址';


--
-- Name: COLUMN sys_oper_log.oper_location; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_oper_log.oper_location IS '操作地点';


--
-- Name: COLUMN sys_oper_log.oper_param; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_oper_log.oper_param IS '请求参数';


--
-- Name: COLUMN sys_oper_log.json_result; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_oper_log.json_result IS '返回参数';


--
-- Name: COLUMN sys_oper_log.status; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_oper_log.status IS '操作状态（0正常 1异常）';


--
-- Name: COLUMN sys_oper_log.error_msg; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_oper_log.error_msg IS '错误消息';


--
-- Name: COLUMN sys_oper_log.oper_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_oper_log.oper_time IS '操作时间';


--
-- Name: sys_oper_log_oper_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sys_oper_log_oper_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_oper_log_oper_id_seq OWNER TO root;

--
-- Name: sys_oper_log_oper_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sys_oper_log_oper_id_seq OWNED BY public.sys_oper_log.oper_id;


--
-- Name: sys_post; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sys_post (
    post_id bigint NOT NULL,
    post_code character varying(64) NOT NULL,
    post_name character varying(50) NOT NULL,
    post_sort integer NOT NULL,
    status character(1) NOT NULL,
    create_by character varying(64),
    create_time timestamp(6) without time zone,
    update_by character varying(64),
    update_time timestamp(6) without time zone,
    remark character varying(500)
);


ALTER TABLE public.sys_post OWNER TO root;

--
-- Name: TABLE sys_post; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.sys_post IS '岗位信息表';


--
-- Name: COLUMN sys_post.post_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_post.post_id IS '岗位ID';


--
-- Name: COLUMN sys_post.post_code; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_post.post_code IS '岗位编码';


--
-- Name: COLUMN sys_post.post_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_post.post_name IS '岗位名称';


--
-- Name: COLUMN sys_post.post_sort; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_post.post_sort IS '显示顺序';


--
-- Name: COLUMN sys_post.status; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_post.status IS '状态（0正常 1停用）';


--
-- Name: COLUMN sys_post.create_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_post.create_by IS '创建者';


--
-- Name: COLUMN sys_post.create_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_post.create_time IS '创建时间';


--
-- Name: COLUMN sys_post.update_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_post.update_by IS '更新者';


--
-- Name: COLUMN sys_post.update_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_post.update_time IS '更新时间';


--
-- Name: COLUMN sys_post.remark; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_post.remark IS '备注';


--
-- Name: sys_post_post_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sys_post_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_post_post_id_seq OWNER TO root;

--
-- Name: sys_post_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sys_post_post_id_seq OWNED BY public.sys_post.post_id;


--
-- Name: sys_role; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sys_role (
    role_id bigint NOT NULL,
    role_name character varying(30) NOT NULL,
    role_key character varying(100) NOT NULL,
    role_sort integer NOT NULL,
    data_scope character(1),
    menu_check_strictly boolean,
    dept_check_strictly boolean,
    status character(1) NOT NULL,
    del_flag character(1) DEFAULT 0,
    create_by character varying(64),
    create_time timestamp(6) without time zone,
    update_by character varying(64),
    update_time timestamp(6) without time zone,
    remark character varying(500)
);


ALTER TABLE public.sys_role OWNER TO root;

--
-- Name: TABLE sys_role; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.sys_role IS '角色信息表';


--
-- Name: COLUMN sys_role.role_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_role.role_id IS '角色ID';


--
-- Name: COLUMN sys_role.role_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_role.role_name IS '角色名称';


--
-- Name: COLUMN sys_role.role_key; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_role.role_key IS '角色权限字符串';


--
-- Name: COLUMN sys_role.role_sort; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_role.role_sort IS '显示顺序';


--
-- Name: COLUMN sys_role.data_scope; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_role.data_scope IS '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）';


--
-- Name: COLUMN sys_role.menu_check_strictly; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_role.menu_check_strictly IS '菜单树选择项是否关联显示';


--
-- Name: COLUMN sys_role.dept_check_strictly; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_role.dept_check_strictly IS '部门树选择项是否关联显示';


--
-- Name: COLUMN sys_role.status; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_role.status IS '角色状态（0正常 1停用）';


--
-- Name: COLUMN sys_role.del_flag; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_role.del_flag IS '删除标志（0代表存在 2代表删除）';


--
-- Name: COLUMN sys_role.create_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_role.create_by IS '创建者';


--
-- Name: COLUMN sys_role.create_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_role.create_time IS '创建时间';


--
-- Name: COLUMN sys_role.update_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_role.update_by IS '更新者';


--
-- Name: COLUMN sys_role.update_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_role.update_time IS '更新时间';


--
-- Name: COLUMN sys_role.remark; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_role.remark IS '备注';


--
-- Name: sys_role_dept; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sys_role_dept (
    role_id bigint NOT NULL,
    dept_id bigint NOT NULL
);


ALTER TABLE public.sys_role_dept OWNER TO root;

--
-- Name: TABLE sys_role_dept; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.sys_role_dept IS '角色和部门关联表';


--
-- Name: COLUMN sys_role_dept.role_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_role_dept.role_id IS '角色ID';


--
-- Name: COLUMN sys_role_dept.dept_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_role_dept.dept_id IS '部门ID';


--
-- Name: sys_role_menu; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sys_role_menu (
    role_id bigint NOT NULL,
    menu_id bigint NOT NULL
);


ALTER TABLE public.sys_role_menu OWNER TO root;

--
-- Name: TABLE sys_role_menu; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.sys_role_menu IS '角色和菜单关联表';


--
-- Name: COLUMN sys_role_menu.role_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_role_menu.role_id IS '角色ID';


--
-- Name: COLUMN sys_role_menu.menu_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_role_menu.menu_id IS '菜单ID';


--
-- Name: sys_role_role_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sys_role_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_role_role_id_seq OWNER TO root;

--
-- Name: sys_role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sys_role_role_id_seq OWNED BY public.sys_role.role_id;


--
-- Name: sys_user; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sys_user (
    user_id bigint NOT NULL,
    dept_id bigint,
    user_name character varying(30) NOT NULL,
    nick_name character varying(30) NOT NULL,
    user_type character varying(2),
    email character varying(50),
    phonenumber character varying(11),
    sex character(1),
    avatar character varying(100),
    password character varying(100),
    status character(1),
    del_flag character(1) DEFAULT '0'::bpchar,
    login_ip character varying(128),
    login_date timestamp(6) without time zone,
    pwd_update_date timestamp(6) without time zone,
    create_by character varying(64),
    create_time timestamp(6) without time zone,
    update_by character varying(64),
    update_time timestamp(6) without time zone,
    remark character varying(500),
    staff_code character varying(64)
);


ALTER TABLE public.sys_user OWNER TO root;

--
-- Name: TABLE sys_user; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.sys_user IS '用户信息表';


--
-- Name: COLUMN sys_user.user_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user.user_id IS '用户ID';


--
-- Name: COLUMN sys_user.dept_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user.dept_id IS '部门ID';


--
-- Name: COLUMN sys_user.user_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user.user_name IS '用户账号';


--
-- Name: COLUMN sys_user.nick_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user.nick_name IS '用户昵称';


--
-- Name: COLUMN sys_user.user_type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user.user_type IS '用户类型（00系统用户）';


--
-- Name: COLUMN sys_user.email; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user.email IS '用户邮箱';


--
-- Name: COLUMN sys_user.phonenumber; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user.phonenumber IS '手机号码';


--
-- Name: COLUMN sys_user.sex; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user.sex IS '用户性别（0男 1女 2未知）';


--
-- Name: COLUMN sys_user.avatar; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user.avatar IS '头像地址';


--
-- Name: COLUMN sys_user.password; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user.password IS '密码';


--
-- Name: COLUMN sys_user.status; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user.status IS '帐号状态（0正常 1停用）';


--
-- Name: COLUMN sys_user.del_flag; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user.del_flag IS '删除标志（0代表存在 2代表删除）';


--
-- Name: COLUMN sys_user.login_ip; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user.login_ip IS '最后登录IP';


--
-- Name: COLUMN sys_user.login_date; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user.login_date IS '最后登录时间';


--
-- Name: COLUMN sys_user.pwd_update_date; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user.pwd_update_date IS '密码最后更新时间';


--
-- Name: COLUMN sys_user.create_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user.create_by IS '创建者';


--
-- Name: COLUMN sys_user.create_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user.create_time IS '创建时间';


--
-- Name: COLUMN sys_user.update_by; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user.update_by IS '更新者';


--
-- Name: COLUMN sys_user.update_time; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user.update_time IS '更新时间';


--
-- Name: COLUMN sys_user.remark; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user.remark IS '备注';


--
-- Name: COLUMN sys_user.staff_code; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user.staff_code IS '工号';


--
-- Name: sys_user_post; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sys_user_post (
    user_id bigint NOT NULL,
    post_id bigint NOT NULL
);


ALTER TABLE public.sys_user_post OWNER TO root;

--
-- Name: TABLE sys_user_post; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.sys_user_post IS '用户与岗位关联表';


--
-- Name: COLUMN sys_user_post.user_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user_post.user_id IS '用户ID';


--
-- Name: COLUMN sys_user_post.post_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user_post.post_id IS '岗位ID';


--
-- Name: sys_user_role; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.sys_user_role (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.sys_user_role OWNER TO root;

--
-- Name: TABLE sys_user_role; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.sys_user_role IS '用户和角色关联表';


--
-- Name: COLUMN sys_user_role.user_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user_role.user_id IS '用户ID';


--
-- Name: COLUMN sys_user_role.role_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.sys_user_role.role_id IS '角色ID';


--
-- Name: sys_user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.sys_user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sys_user_user_id_seq OWNER TO root;

--
-- Name: sys_user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.sys_user_user_id_seq OWNED BY public.sys_user.user_id;


--
-- Name: unit_detail; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.unit_detail (
    month integer NOT NULL,
    business_unit character varying(20) NOT NULL,
    branch_office character varying(20) NOT NULL,
    employee_id character varying(10) NOT NULL,
    employee_name character varying(20) NOT NULL,
    type character varying(50) NOT NULL,
    completed_num integer NOT NULL,
    activation_num integer NOT NULL
);


ALTER TABLE public.unit_detail OWNER TO root;

--
-- Name: COLUMN unit_detail.month; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.unit_detail.month IS '月份';


--
-- Name: COLUMN unit_detail.business_unit; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.unit_detail.business_unit IS '经营单位';


--
-- Name: COLUMN unit_detail.branch_office; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.unit_detail.branch_office IS '支局';


--
-- Name: COLUMN unit_detail.employee_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.unit_detail.employee_id IS '工号';


--
-- Name: COLUMN unit_detail.employee_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.unit_detail.employee_name IS '姓名';


--
-- Name: COLUMN unit_detail.type; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.unit_detail.type IS '类型';


--
-- Name: COLUMN unit_detail.completed_num; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.unit_detail.completed_num IS '竣工数';


--
-- Name: COLUMN unit_detail.activation_num; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.unit_detail.activation_num IS '激活数';


--
-- Name: gen_table table_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.gen_table ALTER COLUMN table_id SET DEFAULT nextval('public.gen_table_table_id_seq'::regclass);


--
-- Name: gen_table_column column_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.gen_table_column ALTER COLUMN column_id SET DEFAULT nextval('public.gen_table_column_column_id_seq'::regclass);


--
-- Name: sys_config config_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_config ALTER COLUMN config_id SET DEFAULT nextval('public.sys_config_config_id_seq'::regclass);


--
-- Name: sys_dict_data dict_code; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_dict_data ALTER COLUMN dict_code SET DEFAULT nextval('public.sys_dict_data_dict_code_seq'::regclass);


--
-- Name: sys_dict_type dict_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_dict_type ALTER COLUMN dict_id SET DEFAULT nextval('public.sys_dict_type_dict_id_seq'::regclass);


--
-- Name: sys_file id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_file ALTER COLUMN id SET DEFAULT nextval('public.sys_file_id_seq'::regclass);


--
-- Name: sys_job job_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_job ALTER COLUMN job_id SET DEFAULT nextval('public.sys_job_job_id_seq'::regclass);


--
-- Name: sys_job_log job_log_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_job_log ALTER COLUMN job_log_id SET DEFAULT nextval('public.sys_job_log_job_log_id_seq'::regclass);


--
-- Name: sys_logininfor info_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_logininfor ALTER COLUMN info_id SET DEFAULT nextval('public.sys_logininfor_info_id_seq'::regclass);


--
-- Name: sys_menu menu_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_menu ALTER COLUMN menu_id SET DEFAULT nextval('public.sys_menu_menu_id_seq'::regclass);


--
-- Name: sys_notice notice_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_notice ALTER COLUMN notice_id SET DEFAULT nextval('public.sys_notice_notice_id_seq'::regclass);


--
-- Name: sys_oper_log oper_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_oper_log ALTER COLUMN oper_id SET DEFAULT nextval('public.sys_oper_log_oper_id_seq'::regclass);


--
-- Name: sys_post post_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_post ALTER COLUMN post_id SET DEFAULT nextval('public.sys_post_post_id_seq'::regclass);


--
-- Name: sys_role role_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_role ALTER COLUMN role_id SET DEFAULT nextval('public.sys_role_role_id_seq'::regclass);


--
-- Name: sys_user user_id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_user ALTER COLUMN user_id SET DEFAULT nextval('public.sys_user_user_id_seq'::regclass);


--
-- Data for Name: data_info_detail; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.data_info_detail (month_no, sale_center_name, org_name, staff_code, staff_name, data_type, complete_num, activate_num) FROM stdin;
202511	靖西分公司	靖西安德综合支局	776791148	黄明芳	全屋WIFI	5	2
202511	平果分公司	平果城东综合支局	776154009	黄笔清	全屋WIFI	2	2
202511	田东分公司	田东城北综合支局	776353129	张帅	全屋WIFI	9	8
202511	右江区分公司	右江区城东综合支局	776790080	唐运千	宽带	1	1
202511	右江区分公司	右江区城西综合支局	776110694	黎政华	宽带	1	1
202511	那坡分公司	那坡城南综合支局	100013040	黄仕中	摄像头	8	5
202511	右江区分公司	右江区澄碧湖综合支局	776032002	黄兴敏	摄像头	9	9
202511	田阳分公司	田阳西南综合支局	776404025	凌尔	摄像头	6	6
202511	田阳分公司	田阳那坡综合支局	776419005	黄忠法	摄像头	5	5
202511	田东分公司	田东林逢综合支局	776790676	甘广标	摄像头	2	1
202511	德保分公司	德保城南综合支局	776104009	黄芨德	摄像头	4	3
202511	右江区分公司	右江区四塘综合支局	776781448	黄承虎	摄像头	4	4
202511	田东分公司	田东城北综合支局	776779041	黄剑	摄像头	8	8
202511	田阳分公司	田阳城东综合支局	776782469	黄海东	摄像头	7	7
202511	田东分公司	田东林逢综合支局	776353120	岑忠友	摄像头	9	9
202511	右江区分公司	右江区城东综合支局	776047025	莫嘉文	摄像头	6	6
202511	右江区分公司	右江区城中综合支局	776781370	唐卡	摄像头	1	0
202511	德保分公司	德保敬德巴头综合支局	776801411	黄荷	摄像头	14	13
202511	田林分公司	田林潞城综合支局	776791413	梁深健	摄像头	7	7
202511	田东分公司	田东祥周综合支局	XN0006622	张立亮	摄像头	14	11
202511	田阳分公司	田阳政企专业支局	776404004	黄武庆	摄像头	1	1
202511	德保分公司	德保燕峒龙光综合支局	776141435	凌振鑫	摄像头	10	7
202511	田东分公司	田东印茶综合支局	776790678	陈毅	摄像头	11	9
202511	隆林分公司	隆林城南综合支局	776605030	农玉兰	摄像头	1	1
202511	田阳分公司	田阳西南综合支局	776405028	黄聪	摄像头	7	6
202511	田阳分公司	田阳西南综合支局	100027314	韦泽祺	摄像头	7	7
202511	那坡分公司	那坡百省综合支局	776782411	韦永亮	摄像头	3	2
202511	西林分公司	西林那佐综合支局	776789115	岑家虎	摄像头	26	23
202511	田东分公司	田东朔良综合支局	776781183	廖忠财	摄像头	2	2
202511	德保分公司	德保城南综合支局	776103061	杨子弟	摄像头	3	3
202511	靖西分公司	靖西地州综合支局	776790955	梁健	摄像头	6	6
202511	隆林分公司	隆林政企专业支局	776776675	李明勇	摄像头	12	12
202511	田阳分公司	田阳玉凤综合支局	776779391	黄永吉	摄像头	4	4
202511	田东分公司	田东思林综合支局	776360003	陆最香	摄像头	1	1
202511	西林分公司	西林古障综合支局	776782504	李林	摄像头	5	5
202511	靖西分公司	靖西城南综合支局	XN0006319	俞小神	摄像头	9	8
202511	右江区分公司	右江区龙景综合支局	776901139	林雨健	摄像头	3	3
202511	平果分公司	平果铝城综合支局	776153061	马全军	摄像头	4	4
202511	右江区分公司	右江区龙景综合支局	776117372	韦晨冬	摄像头	1	0
202511	德保分公司	德保马隘都安综合支局	776902173	黄克界	摄像头	6	4
202511	田东分公司	田东义圩综合支局	776359006	黄立升	摄像头	4	4
202511	靖西分公司	靖西地州综合支局	776779724	李国伟	摄像头	1	1
202511	田阳分公司	田阳城东综合支局	776790591	黄欢	摄像头	4	4
202511	平果分公司	平果新安综合支局	100011762	陆文昭	摄像头	7	6
202511	田林分公司	田林潞城综合支局	776782061	向孙赢	摄像头	2	2
202511	右江区分公司	右江区大王岭综合支局	776902268	邝震	摄像头	3	3
202511	田东分公司	田东林逢综合支局	776359006	黄立升	摄像头	4	2
202511	平果分公司	平果坡造综合支局	776789258	班兆秋	摄像头	1	1
202511	隆林分公司	隆林者浪综合支局	776801815	王章文	摄像头	7	5
202511	右江区分公司	右江区城西综合支局	776177383	邓显武	摄像头	3	0
202511	田林分公司	田林八渡综合支局	776902137	农义忠	摄像头	1	1
202511	靖西分公司	靖西武平综合支局	776153132	何正涛	摄像头	1	1
202511	右江区分公司	右江区城东综合支局	776117379	罗迢	全屋WIFI	2	2
202511	隆林分公司	隆林城北综合支局	776701144	范虹	全屋WIFI	2	2
202511	靖西分公司	靖西城北综合支局	776504020	农继勇	全屋WIFI	18	14
202511	西林分公司	西林古障综合支局	776777061	刘建林	全屋WIFI	5	4
202511	德保分公司	德保城南综合支局	XN0006493	谭朝珠	全屋WIFI	9	3
202511	田阳分公司	田阳头塘综合支局	776791213	黄罗峰	全屋WIFI	4	4
202511	田阳分公司	田阳那坡综合支局	776411016	李羿澄	全屋WIFI	2	2
202511	右江区分公司	右江区城东综合支局	776790080	唐运千	全屋WIFI	4	4
202511	靖西分公司	靖西湖润综合支局	776779725	卢发金	全屋WIFI	9	7
202511	那坡分公司	那坡龙合综合支局	776211001	农京运	全屋WIFI	4	4
202511	隆林分公司	隆林克长综合支局	776603038	张仕明	全屋WIFI	2	2
202511	靖西分公司	靖西新甲综合支局	776503003	韦登昊	全屋WIFI	10	8
202511	田阳分公司	田阳头塘综合支局	776790949	赵名杨	全屋WIFI	9	9
202511	西林分公司	西林古障综合支局	776790461	农何信	全屋WIFI	2	2
202511	右江区分公司	右江区城东综合支局	776047009	黄明德	全屋WIFI	4	2
202511	隆林分公司	隆林德峨综合支局	776790341	王诗宇	全屋WIFI	4	4
202511	凌云分公司	凌云浩坤综合支局	776653052	王道正	全屋WIFI	4	4
202511	隆林分公司	隆林城南综合支局	776903001	冯豈松	全屋WIFI	8	8
202511	田林分公司	田林定安综合支局	776779080	黄强立	全屋WIFI	9	9
202511	靖西分公司	靖西城南综合支局	776518002	黄军	全屋WIFI	2	1
202511	德保分公司	德保那甲隆桑综合支局	776117009	农恒造	全屋WIFI	16	13
202511	德保分公司	德保敬德巴头综合支局	776801411	黄荷	全屋WIFI	6	6
202511	田林分公司	田林潞城综合支局	776782061	向孙赢	全屋WIFI	2	2
202511	隆林分公司	隆林隆或综合支局	776779380	冉登文	全屋WIFI	3	2
202511	那坡分公司	那坡百省综合支局	776206001	农荣锋	全屋WIFI	6	5
202511	右江区分公司	右江区龙景综合支局	776791244	黄伟雄	全屋WIFI	9	8
202511	田阳分公司	田阳玉凤综合支局	776408004	廖瑞鹏	全屋WIFI	6	6
202511	靖西分公司	靖西龙邦综合支局	776507004	韦正策	全屋WIFI	2	2
202511	靖西分公司	靖西湖润综合支局	776903233	马国华	全屋WIFI	1	1
202511	德保分公司	德保马隘都安综合支局	776781373	黄志起	全屋WIFI	17	14
202511	田阳分公司	田阳城东综合支局	776790591	黄欢	全屋WIFI	4	3
202511	平果分公司	平果太平综合支局	776167002	黄寿松	全屋WIFI	2	2
202511	平果分公司	平果铝城综合支局	XN0006607	凌承龙	全屋WIFI	10	10
202511	隆林分公司	隆林平班综合支局	776137039	罗桥廷	全屋WIFI	5	5
202511	靖西分公司	靖西城南综合支局	776791149	凤昌浩	全屋WIFI	9	7
202511	田林分公司	田林六隆综合支局	776324001	韦建交	全屋WIFI	7	5
202511	平果分公司	平果铝城综合支局	776153061	马全军	全屋WIFI	4	4
202511	平果分公司	平果铝城综合支局	776153064	陆信能	全屋WIFI	2	2
202511	田阳分公司	田阳坡洪综合支局	776781789	农吉飞	全屋WIFI	3	3
202511	靖西分公司	武平综合支局	776903110	何振飘	宽带	1	1
202511	德保分公司	燕峒龙光综合支局	776106577	潘寿相	宽带	3	2
202511	田林分公司	定安综合支局	776779080	黄强立	宽带	2	2
202511	西林分公司	西林城北综合支局	776903378	黄健平	宽带	1	1
202511	靖西分公司	果乐综合支局	776801173	王海	宽带	1	1
202511	靖西分公司	地州综合支局	776790955	梁健	宽带	1	1
202511	凌云分公司	茶山综合支局	776903365	冯文伸	宽带	1	1
202511	乐业分公司	乐业城市综合支局	776790150	吴显昆	宽带	4	4
202511	田东分公司	田东祥周综合支局	776365003	刘伟	FTTR	6	6
202511	西林分公司	西林古障综合支局	776782504	李林	FTTR	4	4
202511	隆林分公司	隆林克长综合支局	776603038	张仕明	FTTR	5	5
202511	靖西分公司	靖西安德综合支局	776503084	农昆	FTTR	6	6
202511	平果分公司	平果铝城综合支局	776153064	陆信能	FTTR	15	14
202511	隆林分公司	隆或综合支局	776790485	龙占权	FTTR	1	0
202511	平果分公司	平果装机工程班	776780516	黄尚官	FTTR	1	0
202511	右江区分公司	右江区城东综合支局	776047025	莫嘉文	FTTR	3	3
202511	田阳分公司	田阳西南综合支局	100027314	韦泽祺	FTTR	6	6
202511	凌云分公司	凌云浪伏综合支局	776902293	陆金笑	FTTR	2	2
202511	右江区分公司	右江区龙川综合支局	776028004	韦绍程	FTTR	6	6
202511	凌云分公司	凌云浪伏综合支局	776902269	唐大桉	FTTR	5	5
202511	田阳分公司	田阳头塘综合支局	776107864	潘家明	FTTR	2	2
202511	隆林分公司	隆林者保综合支局	XN0006592	邹文韬	FTTR	1	1
202511	田东分公司	田东城南综合支局	776354008	罗昌嵩	FTTR	5	5
202511	田林分公司	田林八渡综合支局	776782062	韦有富	FTTR	1	1
202511	那坡分公司	那坡城北综合支局	776789851	黎映辰	FTTR	4	4
202511	隆林分公司	隆林者浪综合支局	776620004	王明尚	FTTR	1	1
202511	田林分公司	田林城西综合支局	776315003	伍班恒	FTTR	6	6
202511	靖西分公司	靖西湖润综合支局	776903233	马国华	FTTR	10	10
202511	隆林分公司	隆林克长综合支局	776791198	冉登林	FTTR	2	2
202511	右江区分公司	右江区城中综合支局	776047054	李文照	FTTR	4	3
202511	德保分公司	德保马隘都安综合支局	776781537	陆日宁	FTTR	5	5
202511	平果分公司	平果新安综合支局	776051813	黄新哲	FTTR	8	8
202511	右江区分公司	右江区城中综合支局	776782633	黄新建	FTTR	2	2
202511	靖西分公司	靖西地州综合支局	776782672	农昌健	FTTR	8	8
202511	田东分公司	田东印茶综合支局	776361005	陈佳龙	FTTR	10	10
202511	右江区分公司	右江区龙景综合支局	776117372	韦晨冬	FTTR	11	11
202511	靖西分公司	靖西禄峒综合支局	776156286	杨荇	FTTR	4	2
202511	隆林分公司	隆林城北综合支局	776801641	尤龙	FTTR	4	4
202511	田阳分公司	田阳城东综合支局	776404023	覃山	FTTR	10	10
202511	靖西分公司	靖西城南综合支局	776518002	黄军	FTTR	3	3
202511	田林分公司	田林六隆综合支局	776780495	黄成东	FTTR	9	8
202511	平果分公司	平果海城综合支局	776789581	黄成志	FTTR	4	4
202511	田林分公司	田林旧州综合支局	776789620	陆华斌	FTTR	2	2
202511	田东分公司	田东思林综合支局	776791508	黄培	FTTR	2	2
202511	隆林分公司	隆林猪场综合支局	776790342	杨光平	FTTR	5	5
202511	田林分公司	田林城西综合支局	776323004	李海财	FTTR	7	7
202511	田林分公司	田林浪平综合支局	776701915	黄冰	FTTR	5	5
202511	右江区分公司	右江区阳圩综合支局	776025005	何显文	FTTR	1	1
202511	田东分公司	作登综合支局	776353121	黄振军	FTTR	1	0
202511	右江区分公司	右江区城中综合支局	776051812	李晓明	宽带	4	4
202511	德保分公司	敬德巴头综合支局	776801411	黄荷	宽带	1	1
202511	隆林分公司	者保综合支局	776903160	杨银	宽带	1	0
202511	西林分公司	那佐综合支局	776790469	黄海波	宽带	2	2
202511	隆林分公司	德峨综合支局	776903282	王吉昌	宽带	5	4
202511	靖西分公司	靖西城北综合支局	100040668	谢小科	宽带	2	2
202511	隆林分公司	者浪综合支局	776801815	王章文	宽带	3	3
202511	西林分公司	八达综合支局	776256001	农全荣	宽带	1	1
202511	田阳分公司	洞靖综合支局	776903410	黄承壮	宽带	1	1
202511	田阳分公司	田阳城东综合支局	776404011	梁庆阳	宽带	1	1
202511	右江区分公司	右江区城西综合支局	776177383	邓显武	宽带	2	2
202511	平果分公司	平果城东综合支局	776780516	黄尚官	宽带	1	1
202511	田东分公司	印茶综合支局	776790678	陈毅	宽带	1	1
202511	田林分公司	旧州综合支局	776801680	罗梁闪	宽带	1	0
202511	德保分公司	德保城北综合支局	776107001	梁爽	宽带	2	1
202511	德保分公司	足荣荣华支局	776005003	李洛全	FTTR	2	0
202511	西林分公司	西林八达综合支局	776903223	黄雪龙	FTTR	2	2
202511	西林分公司	西林古障综合支局	776257001	熊忠前	全屋WIFI	1	1
202511	平果分公司	平果海城综合支局	776154010	李继宁	全屋WIFI	1	1
202511	那坡分公司	那坡百省综合支局	776782411	韦永亮	全屋WIFI	1	1
202511	靖西分公司	靖西城南综合支局	776903234	李永将	全屋WIFI	1	1
202511	那坡分公司	那坡平孟综合支局	776203048	叶俊平	全屋WIFI	1	0
202511	德保分公司	德保城北综合支局	776780136	黄海杰	全屋WIFI	11	11
202511	西林分公司	西林八达综合支局	776256001	农全荣	全屋WIFI	7	7
202511	右江区分公司	右江区龙景综合支局	776136775	陈昌维	全屋WIFI	21	20
202511	德保分公司	德保城南综合支局	776108001	罗胜	宽带	6	6
202511	德保分公司	德保城南综合支局	XN0006494	王由好	宽带	5	5
202511	德保分公司	德保城南综合支局	XN0006494	王由好	摄像头	3	3
202511	右江区分公司	右江区龙川综合支局	776902262	梁效彰	摄像头	4	4
202511	右江区分公司	右江区四塘综合支局	776047056	马翔译	摄像头	8	8
202511	平果分公司	平果铝城综合支局	776153064	陆信能	摄像头	4	4
202511	田林分公司	田林浪平综合支局	776701915	黄冰	摄像头	4	4
202511	右江区分公司	右江区城西综合支局	776782705	谷修顿	摄像头	2	2
202511	那坡分公司	那坡城南综合支局	776789519	农尚升	摄像头	11	9
202511	平果分公司	平果新安综合支局	776051813	黄新哲	摄像头	8	8
202511	右江区分公司	右江区城西综合支局	776047026	黎建云	摄像头	10	10
202511	右江区分公司	右江区龙景综合支局	776776365	农新鹏	摄像头	9	9
202511	靖西分公司	靖西城北综合支局	776504016	陆刚豪	摄像头	3	2
202511	田阳分公司	田阳坡洪综合支局	776782412	钟斌奖	摄像头	4	3
202511	右江区分公司	右江区城西综合支局	776112808	何旭	摄像头	10	8
202511	平果分公司	平果太平综合支局	776801478	韦忠棒	摄像头	5	5
202511	平果分公司	平果铝城综合支局	XN0006607	凌承龙	摄像头	2	2
202511	田东分公司	田东城北综合支局	776354021	黄盛华	摄像头	8	8
202511	平果分公司	平果城东综合支局	776051815	陈文禧	摄像头	2	1
202511	乐业分公司	乐业甘田综合支局	776903149	陆义铭	摄像头	2	2
202511	隆林分公司	隆林城北综合支局	776801641	尤龙	摄像头	2	2
202511	平果分公司	平果城东综合支局	XN0006606	梁海	摄像头	6	5
202511	靖西分公司	靖西新甲综合支局	776903232	廖坤	摄像头	2	1
202511	田阳分公司	田阳那坡综合支局	776782470	黄河	摄像头	4	3
202511	右江区分公司	右江区龙景综合支局	776782707	杨旭	摄像头	2	0
202511	田东分公司	田东林逢综合支局	XN0006240	黄忠臣	摄像头	12	9
202511	靖西分公司	靖西化峒综合支局	776790953	何开文	摄像头	5	4
202511	右江区分公司	右江区龙景综合支局	776779294	李生学	摄像头	8	8
202511	田东分公司	田东义圩综合支局	776365009	刘忠世	摄像头	8	6
202511	田阳分公司	田阳百育综合支局	776903198	何晨珲	摄像头	3	3
202511	田东分公司	田东城南综合支局	XN0006619	卢万祥	摄像头	5	4
202511	凌云分公司	凌云泗城综合支局	XN0006717	戴学繁	摄像头	5	5
202511	右江区分公司	右江区龙景综合支局	776791244	黄伟雄	摄像头	2	2
202511	平果分公司	平果城东综合支局	776051808	陆如成	摄像头	2	2
202511	隆林分公司	隆林城北综合支局	776902083	严余	宽带	3	3
202511	德保分公司	德保马隘都安综合支局	776701579	罗世金	摄像头	3	3
202511	靖西分公司	靖西政企专业支局	776521003	杨经星	摄像头	1	1
202511	德保分公司	德保城南综合支局	776104009	黄芨德	全屋WIFI	9	9
202511	那坡分公司	那坡百省综合支局	776777931	叶力晖	全屋WIFI	2	2
202511	凌云分公司	凌云茶山综合支局	776903365	冯文伸	全屋WIFI	3	3
202511	平果分公司	平果坡造综合支局	776051817	石盛宇	全屋WIFI	9	8
202511	右江区分公司	右江区城东综合支局	776701234	黄志基	全屋WIFI	6	3
202511	田东分公司	田东城南综合支局	XN0006617	黄城生	全屋WIFI	10	6
202511	平果分公司	平果铝城综合支局	776780514	陆信忠	全屋WIFI	16	14
202511	凌云分公司	凌云茶山综合支局	776789296	万恒乾	全屋WIFI	3	3
202511	靖西分公司	靖西政企专业支局	100015499	黄加辉	全屋WIFI	10	8
202511	田阳分公司	田阳西南综合支局	776405028	黄聪	全屋WIFI	9	9
202511	靖西分公司	靖西武平综合支局	776153132	何正涛	全屋WIFI	3	3
202511	田林分公司	田林城西综合支局	776903477	明胜聪	全屋WIFI	3	3
202511	平果分公司	平果新安综合支局	776140445	廖春峥	全屋WIFI	5	3
202511	德保分公司	德保燕峒龙光综合支局	776141435	凌振鑫	全屋WIFI	7	5
202511	田阳分公司	田阳城东综合支局	776791329	李文武	全屋WIFI	4	4
202511	那坡分公司	那坡德隆综合支局	776782119	杨贵龙	全屋WIFI	3	3
202511	平果分公司	平果城东综合支局	776168002	黄承东	全屋WIFI	4	4
202511	平果分公司	平果太平综合支局	776801478	韦忠棒	全屋WIFI	3	3
202511	田阳分公司	田阳坡洪综合支局	776782412	钟斌奖	全屋WIFI	1	1
202511	右江区分公司	右江区龙景综合支局	776110696	马均福	全屋WIFI	5	5
202511	右江区分公司	右江区城中综合支局	776051812	李晓明	全屋WIFI	7	2
202511	田阳分公司	田阳那坡综合支局	776419005	黄忠法	全屋WIFI	2	2
202511	那坡分公司	那坡城北综合支局	776791227	马晓东	全屋WIFI	2	2
202511	田东分公司	田东印茶综合支局	776790678	陈毅	全屋WIFI	2	2
202511	田林分公司	田林旧州综合支局	776789620	陆华斌	全屋WIFI	1	1
202511	右江区分公司	右江区城西综合支局	776051811	张靖	全屋WIFI	2	2
202511	德保分公司	德保燕峒龙光综合支局	776005015	黄绍都	全屋WIFI	2	0
202511	靖西分公司	靖西果乐综合支局	776791149	凤昌浩	全屋WIFI	1	1
202511	田东分公司	田东城北综合支局	776779041	黄剑	全屋WIFI	6	6
202511	平果分公司	平果太平综合支局	776141913	班必飞	全屋WIFI	1	0
202511	凌云分公司	凌云浪伏综合支局	776659002	杨再冲	全屋WIFI	2	1
202511	靖西分公司	靖西安德综合支局	776779978	赵明刚	全屋WIFI	1	1
202511	右江区分公司	右江区城中综合支局	776780541	吴东平	全屋WIFI	1	1
202511	右江区分公司	右江区龙景综合支局	776782706	黄雨	全屋WIFI	1	0
202511	德保分公司	德保马隘都安综合支局	776701579	罗世金	全屋WIFI	1	1
202511	靖西分公司	靖西禄峒综合支局	776779729	杨文腾	全屋WIFI	2	1
202511	田林分公司	田林潞城综合支局	776791413	梁深健	FTTR	3	4
202511	田东分公司	田东城南综合支局	776354008	罗昌嵩	宽带	3	3
202511	凌云分公司	浩坤综合支局	776781570	劳建峰	宽带	2	2
202511	田东分公司	田东城北综合支局	776779041	黄剑	宽带	4	4
202511	乐业分公司	花坪综合支局	776456002	王功泽	宽带	1	1
202511	凌云分公司	浪伏综合支局	776659003	周歧稳	宽带	2	1
202511	凌云分公司	茶山综合支局	776789296	万恒乾	宽带	2	2
202511	平果分公司	新安综合支局	100011762	陆文昭	宽带	1	1
202511	田阳分公司	头塘综合支局	776790949	赵名杨	宽带	2	1
202511	西林分公司	西林政企专业支局	776256007	贺刚银	FTTR	0	0
202511	靖西分公司	靖西安德综合支局	776779978	赵明刚	FTTR	2	2
202511	那坡分公司	那坡城南综合支局	776780245	农子文	FTTR	1	1
202511	田阳分公司	田阳百育综合支局	776137911	蒙柯睿	FTTR	14	14
202511	右江区分公司	右江区城东综合支局	776047009	黄明德	FTTR	5	5
202511	田阳分公司	田阳那坡综合支局	776782470	黄河	FTTR	11	10
202511	右江区分公司	右江区城中综合支局	776781370	唐卡	FTTR	4	4
202511	右江区分公司	右江区阳圩综合支局	776781371	黄钰星	FTTR	1	1
202511	隆林分公司	隆林城南综合支局	776903112	黄毅	FTTR	29	29
202511	田林分公司	田林城东综合支局	776303060	阮敬翔	FTTR	1	0
202511	田阳分公司	田阳西南综合支局	XN0006559	陆庆华	FTTR	7	7
202511	靖西分公司	靖西城北综合支局	776504016	陆刚豪	FTTR	5	5
202511	田林分公司	田林城西综合支局	776313007	杨绍远	FTTR	8	8
202511	隆林分公司	隆林城北综合支局	776902083	严余	FTTR	6	6
202511	隆林分公司	隆林政企专业支局	776790368	柳隆文	FTTR	1	1
202511	田东分公司	田东城北综合支局	776354021	黄盛华	FTTR	9	9
202511	田林分公司	田林城西综合支局	776903477	明胜聪	FTTR	7	7
202511	平果分公司	平果榜圩综合支局	XN0006762	陆舜龙	FTTR	2	2
202511	德保分公司	德保城南综合支局	776103061	杨子弟	FTTR	5	5
202511	靖西分公司	靖西禄峒综合支局	776790202	肖祥友	FTTR	4	4
202511	田东分公司	田东印茶综合支局	776790678	陈毅	FTTR	14	14
202511	田东分公司	田东城北综合支局	776353129	张帅	FTTR	2	2
202511	田东分公司	田东作登综合支局	776353121	黄振军	FTTR	13	12
202511	田阳分公司	田阳坡洪综合支局	776781789	农吉飞	FTTR	6	6
202511	右江区分公司	右江区城中综合支局	776791248	梁安龙	FTTR	6	6
202511	那坡分公司	那坡德隆综合支局	776778054	李双宏	FTTR	1	1
202511	田阳分公司	田阳坡洪综合支局	776782412	钟斌奖	FTTR	2	2
202511	乐业分公司	乐业城市综合支局	776789435	袁宏科	FTTR	5	5
202511	凌云分公司	凌云浩坤综合支局	776790241	郁长龙	FTTR	4	4
202511	田阳分公司	田阳洞靖综合支局	776409006	梁文	FTTR	1	1
202511	田林分公司	田林定安综合支局	776701107	农俊杰	FTTR	2	2
202511	田阳分公司	田阳坡洪综合支局	776790251	杨忠敏	FTTR	2	2
202511	凌云分公司	凌云浩坤综合支局	776790051	劳兴新	FTTR	2	2
202511	田阳分公司	田阳头塘综合支局	776790949	赵名杨	FTTR	1	1
202511	右江区分公司	右江区龙景综合支局	776110696	马均福	FTTR	1	1
202511	隆林分公司	隆林城南综合支局	776903112	黄毅	宽带	1	1
202511	田东分公司	义圩综合支局	776359006	黄立升	宽带	1	1
202511	平果分公司	平果城东综合支局	776902443	黄冠文	宽带	1	1
202511	靖西分公司	果乐综合支局	776791149	凤昌浩	宽带	1	1
202511	隆林分公司	隆或综合支局	776701942	吴凯	宽带	2	2
202511	右江区分公司	右江区城东综合支局	776701234	黄志基	宽带	1	1
202511	靖西分公司	龙邦综合支局	776144677	黄盛旺	宽带	1	1
202511	德保分公司	燕峒龙光综合支局	776780134	黄大耕	宽带	1	1
202511	西林分公司	古障综合支局	776777061	刘建林	宽带	1	1
202511	右江区分公司	右江区龙景综合支局	776779294	李生学	宽带	1	1
202511	那坡分公司	那坡平孟综合支局	776782530	农建明	FTTR	1	1
202511	靖西分公司	靖西武平综合支局	776518002	黄军	FTTR	1	1
202511	德保分公司	德保城南综合支局	776104009	黄芨德	FTTR	2	2
202511	右江区分公司	右江区城中综合支局	776782633	黄新建	全屋WIFI	1	1
202511	乐业分公司	乐业新化综合支局	776453066	黎源	全屋WIFI	4	4
202511	隆林分公司	克长综合支局	776791198	冉登林	宽带	2	2
202511	西林分公司	西林古障综合支局	776256005	邓将	摄像头	1	1
202511	田林分公司	田林定安综合支局	776779080	黄强立	摄像头	5	3
202511	西林分公司	西林古障综合支局	776790461	农何信	摄像头	3	3
202511	隆林分公司	隆林猪场综合支局	776701925	杨健	摄像头	17	13
202511	隆林分公司	隆林城南综合支局	776903112	黄毅	摄像头	11	7
202511	那坡分公司	那坡德隆综合支局	776782119	杨贵龙	摄像头	2	2
202511	那坡分公司	那坡百省综合支局	776206001	农荣锋	摄像头	10	9
202511	田阳分公司	田阳头塘综合支局	776790949	赵名杨	摄像头	9	8
202511	靖西分公司	靖西果乐综合支局	776801173	王海	摄像头	9	8
202511	那坡分公司	那坡龙合综合支局	776211005	王启江	摄像头	13	12
202511	右江区分公司	右江区城西综合支局	776779999	岑忠彩	摄像头	6	7
202511	靖西分公司	靖西龙邦综合支局	776507004	韦正策	摄像头	5	5
202511	德保分公司	德保东凌综合支局	776789485	阮荣达	摄像头	9	7
202511	田阳分公司	田阳城东综合支局	776404011	梁庆阳	摄像头	20	7
202511	田林分公司	田林浪平综合支局	776322006	吴定碧	摄像头	1	0
202511	德保分公司	德保马隘都安综合支局	776781537	陆日宁	摄像头	5	5
202511	乐业分公司	乐业城市综合支局	776789435	袁宏科	摄像头	12	11
202511	德保分公司	德保马隘都安综合支局	776781373	黄志起	摄像头	10	8
202511	田林分公司	田林潞城综合支局	776777743	李秉罡	摄像头	17	15
202511	田东分公司	田东义圩综合支局	776358001	李璜	摄像头	8	7
202511	右江区分公司	右江区城西综合支局	776177383	邓显武	摄像头	4	4
202511	田林分公司	田林定安综合支局	776322005	韦宝林	摄像头	3	3
202511	德保分公司	德保城北综合支局	776103065	雍正福	摄像头	4	3
202511	德保分公司	德保足荣荣华综合支局	776902175	杨伟业	摄像头	2	1
202511	田阳分公司	田阳西南综合支局	776790947	李俊麟	摄像头	3	3
202511	平果分公司	平果铝城综合支局	776780514	陆信忠	摄像头	13	12
202511	隆林分公司	隆林隆或综合支局	776790485	龙占权	摄像头	10	7
202511	田东分公司	田东祥周综合支局	776102410	李天北	摄像头	2	2
202511	靖西分公司	靖西城南综合支局	776518002	黄军	摄像头	9	7
202511	田阳分公司	田阳坡洪综合支局	776781789	农吉飞	摄像头	4	4
202511	靖西分公司	靖西城北综合支局	776504020	农继勇	摄像头	11	8
202511	右江区分公司	右江区四塘综合支局	776024001	罗忠良	摄像头	3	3
202511	靖西分公司	靖西湖润综合支局	776779725	卢发金	摄像头	5	5
202511	西林分公司	西林城北综合支局	776801211	陆宇杭	摄像头	2	2
202511	右江区分公司	右江区城东综合支局	776701234	黄志基	摄像头	4	4
202511	田东分公司	田东城北综合支局	776777887	韦忠将	摄像头	4	3
202511	田林分公司	田林城西综合支局	776903477	明胜聪	摄像头	3	1
202511	平果分公司	平果城东综合支局	776701880	农国政	摄像头	6	4
202511	靖西分公司	靖西城南综合支局	776903234	李永将	摄像头	1	1
202511	平果分公司	平果政企专业支局	XN0006605	黄忠站	摄像头	3	3
202511	靖西分公司	靖西安德综合支局	776779978	赵明刚	摄像头	1	1
202511	靖西分公司	靖西地州综合支局	776782672	农昌健	摄像头	4	2
202511	凌云分公司	凌云浪伏综合支局	776902293	陆金笑	摄像头	4	4
202511	右江区分公司	右江区城东综合支局	776136822	肖君	摄像头	1	0
202511	西林分公司	西林政企专业支局	776256007	贺刚银	摄像头	1	1
202511	田东分公司	田东朔良综合支局	776789212	陆问	摄像头	1	0
202511	平果分公司	平果新安综合支局	776120607	李勇	摄像头	5	5
202511	靖西分公司	靖西武平综合支局	776518002	黄军	全屋WIFI	4	4
202511	靖西分公司	靖西化峒综合支局	776520002	陆扬	全屋WIFI	6	3
202511	田东分公司	田东城北综合支局	776354016	农伟	全屋WIFI	7	7
202511	田东分公司	田东城南综合支局	776354006	何雨	全屋WIFI	8	8
202511	德保分公司	德保敬德巴头综合支局	776777811	黄健	全屋WIFI	8	6
202511	那坡分公司	那坡德隆综合支局	776778054	李双宏	全屋WIFI	5	3
202511	靖西分公司	靖西武平综合支局	776903110	何振飘	全屋WIFI	6	6
202511	田林分公司	田林城西综合支局	776801709	赵金寿	全屋WIFI	5	5
202511	田东分公司	田东作登综合支局	776368008	韦寿猛	全屋WIFI	2	2
202511	凌云分公司	凌云浩坤综合支局	776781570	劳建峰	全屋WIFI	6	5
202511	隆林分公司	隆林德峨综合支局	776903536	杨虎	全屋WIFI	4	4
202511	右江区分公司	右江区城东综合支局	776790283	黄波	全屋WIFI	8	8
202511	德保分公司	德保燕峒龙光综合支局	776780134	黄大耕	全屋WIFI	4	3
202511	德保分公司	德保东凌综合支局	776791538	李荣振	全屋WIFI	2	2
202511	凌云分公司	凌云泗城综合支局	776782067	田仁政	全屋WIFI	6	6
202511	田阳分公司	田阳那坡综合支局	776782470	黄河	全屋WIFI	1	1
202511	右江区分公司	右江区城西综合支局	776779999	岑忠彩	全屋WIFI	1	1
202511	乐业分公司	乐业新化综合支局	776791710	罗韶轩	全屋WIFI	5	4
202511	田东分公司	田东印茶综合支局	776358003	农国亮	全屋WIFI	3	3
202511	田阳分公司	田阳坡洪综合支局	776790251	杨忠敏	全屋WIFI	4	4
202511	右江区分公司	右江区城东综合支局	776117367	刘升	全屋WIFI	1	1
202511	隆林分公司	隆林者浪综合支局	776801815	王章文	全屋WIFI	6	4
202511	田东分公司	田东城北综合支局	776354010	宁彬	全屋WIFI	2	2
202511	隆林分公司	隆林克长综合支局	776791198	冉登林	全屋WIFI	2	1
202511	平果分公司	平果榜圩综合支局	776051822	苏宝观	全屋WIFI	3	3
202511	靖西分公司	靖西城北综合支局	776504010	许志欢	全屋WIFI	3	3
202511	靖西分公司	靖西武平综合支局	776790952	李启校	全屋WIFI	4	4
202511	田阳分公司	田阳洞靖综合支局	776409006	梁文	全屋WIFI	1	1
202511	田林分公司	田林旧州综合支局	776801680	罗梁闪	全屋WIFI	1	0
202511	田阳分公司	田阳头塘综合支局	776415002	林凯旋	全屋WIFI	1	1
202511	田东分公司	田东祥周综合支局	776366013	梁福翔	全屋WIFI	2	2
202511	田阳分公司	田阳洞靖综合支局	776406003	李勇	全屋WIFI	2	1
202511	靖西分公司	靖西地州综合支局	776790955	梁健	全屋WIFI	2	2
202511	靖西分公司	靖西城南综合支局	776504025	黄日赞	FTTR	9	10
202511	田阳分公司	百育综合支局	776137911	蒙柯睿	宽带	2	2
202511	右江区分公司	四塘综合支局	776791047	黄承湘	宽带	1	1
202511	田林分公司	田林城西综合支局	776315003	伍班恒	宽带	5	4
202511	德保分公司	德保城南综合支局	776103061	杨子弟	宽带	1	1
202511	凌云分公司	凌云泗城综合支局	776782724	田宏干	FTTR	6	6
202511	田东分公司	田东义圩综合支局	776365009	刘忠世	FTTR	15	14
202511	平果分公司	平果城东综合支局	776780516	黄尚官	FTTR	10	10
202511	右江区分公司	右江区阳圩综合支局	776117376	李京津	FTTR	10	10
202511	平果分公司	平果城东综合支局	776902443	黄冠文	FTTR	12	12
202511	田林分公司	田林六隆综合支局	776307002	罗肖	FTTR	6	6
202511	田阳分公司	田阳玉凤综合支局	776408004	廖瑞鹏	FTTR	3	3
202511	田林分公司	田林城西综合支局	776303060	阮敬翔	FTTR	11	11
202511	田阳分公司	田阳那坡综合支局	776411016	李羿澄	FTTR	9	9
202511	靖西分公司	靖西新甲综合支局	776503003	韦登昊	FTTR	10	10
202511	靖西分公司	靖西城北综合支局	100040668	谢小科	FTTR	4	3
202511	那坡分公司	那坡龙合综合支局	776211001	农京运	FTTR	8	8
202511	隆林分公司	隆林城南综合支局	776791554	杨明顺	FTTR	13	13
202511	平果分公司	平果坡造综合支局	776051817	石盛宇	FTTR	4	4
202511	田阳分公司	田阳玉凤综合支局	776779391	黄永吉	FTTR	11	10
202511	平果分公司	平果铝城综合支局	776780520	杨国立	FTTR	11	11
202511	平果分公司	平果城东综合支局	776153023	陆炜	FTTR	7	7
202511	靖西分公司	靖西武平综合支局	776153132	何正涛	FTTR	3	3
202511	那坡分公司	那坡城南综合支局	100013040	黄仕中	FTTR	6	6
202511	右江区分公司	右江区城西综合支局	776110694	黎政华	FTTR	8	8
202511	德保分公司	德保敬德巴头综合支局	776801411	黄荷	FTTR	5	5
202511	靖西分公司	靖西城南综合支局	100040666	周密根	FTTR	10	10
202511	靖西分公司	靖西地州综合支局	776779724	李国伟	FTTR	4	4
202511	田东分公司	田东林逢综合支局	XN0006240	黄忠臣	FTTR	6	6
202511	隆林分公司	隆林克长综合支局	776902373	曾清	FTTR	4	4
202511	德保分公司	德保城北综合支局	776801421	黄仕全	FTTR	3	3
202511	田东分公司	田东作登综合支局	7763610044	黄作山	FTTR	9	9
202511	德保分公司	德保城北综合支局	776780136	黄海杰	FTTR	3	3
202511	右江区分公司	右江区城西综合支局	776177383	邓显武	FTTR	3	3
202511	德保分公司	德保燕峒龙光综合支局	776780134	黄大耕	FTTR	3	3
202511	右江区分公司	右江区城东综合支局	776701234	黄志基	FTTR	2	2
202511	田东分公司	田东城南综合支局	776354004	黄军权	FTTR	1	0
202511	平果分公司	平果城东综合支局	XN0006606	梁海	FTTR	4	4
202511	平果分公司	平果榜圩综合支局	776051822	苏宝观	FTTR	3	3
202511	凌云分公司	凌云茶山综合支局	776903365	冯文伸	FTTR	6	6
202511	靖西分公司	靖西城北综合支局	776504010	许志欢	FTTR	11	9
202511	靖西分公司	靖西政企专业支局	100015499	黄加辉	FTTR	1	1
202511	靖西分公司	靖西新甲综合支局	776503084	农昆	FTTR	1	1
202511	平果分公司	平果太平综合支局	776167002	黄寿松	FTTR	3	3
202511	靖西分公司	新甲综合支局	776503003	韦登昊	FTTR	1	0
202511	靖西分公司	靖西城北综合支局	776504020	农继勇	FTTR	3	3
202511	靖西分公司	靖西新甲综合支局	776779158	雷平	FTTR	1	1
202511	田林分公司	八桂综合支局	776307002	罗肖	FTTR	0	0
202511	田阳分公司	田阳百育综合支局	776903198	何晨珲	FTTR	1	1
202511	隆林分公司	隆林者浪综合支局	776801815	王章文	FTTR	1	1
202511	田林分公司	八渡综合支局	776701447	梁贵荣	宽带	2	2
202511	田东分公司	田东城北综合支局	776364001	周作弟	宽带	2	2
202511	田阳分公司	田阳西南综合支局	100027314	韦泽祺	宽带	3	3
202511	田林分公司	田林城西综合支局	776323004	李海财	宽带	2	2
202511	靖西分公司	化峒综合支局	776790953	何开文	宽带	2	2
202511	田东分公司	义圩综合支局	776358001	李璜	宽带	2	2
202511	靖西分公司	靖西城北综合支局	776504016	陆刚豪	宽带	2	1
202511	田东分公司	义圩综合支局	776365009	刘忠世	宽带	1	0
202511	右江区分公司	右江区城东综合支局	776117367	刘升	宽带	1	1
202511	平果分公司	平果铝城综合支局	776153064	陆信能	宽带	2	2
202511	乐业分公司	乐业城市综合支局	776901056	杨正国	宽带	3	3
202511	隆林分公司	隆或综合支局	776791807	冉浩成	宽带	1	1
202511	右江区分公司	右江区龙景综合支局	776779294	李生学	宽带	2	2
202511	田东分公司	田东城北综合支局	776354016	农伟	宽带	2	2
202511	靖西分公司	湖润综合支局	776779725	卢发金	宽带	1	1
202511	右江区分公司	四塘综合支局	776781448	黄承虎	宽带	1	1
202511	德保分公司	德保城南综合支局	XN0006493	谭朝珠	宽带	1	1
202511	田阳分公司	玉凤综合支局	776404029	黄中站	FTTR	1	1
202511	乐业分公司	乐业花坪综合支局	776456002	王功泽	FTTR	1	1
202511	田林分公司	田林城西综合支局	XN0006625	韦志兵	全屋WIFI	2	2
202511	田东分公司	田东作登综合支局	776789210	梁海亮	全屋WIFI	2	1
202511	乐业分公司	乐业花坪综合支局	776707813	钟湛烃	全屋WIFI	15	15
202511	凌云分公司	凌云浪伏综合支局	776659003	周歧稳	全屋WIFI	4	4
202511	乐业分公司	乐业城市综合支局	776790150	吴显昆	全屋WIFI	8	7
202511	田阳分公司	田阳玉凤综合支局	776779391	黄永吉	全屋WIFI	2	2
202511	德保分公司	德保城南综合支局	776103061	杨子弟	全屋WIFI	12	8
202511	平果分公司	平果城东综合支局	776791071	黄立程	全屋WIFI	3	2
202511	西林分公司	古障综合支局	776782504	李林	宽带	1	1
202511	田林分公司	田林六隆综合支局	776780329	李斌	摄像头	6	6
202511	隆林分公司	隆林城北综合支局	776903002	田孟法	摄像头	11	8
202511	乐业分公司	乐业城市综合支局	776790150	吴显昆	摄像头	25	22
202511	右江区分公司	右江区龙景综合支局	776782540	黄卓学	摄像头	3	3
202511	德保分公司	德保敬德巴头综合支局	776781441	黄特	摄像头	3	2
202511	隆林分公司	隆林德峨综合支局	776790341	王诗宇	摄像头	17	15
202511	隆林分公司	隆林猪场综合支局	776790342	杨光平	摄像头	20	16
202511	乐业分公司	乐业城市综合支局	776901056	杨正国	摄像头	7	7
202511	隆林分公司	隆林克长综合支局	776791198	冉登林	摄像头	5	4
202511	田阳分公司	田阳百育综合支局	776407015	韦日行	摄像头	5	4
202511	凌云分公司	凌云浩坤综合支局	776781570	劳建峰	摄像头	10	10
202511	田东分公司	田东作登综合支局	7763610044	黄作山	摄像头	9	9
202511	西林分公司	西林那劳综合支局	776903224	蒙智强	摄像头	3	1
202511	德保分公司	德保城北综合支局	776780136	黄海杰	摄像头	3	3
202511	田东分公司	田东祥周综合支局	776365003	刘伟	摄像头	3	3
202511	凌云分公司	凌云茶山综合支局	776789296	万恒乾	摄像头	5	5
202511	田林分公司	田林旧州综合支局	776789620	陆华斌	摄像头	8	7
202511	靖西分公司	靖西城南综合支局	776504025	黄日赞	摄像头	10	8
202511	右江区分公司	右江区城东综合支局	776047009	黄明德	摄像头	2	2
202511	平果分公司	平果榜圩综合支局	776051822	苏宝观	摄像头	4	3
202511	凌云分公司	凌云浪伏综合支局	776902269	唐大桉	摄像头	8	7
202511	隆林分公司	隆林平班综合支局	776701816	马定威	摄像头	7	7
202511	右江区分公司	右江区城中综合支局	776791248	梁安龙	摄像头	7	7
202511	田东分公司	田东城北综合支局	776354016	农伟	摄像头	7	6
202511	隆林分公司	隆林德峨综合支局	776903536	杨虎	摄像头	5	5
202511	乐业分公司	乐业甘田综合支局	776789575	黎明东	摄像头	8	7
202511	田阳分公司	田阳城东综合支局	776404007	黄文华	摄像头	8	7
202511	平果分公司	平果太平综合支局	776903221	黄伟君	摄像头	9	8
202511	隆林分公司	隆林者保综合支局	XN0006592	邹文韬	摄像头	2	1
202511	隆林分公司	隆林隆或综合支局	776791807	冉浩成	摄像头	11	11
202511	平果分公司	平果城东综合支局	776791071	黄立程	摄像头	1	1
202511	田阳分公司	田阳头塘综合支局	776503015	颜力顺	摄像头	9	9
202511	右江区分公司	右江区城东综合支局	776047019	黄镇权	摄像头	1	1
202511	田阳分公司	田阳百育综合支局	776407014	罗飞	摄像头	2	2
202511	右江区分公司	右江区城中综合支局	776781370	唐卡	摄像头	2	2
202511	田东分公司	田东作登综合支局	776368008	韦寿猛	摄像头	10	9
202511	靖西分公司	靖西新甲综合支局	776503003	韦登昊	摄像头	12	8
202511	田林分公司	田林城西综合支局	776323004	李海财	摄像头	1	1
202511	田林分公司	田林潞城综合支局	776779197	黎书醒	摄像头	8	8
202511	右江区分公司	右江区城西综合支局	776782705	谷修顿	摄像头	1	1
202511	田东分公司	田东作登综合支局	776791508	黄培	摄像头	3	3
202511	那坡分公司	那坡百省综合支局	776777931	叶力晖	摄像头	3	2
202511	平果分公司	平果旧城综合支局	776051818	李继文	摄像头	1	1
202511	凌云分公司	凌云茶山综合支局	776655017	陈霖	摄像头	5	5
202511	靖西分公司	靖西武平综合支局	776791324	何大军	摄像头	1	1
202511	田东分公司	田东印茶综合支局	776361005	陈佳龙	摄像头	4	4
202511	田林分公司	田林六隆综合支局	776307002	罗肖	全屋WIFI	6	5
202511	右江区分公司	右江区龙景综合支局	776779294	李生学	全屋WIFI	6	4
202511	右江区分公司	右江区四塘综合支局	776777378	黄高科	全屋WIFI	3	2
202511	平果分公司	平果城东综合支局	776701880	农国政	全屋WIFI	4	4
202511	田阳分公司	田阳西南综合支局	776404025	凌尔	全屋WIFI	8	6
202511	德保分公司	德保城南综合支局	XN0006494	王由好	全屋WIFI	6	6
202511	右江区分公司	右江区城西综合支局	776782705	谷修顿	全屋WIFI	9	8
202511	右江区分公司	右江区澄碧湖综合支局	776144459	梁富林	全屋WIFI	2	1
202511	田林分公司	田林城西综合支局	776323004	李海财	全屋WIFI	9	8
202511	田阳分公司	田阳西南综合支局	100027314	韦泽祺	全屋WIFI	8	5
202511	右江区分公司	右江区龙景综合支局	776901139	林雨健	全屋WIFI	14	8
202511	田阳分公司	田阳洞靖综合支局	776779400	罗朝壮	全屋WIFI	4	4
202511	平果分公司	平果榜圩综合支局	776776539	黄泽锶	全屋WIFI	9	7
202511	平果分公司	平果铝城综合支局	776185061	宋显辉	全屋WIFI	5	5
202511	田林分公司	田林定安综合支局	776701107	农俊杰	全屋WIFI	1	1
202511	乐业分公司	乐业甘田综合支局	776903149	陆义铭	全屋WIFI	4	3
202511	田阳分公司	田阳头塘综合支局	776107864	潘家明	全屋WIFI	4	3
202511	右江区分公司	右江区城西综合支局	776110694	黎政华	全屋WIFI	4	4
202511	平果分公司	平果海城综合支局	776161006	黄炳康	全屋WIFI	3	2
202511	凌云分公司	凌云浪伏综合支局	776902293	陆金笑	全屋WIFI	4	4
202511	乐业分公司	乐业花坪综合支局	776456002	王功泽	全屋WIFI	4	3
202511	田阳分公司	田阳政企专业支局	776404004	黄武庆	全屋WIFI	1	1
202511	右江区分公司	右江区城西综合支局	776177383	邓显武	全屋WIFI	2	1
202511	田东分公司	田东思林综合支局	776360003	陆最香	全屋WIFI	3	3
202511	靖西分公司	靖西城南综合支局	776782673	郭康宝	全屋WIFI	8	8
202511	田阳分公司	田阳城东综合支局	776404007	黄文华	全屋WIFI	2	2
202511	田东分公司	田东城南综合支局	776354008	罗昌嵩	全屋WIFI	4	4
202511	右江区分公司	右江区城东综合支局	776776673	杨增友	全屋WIFI	2	2
202511	乐业分公司	新化综合支局	776791710	罗韶轩	宽带	5	4
202511	田阳分公司	头塘综合支局	776791213	黄罗峰	宽带	2	2
202511	平果分公司	平果城东综合支局	776051815	陈文禧	FTTR	6	6
202511	那坡分公司	龙合综合支局	776901212	黄宏语	宽带	2	2
202511	右江区分公司	右江区龙景综合支局	776779294	李生学	FTTR	9	7
202511	那坡分公司	那坡政企专业支局	776789051	岑博	宽带	2	2
202511	田林分公司	潞城综合支局	776779197	黎书醒	宽带	2	2
202511	田东分公司	田东城北综合支局	776354021	黄盛华	宽带	2	2
202511	田林分公司	田林定安综合支局	776779080	黄强立	FTTR	6	6
202511	德保分公司	马隘都安综合支局	776781373	黄志起	宽带	2	2
202511	田东分公司	田东城北综合支局	776779041	黄剑	FTTR	5	5
202511	靖西分公司	靖西城南综合支局	XN0006319	俞小神	FTTR	15	15
202511	田阳分公司	田阳百育综合支局	776790253	黄林龙	FTTR	4	4
202511	田东分公司	田东城北综合支局	776354016	农伟	FTTR	15	15
202511	田东分公司	田东城南综合支局	776354006	何雨	FTTR	12	12
202511	田林分公司	田林城西综合支局	XN0006625	韦志兵	FTTR	4	4
202511	右江区分公司	右江区四塘综合支局	776047056	马翔译	FTTR	7	7
202511	靖西分公司	靖西化峒综合支局	776790953	何开文	FTTR	5	5
202511	田东分公司	田东祥周综合支局	776366010	班锦波	FTTR	5	5
202511	平果分公司	平果新安综合支局	776140445	廖春峥	FTTR	3	3
202511	田阳分公司	田阳城东综合支局	776404007	黄文华	FTTR	5	5
202511	那坡分公司	那坡城南综合支局	776781551	陈元龙	FTTR	4	3
202511	田东分公司	田东城南综合支局	776791087	王磊	FTTR	11	8
202511	田阳分公司	田阳头塘综合支局	776791213	黄罗峰	FTTR	11	11
202511	德保分公司	德保东凌综合支局	776789485	阮荣达	FTTR	3	2
202511	靖西分公司	靖西武平综合支局	776791324	何大军	FTTR	4	4
202511	隆林分公司	隆林平班综合支局	776137039	罗桥廷	FTTR	12	12
202511	平果分公司	平果榜圩综合支局	776776539	黄泽锶	FTTR	5	5
202511	右江区分公司	右江区城西综合支局	776112808	何旭	FTTR	4	4
202511	田林分公司	田林六隆综合支局	776324001	韦建交	FTTR	7	7
202511	隆林分公司	隆林德峨综合支局	776790341	王诗宇	FTTR	1	1
202511	平果分公司	平果太平综合支局	776801479	韦家盛	FTTR	3	3
202511	田东分公司	田东城北综合支局	776777887	韦忠将	FTTR	7	7
202511	隆林分公司	隆林德峨综合支局	776903282	王吉昌	FTTR	5	5
202511	靖西分公司	靖西城南综合支局	776791149	凤昌浩	FTTR	3	3
202511	凌云分公司	凌云茶山综合支局	776789296	万恒乾	FTTR	1	1
202511	隆林分公司	隆林平班综合支局	776701816	马定威	FTTR	4	4
202511	西林分公司	西林那劳综合支局	776903224	蒙智强	FTTR	10	10
202511	右江区分公司	右江区城东综合支局	776047020	梁冬健	FTTR	1	1
202511	凌云分公司	凌云浩坤综合支局	776653052	王道正	FTTR	4	4
202511	田林分公司	田林八渡综合支局	776902137	农义忠	FTTR	2	2
202511	右江区分公司	右江区城东综合支局	776047019	黄镇权	FTTR	1	1
202511	凌云分公司	泗城综合支局	776653046	廖庆灵	FTTR	1	0
202511	靖西分公司	靖西湖润综合支局	776779725	卢发金	FTTR	9	8
202511	田东分公司	田东作登综合支局	776789210	梁海亮	FTTR	6	5
202511	德保分公司	德保马隘都安综合支局	776781373	黄志起	FTTR	6	6
202511	凌云分公司	凌云泗城综合支局	776653046	廖庆灵	FTTR	5	5
202511	右江区分公司	右江区龙川综合支局	776902262	梁效彰	FTTR	1	1
202511	德保分公司	德保燕峒龙光综合支局	776005015	黄绍都	FTTR	2	1
202511	凌云分公司	浪伏综合支局	776653052	王道正	FTTR	1	0
202511	右江区分公司	右江区澄碧湖综合支局	776144459	梁富林	FTTR	1	1
202511	田阳分公司	田阳西南综合支局	776404025	凌尔	FTTR	6	5
202511	靖西分公司	靖西果乐综合支局	776791149	凤昌浩	FTTR	3	3
202511	凌云分公司	凌云茶山综合支局	776701863	姚才状	FTTR	1	1
202511	靖西分公司	武平综合支局	776524005	黄春	FTTR	1	0
202511	平果分公司	平果城东综合支局	776791071	黄立程	FTTR	2	2
202511	平果分公司	平果铝城综合支局	776780514	陆信忠	宽带	6	6
202511	田阳分公司	百育综合支局	776407014	罗飞	宽带	1	1
202511	右江区分公司	右江区龙景综合支局	776901139	林雨健	宽带	3	3
202511	靖西分公司	靖西城北综合支局	776504020	农继勇	宽带	5	5
202511	右江区分公司	右江区龙景综合支局	776782707	杨旭	宽带	2	2
202511	平果分公司	太平综合支局	776801478	韦忠棒	宽带	2	2
202511	德保分公司	敬德巴头综合支局	776777811	黄健	宽带	2	2
202511	田林分公司	田林城西综合支局	776303060	阮敬翔	宽带	1	1
202511	凌云分公司	浪伏综合支局	776902293	陆金笑	宽带	1	1
202511	德保分公司	那甲隆桑支局	77650049	陆涛	宽带	1	1
202511	右江区分公司	右江区城东综合支局	776136822	肖君	宽带	1	1
202511	德保分公司	足荣荣华支局	776005003	李洛全	宽带	1	1
202511	田林分公司	田林旧州综合支局	776801680	罗梁闪	FTTR	1	1
202511	右江区分公司	右江区城西综合支局	776051811	张靖	全屋WIFI	2	2
202511	田林分公司	田林定安综合支局	776780466	黄左	全屋WIFI	1	1
202511	右江区分公司	右江区龙景综合支局	776782707	杨旭	全屋WIFI	3	1
202511	凌云分公司	凌云浪伏综合支局	776903366	何南华	全屋WIFI	5	1
202511	凌云分公司	凌云浩坤综合支局	776790241	郁长龙	全屋WIFI	3	2
202511	平果分公司	平果新安综合支局	100011762	陆文昭	全屋WIFI	10	5
202511	田林分公司	田林八渡综合支局	776782062	韦有富	全屋WIFI	2	1
202511	靖西分公司	靖西新甲综合支局	776779158	雷平	全屋WIFI	9	8
202511	西林分公司	西林古障综合支局	776902236	贺刚林	摄像头	2	2
202511	靖西分公司	靖西城南综合支局	776504030	邓明克	摄像头	4	4
202511	那坡分公司	那坡龙合综合支局	776211001	农京运	摄像头	19	16
202511	田林分公司	田林城西综合支局	776315003	伍班恒	摄像头	6	4
202511	平果分公司	平果铝城综合支局	776780520	杨国立	摄像头	6	6
202511	那坡分公司	那坡城北综合支局	776779330	莫尚敏	摄像头	8	6
202511	隆林分公司	隆林克长综合支局	776603038	张仕明	摄像头	19	14
202511	右江区分公司	右江区四塘综合支局	776777378	黄高科	摄像头	2	2
202511	凌云分公司	凌云泗城综合支局	776782724	田宏干	摄像头	9	9
202511	德保分公司	德保燕峒龙光综合支局	776780134	黄大耕	摄像头	10	10
202511	隆林分公司	隆林克长综合支局	776902373	曾清	摄像头	4	2
202511	田东分公司	田东思林综合支局	776791508	黄培	摄像头	5	5
202511	那坡分公司	那坡龙合综合支局	776901212	黄宏语	摄像头	14	12
202511	西林分公司	西林古障综合支局	776257001	熊忠前	摄像头	3	2
202511	凌云分公司	凌云茶山综合支局	776903365	冯文伸	摄像头	7	7
202511	田阳分公司	田阳洞靖综合支局	776903410	黄承壮	摄像头	6	6
202511	靖西分公司	靖西政企专业支局	100015499	黄加辉	摄像头	11	5
202511	右江区分公司	右江区城西综合支局	776110694	黎政华	摄像头	6	6
202511	乐业分公司	乐业新化综合支局	776791710	罗韶轩	摄像头	7	7
202511	德保分公司	德保敬德巴头综合支局	776777811	黄健	摄像头	8	8
202511	凌云分公司	凌云浩坤综合支局	776790051	劳兴新	摄像头	6	6
202511	田东分公司	田东思林综合支局	776354004	黄军权	摄像头	1	1
202511	隆林分公司	隆林者浪综合支局	776620004	王明尚	摄像头	6	6
202511	田阳分公司	田阳坡洪综合支局	776790251	杨忠敏	摄像头	20	20
202511	平果分公司	平果政企专业支局	776185063	卢勇	摄像头	4	4
202511	靖西分公司	靖西城北综合支局	776903109	雷国仕	摄像头	2	2
202511	靖西分公司	靖西安德综合支局	776503084	农昆	摄像头	1	1
202511	德保分公司	德保那甲隆桑综合支局	776780133	陆运正	摄像头	1	1
202511	德保分公司	德保敬德巴头综合支局	776789358	罗华义	摄像头	5	5
202511	平果分公司	平果城东综合支局	776780516	黄尚官	摄像头	1	1
202511	靖西分公司	靖西湖润综合支局	776903233	马国华	摄像头	4	2
202511	西林分公司	西林城北综合支局	776903378	黄健平	摄像头	14	9
202511	平果分公司	平果太平综合支局	776167002	黄寿松	摄像头	2	1
202511	田阳分公司	田阳洞靖综合支局	776801040	黄丹皞	摄像头	5	5
202511	右江区分公司	右江区龙川综合支局	776028004	韦绍程	摄像头	1	1
202511	田东分公司	田东林逢综合支局	776354024	刘伟臣	摄像头	1	1
202511	德保分公司	德保燕峒龙光综合支局	776106577	潘寿相	摄像头	2	2
202511	德保分公司	德保东凌综合支局	776791538	李荣振	摄像头	1	0
202511	靖西分公司	靖西化峒综合支局	776153132	何正涛	摄像头	1	1
202511	右江区分公司	右江区城东综合支局	776790080	唐运千	摄像头	1	1
202511	田东分公司	田东城南综合支局	776354006	何雨	摄像头	1	1
202511	靖西分公司	靖西城北综合支局	100040668	谢小科	摄像头	2	2
202511	田林分公司	田林定安综合支局	776701107	农俊杰	摄像头	1	1
202511	靖西分公司	靖西果乐综合支局	776504021	黄涛	摄像头	1	1
202511	那坡分公司	那坡城南综合支局	776789519	农尚升	全屋WIFI	4	2
202511	平果分公司	平果新安综合支局	776789649	黄江涛	全屋WIFI	8	5
202511	田东分公司	田东林逢综合支局	776354024	刘伟臣	全屋WIFI	3	3
202511	乐业分公司	乐业城市综合支局	776789435	袁宏科	全屋WIFI	10	10
202511	右江区分公司	右江区大王岭综合支局	776779763	李荣伟	全屋WIFI	4	4
202511	田林分公司	田林潞城综合支局	776779197	黎书醒	全屋WIFI	5	4
202511	靖西分公司	靖西地州综合支局	776782672	农昌健	全屋WIFI	8	8
202511	靖西分公司	靖西果乐综合支局	776801173	王海	全屋WIFI	9	8
202511	西林分公司	西林城北综合支局	776903378	黄健平	全屋WIFI	9	7
202511	田东分公司	田东城北综合支局	776777887	韦忠将	全屋WIFI	2	2
202511	右江区分公司	右江区龙景综合支局	776177381	黄熙武	全屋WIFI	9	7
202511	田东分公司	田东义圩综合支局	776365009	刘忠世	全屋WIFI	7	7
202511	凌云分公司	凌云茶山综合支局	776701863	姚才状	全屋WIFI	4	4
202511	右江区分公司	右江区四塘综合支局	776791047	黄承湘	全屋WIFI	7	7
202511	那坡分公司	那坡德隆综合支局	776204014	黄德新	全屋WIFI	1	1
202511	右江区分公司	右江区四塘综合支局	776781448	黄承虎	全屋WIFI	3	3
202511	西林分公司	西林古障综合支局	776782504	李林	全屋WIFI	4	3
202511	德保分公司	德保敬德巴头综合支局	776781441	黄特	全屋WIFI	8	8
202511	田东分公司	田东思林综合支局	776354004	黄军权	全屋WIFI	2	2
202511	田东分公司	田东林逢综合支局	776353120	岑忠友	全屋WIFI	5	3
202511	田林分公司	田林定安综合支局	776322005	韦宝林	全屋WIFI	4	4
202511	田东分公司	田东义圩综合支局	776359006	黄立升	全屋WIFI	3	2
202511	右江区分公司	右江区城中综合支局	776047054	李文照	全屋WIFI	3	3
202511	德保分公司	德保城北综合支局	776103065	雍正福	全屋WIFI	8	6
202511	隆林分公司	隆林德峨综合支局	776903282	王吉昌	全屋WIFI	11	10
202511	田阳分公司	田阳西南综合支局	776414014	蒙亮	全屋WIFI	8	8
202511	平果分公司	平果城东综合支局	776902443	黄冠文	全屋WIFI	7	6
202511	平果分公司	平果海城综合支局	776801629	黄义朗	全屋WIFI	3	2
202511	右江区分公司	右江区城中综合支局	776791248	梁安龙	全屋WIFI	4	2
202511	右江区分公司	右江区大王岭综合支局	776776827	朱诚能	全屋WIFI	3	3
202511	平果分公司	平果铝城综合支局	776154024	冯健洋	全屋WIFI	4	4
202511	田阳分公司	田阳百育综合支局	776137911	蒙柯睿	全屋WIFI	4	4
202511	乐业分公司	乐业城市综合支局	776901056	杨正国	全屋WIFI	7	5
202511	右江区分公司	右江区龙景综合支局	776782540	黄卓学	全屋WIFI	1	1
202511	隆林分公司	隆林者保综合支局	776903318	黄荣考	全屋WIFI	1	1
202511	凌云分公司	凌云浩坤综合支局	776790051	劳兴新	全屋WIFI	3	3
202511	那坡分公司	那坡城南综合支局	776781551	陈元龙	全屋WIFI	2	1
202511	靖西分公司	靖西政企专业支局	776521003	杨经星	全屋WIFI	7	7
202511	隆林分公司	隆林猪场综合支局	776701925	杨健	全屋WIFI	2	1
202511	靖西分公司	靖西禄峒综合支局	776902111	李永炼	全屋WIFI	4	3
202511	右江区分公司	右江区四塘综合支局	776047056	马翔译	全屋WIFI	1	1
202511	右江区分公司	右江区阳圩综合支局	776025005	何显文	全屋WIFI	1	1
202511	右江区分公司	右江区阳圩综合支局	776025005	何显文	全屋WIFI	3	1
202511	乐业分公司	甘田综合支局	776789575	黎明东	宽带	2	2
202511	那坡分公司	那坡城北综合支局	776791227	马晓东	宽带	1	1
202511	右江区分公司	右江区龙景综合支局	776791244	黄伟雄	宽带	3	3
202511	德保分公司	那甲隆桑支局	776117009	农恒造	宽带	3	3
202511	田阳分公司	玉凤综合支局	776779391	黄永吉	宽带	1	1
202511	右江区分公司	右江区城东综合支局	776790283	黄波	宽带	1	1
202511	隆林分公司	德峨综合支局	776790341	王诗宇	宽带	1	1
202511	隆林分公司	隆林城南综合支局	776903001	冯豈松	FTTR	16	16
202511	靖西分公司	靖西城南综合支局	776782673	郭康宝	FTTR	4	4
202511	靖西分公司	靖西果乐综合支局	776801173	王海	FTTR	11	5
202511	平果分公司	平果城东综合支局	776154009	黄笔清	FTTR	8	8
202511	田东分公司	田东朔良综合支局	776789212	陆问	FTTR	8	7
202511	德保分公司	德保马隘都安综合支局	776801339	林世吉	FTTR	1	1
202511	田阳分公司	田阳玉凤综合支局	776404029	黄中站	FTTR	1	1
202511	田东分公司	田东林逢综合支局	776354024	刘伟臣	FTTR	5	5
202511	隆林分公司	隆林隆或综合支局	776779380	冉登文	FTTR	5	5
202511	田阳分公司	田阳西南综合支局	776405028	黄聪	FTTR	4	4
202511	靖西分公司	靖西武平综合支局	776790952	李启校	FTTR	7	6
202511	右江区分公司	右江区大王岭综合支局	776776827	朱诚能	FTTR	1	1
202511	田东分公司	田东祥周综合支局	776156810	黄佐清	FTTR	3	3
202511	田东分公司	田东思林综合支局	776354004	黄军权	FTTR	3	3
202511	田东分公司	田东作登综合支局	776791508	黄培	FTTR	4	4
202511	那坡分公司	那坡城北综合支局	776777638	李绍龙	FTTR	12	12
202511	凌云分公司	凌云浪伏综合支局	776659002	杨再冲	FTTR	5	5
202511	德保分公司	德保城南综合支局	XN0006493	谭朝珠	FTTR	7	6
202511	右江区分公司	右江区龙景综合支局	776136775	陈昌维	FTTR	14	14
202511	田东分公司	田东作登综合支局	776368008	韦寿猛	FTTR	7	7
202511	田阳分公司	田阳百育综合支局	776407015	韦日行	FTTR	13	13
202511	隆林分公司	隆林猪场综合支局	776701925	杨健	FTTR	3	2
202511	那坡分公司	那坡德隆综合支局	776204014	黄德新	FTTR	2	2
202511	平果分公司	平果新安综合支局	100011762	陆文昭	FTTR	2	2
202511	靖西分公司	化峒综合支局	776520002	陆扬	FTTR	1	0
202511	乐业分公司	乐业新化综合支局	776902138	蒙世昌	FTTR	6	6
202511	平果分公司	平果铝城综合支局	776153061	马全军	FTTR	8	8
202511	德保分公司	德保足荣荣华综合支局	776005003	李洛全	FTTR	9	9
202511	田东分公司	田东义圩综合支局	776358001	李璜	FTTR	4	4
202511	右江区分公司	右江区澄碧湖综合支局	776032002	黄兴敏	FTTR	3	3
202511	右江区分公司	右江区城西综合支局	776047026	黎建云	FTTR	7	7
202511	凌云分公司	凌云泗城综合支局	776653044	姚华球	FTTR	3	3
202511	那坡分公司	那坡平孟综合支局	776203048	叶俊平	FTTR	3	3
202511	平果分公司	平果坡造综合支局	776789258	班兆秋	FTTR	2	2
202511	隆林分公司	隆林隆或综合支局	776791807	冉浩成	FTTR	3	3
202511	右江区分公司	右江区城中综合支局	776051812	李晓明	FTTR	6	6
202511	右江区分公司	右江区城东综合支局	776117367	刘升	FTTR	4	4
202511	田阳分公司	田阳城东综合支局	776790591	黄欢	FTTR	3	3
202511	那坡分公司	那坡龙合综合支局	776211005	王启江	FTTR	3	3
202511	隆林分公司	猪场综合支局	776790342	杨光平	FTTR	1	0
202511	右江区分公司	右江区大王岭综合支局	776789424	黄春江	FTTR	3	3
202511	乐业分公司	乐业甘田综合支局	776903149	陆义铭	FTTR	2	2
202511	右江区分公司	右江区城东综合支局	776136822	肖君	FTTR	2	2
202511	右江区分公司	右江区城西综合支局	776051811	张靖	FTTR	5	5
202511	右江区分公司	右江区四塘综合支局	776777378	黄高科	FTTR	7	7
202511	西林分公司	西林城北综合支局	776903378	黄健平	FTTR	10	10
202511	德保分公司	德保敬德巴头综合支局	776777811	黄健	FTTR	3	3
202511	那坡分公司	那坡德隆综合支局	776782119	杨贵龙	FTTR	2	2
202511	田阳分公司	田阳坡洪综合支局	776779084	韦东礼	FTTR	2	2
202511	德保分公司	德保足荣荣华综合支局	776902175	杨伟业	FTTR	1	1
202511	隆林分公司	者保综合支局	776903318	黄荣考	宽带	1	1
202511	田阳分公司	田阳西南综合支局	776405028	黄聪	宽带	2	2
202511	田林分公司	六隆综合支局	776780329	李斌	宽带	2	2
202511	隆林分公司	猪场综合支局	776701925	杨健	宽带	1	1
202511	靖西分公司	靖西城北综合支局	776903109	雷国仕	宽带	2	2
202511	田林分公司	六隆综合支局	776307002	罗肖	宽带	1	1
202511	乐业分公司	花坪综合支局	776707813	钟湛烃	宽带	4	4
202511	靖西分公司	靖西政企专业支局	100015499	黄加辉	宽带	2	2
202511	平果分公司	海城综合支局	776789581	黄成志	宽带	2	2
202511	凌云分公司	浪伏综合支局	776902269	唐大桉	宽带	1	1
202511	凌云分公司	泗城综合支局	776782067	田仁政	宽带	2	2
202511	靖西分公司	新甲综合支局	776503003	韦登昊	宽带	1	1
202511	平果分公司	平果城东综合支局	776051815	陈文禧	宽带	3	3
202511	德保分公司	马隘都安综合支局	776902173	黄克界	宽带	1	0
202511	平果分公司	平果城东综合支局	776051808	陆如成	宽带	1	1
202511	平果分公司	平果城东综合支局	776154009	黄笔清	宽带	1	1
202511	德保分公司	敬德巴头综合支局	776781441	黄特	宽带	1	1
202511	田阳分公司	田东义圩综合支局	776365009	刘忠世	FTTR	1	1
202511	右江区分公司	右江区城西综合支局	776779999	岑忠彩	FTTR	1	1
202511	右江区分公司	右江区四塘综合支局	776781448	黄承虎	FTTR	1	1
202511	田东分公司	田东祥周综合支局	776365003	刘伟	全屋WIFI	1	1
202511	田阳分公司	田阳百育综合支局	776407015	韦日行	全屋WIFI	1	1
202511	田林分公司	田林潞城综合支局	776791413	梁深健	全屋WIFI	5	5
202511	田阳分公司	田阳城东综合支局	776404023	覃山	全屋WIFI	5	5
202511	田林分公司	田林八渡综合支局	776902137	农义忠	全屋WIFI	3	3
202511	田林分公司	田林六隆综合支局	776780329	李斌	全屋WIFI	8	8
202511	右江区分公司	右江区龙景综合支局	776136775	陈昌维	摄像头	5	4
202511	平果分公司	平果海城综合支局	776161006	黄炳康	摄像头	8	8
202511	平果分公司	平果城东综合支局	776902443	黄冠文	摄像头	2	2
202511	田阳分公司	田阳头塘综合支局	776107864	潘家明	摄像头	8	8
202511	田阳分公司	田阳洞靖综合支局	776406003	李勇	摄像头	4	3
202511	那坡分公司	那坡德隆综合支局	776204014	黄德新	摄像头	3	3
202511	平果分公司	平果海城综合支局	776154010	李继宁	摄像头	1	1
202511	田东分公司	田东城南综合支局	776354008	罗昌嵩	摄像头	4	4
202511	隆林分公司	隆林平班综合支局	776137039	罗桥廷	摄像头	45	36
202511	田东分公司	田东城北综合支局	776354010	宁彬	摄像头	8	6
202511	田林分公司	田林城西综合支局	776313007	杨绍远	摄像头	4	4
202511	田东分公司	田东城北综合支局	776364001	周作弟	摄像头	2	2
202511	凌云分公司	凌云茶山综合支局	776701863	姚才状	摄像头	4	4
202511	右江区分公司	右江区龙景综合支局	776110696	马均福	摄像头	4	4
202511	右江区分公司	右江区城中综合支局	776782633	黄新建	摄像头	4	4
202511	田东分公司	田东城南综合支局	XN0006617	黄城生	摄像头	5	5
202511	田阳分公司	田阳城东综合支局	776404023	覃山	摄像头	6	6
202511	德保分公司	德保足荣荣华综合支局	776005003	李洛全	摄像头	11	11
202511	右江区分公司	右江区阳圩综合支局	776117376	李京津	摄像头	1	1
202511	平果分公司	平果太平综合支局	776801479	韦家盛	摄像头	1	0
202511	平果分公司	平果榜圩综合支局	776776539	黄泽锶	摄像头	8	8
202511	德保分公司	德保那甲隆桑综合支局	77650049	陆涛	摄像头	7	6
202511	隆林分公司	隆林政企专业支局	776790368	柳隆文	摄像头	7	7
202511	田阳分公司	田阳洞靖综合支局	776409006	梁文	摄像头	2	2
202511	右江区分公司	右江区城东综合支局	776136771	黄景玉	宽带	2	2
202511	靖西分公司	靖西禄峒综合支局	776902111	李永炼	摄像头	4	2
202511	西林分公司	西林城北综合支局	100028194	农文师	摄像头	8	8
202511	平果分公司	平果坡造综合支局	776051817	石盛宇	摄像头	7	7
202511	隆林分公司	隆林者保综合支局	776903318	黄荣考	摄像头	1	1
202511	田林分公司	田林八渡综合支局	776782062	韦有富	摄像头	2	1
202511	右江区分公司	右江区城东综合支局	776047009	黄明德	宽带	1	1
202511	平果分公司	平果榜圩综合支局	XN0006762	陆舜龙	摄像头	1	1
202511	右江区分公司	右江区四塘综合支局	776781448	黄承虎	摄像头	2	0
202511	右江区分公司	右江区城西综合支局	776051811	张靖	摄像头	5	5
202511	西林分公司	西林古障综合支局	776777061	刘建林	摄像头	6	5
202511	凌云分公司	凌云泗城综合支局	776653044	姚华球	摄像头	4	4
202511	隆林分公司	隆林城北综合支局	776902083	严余	摄像头	1	1
202511	乐业分公司	乐业新化综合支局	776453066	黎源	摄像头	3	2
202511	平果分公司	平果铝城综合支局	776185061	宋显辉	摄像头	2	2
202511	田阳分公司	田阳洞靖综合支局	776801040	黄丹皞	全屋WIFI	2	2
202511	平果分公司	平果城东综合支局	776051815	陈文禧	全屋WIFI	15	13
202511	田东分公司	田东作登综合支局	7763610044	黄作山	全屋WIFI	2	2
202511	德保分公司	德保足荣荣华综合支局	776005003	李洛全	全屋WIFI	10	9
202511	德保分公司	德保马隘都安综合支局	776902173	黄克界	全屋WIFI	10	8
202511	右江区分公司	右江区龙景综合支局	776117372	韦晨冬	全屋WIFI	5	4
202511	平果分公司	平果铝城综合支局	776780520	杨国立	全屋WIFI	11	11
202511	靖西分公司	靖西城南综合支局	776504025	黄日赞	全屋WIFI	9	7
202511	田阳分公司	田阳百育综合支局	776790253	黄林龙	全屋WIFI	2	1
202511	那坡分公司	那坡城北综合支局	776777638	李绍龙	全屋WIFI	2	2
202511	田东分公司	田东城南综合支局	776791087	王磊	全屋WIFI	5	3
202511	靖西分公司	靖西化峒综合支局	776790953	何开文	全屋WIFI	14	8
202511	隆林分公司	隆林猪场综合支局	776790342	杨光平	全屋WIFI	14	10
202511	田阳分公司	田阳头塘综合支局	776503015	颜力顺	全屋WIFI	3	1
202511	西林分公司	西林城北综合支局	776801211	陆宇杭	全屋WIFI	1	1
202511	靖西分公司	靖西城北综合支局	776504016	陆刚豪	全屋WIFI	4	4
202511	右江区分公司	右江区城西综合支局	776047026	黎建云	全屋WIFI	4	4
202511	靖西分公司	靖西禄峒综合支局	776156286	杨荇	全屋WIFI	4	4
202511	田林分公司	田林潞城综合支局	776777743	李秉罡	全屋WIFI	13	12
202511	田阳分公司	田阳坡洪综合支局	776779084	韦东礼	全屋WIFI	4	3
202511	右江区分公司	右江区城西综合支局	776177383	邓显武	全屋WIFI	1	1
202511	隆林分公司	隆林隆或综合支局	776701942	吴凯	全屋WIFI	6	3
202511	靖西分公司	靖西禄峒综合支局	776790202	肖祥友	全屋WIFI	3	2
202511	乐业分公司	乐业城市综合支局	776779381	黄朝浩	全屋WIFI	4	4
202511	田东分公司	田东城北综合支局	776364001	周作弟	全屋WIFI	7	5
202511	平果分公司	平果城东综合支局	776153023	陆炜	全屋WIFI	2	2
202511	田东分公司	田东义圩综合支局	776358001	李璜	全屋WIFI	7	5
202511	右江区分公司	右江区城东综合支局	776136771	黄景玉	全屋WIFI	4	4
202511	那坡分公司	那坡龙合综合支局	776211005	王启江	全屋WIFI	7	6
202511	隆林分公司	隆林隆或综合支局	776791807	冉浩成	全屋WIFI	3	3
202511	靖西分公司	靖西城北综合支局	100040668	谢小科	全屋WIFI	6	6
202511	西林分公司	西林那佐综合支局	776790469	黄海波	全屋WIFI	10	10
202511	西林分公司	西林那佐综合支局	776781782	李卫	全屋WIFI	3	1
202511	平果分公司	平果旧城综合支局	776153049	黄忠诚	全屋WIFI	3	1
202511	田东分公司	田东祥周综合支局	776102410	李天北	全屋WIFI	1	1
202511	右江区分公司	右江区四塘综合支局	776024001	罗忠良	全屋WIFI	5	3
202511	德保分公司	德保足荣荣华综合支局	776902175	杨伟业	全屋WIFI	3	2
202511	田阳分公司	田阳百育综合支局	776407014	罗飞	全屋WIFI	2	2
202511	西林分公司	西林政企专业支局	776256007	贺刚银	全屋WIFI	1	0
202511	凌云分公司	凌云泗城综合支局	776653046	廖庆灵	全屋WIFI	2	2
202511	靖西分公司	靖西城南综合支局	776518002	黄军	宽带	1	1
202511	平果分公司	平果铝城综合支局	776780520	杨国立	宽带	1	1
202511	靖西分公司	安德综合支局	776791148	黄明芳	宽带	2	2
202511	右江区分公司	右江区城东综合支局	776136771	黄景玉	FTTR	6	5
202511	右江区分公司	右江区城西综合支局	776782705	谷修顿	宽带	4	3
202511	右江区分公司	右江区澄碧湖综合支局	776032002	黄兴敏	宽带	5	5
202511	乐业分公司	新化综合支局	776902138	蒙世昌	宽带	1	1
202511	右江区分公司	右江区四塘综合支局	776781448	黄承虎	FTTR	3	3
202511	右江区分公司	右江区城东综合支局	776790080	唐运千	FTTR	2	2
202511	田东分公司	田东城南综合支局	XN0006619	卢万祥	FTTR	9	9
202511	凌云分公司	凌云浪伏综合支局	776903366	何南华	FTTR	6	6
202511	乐业分公司	乐业城市综合支局	776901056	杨正国	FTTR	6	6
202511	平果分公司	平果铝城综合支局	776780514	陆信忠	FTTR	15	15
202511	右江区分公司	右江区龙景综合支局	776782707	杨旭	FTTR	7	7
202511	田阳分公司	田阳头塘综合支局	776503015	颜力顺	FTTR	1	1
202511	德保分公司	德保燕峒龙光综合支局	776141435	凌振鑫	FTTR	5	3
202511	隆林分公司	隆林城北综合支局	776701144	范虹	FTTR	8	8
202511	右江区分公司	右江区龙景综合支局	776901139	林雨健	FTTR	8	8
202511	田阳分公司	田阳城东综合支局	776791329	李文武	FTTR	3	3
202511	那坡分公司	那坡平孟综合支局	776789146	何国强	FTTR	8	8
202511	隆林分公司	隆林隆或综合支局	776790485	龙占权	FTTR	7	7
202511	平果分公司	平果铝城综合支局	XN0006607	凌承龙	FTTR	7	7
202511	隆林分公司	隆林平班综合支局	776603036	黄运	FTTR	2	0
202511	那坡分公司	那坡城南综合支局	776789519	农尚升	FTTR	5	5
202511	田东分公司	田东城北综合支局	776354010	宁彬	FTTR	2	2
202511	凌云分公司	凌云浪伏综合支局	776653052	王道正	FTTR	1	0
202511	右江区分公司	右江区龙景综合支局	776776365	农新鹏	FTTR	6	6
202511	右江区分公司	右江区城东综合支局	776117379	罗迢	FTTR	4	4
202511	平果分公司	平果旧城综合支局	776780515	黄新淋	FTTR	9	9
202511	德保分公司	德保城南综合支局	776108001	罗胜	FTTR	5	5
202511	平果分公司	平果太平综合支局	776801478	韦忠棒	FTTR	2	2
202511	平果分公司	平果旧城综合支局	776153049	黄忠诚	FTTR	2	2
202511	隆林分公司	隆林者保综合支局	776903160	杨银	FTTR	2	2
202511	平果分公司	平果新安综合支局	776801477	韦银	FTTR	1	1
202511	田林分公司	田林潞城综合支局	776777743	李秉罡	FTTR	5	5
202511	靖西分公司	靖西武平综合支局	776524005	黄春	FTTR	1	0
202511	那坡分公司	那坡城北综合支局	776791227	马晓东	FTTR	8	8
202511	西林分公司	西林古障综合支局	776790461	农何信	FTTR	7	7
202511	靖西分公司	靖西龙邦综合支局	776507004	韦正策	FTTR	2	2
202511	田阳分公司	田阳百育综合支局	776407014	罗飞	FTTR	2	2
202511	平果分公司	平果海城综合支局	776161006	黄炳康	FTTR	4	4
202511	田东分公司	田东林逢综合支局	776359006	黄立升	FTTR	1	0
202511	田阳分公司	田阳政企专业支局	776801355	蒙常流	FTTR	3	3
202511	平果分公司	平果装机工程班	776701962	黄亨	FTTR	1	0
202511	右江区分公司	右江区澄碧湖综合支局	776103077	何贵仕	FTTR	1	1
202511	靖西分公司	龙邦综合支局	776144677	黄盛旺	FTTR	1	0
202511	田林分公司	田林旧州综合支局	776308002	班雄雨	FTTR	3	3
202511	西林分公司	西林八达综合支局	776256001	农全荣	FTTR	1	1
202511	凌云分公司	茶山综合支局	776701863	姚才状	宽带	1	0
202511	德保分公司	燕峒龙光综合支局	776141435	凌振鑫	宽带	1	1
202511	右江区分公司	龙川综合支局	776028004	韦绍程	宽带	1	1
202511	田阳分公司	头塘综合支局	776503015	颜力顺	宽带	2	2
202511	那坡分公司	龙合综合支局	776211001	农京运	宽带	1	1
202511	隆林分公司	隆或综合支局	776790485	龙占权	宽带	2	2
202511	田阳分公司	洞靖综合支局	776406003	李勇	宽带	1	1
202511	田阳分公司	田阳城东综合支局	776790591	黄欢	宽带	1	1
202511	靖西分公司	武平综合支局	776790952	李启校	宽带	1	1
202511	田林分公司	田林城西综合支局	776801709	赵金寿	宽带	2	2
202511	田阳分公司	百育综合支局	776407015	韦日行	宽带	1	1
202511	田东分公司	田东城北综合支局	776353129	张帅	宽带	2	2
202511	德保分公司	德保城南综合支局	776104009	黄芨德	宽带	1	1
202511	凌云分公司	右江区龙景综合支局	776136775	陈昌维	FTTR	1	1
202511	右江区分公司	右江区大王岭综合支局	776902268	邝震	FTTR	1	1
202511	右江区分公司	右江区龙景综合支局	776782540	黄卓学	全屋WIFI	2	1
202511	那坡分公司	那坡平孟综合支局	776789146	何国强	全屋WIFI	1	1
202511	右江区分公司	右江区阳圩综合支局	776117376	李京津	全屋WIFI	1	1
202511	乐业分公司	乐业新化综合支局	776902138	蒙世昌	全屋WIFI	7	7
202511	平果分公司	平果太平综合支局	776903221	黄伟君	全屋WIFI	2	2
202511	德保分公司	德保城北综合支局	776107001	梁爽	全屋WIFI	6	5
202511	隆林分公司	隆林隆或综合支局	776790485	龙占权	全屋WIFI	3	2
202511	田东分公司	作登综合支局	776791508	黄培	宽带	1	1
202511	隆林分公司	猪场综合支局	776790342	杨光平	宽带	1	1
202511	乐业分公司	乐业城市综合支局	776779381	黄朝浩	宽带	2	1
202511	乐业分公司	新化综合支局	776453066	黎源	宽带	1	1
202511	靖西分公司	靖西安德综合支局	776791148	黄明芳	摄像头	9	7
202511	德保分公司	德保城北综合支局	776107001	梁爽	摄像头	12	12
202511	田东分公司	田东印茶综合支局	776358003	农国亮	摄像头	4	3
202511	右江区分公司	右江区城中综合支局	776047054	李文照	摄像头	3	3
202511	隆林分公司	隆林德峨综合支局	776903282	王吉昌	摄像头	23	23
202511	田阳分公司	田阳百育综合支局	776137911	蒙柯睿	摄像头	1	1
202511	右江区分公司	右江区城东综合支局	776047020	梁冬健	摄像头	4	4
202511	田林分公司	田林城西综合支局	776303060	阮敬翔	摄像头	7	3
202511	田林分公司	田林六隆综合支局	776324001	韦建交	摄像头	8	8
202511	田东分公司	田东祥周综合支局	776366013	梁福翔	摄像头	4	4
202511	右江区分公司	右江区龙景综合支局	776177381	黄熙武	摄像头	9	1
202511	靖西分公司	靖西禄峒综合支局	776156286	杨荇	摄像头	3	3
202511	田林分公司	田林定安综合支局	776780466	黄左	摄像头	5	2
202511	隆林分公司	隆林者保综合支局	776903160	杨银	摄像头	4	2
202511	平果分公司	平果新安综合支局	776801477	韦银	摄像头	1	1
202511	靖西分公司	靖西禄峒综合支局	776790202	肖祥友	摄像头	8	5
202511	平果分公司	平果旧城综合支局	776789729	陆兆欢	摄像头	5	5
202511	田林分公司	田林城西综合支局	776801709	赵金寿	摄像头	8	6
202511	西林分公司	西林政企专业支局	776136629	罗昌福	摄像头	7	7
202511	田东分公司	田东城北综合支局	776353129	张帅	摄像头	7	7
202511	西林分公司	西林八达综合支局	776256001	农全荣	摄像头	6	5
202511	田东分公司	田东祥周综合支局	776366010	班锦波	摄像头	3	2
202511	田阳分公司	田阳洞靖综合支局	776779400	罗朝壮	摄像头	4	4
202511	凌云分公司	凌云浩坤综合支局	776790241	郁长龙	摄像头	4	4
202511	隆林分公司	隆林隆或综合支局	776701942	吴凯	摄像头	16	16
202511	田阳分公司	田阳西南综合支局	XN0006559	陆庆华	摄像头	4	3
202511	田东分公司	田东作登综合支局	776353121	黄振军	摄像头	4	2
202511	隆林分公司	隆林隆或综合支局	776776283	黄昌谋	摄像头	2	1
202511	田阳分公司	田阳玉凤综合支局	776408004	廖瑞鹏	摄像头	2	2
202511	那坡分公司	那坡平孟综合支局	776782530	农建明	摄像头	1	0
202511	田阳分公司	田阳百育综合支局	776790253	黄林龙	摄像头	1	0
202511	田东分公司	田东祥周综合支局	776156810	黄佐清	摄像头	15	14
202511	隆林分公司	隆林城北综合支局	776701144	范虹	摄像头	6	6
202511	乐业分公司	乐业花坪综合支局	776456002	王功泽	摄像头	3	2
202511	田林分公司	田林六隆综合支局	776780495	黄成东	摄像头	3	3
202511	那坡分公司	那坡百省综合支局	776902426	姚明	摄像头	3	3
202511	凌云分公司	凌云政企专业支局	776653031	杨再升	摄像头	7	7
202511	平果分公司	平果新安综合支局	776789649	黄江涛	摄像头	9	7
202511	那坡分公司	那坡平孟综合支局	776789146	何国强	摄像头	1	1
202511	右江区分公司	右江区城中综合支局	776051812	李晓明	摄像头	3	3
202511	靖西分公司	靖西龙邦综合支局	776144677	黄盛旺	FTTR	19	20
202511	右江区分公司	右江区龙景综合支局	776782707	杨旭	摄像头	3	3
202511	田阳分公司	田阳那坡综合支局	776411016	李羿澄	摄像头	1	1
202511	西林分公司	西林八达综合支局	776903223	黄雪龙	摄像头	4	4
202511	右江区分公司	右江区城中综合支局	776047054	李文照	摄像头	1	0
202511	隆林分公司	隆林者浪综合支局	776603031	杨腾英	摄像头	1	1
202511	靖西分公司	靖西禄峒综合支局	776779729	杨文腾	摄像头	2	0
202511	右江区分公司	右江区龙景综合支局	776782706	黄雨	摄像头	3	1
202511	右江区分公司	右江区龙景综合支局	776776365	农新鹏	全屋WIFI	3	2
202511	右江区分公司	右江区龙景综合支局	776782540	黄卓学	全屋WIFI	3	3
202511	田林分公司	田林城西综合支局	776315003	伍班恒	全屋WIFI	10	7
202511	田林分公司	田林城西综合支局	776303060	阮敬翔	全屋WIFI	4	3
202511	右江区分公司	右江区龙川综合支局	776028004	韦绍程	全屋WIFI	3	2
202511	德保分公司	德保马隘都安综合支局	776781537	陆日宁	全屋WIFI	8	8
202511	田东分公司	田东城北综合支局	776354021	黄盛华	全屋WIFI	7	7
202511	田林分公司	田林八渡综合支局	776701447	梁贵荣	全屋WIFI	2	1
202511	靖西分公司	靖西城南综合支局	776504030	邓明克	全屋WIFI	4	4
202511	德保分公司	德保城南综合支局	776108001	罗胜	全屋WIFI	16	14
202511	田东分公司	田东作登综合支局	776791508	黄培	全屋WIFI	1	1
202511	靖西分公司	靖西城北综合支局	776903109	雷国仕	全屋WIFI	7	5
202511	隆林分公司	隆林城北综合支局	776902083	严余	全屋WIFI	3	3
202511	平果分公司	平果旧城综合支局	776789729	陆兆欢	全屋WIFI	3	3
202511	田林分公司	田林六隆综合支局	776780495	黄成东	全屋WIFI	7	5
202511	靖西分公司	靖西龙邦综合支局	776144677	黄盛旺	全屋WIFI	6	6
202511	平果分公司	平果海城综合支局	776789581	黄成志	全屋WIFI	11	8
202511	右江区分公司	右江区城东综合支局	776136822	肖君	全屋WIFI	3	3
202511	右江区分公司	右江区澄碧湖综合支局	776032002	黄兴敏	全屋WIFI	5	5
202511	隆林分公司	隆林政企专业支局	776790368	柳隆文	全屋WIFI	1	1
202511	凌云分公司	凌云泗城综合支局	776782724	田宏干	全屋WIFI	4	4
202511	平果分公司	平果坡造综合支局	776789258	班兆秋	全屋WIFI	4	3
202511	德保分公司	德保东凌综合支局	776789485	阮荣达	全屋WIFI	6	5
202511	隆林分公司	隆林城北综合支局	776801641	尤龙	全屋WIFI	3	2
202511	右江区分公司	右江区大王岭综合支局	776789424	黄春江	全屋WIFI	3	2
202511	平果分公司	平果城东综合支局	XN0006606	梁海	全屋WIFI	2	2
202511	德保分公司	德保那甲隆桑综合支局	77650049	陆涛	全屋WIFI	6	5
202511	右江区分公司	右江区大王岭综合支局	776902268	邝震	全屋WIFI	2	2
202511	田东分公司	田东思林综合支局	776791508	黄培	全屋WIFI	2	2
202511	平果分公司	平果城东综合支局	776051808	陆如成	全屋WIFI	3	3
202511	靖西分公司	新甲综合支局	776779158	雷平	宽带	3	3
202511	那坡分公司	那坡城南综合支局	776789519	农尚升	宽带	1	1
202511	西林分公司	西林城北综合支局	100028194	农文师	FTTR	10	10
202511	德保分公司	德保城北综合支局	776103065	雍正福	宽带	4	4
202511	田东分公司	作登综合支局	776368008	韦寿猛	宽带	1	1
202511	平果分公司	平果铝城综合支局	776153061	马全军	宽带	1	1
202511	德保分公司	德保敬德巴头综合支局	776781441	黄特	FTTR	1	1
202511	右江区分公司	右江区龙景综合支局	776110696	马均福	FTTR	5	5
202511	德保分公司	德保马隘都安综合支局	776701579	罗世金	FTTR	9	9
202511	田林分公司	田林城西综合支局	776801709	赵金寿	FTTR	12	11
202511	平果分公司	平果旧城综合支局	776051818	李继文	FTTR	2	2
202511	田东分公司	田东祥周综合支局	776366013	梁福翔	FTTR	5	5
202511	靖西分公司	靖西地州综合支局	776790955	梁健	FTTR	11	11
202511	田东分公司	田东城南综合支局	XN0006617	黄城生	FTTR	8	8
202511	平果分公司	平果铝城综合支局	776153031	农国营	FTTR	6	6
202511	右江区分公司	右江区龙景综合支局	776782706	黄雨	FTTR	6	6
202511	田东分公司	田东印茶综合支局	776358003	农国亮	FTTR	6	6
202511	田林分公司	田林六隆综合支局	776780329	李斌	FTTR	6	6
202511	右江区分公司	右江区龙景综合支局	776177381	黄熙武	FTTR	8	8
202511	德保分公司	德保城北综合支局	776107001	梁爽	FTTR	4	3
202511	隆林分公司	隆林城北综合支局	776903002	田孟法	FTTR	15	15
202511	右江区分公司	右江区大王岭综合支局	776779763	李荣伟	FTTR	2	2
202511	田东分公司	田东祥周综合支局	XN0006622	张立亮	FTTR	11	10
202511	西林分公司	西林那佐综合支局	776790469	黄海波	FTTR	16	16
202511	平果分公司	平果旧城综合支局	776789729	陆兆欢	FTTR	4	4
202511	乐业分公司	乐业城市综合支局	776790150	吴显昆	FTTR	10	10
202511	平果分公司	平果城东综合支局	776168002	黄承东	FTTR	11	11
202511	凌云分公司	凌云茶山综合支局	776655017	陈霖	FTTR	3	3
202511	那坡分公司	那坡百省综合支局	776206001	农荣锋	FTTR	3	3
202511	西林分公司	西林古障综合支局	776257001	熊忠前	FTTR	3	3
202511	靖西分公司	地州综合支局	776782672	农昌健	FTTR	1	0
202511	田阳分公司	田阳洞靖综合支局	776406003	李勇	FTTR	3	3
202511	平果分公司	平果铝城综合支局	776154024	冯健洋	FTTR	3	3
202511	田林分公司	田林定安综合支局	776780466	黄左	FTTR	3	3
202511	田阳分公司	田阳那坡综合支局	776419005	黄忠法	FTTR	8	8
202511	平果分公司	平果铝城综合支局	776185061	宋显辉	FTTR	2	2
202511	西林分公司	西林城北综合支局	776801211	陆宇杭	FTTR	9	9
202511	那坡分公司	那坡龙合综合支局	776901212	黄宏语	FTTR	2	2
202511	平果分公司	平果坡造综合支局	776165002	杨志州	FTTR	1	1
202511	平果分公司	平果太平综合支局	776903221	黄伟君	FTTR	7	7
202511	靖西分公司	靖西化峒综合支局	776520002	陆扬	FTTR	5	4
202511	隆林分公司	隆林隆或综合支局	776701942	吴凯	FTTR	3	3
202511	田东分公司	田东思林综合支局	776360003	陆最香	FTTR	2	2
202511	右江区分公司	右江区城西综合支局	776782705	谷修顿	FTTR	2	2
202511	右江区分公司	右江区城东综合支局	776790283	黄波	FTTR	3	3
202511	隆林分公司	隆林克长综合支局	776801393	张传	FTTR	1	0
202511	田东分公司	田东义圩综合支局	776359006	黄立升	FTTR	2	1
202511	田阳分公司	田阳城东综合支局	776782469	黄海东	FTTR	1	1
202511	西林分公司	西林古障综合支局	776902236	贺刚林	FTTR	2	2
202511	乐业分公司	乐业甘田综合支局	776789575	黎明东	FTTR	3	3
202511	平果分公司	太平综合支局	776903221	黄伟君	宽带	3	3
202511	田东分公司	田东城南综合支局	XN0006619	卢万祥	宽带	4	4
202511	平果分公司	榜圩综合支局	776776539	黄泽锶	宽带	3	2
202511	田林分公司	六隆综合支局	776780495	黄成东	宽带	1	1
202511	平果分公司	旧城综合支局	776789729	陆兆欢	宽带	1	1
202511	右江区分公司	右江区城东综合支局	776776673	杨增友	宽带	1	1
202511	右江区分公司	右江区城西综合支局	776112808	何旭	宽带	2	2
202511	凌云分公司	浩坤综合支局	776653052	王道正	宽带	1	1
202511	右江区分公司	右江区城中综合支局	776791248	梁安龙	宽带	2	2
202511	田东分公司	思林综合支局	776360003	陆最香	宽带	2	0
202511	平果分公司	坡造综合支局	776789258	班兆秋	宽带	1	1
202511	田东分公司	林逢综合支局	776353120	岑忠友	宽带	1	1
202511	靖西分公司	禄峒综合支局	776156286	杨荇	宽带	1	1
202511	隆林分公司	隆林城北综合支局	776801641	尤龙	宽带	1	1
202511	右江区分公司	右江区龙景综合支局	776782707	杨旭	全屋WIFI	1	1
202511	平果分公司	平果铝城综合支局	776153024	许康安	全屋WIFI	1	1
202511	平果分公司	平果新安综合支局	776051813	黄新哲	全屋WIFI	2	2
202511	德保分公司	德保城北综合支局	776801421	黄仕全	全屋WIFI	1	1
202511	右江区分公司	右江区城东综合支局	776047019	黄镇权	全屋WIFI	1	1
202511	右江区分公司	右江区龙川综合支局	776902262	梁效彰	全屋WIFI	1	0
202511	右江区分公司	右江区城西综合支局	776112808	何旭	全屋WIFI	5	5
202511	平果分公司	平果旧城综合支局	776051818	李继文	全屋WIFI	2	2
202511	右江区分公司	右江区龙景综合支局	776776365	农新鹏	宽带	4	4
202511	平果分公司	平果新安综合支局	776140445	廖春峥	摄像头	7	6
202511	田东分公司	田东作登综合支局	776789210	梁海亮	摄像头	6	5
202511	西林分公司	西林那佐综合支局	776790469	黄海波	摄像头	18	18
202511	凌云分公司	凌云浪伏综合支局	776903366	何南华	摄像头	7	7
202511	田阳分公司	田阳城东综合支局	776791329	李文武	摄像头	10	10
202511	那坡分公司	那坡城北综合支局	776777638	李绍龙	摄像头	15	11
202511	右江区分公司	右江区城东综合支局	776136822	肖君	摄像头	2	2
202511	那坡分公司	那坡德隆综合支局	776778054	李双宏	摄像头	10	2
202511	德保分公司	德保城南综合支局	776108001	罗胜	摄像头	13	13
202511	那坡分公司	那坡城北综合支局	776791227	马晓东	摄像头	10	4
202511	靖西分公司	靖西城南综合支局	100040666	周密根	摄像头	5	5
202511	隆林分公司	隆林隆或综合支局	776779380	冉登文	摄像头	11	9
202511	那坡分公司	那坡平孟综合支局	776212001	凌正伟	摄像头	5	4
202511	靖西分公司	靖西武平综合支局	776903110	何振飘	摄像头	4	3
202511	德保分公司	德保城南综合支局	XN0006493	谭朝珠	摄像头	9	8
202511	田阳分公司	田阳坡洪综合支局	776779084	韦东礼	摄像头	4	4
202511	平果分公司	平果海城综合支局	776789581	黄成志	摄像头	5	5
202511	右江区分公司	右江区城东综合支局	776117379	罗迢	摄像头	5	5
202511	凌云分公司	凌云泗城综合支局	776782067	田仁政	摄像头	6	3
202511	靖西分公司	靖西新甲综合支局	776779158	雷平	摄像头	15	15
202511	那坡分公司	那坡城南综合支局	776781551	陈元龙	摄像头	13	12
202511	凌云分公司	凌云浪伏综合支局	776659003	周歧稳	摄像头	3	3
202511	田阳分公司	田阳头塘综合支局	776791213	黄罗峰	摄像头	11	12
202511	田阳分公司	田阳西南综合支局	776414014	蒙亮	摄像头	7	7
202511	田林分公司	田林六隆综合支局	776307002	罗肖	摄像头	3	3
202511	德保分公司	德保城北综合支局	776801421	黄仕全	摄像头	13	12
202511	右江区分公司	右江区大王岭综合支局	776779763	李荣伟	摄像头	2	2
202511	右江区分公司	右江区城西综合支局	776779999	岑忠彩	摄像头	2	0
202511	靖西分公司	靖西化峒综合支局	776520002	陆扬	摄像头	5	4
202511	右江区分公司	右江区城中综合支局	776780541	吴东平	摄像头	3	2
202511	凌云分公司	凌云政企专业支局	776791111	肖仕杰	摄像头	1	1
202511	乐业分公司	乐业城市综合支局	776779381	黄朝浩	摄像头	16	9
202511	德保分公司	德保那甲隆桑综合支局	776117009	农恒造	摄像头	5	5
202511	右江区分公司	右江区大王岭综合支局	776789424	黄春江	摄像头	3	3
202511	乐业分公司	乐业新化综合支局	776902138	蒙世昌	摄像头	2	2
202511	田林分公司	田林旧州综合支局	776308002	班雄雨	摄像头	3	3
202511	靖西分公司	靖西武平综合支局	776790952	李启校	摄像头	6	4
202511	乐业分公司	乐业花坪综合支局	776707813	钟湛烃	摄像头	9	9
202511	西林分公司	西林那佐综合支局	776781782	李卫	摄像头	15	9
202511	隆林分公司	隆林城南综合支局	776903001	冯豈松	摄像头	11	7
202511	右江区分公司	右江区大王岭综合支局	776776827	朱诚能	摄像头	2	2
202511	田东分公司	田东城南综合支局	776791087	王磊	摄像头	1	1
202511	凌云分公司	凌云泗城综合支局	776653046	廖庆灵	摄像头	5	4
202511	右江区分公司	右江区四塘综合支局	776791047	黄承湘	摄像头	7	7
202511	田阳分公司	田阳头塘综合支局	776415002	林凯旋	摄像头	11	5
202511	田阳分公司	头塘综合支局	776107864	潘家明	宽带	1	0
202511	右江区分公司	右江区城东综合支局	776136771	黄景玉	摄像头	1	1
202511	右江区分公司	右江区城东综合支局	776047025	莫嘉文	摄像头	1	0
202511	平果分公司	平果铝城综合支局	776153024	许康安	摄像头	1	1
202511	右江区分公司	右江区城东综合支局	776117367	刘升	摄像头	1	1
202511	靖西分公司	靖西城南综合支局	776782673	郭康宝	摄像头	5	5
202511	平果分公司	平果旧城综合支局	776153049	黄忠诚	摄像头	3	1
202511	隆林分公司	隆林城南综合支局	776791554	杨明顺	摄像头	2	0
202511	平果分公司	平果政企专业支局	776154006	韦彦武	摄像头	6	6
202511	右江区分公司	右江区澄碧湖综合支局	776144459	梁富林	摄像头	1	1
202511	德保分公司	德保足荣荣华综合支局	776902213	黄辉	摄像头	1	1
202511	凌云分公司	凌云浪伏综合支局	776659002	杨再冲	摄像头	1	1
202511	凌云分公司	凌云浩坤综合支局	776653052	王道正	摄像头	1	1
202511	靖西分公司	靖西城南综合支局	XN0006319	俞小神	全屋WIFI	8	8
202511	那坡分公司	那坡城北综合支局	776779330	莫尚敏	全屋WIFI	3	2
202511	田林分公司	田林城西综合支局	776313007	杨绍远	全屋WIFI	9	6
202511	田阳分公司	田阳西南综合支局	XN0006559	陆庆华	全屋WIFI	9	8
202511	隆林分公司	隆林者保综合支局	776903160	杨银	全屋WIFI	1	1
202511	田阳分公司	田阳城东综合支局	776404011	梁庆阳	全屋WIFI	7	7
202511	平果分公司	平果城东综合支局	776780516	黄尚官	全屋WIFI	8	8
202511	凌云分公司	凌云浪伏综合支局	776902269	唐大桉	全屋WIFI	5	5
202511	隆林分公司	隆林城北综合支局	776903002	田孟法	全屋WIFI	18	15
202511	西林分公司	西林城北综合支局	100028194	农文师	全屋WIFI	10	7
202511	平果分公司	平果太平综合支局	776801479	韦家盛	全屋WIFI	7	5
202511	右江区分公司	右江区城东综合支局	776047025	莫嘉文	全屋WIFI	10	10
202511	田东分公司	田东朔良综合支局	776781183	廖忠财	全屋WIFI	7	5
202511	那坡分公司	那坡城南综合支局	100013040	黄仕中	全屋WIFI	7	5
202511	右江区分公司	右江区城西综合支局	776047026	黎建云	全屋WIFI	1	1
202511	靖西分公司	靖西城南综合支局	100040666	周密根	全屋WIFI	7	6
202511	凌云分公司	凌云泗城综合支局	XN0006717	戴学繁	全屋WIFI	5	5
202511	田阳分公司	田阳洞靖综合支局	776903410	黄承壮	全屋WIFI	1	1
202511	隆林分公司	隆林者浪综合支局	776620004	王明尚	全屋WIFI	1	1
202511	田东分公司	田东林逢综合支局	XN0006240	黄忠臣	全屋WIFI	5	4
202511	乐业分公司	乐业甘田综合支局	776789575	黎明东	全屋WIFI	7	5
202511	德保分公司	德保那甲隆桑综合支局	776780133	陆运正	全屋WIFI	3	3
202511	西林分公司	西林那佐综合支局	776789115	岑家虎	全屋WIFI	1	1
202511	右江区分公司	右江区澄碧湖综合支局	776103077	何贵仕	全屋WIFI	1	1
202511	隆林分公司	隆林城南综合支局	776903112	黄毅	全屋WIFI	4	2
202511	田林分公司	田林浪平综合支局	776322006	吴定碧	全屋WIFI	2	1
202511	田东分公司	田东城南综合支局	XN0006619	卢万祥	全屋WIFI	6	6
202511	田阳分公司	洞靖综合支局	776779400	罗朝壮	宽带	1	0
202511	右江区分公司	右江区城西综合支局	776779999	岑忠彩	FTTR	8	8
202511	平果分公司	平果城东综合支局	776051808	陆如成	FTTR	10	10
202511	平果分公司	平果城东综合支局	776791071	黄立程	宽带	1	1
202511	田林分公司	田林城西综合支局	776903477	明胜聪	宽带	2	2
202511	那坡分公司	那坡城北综合支局	776779330	莫尚敏	FTTR	10	10
202511	凌云分公司	凌云泗城综合支局	776782067	田仁政	FTTR	6	6
202511	田东分公司	田东城北综合支局	776364001	周作弟	FTTR	13	13
202511	凌云分公司	凌云浪伏综合支局	776659003	周歧稳	FTTR	6	6
202511	右江区分公司	右江区龙景综合支局	776791244	黄伟雄	FTTR	8	7
202511	田阳分公司	田阳头塘综合支局	776415002	林凯旋	FTTR	5	5
202511	平果分公司	平果城东综合支局	776701880	农国政	FTTR	9	9
202511	乐业分公司	乐业新化综合支局	776791710	罗韶轩	FTTR	3	3
202511	乐业分公司	乐业城市综合支局	776779381	黄朝浩	FTTR	4	4
202511	西林分公司	西林那劳综合支局	776902355	刘福成	FTTR	7	7
202511	右江区分公司	右江区城东综合支局	776776673	杨增友	FTTR	4	4
202511	德保分公司	马隘综合支局	776701579	罗世金	FTTR	1	0
202511	凌云分公司	凌云浩坤综合支局	776781570	劳建峰	FTTR	8	8
202511	田阳分公司	田阳西南综合支局	776790947	李俊麟	FTTR	3	3
202511	靖西分公司	靖西新甲综合支局	776903232	廖坤	FTTR	6	6
202511	德保分公司	德保敬德巴头综合支局	776789358	罗华义	FTTR	1	1
202511	右江区分公司	右江区四塘综合支局	776791047	黄承湘	FTTR	4	4
202511	平果分公司	平果铝城综合支局	776153063	陆信新	FTTR	4	4
202511	右江区分公司	右江区龙景综合支局	776782540	黄卓学	FTTR	3	3
202511	德保分公司	德保城南综合支局	XN0006494	王由好	FTTR	2	2
202511	平果分公司	平果新安综合支局	776789649	黄江涛	FTTR	6	6
202511	德保分公司	德保那甲隆桑综合支局	776780133	陆运正	FTTR	2	2
202511	田东分公司	田东林逢综合支局	776790676	甘广标	FTTR	2	2
202511	平果分公司	平果新安综合支局	776120607	李勇	FTTR	2	2
202511	靖西分公司	靖西禄峒综合支局	776782671	何国猛	FTTR	2	2
202511	田林分公司	田林浪平综合支局	776322006	吴定碧	FTTR	1	1
202511	德保分公司	德保城北综合支局	776103065	雍正福	FTTR	2	2
202511	靖西分公司	靖西安德综合支局	776791148	黄明芳	FTTR	6	6
202511	田东分公司	田东祥周综合支局	776102410	李天北	FTTR	5	5
202511	靖西分公司	靖西城南综合支局	776504030	邓明克	FTTR	5	5
202511	田阳分公司	田阳西南综合支局	776414014	蒙亮	FTTR	4	4
202511	田林分公司	田林潞城综合支局	776779197	黎书醒	FTTR	3	3
202511	西林分公司	西林那佐综合支局	776789115	岑家虎	FTTR	8	8
202511	西林分公司	西林古障综合支局	776777061	刘建林	FTTR	2	2
202511	靖西分公司	靖西武平综合支局	776903110	何振飘	FTTR	2	2
202511	田阳分公司	田阳洞靖综合支局	776903410	黄承壮	FTTR	1	1
202511	平果分公司	平果海城综合支局	776801629	黄义朗	FTTR	1	1
202511	田阳分公司	田阳洞靖综合支局	776779400	罗朝壮	FTTR	1	1
202511	西林分公司	西林那佐综合支局	776781782	李卫	FTTR	6	5
202511	田东分公司	印茶综合支局	776358003	农国亮	FTTR	1	0
202511	那坡分公司	那坡平孟综合支局	776212001	凌正伟	FTTR	1	1
202511	平果分公司	平果政企专业支局	776154006	韦彦武	FTTR	1	1
202511	凌云分公司	泗城综合支局	776782724	田宏干	宽带	1	1
202511	田阳分公司	坡洪综合支局	776779084	韦东礼	宽带	1	1
202511	田林分公司	潞城综合支局	776777743	李秉罡	宽带	5	5
202511	右江区分公司	右江区龙景综合支局	776136775	陈昌维	宽带	2	2
202511	西林分公司	西林城北综合支局	100028194	农文师	宽带	1	1
202511	田东分公司	田东城南综合支局	XN0006617	黄城生	宽带	2	2
202511	凌云分公司	泗城综合支局	XN0006717	戴学繁	宽带	2	2
202511	靖西分公司	靖西城南综合支局	100040666	周密根	宽带	1	1
202511	隆林分公司	隆林城北综合支局	776903002	田孟法	宽带	1	1
202511	右江区分公司	右江区城中综合支局	776782633	黄新建	宽带	1	1
202511	凌云分公司	浩坤综合支局	776790051	劳兴新	宽带	3	3
202511	田阳分公司	田阳西南综合支局	XN0006559	陆庆华	宽带	1	1
202511	那坡分公司	那坡城南综合支局	100013040	黄仕中	宽带	1	1
202511	右江区分公司	右江区城西综合支局	776051811	张靖	宽带	1	1
202511	田林分公司	定安综合支局	776701107	农俊杰	宽带	1	1
202511	靖西分公司	武平综合支局	776518002	黄军	宽带	2	2
202511	德保分公司	德保足荣荣华综合支局	776902213	黄辉	FTTR	1	1
202511	靖西分公司	果乐综合支局	776801173	王海	FTTR	1	1
202511	田阳分公司	田阳城东综合支局	776782469	黄海东	全屋WIFI	2	2
\.


--
-- Data for Name: gen_table; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.gen_table (table_id, table_name, table_comment, sub_table_name, sub_table_fk_name, class_name, tpl_category, tpl_web_type, package_name, module_name, business_name, function_name, function_author, gen_type, gen_path, options, create_by, create_time, update_by, update_time, remark) FROM stdin;
\.


--
-- Data for Name: gen_table_column; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.gen_table_column (column_id, table_id, column_name, column_comment, column_type, java_type, java_field, is_pk, is_increment, is_required, is_insert, is_edit, is_list, is_query, query_type, html_type, dict_type, sort, create_by, create_time, update_by, update_time) FROM stdin;
\.


--
-- Data for Name: order_info; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.order_info (month_no, data_type, phone_num, completed_at, user_id, sale_center_name, org_name, order_id, staff_code, staff_name, binding_at, online_at, aaa_flag, serial_code, device_name, activate_flag, unactivate_reason) FROM stdin;
202512	FTTR_H	07760519517	2023-09-18 15:51:16	663736848856	右江区分公司	右江区装机工程班	WO2023091814822	776779999	岑忠彩	2025-12-01 16:34:20	2025-12-01 16:33:59	NULL	D8B2AA-3F745D8B2AA7276C5	FTTR设备-家庭FTTR设备-主设备	未激活	其他
202512	FTTR_H	07760665543	2025-12-01 18:41:34	664255113742	田东分公司	田东城南综合支局	WO2025120124687	XN0006619	卢万祥	NULL	NULL	0	D8B2AA-41745D8B2AA72AB0C	FTTR设备-家庭FTTR设备-主设备	未激活	其他
202512	FTTR_H	07760519517	2023-09-18 15:51:16	663736848856	右江区分公司	右江区装机工程班	WO2023091814822	776779999	岑忠彩	2025-12-01 16:34:20	2025-12-01 16:33:59	NULL	D8B2AA-3F745D8B2AA7276C5	FTTR设备-家庭FTTR设备-主设备	未激活	其他
202512	普通宽带	07761960970	2025-12-01 19:10:21	664256124060	靖西分公司	靖西新甲综合支局	WO2025120125072	776503003	韦登昊	NULL	NULL	NULL	DCC64B-47863DCC64B8B7131	GPON上行天翼网关双频版(4口)	未激活	光猫无上线记录
202512	千兆宽带	07760844123	2025-12-01 08:44:15	664245277228	隆林分公司	隆林平班综合支局	WO2025113015045	776137039	罗桥廷	NULL	NULL	NULL	70D51E-3C84570D51E0BDAD4	天翼网关4.0-10G-PON-1×2.5GE-3GE-1POTS-双频WiFi6	未激活	光猫无上线记录
202512	千兆宽带	07760671023	2025-12-01 13:52:39	664256355287	田东分公司	田东作登综合支局	WO2025113006566	7763610044	黄作山	NULL	NULL	NULL	90B942-3184590B942AAE009	天翼网关4.0-10G-PON-1×2.5GE-3GE-1POTS-无WiFi	未激活	光猫无上线记录
202512	全屋WIFI	97762221878955	2025-12-01 09:33:54.0	664256266002	平果分公司	平果铝城综合支局	WO2025113003237	XN0006607	凌承龙	20251201	20251201	0	180122801373329	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202512	全屋WIFI	97762221882737	2025-12-01 19:14:33.0	664256126205	靖西分公司	靖西新甲综合支局	WO2025112941648	776503003	韦登昊	NULL	NULL	NULL	182386871075230	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202512	全屋WIFI	97762221878083	2025-12-01 19:06:53.0	664256433812	靖西分公司	靖西城北综合支局	WO2025113009245	776903109	雷国仕	20251201	20251201	NULL	182386871074529	NULL	未激活	其他
202512	全屋WIFI	97762221882753	2025-12-01 15:54:59.0	664256417890	田东分公司	田东作登综合支局	WO2025113009011	7763610044	黄作山	20250923	20251201	NULL	180122801321074	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202512	全屋WIFI	97762221884681	2025-12-01 17:23:59.0	664255827959	右江区分公司	右江区城中综合支局	WO2025112929511	776780541	吴东平	20250814	20251201	NULL	180122800601717	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202512	全屋WIFI	97762221878964	2025-12-01 13:52:20.0	664256366103	田东分公司	田东作登综合支局	WO2025113006743	7763610044	黄作山	20251201	20251201	NULL	182386871104719	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202512	全屋WIFI	97762221884667	2025-12-01 13:33:51.0	664255695609	靖西分公司	靖西化峒综合支局	WO2025112924849	776520002	陆扬	20251201	20251201	NULL	180122801372446	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202512	全屋WIFI	97762221880839	2025-12-01 12:56:43.0	664255700518	田东分公司	田东林逢综合支局	WO2025112924720	776359006	黄立升	20251130	20251201	NULL	182386871073486	NULL	未激活	其他
202512	全屋WIFI	97762221882441	2025-12-01 18:26:09.0	664249651706	乐业分公司	乐业花坪综合支局	WO2025112117525	776456002	王功泽	NULL	NULL	NULL	180122801373622	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202512	全屋WIFI	97762221882785	2025-12-01 19:42:41.0	664257022648	西林分公司	西林古马综合支局	WO2025120113678	776790461	农何信	20251201	20251201	NULL	180122801438075	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	千兆宽带	07761884077	2025-11-02 01:14:34	664231787660	德保分公司	德保马隘都安综合支局	WO2025110114202	776902173	黄克界	NULL	NULL	NULL	FHLWLK601610	天翼网关4.0-10G-PON-1×2.5GE-3GE-1POTS-双频WiFi6	未激活	光猫无上线记录
202511	普通宽带	07760162574	2025-11-13 10:18:24	664242372572	德保分公司	德保燕峒龙光综合支局	WO2025111302430	776005015	黄绍都	NULL	NULL	NULL	84F5EB-4384584F5EBAFB32F	天翼网关4.0-1G-PON-4GE-1POTS-无WiFi	未激活	光猫无上线记录
202511	千兆宽带	07760663768	2025-11-17 18:03:47	664222787113	那坡分公司	那坡城北综合支局	WO2025111720898	776791227	马晓东	NULL	NULL	NULL	ZNXT99F9B840	X-GPON上行天翼网关	未激活	光猫无上线记录
202511	千兆宽带	07760646036	2025-11-29 10:19:37	664254805043	凌云分公司	凌云泗城综合支局	WO2025112918994	776653044	姚华球	NULL	NULL	NULL	C467D1-36862C467D1734FF9	X-GPON上行天翼网关	未激活	光猫无上线记录
202511	普通宽带	07761664666	2025-11-28 17:24:32	664254573214	平果分公司	平果新安综合支局	WO2025112740735	776140445	廖春峥	NULL	NULL	NULL	1012B4-358451012B441D238	EPON上行天翼网关单频版(4口)	未激活	光猫无上线记录
202511	普通宽带	07761887832	2025-11-28 17:32:36	664253774346	靖西分公司	靖西城南综合支局	WO2025112733096	776518002	黄军	NULL	NULL	NULL	602E20-3C845602E20A25CF5	GPON上行天翼网关双频版(4口)	未激活	光猫无上线记录
202511	千兆宽带	07760648289	2025-11-29 18:20:00	664254307488	西林分公司	西林城北综合支局	WO2025112726324	100028194	农文师	NULL	NULL	NULL	DC3642-4A845DC36428CD2C9	天翼网关4.0-10G-PON-1×2.5GE-3GE-1POTS-双频WiFi6	未激活	光猫无上线记录
202511	普通宽带	07760660281	2025-11-24 15:04:27	664251629876	隆林分公司	隆林者浪综合支局	WO2025112415754	776801815	王章文	NULL	NULL	NULL	C09FE1-31845C09FE1433D00	GPON上行天翼网关双频版(4口)	未激活	光猫无上线记录
202511	普通宽带	07760446007	2025-11-19 18:39:47	664238220983	那坡分公司	那坡城北综合支局	WO2025111922465	776791227	马晓东	NULL	NULL	NULL	38637F-3F84538637F79F0BC	天翼网关4.0-1G-PON-4GE-1POTS-无WiFi	未激活	光猫无上线记录
202511	千兆宽带	07760666838	2025-11-26 15:39:33	664214031538	田林分公司	田林浪平综合支局	WO2025112616815	776701915	黄冰	NULL	NULL	NULL	90B942-3D84590B942AADCF1	天翼网关4.0-10G-PON-1×2.5GE-3GE-1POTS-无WiFi	未激活	光猫无上线记录
202511	普通宽带	07761882043	2025-11-11 14:45:01	664241445833	田东分公司	田东作登综合支局	WO2025111112685	776789210	梁海亮	NULL	NULL	NULL	7886B6-3B8457886B639338E	GPON上行天翼网关单频版(4口)	未激活	光猫无上线记录
202511	千兆宽带	07760639169	2025-11-26 16:05:20	664248900532	乐业分公司	乐业甘田综合支局	WO2025112615774	776903149	陆义铭	NULL	NULL	NULL	90B942-3184590B942AA867E	天翼网关4.0-10G-PON-1×2.5GE-3GE-1POTS-无WiFi	未激活	光猫无上线记录
202511	普通宽带	07760530730	2025-11-28 18:47:48	664250822969	平果分公司	平果太平综合支局	WO2025112855567	776903221	黄伟君	NULL	NULL	NULL	B4FBF9-3E843B4FBF93966BD	GPON上行天翼网关单频版(4口)	未激活	光猫无上线记录
202511	普通宽带	07760534162	2025-11-30 20:42:55	664249095223	德保分公司	德保城北综合支局	WO2025113006768	776103065	雍正福	NULL	NULL	NULL	8C6D77-4E8438C6D77B40835	GPON上行天翼网关单频版(4口)	未激活	光猫无上线记录
202511	普通宽带	07760163904	2025-11-06 13:58:37	664236397376	田东分公司	田东作登综合支局	WO2025110612781	776791508	黄培	NULL	NULL	NULL	84F5EB-4084584F5EBAFAE31	天翼网关4.0-1G-PON-4GE-1POTS-无WiFi	未激活	光猫无上线记录
202511	千兆宽带	07760610876	2025-11-28 17:04:20	664254161049	隆林分公司	隆林城南综合支局	WO2025112852094	776903112	黄毅	NULL	NULL	NULL	70D51E-4284570D51E0C2778	天翼网关4.0-10G-PON-1×2.5GE-3GE-1POTS-双频WiFi6	未激活	光猫无上线记录
202511	普通宽带	07760556346	2025-11-10 10:15:48	664236955340	乐业分公司	乐业花坪综合支局	WO2025110806091	776456002	王功泽	NULL	NULL	NULL	38637F-3584538637F79F038	天翼网关4.0-1G-PON-4GE-1POTS-无WiFi	未激活	光猫无上线记录
202511	千兆宽带	07760659941	2025-11-28 18:31:30	664253724339	德保分公司	德保城南综合支局	WO2025112858658	XN0006494	王由好	NULL	NULL	NULL	90B942-4C84590B942AACC23	天翼网关4.0-10G-PON-1×2.5GE-3GE-1POTS-无WiFi	未激活	光猫无上线记录
202511	普通宽带	07761992195	2025-11-12 16:46:11	664241976235	平果分公司	平果海城综合支局	WO2025111105915	776801629	黄义朗	NULL	NULL	NULL	ZDGPBS25060901470	GPON上行天翼网关单频版(4口)	未激活	光猫无上线记录
202511	千兆宽带	07760625447	2025-11-30 11:51:15	664254929242	乐业分公司	乐业城市综合支局	WO2025112856448	776779381	黄朝浩	NULL	NULL	NULL	90B942-3D84590B942AACF0E	天翼网关4.0-10G-PON-1×2.5GE-3GE-1POTS-无WiFi	未激活	光猫无上线记录
202511	普通宽带	07760260409	2025-11-28 11:12:39	664229775031	那坡分公司	那坡百省综合支局	WO2025112836544	776782411	韦永亮	NULL	NULL	NULL	84F5EB-3B84584F5EBAFBEC9	天翼网关4.0-1G-PON-4GE-1POTS-无WiFi	未激活	光猫无上线记录
202511	千兆宽带	07760657303	2025-11-30 16:36:54	664254512421	田林分公司	田林潞城综合支局	WO2025112733638	776777743	李秉罡	NULL	NULL	NULL	1012B4-3A8451012B4F36062	X-GPON上行天翼网关	未激活	光猫无上线记录
202511	千兆宽带	07760669017	2025-11-21 17:10:37	664248914727	德保分公司	德保燕峒龙光综合支局	WO2025112122843	776141435	凌振鑫	NULL	NULL	NULL	FHLWLK602022	天翼网关4.0-10G-PON-1×2.5GE-3GE-1POTS-双频WiFi6	未激活	光猫无上线记录
202511	千兆宽带	07761964357	2025-11-05 20:32:51	664235057296	那坡分公司	那坡龙合综合支局	WO2025110522060	776901212	黄宏语	NULL	NULL	NULL	ACFBC2-4D845ACFBC21AC44A	天翼网关4.0-10G-PON-1×2.5GE-3GE-1POTS-无WiFi	未激活	光猫无上线记录
202511	普通宽带	07760159310	2025-11-28 17:23:38	664254595406	平果分公司	平果新安综合支局	WO2025112740746	776140445	廖春峥	NULL	NULL	NULL	1012B4-3F8451012B440D640	EPON上行天翼网关单频版(4口)	未激活	光猫无上线记录
202511	千兆宽带	07761883495	2025-11-24 14:19:02	664244740189	田林分公司	田林潞城综合支局	WO2025112414129	776779197	黎书醒	NULL	NULL	NULL	C0CC42-4A845C0CC4295CD58	X-GPON上行天翼网关	未激活	光猫无上线记录
202511	普通宽带	07761885456	2025-11-22 18:46:11	664229696095	田林分公司	田林定安综合支局	WO2025102812059	776322005	韦宝林	NULL	NULL	NULL	90B942-4D84590B942AAD3C4	天翼网关4.0-10G-PON-1×2.5GE-3GE-1POTS-无WiFi	未激活	光猫无上线记录
202511	千兆宽带	07760668124	2025-11-28 22:33:27	664253828551	德保分公司	德保城北综合支局	WO2025112864720	776107001	梁爽	NULL	NULL	NULL	FHLWLK600153	天翼网关4.0-10G-PON-1×2.5GE-3GE-1POTS-双频WiFi6	未激活	光猫无上线记录
202511	普通宽带	07760668792	2025-11-16 11:38:18	664244679466	乐业分公司	乐业城市综合支局	WO2025111600742	776779381	黄朝浩	NULL	NULL	NULL	38637F-4B84538637F79EFCC	天翼网关4.0-1G-PON-4GE-1POTS-无WiFi	未激活	光猫无上线记录
202511	普通宽带	07761958918	2025-11-30 18:42:00	664252875821	平果分公司	平果海城综合支局	WO2025112736248	776801629	黄义朗	NULL	NULL	NULL	38E2DD-3184538E2DD0708C8	GPON上行天翼网关单频版(4口)	未激活	光猫无上线记录
202511	普通宽带	07760160790	2025-11-06 16:17:39	664235409124	田阳分公司	田阳头塘综合支局	WO2025110523871	776790949	赵名杨	NULL	NULL	NULL	38637F-3D84538637F79F4DC	天翼网关4.0-1G-PON-4GE-1POTS-无WiFi	未激活	光猫无上线记录
202511	千兆宽带	07760549931	2025-11-28 10:35:21	664253125025	田阳分公司	田阳洞靖综合支局	WO2025112729381	776903410	黄承壮	NULL	NULL	NULL	ZDGPBS25060902505	X-GPON上行天翼网关	未激活	光猫无上线记录
202511	千兆宽带	07760664261	2025-11-28 17:39:07	664253835237	田阳分公司	田阳西南综合支局	WO2025112852478	776790947	李俊麟	NULL	NULL	NULL	ZDGPBS25060902156	X-GPON上行天翼网关	未激活	光猫无上线记录
202511	普通宽带	07760665958	2025-11-25 20:40:34	664220242759	田林分公司	田林旧州综合支局	WO2025110603452	776308002	班雄雨	NULL	NULL	NULL	TXKUEJ800957	天翼网关4.0-10G-PON-1×2.5GE-3GE-1POTS-无WiFi	未激活	光猫无上线记录
202511	普通宽带	07760663129	2025-11-28 13:21:48	664253952170	西林分公司	西林那佐综合支局	WO2025112728706	776781782	李卫	NULL	NULL	NULL	1CD5E2-438441CD5E2794BA6	GPON上行天翼网关单频版(4口)	未激活	光猫无上线记录
202511	普通宽带	07760652108	2025-11-25 16:30:45	664250592293	德保分公司	德保马隘都安综合支局	WO2025112517556	776701579	罗世金	NULL	NULL	NULL	90FD73-4084590FD73564E40	GPON上行天翼网关单频版(4口)	未激活	光猫无上线记录
202511	普通宽带	07760159757	2025-11-13 11:25:55	664242331017	德保分公司	德保燕峒龙光综合支局	WO2025111305645	776005015	黄绍都	NULL	NULL	NULL	ZDGPBS25060901903	GPON上行天翼网关双频版(4口)	未激活	光猫无上线记录
202511	普通宽带	07760660682	2025-11-28 16:13:54	664254614323	平果分公司	平果新安综合支局	WO2025112851251	776140445	廖春峥	NULL	NULL	NULL	1012B4-3F8451012B4404E70	EPON上行天翼网关单频版(4口)	未激活	光猫无上线记录
202511	千兆宽带	07760551878	2025-11-21 16:37:04	664248835399	田阳分公司	田阳西南综合支局	WO2025112118947	776414014	蒙亮	NULL	NULL	NULL	1012B4-408451012B4F3090A	10G-EPON上行天翼网关	未激活	光猫无上线记录
202511	普通宽带	07760665438	2025-11-07 09:23:40	664237816301	西林分公司	西林那佐综合支局	WO2025110604753	776781782	李卫	NULL	NULL	NULL	D0F928-48845D0F9285FEACD	天翼网关4.0-1G-PON-4GE-1POTS-无WiFi	未激活	光猫无上线记录
202511	千兆宽带	07760666728	2025-11-27 19:33:03	664252682013	隆林分公司	隆林克长综合支局	WO2025112730278	776902373	曾清	NULL	NULL	NULL	70D51E-3D84570D51E0C42C0	天翼网关4.0-10G-PON-1×2.5GE-3GE-1POTS-双频WiFi6	未激活	光猫无上线记录
202511	千兆宽带	07760170413	2025-11-23 14:32:16	664250906792	西林分公司	西林那佐综合支局	WO2025112309956	776790469	黄海波	NULL	NULL	NULL	SKYWB03A2DCF	天翼网关4.0-10G-PON-1×2.5GE-3GE-1POTS-无WiFi	未激活	光猫无上线记录
202511	普通宽带	07760670138	2025-11-08 17:56:01	664239433011	西林分公司	西林城北综合支局	WO2025110815113	100028194	农文师	NULL	NULL	NULL	M022524ALU00070462	天翼网关4.0-1G-PON-4GE-1POTS-无WiFi	未激活	光猫无上线记录
202511	千兆宽带	07760664076	2025-11-07 13:49:03	664238478621	平果分公司	平果新安综合支局	WO2025110712427	776789649	黄江涛	NULL	NULL	NULL	90B942-3784590B942AA91F4	天翼网关4.0-10G-PON-1×2.5GE-3GE-1POTS-无WiFi	未激活	光猫无上线记录
202511	千兆宽带	07760598567	2025-11-26 16:13:41	664248369988	乐业分公司	乐业甘田综合支局	WO2025112615820	776903149	陆义铭	NULL	NULL	NULL	90B942-4084590B942AA85EE	天翼网关4.0-10G-PON-1×2.5GE-3GE-1POTS-无WiFi	未激活	光猫无上线记录
202511	千兆宽带	07760648661	2025-11-10 20:45:12	664240162543	乐业分公司	乐业城市综合支局	WO2025110815560	776779381	黄朝浩	NULL	NULL	NULL	348511-4384534851133443C	X-GPON上行天翼网关	未激活	光猫无上线记录
202511	普通宽带	07760658916	2025-11-28 19:15:41	664254566384	平果分公司	平果新安综合支局	WO2025112851394	776140445	廖春峥	NULL	NULL	NULL	FC94CE-41845FC94CE2FEB50	GPON上行天翼网关单频版(4口)	未激活	光猫无上线记录
202511	普通宽带	07760167382	2025-11-14 13:58:39	664241810969	右江区分公司	右江区龙景综合支局	WO2025111408914	776782706	黄雨	NULL	NULL	NULL	101081-46845101081318D80	GPON上行天翼网关双频版(4口)	未激活	光猫无上线记录
202510	全屋WIFI	97762221867066	2025-10-18 13:41:30.0	664221202598	田东分公司	田东义圩综合支局	WO2025101708255	776365009	刘忠世	20251018	20251201	NULL	182386871048577	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221876461	2025-10-30 20:09:42.0	664230594966	平果分公司	平果新安综合支局	WO2025102922242	776140445	廖春峥	20251102	20251201	NULL	180122801438158	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221868488	2025-10-05 15:13:42.0	664211319427	乐业分公司	乐业花坪综合支局	WO2025100415523	776707813	钟湛烃	20251004	20251201	0	182386871047176	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221864897	2025-10-13 17:33:11.0	664216269744	田东分公司	田东思林综合支局	WO2025101111430	776354004	黄军权	20251009	20251201	NULL	180122801184795	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221869343	2025-10-23 18:15:34.0	664223633819	平果分公司	平果铝城综合支局	WO2025102115541	776780520	杨国立	20251021	20251201	NULL	182386871049954	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221867439	2025-10-02 18:46:54.0	664210385226	德保分公司	德保东凌综合支局	WO2025100219117	776791538	李荣振	20251002	20251201	NULL	180122801184236	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221862257	2025-10-30 20:24:30.0	664221659306	乐业分公司	乐业花坪综合支局	WO2025101721864	776456002	王功泽	20251026	20251201	0	182386871071059	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221870693	2025-10-30 20:09:46.0	664230591469	平果分公司	平果新安综合支局	WO2025102922270	776140445	廖春峥	NULL	NULL	NULL	180122801438130	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221865132	2025-10-18 17:16:49.0	664220823519	隆林分公司	隆林隆或综合支局	WO2025101621041	776701942	吴凯	20251018	20251201	NULL	182386871051741	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221873329	2025-10-21 18:11:32.0	664224206501	田阳分公司	田阳西南综合支局	WO2025102108398	XN0006559	陆庆华	20251018	20251201	NULL	182386871066025	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221863923	2025-10-13 17:33:21.0	664216275607	田东分公司	田东思林综合支局	WO2025101111470	776354004	黄军权	20251009	20251201	NULL	180122801184800	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221862588	2025-10-02 20:05:40.0	664210592551	德保分公司	德保城北综合支局	WO2025100209735	776103065	雍正福	NULL	NULL	NULL	182386871039436	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868362	2025-10-02 16:47:42.0	664209171431	平果分公司	平果铝城综合支局	WO2025093029537	776780520	杨国立	20251001	20251201	NULL	180122801184482	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221863838	2025-10-11 18:28:51.0	664214832402	平果分公司	平果铝城综合支局	WO2025100919618	776780520	杨国立	20251011	20251201	NULL	182386871043878	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221862221	2025-10-29 16:35:35.0	664221213130	田林分公司	田林定安综合支局	WO2025101707036	776322005	韦宝林	NULL	NULL	NULL	182386871042095	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221864852	2025-10-10 14:23:47.0	664215466603	右江区分公司	右江区龙景综合支局	WO2025101013832	776779294	李生学	20251010	20251201	0	182386871039326	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221867748	2025-10-14 08:19:06.0	664215780775	平果分公司	平果城东综合支局	WO2025101025385	776780516	黄尚官	20250908	20251201	NULL	180122801320540	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221867945	2025-10-15 11:37:45.0	664219320931	隆林分公司	隆林隆或综合支局	WO2025101503114	776779380	冉登文	NULL	NULL	NULL	182386870998493	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221862999	2025-10-13 18:20:00.0	664217755410	田阳分公司	田阳西南综合支局	WO2025101308483	XN0006559	陆庆华	20251013	20251201	NULL	182386871051498	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221865947	2025-10-12 12:15:39.0	664216886295	平果分公司	平果新安综合支局	WO2025101201199	XN0006608	陆诚	NULL	NULL	NULL	183910970525165	泛智能终端-无线路由器-锐捷RG-MA3032	未激活	其他
202510	全屋WIFI	97762221862256	2025-10-19 16:42:27.0	664221651463	田东分公司	田东义圩综合支局	WO2025101721882	776359006	黄立升	20251019	20251201	NULL	182386871050286	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221872485	2025-10-23 17:04:49.0	664225937663	隆林分公司	隆林者浪综合支局	WO2025102317838	776603031	杨腾英	NULL	NULL	NULL	114025080044847	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221871423	2025-10-24 11:56:21.0	664225191873	隆林分公司	隆林隆或综合支局	WO2025102219160	776701942	吴凯	NULL	NULL	NULL	182386871047017	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221861531	2025-10-02 18:20:37.0	664209199127	靖西分公司	靖西城南综合支局	WO2025093030448	776801391	林弘宇	NULL	NULL	NULL	YN96R4T07754	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221874406	2025-10-27 20:45:26.0	664228080879	靖西分公司	靖西政企专业支局	WO2025102603932	776782349	邓家华	20251027	20251201	NULL	182386871072519	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221867754	2025-10-11 15:38:29.0	664215851206	德保分公司	德保城北综合支局	WO2025101027832	776801421	黄仕全	20251010	20251201	0	182386871041609	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221865867	2025-10-18 18:21:26.0	664215546389	隆林分公司	隆林隆或综合支局	WO2025101017581	776701942	吴凯	20251018	20251201	NULL	182386871042013	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221872691	2025-10-30 20:12:23.0	664230570349	平果分公司	平果新安综合支局	WO2025102922161	776140445	廖春峥	20251101	20251201	NULL	180122801371996	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221873644	2025-10-30 13:43:33.0	664230606465	平果分公司	平果新安综合支局	WO2025102922262	776120607	李勇	20251030	20251201	NULL	182386871072768	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221870726	2025-10-30 17:13:15.0	664231100519	靖西分公司	靖西禄峒综合支局	WO2025102938534	776790202	肖祥友	20251030	20251202	NULL	182386871066017	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868760	2025-10-11 15:11:21.0	664216315054	隆林分公司	隆林克长综合支局	WO2025101111489	776902373	曾清	20251002	20251201	NULL	180122801184732	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221388301	2025-10-31 08:28:08.0	663835603664	右江区分公司	右江区城西综合支局	WO2024022608511	776177383	邓显武	NULL	NULL	NULL	NULL	NULL	未激活	未销串
202510	全屋WIFI	97762221870698	2025-10-30 17:54:51.0	664230655913	平果分公司	平果新安综合支局	WO2025102923554	776120607	李勇	20251105	20251201	NULL	180122801438138	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221864478	2025-10-04 17:37:29.0	664209746022	那坡分公司	那坡城南综合支局	WO2025100111055	776781551	陈元龙	20251103	20251201	NULL	182386871047840	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221873703	2025-10-31 13:19:44.0	664231694888	田阳分公司	田阳坡洪综合支局	WO2025103024352	776790251	杨忠敏	20251031	20251201	NULL	182386871008713	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221861609	2025-10-06 14:40:44.0	664210736054	德保分公司	德保足荣荣华综合支局	WO2025100216423	776005003	李洛全	NULL	NULL	0	182386871064945	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221863234	2025-10-18 16:19:32.0	664221089005	田阳分公司	田阳西南综合支局	WO2025101702173	XN0006559	陆庆华	20251018	20251201	NULL	182386871066043	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221871657	2025-10-30 14:12:47.0	664230639992	平果分公司	平果新安综合支局	WO2025102923671	776120607	李勇	20251102	20251201	NULL	182386871072874	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221874498	2025-10-30 20:12:29.0	664230576336	平果分公司	平果新安综合支局	WO2025102922194	776140445	廖春峥	NULL	NULL	NULL	180122801438136	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221871312	2025-10-22 11:52:57.0	664223213445	田东分公司	田东城南综合支局	WO2025102002233	776791087	王磊	NULL	NULL	0	182386871082583	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221861796	2025-10-09 15:39:42.0	664214519831	那坡分公司	那坡平孟综合支局	WO2025100908528	776789146	何国强	NULL	NULL	0	NULL	NULL	未激活	未销串
202510	全屋WIFI	97762221876472	2025-10-30 14:12:41.0	664230643938	平果分公司	平果新安综合支局	WO2025102923670	776120607	李勇	20251108	20251201	NULL	182386871082258	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868587	2025-10-11 10:55:12.0	664212670218	田林分公司	田林城西综合支局	WO2025101017058	776323004	李海财	20251008	20251201	NULL	182386871052503	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221864122	2025-10-16 09:11:26.0	664220044974	右江区分公司	右江区阳圩综合支局	WO2025101526088	776117376	李京津	20251015	20251201	NULL	180122801183914	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221871656	2025-10-30 14:12:45.0	664230639839	平果分公司	平果新安综合支局	WO2025102923655	776120607	李勇	20251103	20251201	NULL	182386871072777	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221863144	2025-10-17 10:02:22.0	664219791870	隆林分公司	隆林克长综合支局	WO2025101519194	776603038	张仕明	NULL	NULL	NULL	180122801184668	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221864793	2025-10-12 19:46:31.0	664214753474	右江区分公司	右江区龙景综合支局	WO2025100916923	776901139	林雨健	20251011	20251201	NULL	182386871052513	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221867669	2025-10-10 14:00:15.0	664214139200	靖西分公司	靖西湖润综合支局	WO2025100813040	776903233	马国华	20251010	20251201	0	180122801184850	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221861758	2025-10-08 18:25:03.0	664213686977	田东分公司	田东城北综合支局	WO2025100800750	776779041	黄剑	NULL	NULL	NULL	182386871008168	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221873622	2025-10-30 15:40:35.0	664230050172	平果分公司	平果海城综合支局	WO2025102824549	776801629	黄义朗	20251029	20251201	NULL	182386871041689	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221866500	2025-10-03 14:31:41.0	664210467107	平果分公司	平果城东综合支局	WO2025100206571	776051815	陈文禧	20251003	20251201	0	182386871051816	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221863645	2025-10-04 17:03:45.0	664211842027	田东分公司	田东林逢综合支局	WO2025100407858	XN0006240	黄忠臣	NULL	NULL	NULL	180122801184549	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221863661	2025-10-09 19:22:23.0	664212084537	平果分公司	平果海城综合支局	WO2025100414798	776801629	黄义朗	20251020	20251201	NULL	180122801184687	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221866265	2025-10-20 11:47:56.0	664222371628	隆林分公司	隆林隆或综合支局	WO2025101813969	776791807	冉浩成	20251020	20251201	0	180122801184099	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221864864	2025-10-11 13:33:09.0	664215587977	平果分公司	平果旧城综合支局	WO2025101018661	776780515	黄新淋	20251011	20251201	NULL	182386871007106	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221867336	2025-10-01 10:22:38.0	664208460348	右江区分公司	右江区龙景综合支局	WO2025093030387	776782540	黄卓学	20250930	20251201	NULL	180122801184845	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221867432	2025-10-03 10:16:47.0	664210226681	德保分公司	德保马隘都安综合支局	WO2025100207160	776781373	黄志起	20251002	20251201	0	180122801184761	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221867854	2025-10-13 15:19:21.0	664217844429	田阳分公司	田阳城东综合支局	WO2025101310791	776404007	黄文华	NULL	NULL	0	182386871052445	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221865860	2025-10-12 21:05:11.0	664215481483	隆林分公司	隆林猪场综合支局	WO2025101014375	776790342	杨光平	NULL	NULL	NULL	114025080044842	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221865440	2025-10-17 13:36:40.0	664208788314	隆林分公司	隆林者保综合支局	WO2025093014142	776903318	黄荣考	NULL	NULL	0	182386871047155	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868783	2025-10-14 09:55:47.0	664216850910	靖西分公司	靖西果乐综合支局	WO2025101200550	776801173	王海	20251016	20251202	NULL	182386871051411	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221874514	2025-10-30 20:16:28.0	664230944651	靖西分公司	靖西果乐综合支局	WO2025102933539	776791149	凤昌浩	20251106	20251201	NULL	182386871066051	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221862492	2025-10-02 11:44:41.0	664208801937	田东分公司	田东林逢综合支局	WO2025093014109	XN0006240	黄忠臣	20251002	20251201	NULL	180122801184555	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221868902	2025-10-20 18:05:23.0	664218878618	靖西分公司	靖西政企专业支局	WO2025101906158	100015499	黄加辉	20251019	20251201	NULL	182386871082615	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221861829	2025-10-09 20:33:40.0	664214917549	田东分公司	田东城南综合支局	WO2025100922630	776354008	罗昌嵩	20251009	20251201	NULL	182386871010422	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221866459	2025-10-02 20:03:39.0	664209616030	德保分公司	德保城北综合支局	WO2025100205269	776103065	雍正福	20251001	20251201	NULL	182386871049139	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868450	2025-10-03 12:53:43.0	664210581074	田阳分公司	田阳坡洪综合支局	WO2025100209565	776790251	杨忠敏	20251003	20251201	NULL	180122801191513	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221867558	2025-10-05 12:38:13.0	664212264880	田东分公司	田东城北综合支局	WO2025100503010	776354021	黄盛华	20251005	20251201	NULL	182386871010574	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221863704	2025-10-11 10:54:21.0	664212667632	田林分公司	田林城西综合支局	WO2025101100508	776323004	李海财	20251008	20251201	NULL	182386871050235	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221865431	2025-10-01 10:21:03.0	664208454856	右江区分公司	右江区龙景综合支局	WO2025093030091	776782540	黄卓学	NULL	NULL	NULL	180122801184834	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221868242	2025-10-22 08:06:18.0	664224349827	平果分公司	平果铝城综合支局	WO2025102112918	XN0006607	凌承龙	20251021	20251201	NULL	182386871047579	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221866693	2025-10-14 08:58:47.0	664213998522	田东分公司	田东义圩综合支局	WO2025100808483	776358001	李璜	NULL	NULL	NULL	182386871048572	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221864106	2025-10-16 18:10:57.0	664219788397	乐业分公司	乐业城市综合支局	WO2025101518834	776790150	吴显昆	20251016	20251201	0	182386871041646	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221865270	2025-10-21 16:16:17.0	664223024093	德保分公司	德保燕峒龙光综合支局	WO2025101911960	776005015	黄绍都	20250918	20251201	0	180122801191248	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221865677	2025-10-14 12:50:13.0	664212786265	隆林分公司	隆林者保综合支局	WO2025100601755	776903318	黄荣考	20251013	20251201	NULL	182386871044006	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221871617	2025-10-29 16:55:45.0	664229808797	凌云分公司	凌云茶山综合支局	WO2025102815276	776903365	冯文伸	20251029	20251201	NULL	180122801183950	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221862731	2025-10-08 23:59:11.0	664212634402	田林分公司	田林城西综合支局	WO2025100514273	776801709	赵金寿	20251008	20251201	NULL	182386871052502	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221864635	2025-10-06 17:35:15.0	664211993932	德保分公司	德保燕峒龙光综合支局	WO2025100412323	776005015	黄绍都	20251009	20251201	NULL	180122801184597	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221862632	2025-10-13 11:48:22.0	664211253676	那坡分公司	那坡龙合综合支局	WO2025100410474	776901212	黄宏语	20251105	20251202	NULL	182386871047856	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221861617	2025-10-04 23:57:14.0	664210838680	德保分公司	德保足荣荣华综合支局	WO2025100218024	776005003	李洛全	NULL	NULL	0	182386871072728	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221864224	2025-10-20 09:00:21.0	664221403593	田东分公司	田东义圩综合支局	WO2025101713052	776358001	李璜	NULL	NULL	NULL	182386871045365	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221866600	2025-10-08 10:47:55.0	664212327076	田阳分公司	田阳西南综合支局	WO2025100504690	776790947	李俊麟	20251008	20251201	NULL	180122801191444	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221866630	2025-10-08 17:55:55.0	664212979168	凌云分公司	凌云泗城综合支局	WO2025100605498	776782724	田宏干	20251008	20251201	0	180122801184057	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221863883	2025-10-11 16:56:33.0	664215443834	右江区分公司	右江区城东综合支局	WO2025101013516	776047009	黄明德	20251011	20251201	NULL	182386871047647	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221869330	2025-10-21 19:54:28.0	664223433742	田东分公司	田东思林综合支局	WO2025102020895	776360003	陆最香	NULL	NULL	NULL	NULL	NULL	未激活	未销串
202510	全屋WIFI	97762221873541	2025-10-29 20:08:38.0	664227968070	平果分公司	平果海城综合支局	WO2025102919099	776801629	黄义朗	NULL	NULL	NULL	182386871039454	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221876469	2025-10-30 14:12:40.0	664230636860	平果分公司	平果新安综合支局	WO2025102923640	776120607	李勇	20251102	20251201	NULL	182386871064716	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221861353	2025-10-15 16:49:36.0	664205812783	那坡分公司	那坡百省综合支局	WO2025092617279	776777931	叶力晖	20251015	20251201	NULL	182386871051344	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221865854	2025-10-11 17:07:40.0	664215402269	靖西分公司	靖西新甲综合支局	WO2025101011985	776779158	雷平	20251010	20251201	NULL	182386871041695	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221869489	2025-10-24 14:47:54.0	664226541289	田东分公司	田东城北综合支局	WO2025102410527	776779041	黄剑	20251024	20251201	NULL	182386871051351	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221861768	2025-10-10 13:42:11.0	664213806952	靖西分公司	靖西城北综合支局	WO2025100803848	100040668	谢小科	20251021	20251201	NULL	182386871049695	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221867577	2025-10-07 16:16:15.0	664212488575	靖西分公司	靖西果乐综合支局	WO2025100510119	776801173	王海	20251101	20251201	NULL	182386871050545	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221876375	2025-10-26 15:09:42.0	664228210787	右江区分公司	右江区城西综合支局	WO2025102606709	776110694	黎政华	NULL	NULL	0	NULL	NULL	未激活	未销串
202510	全屋WIFI	97762221872329	2025-10-21 19:16:45.0	664223543215	靖西分公司	靖西城北综合支局	WO2025102012085	776504016	陆刚豪	20251021	20251201	NULL	182386871051936	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221872576	2025-10-29 13:48:21.0	664227938681	隆林分公司	隆林隆或综合支局	WO2025102600513	776701942	吴凯	NULL	NULL	NULL	180122800609079	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221876459	2025-10-30 22:05:42.0	664230540146	德保分公司	德保燕峒龙光综合支局	WO2025103025377	776141435	凌振鑫	20251030	20251201	NULL	182386871065522	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221867243	2025-10-22 12:46:33.0	664224629293	靖西分公司	靖西新甲综合支局	WO2025102121965	776903232	廖坤	NULL	NULL	0	182386871048691	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221869083	2025-10-25 16:40:51.0	664221862753	德保分公司	德保燕峒龙光综合支局	WO2025101800529	776141435	凌振鑫	NULL	NULL	NULL	182386871067759	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221864666	2025-10-17 18:19:00.0	664212402660	田东分公司	田东城南综合支局	WO2025101717274	XN0006619	卢万祥	NULL	NULL	NULL	182386871048261	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221867917	2025-10-15 11:37:12.0	664218933823	平果分公司	平果铝城综合支局	WO2025101422054	776153024	许康安	20250802	20251201	NULL	183910970525029	泛智能终端-无线路由器-锐捷RG-MA3032	未激活	其他
202510	全屋WIFI	97762221869305	2025-10-19 16:26:50.0	664222965146	平果分公司	平果城东综合支局	WO2025101910118	776153023	陆炜	20251019	20251201	NULL	182386871046779	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221864510	2025-10-12 10:58:02.0	664210344981	右江区分公司	右江区龙景综合支局	WO2025100202376	776136775	陈昌维	NULL	NULL	NULL	182386871048298	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221867242	2025-10-29 12:55:29.0	664224616821	右江区分公司	右江区四塘综合支局	WO2025102121998	776047056	马翔译	20251029	20251201	NULL	182386871050251	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221863734	2025-10-08 14:46:07.0	664213293088	田东分公司	田东城南综合支局	WO2025100705338	776791087	王磊	20251008	20251201	0	180122801133130	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221867748	2025-10-14 08:19:06.0	664215780775	平果分公司	平果城东综合支局	WO2025101025385	776780516	黄尚官	20250902	20251201	NULL	180122801316152	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221866886	2025-10-14 15:27:32.0	664217855761	那坡分公司	那坡平孟综合支局	WO2025101311057	776789155	梁文荣	NULL	NULL	NULL	182386871047821	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221861551	2025-10-04 17:36:45.0	664209671451	右江区分公司	右江区龙景综合支局	WO2025100107411	776110696	马均福	20251004	20251201	0	182386871047088	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868285	2025-10-10 07:26:29.0	664207346194	靖西分公司	靖西城南综合支局	WO2025092818469	776801391	林弘宇	NULL	NULL	0	182386871049888	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221867169	2025-10-23 13:42:35.0	664223303706	靖西分公司	靖西果乐综合支局	WO2025102005938	776903111	王博	20251023	20251201	NULL	182386871082067	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221872669	2025-10-29 13:37:09.0	664230097059	靖西分公司	靖西城南综合支局	WO2025102825222	XN0006319	俞小神	20251102	20251201	NULL	182386871042083	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868061	2025-10-24 17:33:59.0	664221204481	田林分公司	田林定安综合支局	WO2025101707053	776322005	韦宝林	20251017	20251202	NULL	182386871042087	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221867449	2025-10-03 10:12:30.0	664210526463	右江区分公司	右江区龙景综合支局	WO2025100207443	776901139	林雨健	20251002	20251201	NULL	182386871044111	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221861547	2025-10-12 11:46:43.0	664209627580	靖西分公司	靖西政企专业支局	WO2025101008624	100015499	黄加辉	NULL	NULL	NULL	180122801183994	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221868808	2025-10-12 18:45:24.0	664217128130	田东分公司	田东城南综合支局	WO2025101207117	776354008	罗昌嵩	20251012	20251201	NULL	182386871041703	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868064	2025-10-18 12:54:03.0	664221247417	靖西分公司	靖西安德综合支局	WO2025101708320	776791321	杨茂盛	20250912	20251201	NULL	180122801313283	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221865655	2025-10-17 18:18:56.0	664212404619	田东分公司	田东城南综合支局	WO2025101717238	XN0006619	卢万祥	20251013	20251201	NULL	182386871051773	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221867101	2025-10-25 16:40:53.0	664221866390	德保分公司	德保燕峒龙光综合支局	WO2025101800539	776141435	凌振鑫	20251025	20251201	NULL	182386871067575	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221864710	2025-10-10 11:54:05.0	664213139862	田东分公司	田东林逢综合支局	WO2025101007146	XN0006240	黄忠臣	20251009	20251201	NULL	182386871047423	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221869704	2025-10-30 13:42:38.0	664230627453	平果分公司	平果新安综合支局	WO2025102923552	776120607	李勇	NULL	NULL	NULL	182386871082055	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221866938	2025-10-17 08:11:33.0	664218920879	靖西分公司	靖西城北综合支局	WO2025101422316	776504016	陆刚豪	20251016	20251201	NULL	182386871051044	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221869753	2025-10-31 13:19:48.0	664231695415	田阳分公司	田阳坡洪综合支局	WO2025103024347	776790251	杨忠敏	20251031	20251201	NULL	182386871011469	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221872696	2025-10-30 13:04:10.0	664230605991	平果分公司	平果新安综合支局	WO2025102922300	776140445	廖春峥	20251030	20251201	NULL	182386871065526	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868377	2025-10-11 14:25:31.0	664209479609	田东分公司	田东林逢综合支局	WO2025101109966	XN0006240	黄忠臣	20251003	20251201	NULL	180122801184569	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221869706	2025-10-30 13:17:59.0	664230635148	平果分公司	平果新安综合支局	WO2025102923607	776120607	李勇	NULL	NULL	NULL	182386871065514	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221863104	2025-10-17 10:21:24.0	664219353358	德保分公司	德保敬德巴头综合支局	WO2025101504865	776777811	黄健	20251017	20251201	NULL	182386871043266	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221869777	2025-10-31 13:22:18.0	664232249068	田东分公司	田东作登综合支局	WO2025103104594	776353121	黄振军	20251031	20251201	NULL	182386871051508	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221864930	2025-10-13 18:18:42.0	664217039619	右江区分公司	右江区城西综合支局	WO2025101204814	776177383	邓显武	20251012	20251202	NULL	182386871043852	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221863908	2025-10-13 21:12:37.0	664215734378	那坡分公司	那坡城南综合支局	WO2025101023757	776781551	陈元龙	20251013	20251201	NULL	182386871047845	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221865120	2025-10-18 16:30:12.0	664220608888	田东分公司	田东作登综合支局	WO2025101613663	776353121	黄振军	20251018	20251201	NULL	182386871047248	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221872667	2025-10-30 17:37:42.0	664230068222	田林分公司	田林城西综合支局	WO2025102824370	776903477	明胜聪	NULL	NULL	0	180122801437066	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221867711	2025-10-13 13:15:23.0	664215126420	靖西分公司	靖西城南综合支局	WO2025101001607	XN0006319	俞小神	20251013	20251201	NULL	182386871049154	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221865556	2025-10-06 23:38:57.0	664210837805	德保分公司	德保足荣荣华综合支局	WO2025100218014	776005003	李洛全	20251004	20251201	0	182386871047271	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221869448	2025-10-23 16:56:09.0	664225641783	凌云分公司	凌云泗城综合支局	WO2025102308624	776653046	廖庆灵	20251023	20251201	NULL	182386871045306	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221876315	2025-10-27 21:58:51.0	664226946356	靖西分公司	靖西化峒综合支局	WO2025102425693	776520002	陆扬	NULL	NULL	NULL	182386871074521	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868704	2025-10-13 13:15:27.0	664215124368	靖西分公司	靖西城南综合支局	WO2025101001650	XN0006319	俞小神	20251013	20251201	NULL	182386871052501	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221876463	2025-10-30 13:00:13.0	664230611121	平果分公司	平果新安综合支局	WO2025102922207	776140445	廖春峥	NULL	NULL	NULL	182386871082259	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221869022	2025-10-18 20:18:27.0	664220912684	隆林分公司	隆林猪场综合支局	WO2025101623787	776701925	杨健	NULL	NULL	NULL	114025080041308	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221866501	2025-10-02 13:46:03.0	664210496056	田东分公司	田东林逢综合支局	WO2025100206742	XN0006240	黄忠臣	20251120	20251201	NULL	180122801184395	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221864154	2025-10-17 15:31:36.0	664220478404	隆林分公司	隆林猪场综合支局	WO2025101610495	776701925	杨健	NULL	NULL	NULL	114025080044838	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221863846	2025-10-11 09:04:55.0	664214902652	德保分公司	德保马隘都安综合支局	WO2025101022374	776801339	林世吉	20251009	20251201	NULL	180122801184658	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221868680	2025-10-12 19:45:23.0	664214748744	右江区分公司	右江区龙景综合支局	WO2025100916912	776901139	林雨健	NULL	NULL	NULL	182386871048649	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221862827	2025-10-11 10:11:39.0	664214718732	田东分公司	田东林逢综合支局	WO2025100915125	XN0006240	黄忠臣	20251011	20251201	NULL	182386871044122	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221870691	2025-10-30 20:12:27.0	664230568339	平果分公司	平果新安综合支局	WO2025102922157	776140445	廖春峥	NULL	NULL	NULL	182386871072778	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221873679	2025-10-30 15:40:26.0	664231354458	田东分公司	田东义圩综合支局	WO2025103012725	776358001	李璜	20251030	20251201	NULL	182386871050831	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868581	2025-10-08 23:59:05.0	664212639415	田林分公司	田林城西综合支局	WO2025100514207	776801709	赵金寿	20251008	20251201	NULL	182386871041698	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221870320	2025-10-19 16:02:30.0	664222934943	平果分公司	平果城东综合支局	WO2025101909501	XN0006606	梁海	20251018	20251201	NULL	182386871046667	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221871478	2025-10-27 12:36:31.0	664226556020	隆林分公司	隆林克长综合支局	WO2025102411593	776791198	冉登林	20251027	20251201	NULL	182386871046750	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221867773	2025-10-12 12:01:42.0	664216235215	隆林分公司	隆林克长综合支局	WO2025101109452	776791198	冉登林	20251006	20251201	NULL	180122801184374	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221867598	2025-10-11 10:41:06.0	664212832751	隆林分公司	隆林隆或综合支局	WO2025100602581	776779380	冉登文	NULL	NULL	NULL	180122801313935	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221868552	2025-10-11 17:19:59.0	664212348086	隆林分公司	隆林猪场综合支局	WO2025100508625	776701925	杨健	NULL	NULL	NULL	114025080043320	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868446	2025-10-04 23:17:23.0	664210541535	德保分公司	德保足荣荣华综合支局	WO2025100208576	776005003	李洛全	20251019	20251201	0	182386871045697	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221865912	2025-10-11 14:30:45.0	664216204468	右江区分公司	右江区阳圩综合支局	WO2025101108097	776117376	李京津	20251015	20251201	NULL	180122801183999	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221863435	2025-10-04 10:21:32.0	664208386851	靖西分公司	靖西城北综合支局	WO2025092932985	776903109	雷国仕	20250928	20251201	NULL	182386871047659	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221862834	2025-10-11 18:28:47.0	664214834440	平果分公司	平果铝城综合支局	WO2025100919659	776780520	杨国立	20251011	20251201	NULL	182386871047592	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221871416	2025-10-23 12:04:06.0	664225066523	平果分公司	平果城东综合支局	WO2025102214353	776051815	陈文禧	20251023	20251201	NULL	182386871064972	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221865617	2025-10-08 10:49:02.0	664211697531	凌云分公司	凌云浪伏综合支局	WO2025100713411	776659003	周歧稳	NULL	NULL	NULL	180122801330757	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221876567	2025-10-31 17:59:03.0	664232717274	靖西分公司	靖西城南综合支局	WO2025103120814	776903234	李永将	20251031	20251201	NULL	180122801373466	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221871347	2025-10-25 12:15:58.0	664223799606	德保分公司	德保城北综合支局	WO2025102409692	776103065	雍正福	20251010	20251201	NULL	182386871039435	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221876351	2025-10-27 13:26:29.0	664227603661	平果分公司	平果旧城综合支局	WO2025102513167	776153049	黄忠诚	20251027	20251201	NULL	182386871052757	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221873664	2025-10-30 20:16:24.0	664230945943	靖西分公司	靖西果乐综合支局	WO2025102933606	776791149	凤昌浩	20251117	20251201	NULL	180122801051189	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221872384	2025-10-23 21:25:43.0	664224358974	德保分公司	德保城北综合支局	WO2025102326370	776107001	梁爽	20251023	20251201	NULL	182386871071899	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221873664	2025-10-30 20:16:24.0	664230945943	靖西分公司	靖西果乐综合支局	WO2025102933606	776791149	凤昌浩	20251117	20251201	NULL	180122801051189	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221869260	2025-10-24 13:38:32.0	664225578888	平果分公司	平果新安综合支局	WO2025102305816	776140445	廖春峥	20251024	20251201	0	182386871072775	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221870608	2025-10-26 15:09:44.0	664228212968	右江区分公司	右江区城西综合支局	WO2025102606786	776110694	黎政华	NULL	NULL	0	NULL	NULL	未激活	未销串
202510	全屋WIFI	97762221867241	2025-10-25 21:42:16.0	664224616050	田东分公司	田东城北综合支局	WO2025102517052	776354018	卢增方	20251025	20251201	NULL	182386871052428	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221863651	2025-10-05 18:38:58.0	664211894636	德保分公司	德保城北综合支局	WO2025100409096	776103065	雍正福	20251005	20251201	0	182386871051500	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221873694	2025-10-30 15:36:32.0	664231620852	田东分公司	田东义圩综合支局	WO2025103021792	776358001	李璜	20251030	20251201	NULL	182386871050273	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221861536	2025-10-02 14:05:49.0	664209428491	田东分公司	田东城北综合支局	WO2025100101170	776364001	周作弟	20251002	20251201	NULL	182386871009128	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221874499	2025-10-30 20:09:47.0	664230601050	平果分公司	平果新安综合支局	WO2025102922293	776140445	廖春峥	NULL	NULL	NULL	180122801438088	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221868626	2025-10-09 13:12:50.0	664213800810	右江区分公司	右江区澄碧湖综合支局	WO2025100803405	776032002	黄兴敏	20251009	20251201	NULL	182386871051824	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221870308	2025-10-26 19:15:30.0	664222623953	那坡分公司	那坡城南综合支局	WO2025101902084	776781551	陈元龙	20251026	20251201	NULL	182386871047853	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221861825	2025-10-10 17:49:27.0	664214877718	靖西分公司	靖西地州综合支局	WO2025100921702	776782672	农昌健	20251010	20251201	NULL	180122801132946	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221844854	2025-10-09 18:17:30.0	664160091915	田东分公司	田东思林综合支局	WO2025100316831	776360003	陆最香	20251009	20251201	NULL	180122801184793	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221870695	2025-10-30 13:42:36.0	664230620982	平果分公司	平果新安综合支局	WO2025102923547	776120607	李勇	NULL	NULL	NULL	182386871082247	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221869036	2025-10-24 17:32:56.0	664221206484	田林分公司	田林定安综合支局	WO2025101707037	776322005	韦宝林	20251017	20251201	NULL	182386871047262	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221863717	2025-10-08 09:29:50.0	664212922713	乐业分公司	乐业城市综合支局	WO2025100604348	776790150	吴显昆	20251008	20251201	NULL	182386871042842	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221865223	2025-10-22 18:25:59.0	664222245844	靖西分公司	靖西城北综合支局	WO2025101810760	776903108	林宏运	NULL	NULL	NULL	182386871051494	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221875400	2025-10-28 09:51:14.0	664228078947	右江区分公司	右江区城东综合支局	WO2025102805634	776136822	肖君	NULL	NULL	0	182386871048455	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221874504	2025-10-30 17:54:55.0	664230653825	平果分公司	平果新安综合支局	WO2025102923557	776120607	李勇	20251030	20251201	NULL	180122801438150	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221868580	2025-10-08 23:59:09.0	664212639272	田林分公司	田林城西综合支局	WO2025100514235	776801709	赵金寿	20251008	20251201	NULL	182386871051797	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221864046	2025-10-14 14:16:48.0	664218670600	平果分公司	平果城东综合支局	WO2025101412841	776791071	黄立程	20251017	20251201	0	182386871051416	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221872461	2025-10-24 12:15:27.0	664225381920	靖西分公司	靖西武平综合支局	WO2025102225601	776791324	何大军	20251024	20251201	0	182386871048664	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221871483	2025-10-26 16:09:42.0	664226649265	田东分公司	田东祥周综合支局	WO2025102518856	776156810	黄佐清	20251025	20251201	NULL	180122801184386	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221865530	2025-10-18 12:25:58.0	664210543777	右江区分公司	右江区城东综合支局	WO2025100208252	776047019	黄镇权	NULL	NULL	NULL	182386871050546	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868380	2025-10-03 11:52:23.0	664209541301	乐业分公司	乐业城市综合支局	WO2025100103932	776790150	吴显昆	NULL	NULL	NULL	182386871044017	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221870514	2025-10-24 17:46:54.0	664225846344	田阳分公司	田阳西南综合支局	WO2025102314567	XN0006559	陆庆华	20251023	20251201	NULL	182386871072750	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221873643	2025-10-30 20:12:33.0	664230574301	平果分公司	平果新安综合支局	WO2025102922179	776140445	廖春峥	NULL	NULL	NULL	182386871072760	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221869393	2025-10-24 20:53:53.0	664224739723	隆林分公司	隆林猪场综合支局	WO2025102203013	776701925	杨健	20251024	20251201	NULL	182386871082597	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221858805	2025-10-02 16:21:23.0	664199312267	隆林分公司	隆林隆或综合支局	WO2025091717529	776779380	冉登文	NULL	NULL	0	180122801184353	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221866543	2025-10-04 11:58:57.0	664211334196	德保分公司	德保足荣荣华综合支局	WO2025100312145	776005003	李洛全	NULL	NULL	0	182386871039164	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221866543	2025-10-04 11:58:57.0	664211334196	德保分公司	德保足荣荣华综合支局	WO2025100312145	776005003	李洛全	NULL	NULL	0	182386871039164	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221875405	2025-10-27 11:43:25.0	664228168024	西林分公司	西林古马综合支局	WO2025102605545	776257001	熊忠前	20251027	20251201	0	182386871071887	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868437	2025-10-02 13:46:05.0	664210485318	田东分公司	田东林逢综合支局	WO2025100206717	XN0006240	黄忠臣	20251002	20251201	NULL	180122801184558	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221866811	2025-10-11 16:08:00.0	664216284765	隆林分公司	隆林克长综合支局	WO2025101110828	776902373	曾清	20250920	20251201	NULL	180122801132808	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221864206	2025-10-24 17:35:02.0	664221197664	田林分公司	田林定安综合支局	WO2025101706878	776322005	韦宝林	20251017	20251202	NULL	182386871042090	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221871534	2025-10-26 15:40:29.0	664227629292	靖西分公司	靖西城北综合支局	WO2025102513424	776504016	陆刚豪	20251025	20251201	NULL	182386871071551	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221863582	2025-10-03 14:00:06.0	664210951255	平果分公司	平果新安综合支局	WO2025100220731	776789649	黄江涛	20251002	20251201	NULL	180122801184170	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221872429	2025-10-24 09:58:06.0	664225052128	德保分公司	德保马隘都安综合支局	WO2025102213801	776781373	黄志起	NULL	NULL	NULL	182386871051369	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221870292	2025-10-18 16:04:50.0	664222291730	右江区分公司	右江区龙景综合支局	WO2025101811596	776110696	马均福	NULL	NULL	0	182386871041710	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221862641	2025-10-04 15:26:05.0	664211347322	平果分公司	平果城东综合支局	WO2025100312080	776051815	陈文禧	20251004	20251201	0	182386871039465	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221874493	2025-10-29 17:55:27.0	664230416794	平果分公司	平果铝城综合支局	WO2025102915136	776153061	马全军	NULL	NULL	NULL	182386871043984	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221867498	2025-10-04 15:17:25.0	664211345744	平果分公司	平果城东综合支局	WO2025100311999	776051815	陈文禧	20251004	20251201	0	182386871048162	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221863028	2025-10-15 17:23:18.0	664218096520	乐业分公司	乐业城市综合支局	WO2025101319373	776779381	黄朝浩	20251105	20251201	NULL	182386871041524	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221871520	2025-10-25 12:38:41.0	664227375091	隆林分公司	隆林平班综合支局	WO2025102507181	776701816	马定威	20251025	20251201	0	182386871067439	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868959	2025-10-17 17:35:35.0	664219884924	靖西分公司	靖西化峒综合支局	WO2025101609396	776520002	陆扬	NULL	NULL	NULL	182386871047703	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221867796	2025-10-14 09:55:51.0	664216848566	靖西分公司	靖西果乐综合支局	WO2025101200488	776801173	王海	20251016	20251201	NULL	182386871046749	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868203	2025-10-25 17:29:17.0	664223753345	隆林分公司	隆林者保综合支局	WO2025102020451	776903160	杨银	20251025	20251201	0	182386871082846	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221873552	2025-10-27 11:43:30.0	664228162117	西林分公司	西林古马综合支局	WO2025102605526	776257001	熊忠前	20251031	20251201	0	182386871071538	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221870696	2025-10-30 13:42:32.0	664230625359	平果分公司	平果新安综合支局	WO2025102923572	776120607	李勇	NULL	NULL	NULL	182386871072532	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868038	2025-10-20 13:14:47.0	664220943501	西林分公司	西林那佐综合支局	WO2025101700154	776781782	李卫	20251020	20251201	NULL	182386871048324	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221869108	2025-10-22 18:26:03.0	664222251247	靖西分公司	靖西城北综合支局	WO2025101810657	776903108	林宏运	20251019	20251201	NULL	182386871052444	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221862551	2025-10-03 19:41:08.0	664209891110	平果分公司	平果铝城综合支局	WO2025100114011	776780520	杨国立	20251002	20251201	NULL	180122801184451	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221867352	2025-10-03 09:14:57.0	664208839236	隆林分公司	隆林猪场综合支局	WO2025093016188	776701925	杨健	20251002	20251201	0	180122801184039	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221863699	2025-10-09 00:01:09.0	664212635421	田林分公司	田林城西综合支局	WO2025100514281	776801709	赵金寿	20251008	20251201	NULL	182386871051445	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221867802	2025-10-12 13:11:59.0	664216966591	田东分公司	田东城北综合支局	WO2025101203083	776354021	黄盛华	20251012	20251201	NULL	182386871050309	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221864947	2025-10-13 08:08:57.0	664217290575	右江区分公司	右江区龙川综合支局	WO2025101211579	776028004	韦绍程	20251011	20251201	NULL	182386871051794	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868179	2025-10-23 13:42:31.0	664223301970	靖西分公司	靖西果乐综合支局	WO2025102005960	776903111	王博	20251023	20251201	NULL	182386871082065	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221872692	2025-10-30 19:33:20.0	664230578571	平果分公司	平果新安综合支局	WO2025102922277	776140445	廖春峥	NULL	NULL	NULL	180122801191355	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221862662	2025-10-05 19:14:18.0	664211505391	靖西分公司	靖西果乐综合支局	WO2025100317213	776791149	凤昌浩	20251014	20251201	NULL	182386871047698	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221861287	2025-10-15 16:29:31.0	664204757813	右江区分公司	右江区城中综合支局	WO2025092508993	776051812	李晓明	NULL	NULL	0	NULL	NULL	未激活	未销串
202510	全屋WIFI	97762221863012	2025-10-14 17:44:37.0	664217908037	田东分公司	田东义圩综合支局	WO2025101312973	776365009	刘忠世	20251014	20251201	NULL	182386871050274	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221866425	2025-10-02 08:29:03.0	664208838492	西林分公司	西林那佐综合支局	WO2025093015282	776789115	岑家虎	NULL	NULL	NULL	180122801183985	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221874454	2025-10-29 16:27:54.0	664229547079	田东分公司	田东林逢综合支局	WO2025102807638	XN0006240	黄忠臣	20251029	20251201	NULL	182386871082244	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221870694	2025-10-30 20:09:51.0	664230591687	平果分公司	平果新安综合支局	WO2025102922303	776140445	廖春峥	NULL	NULL	NULL	180122801438157	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221869708	2025-10-30 17:55:00.0	664230652655	平果分公司	平果新安综合支局	WO2025102923519	776120607	李勇	20251030	20251201	NULL	180122801438155	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221867554	2025-10-08 18:14:12.0	664212207886	德保分公司	德保燕峒龙光综合支局	WO2025100810280	776141435	凌振鑫	20251003	20251201	NULL	180122801184661	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221866774	2025-10-11 13:33:04.0	664215585443	平果分公司	平果旧城综合支局	WO2025101018676	776780515	黄新淋	20251011	20251201	NULL	182386871010666	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868446	2025-10-04 23:17:23.0	664210541535	德保分公司	德保足荣荣华综合支局	WO2025100208576	776005003	李洛全	20251019	20251201	0	182386871045697	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221866262	2025-10-19 15:47:23.0	664222332489	平果分公司	平果城东综合支局	WO2025101812734	XN0006606	梁海	20251018	20251201	NULL	182386871041649	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221864468	2025-10-03 11:52:27.0	664209535974	乐业分公司	乐业城市综合支局	WO2025100103871	776790150	吴显昆	NULL	NULL	NULL	182386871039194	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221876311	2025-10-26 15:52:38.0	664226805667	靖西分公司	靖西果乐综合支局	WO2025102421328	776801173	王海	NULL	NULL	NULL	182386871072518	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221865842	2025-10-21 13:01:15.0	664215273483	靖西分公司	靖西新甲综合支局	WO2025101006983	776903232	廖坤	20251021	20251201	NULL	182386871050231	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221865919	2025-10-13 17:33:16.0	664216278160	田东分公司	田东思林综合支局	WO2025101111407	776354004	黄军权	20250424	20251201	NULL	183910970441002	泛智能终端-无线路由器-锐捷RG-MA3032	未激活	其他
202510	全屋WIFI	97762221873557	2025-10-28 19:04:59.0	664228501509	平果分公司	平果太平综合支局	WO2025102614029	776801479	韦家盛	20251101	20251201	NULL	182386871070837	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221874354	2025-10-24 16:24:06.0	664226728870	德保分公司	德保敬德巴头综合支局	WO2025102417059	776777811	黄健	20251024	20251201	NULL	180122801184427	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221874481	2025-10-30 15:40:34.0	664230046544	平果分公司	平果海城综合支局	WO2025102824569	776801629	黄义朗	20251111	20251201	NULL	182386871046765	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221861572	2025-10-04 02:43:44.0	664210108890	德保分公司	德保燕峒龙光综合支局	WO2025100122532	776005015	黄绍都	NULL	NULL	NULL	180122801184780	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221866673	2025-10-22 16:20:14.0	664213757417	乐业分公司	乐业花坪综合支局	WO2025102206979	776456002	王功泽	20251011	20251201	NULL	182386871051487	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221864039	2025-10-16 18:34:20.0	664218621299	德保分公司	德保城北综合支局	WO2025101619510	776107001	梁爽	NULL	NULL	NULL	114025080044849	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221863632	2025-10-04 16:38:09.0	664211670133	田东分公司	田东城南综合支局	WO2025100402954	776791087	王磊	20251004	20251201	NULL	180122801133140	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221864464	2025-10-11 14:25:27.0	664209494255	田东分公司	田东林逢综合支局	WO2025101109977	XN0006240	黄忠臣	20251003	20251201	NULL	180122801184560	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221864898	2025-10-13 17:33:15.0	664216269861	田东分公司	田东思林综合支局	WO2025101111393	776354004	黄军权	20251009	20251201	NULL	180122801184791	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221861191	2025-10-13 19:21:56.0	664205751059	那坡分公司	那坡城南综合支局	WO2025092613695	776789519	农尚升	NULL	NULL	NULL	182386871050631	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221863082	2025-10-20 18:05:20.0	664218887280	靖西分公司	靖西政企专业支局	WO2025101906138	100015499	黄加辉	NULL	NULL	0	182386871082582	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868432	2025-10-15 12:20:10.0	664210365790	那坡分公司	那坡德隆综合支局	WO2025100203105	776778054	李双宏	20251013	20251201	NULL	182386871052597	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221867105	2025-10-20 12:52:49.0	664222040629	右江区分公司	右江区龙景综合支局	WO2025101805240	776776365	农新鹏	20251018	20251201	NULL	182386871069069	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221865140	2025-10-20 13:18:19.0	664220944059	西林分公司	西林那佐综合支局	WO2025101700183	776781782	李卫	NULL	NULL	NULL	180122801313321	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221864659	2025-10-11 17:19:58.0	664212350198	隆林分公司	隆林猪场综合支局	WO2025100508624	776701925	杨健	NULL	NULL	NULL	114025080036137	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221872742	2025-10-31 21:18:09.0	664231846746	乐业分公司	乐业城市综合支局	WO2025103130195	776790150	吴显昆	NULL	NULL	NULL	182386871071272	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221874496	2025-10-30 22:05:44.0	664230539818	德保分公司	德保燕峒龙光综合支局	WO2025103025417	776141435	凌振鑫	NULL	NULL	NULL	182386871067751	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221873664	2025-10-30 20:16:24.0	664230945943	靖西分公司	靖西果乐综合支局	WO2025102933606	776791149	凤昌浩	20251117	20251201	NULL	180122801051189	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221866996	2025-10-18 17:47:39.0	664220012831	平果分公司	平果太平综合支局	WO2025101525132	776167002	黄寿松	NULL	NULL	NULL	182386871009506	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221865468	2025-10-12 11:43:46.0	664209636159	靖西分公司	靖西政企专业支局	WO2025101008594	100015499	黄加辉	20251009	20251201	NULL	180122801183993	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221867023	2025-10-17 18:40:42.0	664220584869	那坡分公司	那坡城南综合支局	WO2025101613205	776781551	陈元龙	20251017	20251201	NULL	182386871047841	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868208	2025-10-22 16:28:15.0	664223829572	右江区分公司	右江区龙景综合支局	WO2025102113619	776791244	黄伟雄	20251015	20251201	0	182386871047695	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221874416	2025-10-27 12:34:30.0	664228289061	凌云分公司	凌云泗城综合支局	WO2025102608589	776782724	田宏干	20251027	20251201	0	182386871047420	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868115	2025-10-25 16:41:01.0	664221864582	德保分公司	德保燕峒龙光综合支局	WO2025101800518	776141435	凌振鑫	20251104	20251201	NULL	182386871067588	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221840896	2025-10-09 18:18:35.0	664160092832	田东分公司	田东思林综合支局	WO2025100316797	776360003	陆最香	NULL	NULL	NULL	180122801184787	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221866028	2025-10-15 15:05:13.0	664218199786	田阳分公司	田阳西南综合支局	WO2025101322592	XN0006559	陆庆华	20251014	20251201	NULL	182386871014908	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221869701	2025-10-30 19:33:24.0	664230585509	平果分公司	平果新安综合支局	WO2025102922208	776140445	廖春峥	NULL	NULL	NULL	180122801132979	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221867416	2025-10-04 12:33:59.0	664210112858	靖西分公司	靖西武平综合支局	WO2025100121892	776790952	李启校	20251004	20251201	NULL	180122801184377	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221865805	2025-10-12 19:45:27.0	664214755568	右江区分公司	右江区龙景综合支局	WO2025100916858	776901139	林雨健	20251011	20251201	NULL	182386871048510	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221871501	2025-10-26 11:05:19.0	664226871864	平果分公司	平果铝城综合支局	WO2025102424318	776780514	陆信忠	20251025	20251201	NULL	182386871072454	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868463	2025-10-06 14:55:58.0	664210730524	德保分公司	德保足荣荣华综合支局	WO2025100216435	776005003	李洛全	20251004	20251201	0	182386871042307	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221869188	2025-10-21 09:36:39.0	664223839498	那坡分公司	那坡百省综合支局	WO2025102023670	776206001	农荣锋	20251020	20251201	NULL	182386871051347	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221861856	2025-10-11 08:41:44.0	664215304809	平果分公司	平果铝城综合支局	WO2025101007781	XN0006607	凌承龙	20251010	20251201	NULL	180122801184257	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221871422	2025-10-24 11:56:13.0	664225191511	隆林分公司	隆林隆或综合支局	WO2025102219131	776701942	吴凯	NULL	NULL	NULL	182386871042049	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221864205	2025-10-17 17:45:04.0	664221197567	田阳分公司	田阳西南综合支局	WO2025101705537	XN0006559	陆庆华	20251017	20251201	NULL	182386871068060	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221863492	2025-10-02 18:03:03.0	664209606786	右江区分公司	右江区龙景综合支局	WO2025100105415	776110696	马均福	20251002	20251201	NULL	180122801184831	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221865372	2025-10-01 04:46:05.0	664207811359	德保分公司	德保燕峒龙光综合支局	WO2025092908466	776005015	黄绍都	20251013	20251201	NULL	180122801184710	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221870387	2025-10-21 09:36:41.0	664223838932	那坡分公司	那坡百省综合支局	WO2025102023588	776206001	农荣锋	20251020	20251201	NULL	182386871051350	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868693	2025-10-11 09:04:50.0	664214908226	德保分公司	德保马隘都安综合支局	WO2025101022482	776801339	林世吉	20251009	20251201	NULL	180122801184651	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221868556	2025-10-07 14:31:26.0	664212384363	平果分公司	平果铝城综合支局	WO2025100506440	776780514	陆信忠	NULL	NULL	NULL	180122801184244	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221873503	2025-10-26 19:25:00.0	664227415302	平果分公司	平果新安综合支局	WO2025102508160	776801477	韦银	20251025	20251201	NULL	182386871065541	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221864834	2025-10-10 13:50:00.0	664215322924	德保分公司	德保敬德巴头综合支局	WO2025101010195	776777811	黄健	20251010	20251201	NULL	182386871044119	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868083	2025-10-20 09:00:17.0	664221407349	田东分公司	田东义圩综合支局	WO2025101713047	776358001	李璜	NULL	NULL	NULL	182386871050288	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868121	2025-10-18 13:32:56.0	664222152096	右江区分公司	右江区龙景综合支局	WO2025101807624	776177381	黄熙武	20251018	20251201	0	182386871047706	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221876381	2025-10-30 20:31:27.0	664228448396	乐业分公司	乐业花坪综合支局	WO2025102612915	776456002	王功泽	20251029	20251201	0	182386871067631	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221862476	2025-10-01 10:24:16.0	664208449706	右江区分公司	右江区龙景综合支局	WO2025093030258	776782540	黄卓学	20250930	20251201	NULL	180122801184840	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221876438	2025-10-29 13:37:13.0	664230092644	靖西分公司	靖西城南综合支局	WO2025102825273	XN0006319	俞小神	NULL	NULL	NULL	182386871046774	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221871658	2025-10-30 17:54:56.0	664230654258	平果分公司	平果新安综合支局	WO2025102923564	776120607	李勇	20251103	20251201	NULL	182386871082062	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221873625	2025-10-29 13:37:14.0	664230090983	靖西分公司	靖西城南综合支局	WO2025102825188	XN0006319	俞小神	20251102	20251201	NULL	182386871051417	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221866543	2025-10-04 11:58:57.0	664211334196	德保分公司	德保足荣荣华综合支局	WO2025100312145	776005003	李洛全	NULL	NULL	0	182386871039164	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221862213	2025-10-18 16:19:36.0	664221084437	田阳分公司	田阳西南综合支局	WO2025101702152	XN0006559	陆庆华	20251018	20251201	NULL	182386871082075	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868446	2025-10-04 23:17:23.0	664210541535	德保分公司	德保足荣荣华综合支局	WO2025100208576	776005003	李洛全	20251019	20251201	0	182386871045697	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221858095	2025-10-20 14:19:11.0	664203440819	隆林分公司	隆林克长综合支局	WO2025092316064	776902373	曾清	20251020	20251201	0	182386871051925	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221863038	2025-10-14 13:12:19.0	664218136748	靖西分公司	靖西武平综合支局	WO2025101320435	776790952	李启校	20251013	20251201	NULL	180122801184521	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221388301	2025-10-31 08:28:08.0	663835603664	右江区分公司	右江区城西综合支局	WO2024022608511	776177383	邓显武	NULL	NULL	NULL	NULL	NULL	未激活	未销串
202510	全屋WIFI	97762221868812	2025-10-13 18:47:14.0	664217243726	田林分公司	田林城西综合支局	WO2025101210377	776313007	杨绍远	20251009	20251201	NULL	182386871052276	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221876439	2025-10-29 13:37:05.0	664230092724	靖西分公司	靖西城南综合支局	WO2025102825261	XN0006319	俞小神	20251029	20251201	NULL	182386871046762	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221863296	2025-10-14 15:48:38.0	664206063402	田林分公司	田林八渡综合支局	WO2025092626883	776902137	农义忠	20250926	20251201	NULL	180122801191314	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221865676	2025-10-12 19:51:36.0	664212767574	右江区分公司	右江区龙景综合支局	WO2025100601541	776901139	林雨健	20251011	20251201	NULL	182386871048672	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221869435	2025-10-24 18:42:09.0	664225353291	西林分公司	西林古马综合支局	WO2025102327538	776257001	熊忠前	20251023	20251201	NULL	182386871072555	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221864784	2025-10-10 13:27:30.0	664214642837	田东分公司	田东林逢综合支局	WO2025101010336	776790676	甘广标	20251010	20251201	NULL	182386871050891	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221867471	2025-10-05 15:38:41.0	664210874449	平果分公司	平果铝城综合支局	WO2025100218867	776780520	杨国立	20251004	20251202	NULL	182386871049280	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868536	2025-10-09 19:22:21.0	664212086441	平果分公司	平果海城综合支局	WO2025100414823	776801629	黄义朗	20251009	20251201	NULL	182386871039240	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221875468	2025-10-30 19:05:23.0	664229801834	德保分公司	德保那甲隆桑综合支局	WO2025103025842	77650049	陆涛	20251030	20251201	NULL	182386871047215	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221865648	2025-10-05 12:38:14.0	664212268059	田东分公司	田东城北综合支局	WO2025100503021	776354021	黄盛华	20251005	20251201	NULL	182386871008695	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221869427	2025-10-27 15:42:39.0	664225205265	德保分公司	德保东凌综合支局	WO2025102219318	776791538	李荣振	20251023	20251201	0	182386871045692	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868721	2025-10-12 11:55:59.0	664215364881	靖西分公司	靖西果乐综合支局	WO2025101011231	776801173	王海	20251020	20251201	NULL	182386871046781	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221867461	2025-10-05 15:34:10.0	664210732049	那坡分公司	那坡城南综合支局	WO2025100214058	776781551	陈元龙	20251005	20251201	NULL	182386871047628	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221866997	2025-10-15 18:28:03.0	664220020911	右江区分公司	右江区城东综合支局	WO2025101525586	776790283	黄波	20251015	20251201	NULL	182386871047730	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221866505	2025-10-03 12:56:47.0	664210575424	田阳分公司	田阳坡洪综合支局	WO2025100209567	776790251	杨忠敏	20251003	20251201	NULL	180122801191512	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221866573	2025-10-05 09:58:09.0	664211944770	隆林分公司	隆林克长综合支局	WO2025100411840	776791198	冉登林	20251005	20251201	NULL	180122801184735	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221861664	2025-10-04 16:38:31.0	664211662757	田东分公司	田东城南综合支局	WO2025100402982	776791087	王磊	20251004	20251201	NULL	180122801133136	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221872710	2025-10-30 15:51:04.0	664230974773	乐业分公司	乐业城市综合支局	WO2025102933553	776789435	袁宏科	20251030	20251201	NULL	182386871064994	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221866637	2025-10-10 09:02:26.0	664213075762	隆林分公司	隆林者浪综合支局	WO2025100700258	776620004	王明尚	20251019	20251201	NULL	182386871050272	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221869723	2025-10-30 09:48:58.0	664230759587	田林分公司	田林六隆综合支局	WO2025102926013	776780495	黄成东	20251029	20251201	NULL	182386871064838	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221868710	2025-10-21 13:01:11.0	664215271827	靖西分公司	靖西新甲综合支局	WO2025101007015	776903232	廖坤	NULL	NULL	NULL	182386871038209	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221869700	2025-10-30 19:33:26.0	664230577854	平果分公司	平果新安综合支局	WO2025102922229	776140445	廖春峥	20251109	20251201	NULL	182386871065515	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221876462	2025-10-30 13:18:29.0	664230604159	平果分公司	平果新安综合支局	WO2025102922276	776120607	李勇	NULL	NULL	NULL	182386871072504	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221866229	2025-10-20 15:38:18.0	664221645114	凌云分公司	凌云泗城综合支局	WO2025101722603	776782724	田宏干	20251020	20251201	NULL	180122801184050	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221861123	2025-10-21 14:30:48.0	664204869195	那坡分公司	那坡平孟综合支局	WO2025092512953	776782530	农建明	20251021	20251201	NULL	182386871039915	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221864496	2025-10-01 17:47:06.0	664210111205	右江区分公司	右江区龙景综合支局	WO2025100121157	776782707	杨旭	20251001	20251201	0	182386871047267	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221865507	2025-10-04 12:32:12.0	664210114645	靖西分公司	靖西武平综合支局	WO2025100121887	776790952	李启校	20251004	20251201	NULL	180122801184368	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221870692	2025-10-30 19:33:18.0	664230581918	平果分公司	平果新安综合支局	WO2025102922334	776140445	廖春峥	NULL	NULL	NULL	180122801319991	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221870512	2025-10-25 09:59:15.0	664225810587	田林分公司	田林城西综合支局	WO2025102313982	776323004	李海财	20251024	20251201	NULL	182386871071897	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221862989	2025-10-20 13:40:40.0	664217634004	隆林分公司	隆林隆或综合支局	WO2025101306845	776701942	吴凯	20251020	20251201	NULL	180122801184107	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221868972	2025-10-16 20:10:47.0	664220177341	平果分公司	平果铝城综合支局	WO2025101600075	776154024	冯健洋	20250702	20251201	NULL	180122800439453	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202510	全屋WIFI	97762221864055	2025-10-16 17:49:35.0	664218811443	田东分公司	田东林逢综合支局	WO2025101418711	776353120	岑忠友	20251016	20251201	NULL	182386871050895	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202510	全屋WIFI	97762221863709	2025-10-14 12:46:33.0	664212781575	隆林分公司	隆林者保综合支局	WO2025100601748	776903318	黄荣考	20251013	20251201	NULL	182386871044011	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221884404	2025-11-21 17:01:32.0	664249364846	右江区分公司	右江区城中综合支局	WO2025112106146	776782633	黄新建	20251121	20251201	0	182386871048304	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221880788	2025-11-29 13:09:24.0	664254887540	平果分公司	平果铝城综合支局	WO2025112835496	776780514	陆信忠	20251128	20251201	NULL	180122801373239	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221881397	2025-11-18 19:40:32.0	664246134751	靖西分公司	靖西城北综合支局	WO2025111610525	776504016	陆刚豪	20251118	20251201	NULL	180122801371987	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221882398	2025-11-24 12:18:37.0	664248699537	隆林分公司	隆林克长综合支局	WO2025112010723	776791198	冉登林	20251124	20251201	0	180122801373764	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221872947	2025-11-08 15:40:48.0	664236392934	田东分公司	田东林逢综合支局	WO2025110416163	XN0006240	黄忠臣	20251030	20251201	NULL	182386871044089	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221881899	2025-11-30 18:23:52.0	664256222535	靖西分公司	靖西政企专业支局	WO2025113003045	100015499	黄加辉	20251130	20251201	NULL	180122801374966	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221883511	2025-11-29 21:16:21.0	664252057474	德保分公司	德保城北综合支局	WO2025112937903	776103065	雍正福	20251127	20251202	NULL	180122801373589	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221884649	2025-11-29 15:35:34.0	664255250811	右江区分公司	右江区大王岭综合支局	WO2025112851829	776776827	朱诚能	20251129	20251201	NULL	180122801375511	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221879338	2025-11-15 12:14:29.0	664244360093	右江区分公司	右江区城东综合支局	WO2025111402116	776047009	黄明德	20251115	20251201	0	180122801371742	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221882407	2025-11-20 18:17:43.0	664248801471	田阳分公司	田阳西南综合支局	WO2025112019817	XN0006559	陆庆华	20251120	20251201	NULL	180122801437913	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221875942	2025-11-10 12:19:06.0	664240410155	平果分公司	平果旧城综合支局	WO2025110901606	776789729	陆兆欢	20251110	20251201	0	182386871052429	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221882612	2025-11-29 18:25:40.0	664253831990	德保分公司	德保城北综合支局	WO2025112927214	776107001	梁爽	NULL	NULL	NULL	180122801373658	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221875548	2025-11-01 16:06:07.0	664231484863	靖西分公司	靖西城南综合支局	WO2025103018555	776903234	李永将	20251101	20251201	0	180122801373483	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221881532	2025-11-21 13:31:59.0	664248863848	平果分公司	平果铝城综合支局	WO2025112016412	776780514	陆信忠	20251121	20251201	NULL	180122801373293	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221875730	2025-11-04 14:11:38.0	664236177643	隆林分公司	隆林者浪综合支局	WO2025110409820	776801815	王章文	20250825	20251201	NULL	183910970525186	泛智能终端-无线路由器-锐捷RG-MA3032	未激活	其他
202511	全屋WIFI	97762221878864	2025-11-29 18:19:44.0	664254322542	西林分公司	西林城北综合支局	WO2025112724046	100028194	农文师	NULL	NULL	NULL	180122801373448	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221879486	2025-11-18 19:17:06.0	664246792035	靖西分公司	靖西城南综合支局	WO2025111816309	XN0006319	俞小神	20251118	20251201	NULL	180122801438167	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221871978	2025-11-12 12:22:48.0	664237646874	隆林分公司	隆林隆或综合支局	WO2025110524964	776701942	吴凯	NULL	NULL	0	182386871046449	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221881508	2025-11-21 19:25:00.0	664248564213	靖西分公司	靖西新甲综合支局	WO2025112005728	776779158	雷平	20251120	20251201	NULL	180122801371544	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221871822	2025-11-07 02:55:46.0	664235021206	田阳分公司	田阳洞靖综合支局	WO2025110306085	776801040	黄丹皞	20251105	20251201	NULL	182386871070904	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221878823	2025-11-27 13:07:58.0	664253226945	田东分公司	田东思林综合支局	WO2025112604430	776354004	黄军权	20251126	20251201	NULL	182386871072772	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221875385	2025-11-05 15:01:48.0	664227519698	那坡分公司	那坡城南综合支局	WO2025102510588	776781551	陈元龙	20251105	20251201	NULL	182386871048831	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221870022	2025-11-06 22:15:08.0	664236922039	德保分公司	德保城北综合支局	WO2025110610448	776103065	雍正福	20251106	20251201	NULL	180122801375383	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221877017	2025-11-12 11:17:57.0	664242018393	西林分公司	西林那佐综合支局	WO2025111108300	776781782	李卫	NULL	NULL	NULL	180122801437971	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221874608	2025-11-15 08:30:47.0	664232711360	隆林分公司	隆林隆或综合支局	WO2025103120875	776779380	冉登文	NULL	NULL	NULL	182386871042057	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221875910	2025-11-08 18:09:33.0	664239433256	西林分公司	西林城北综合支局	WO2025110815971	100028194	农文师	20251119	20251201	NULL	180122801410914	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221884398	2025-11-21 18:34:42.0	664249225401	田东分公司	田东义圩综合支局	WO2025112101059	776358001	李璜	20251121	20251201	NULL	180122801373365	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221881394	2025-11-26 11:06:39.0	664246050361	乐业分公司	乐业花坪综合支局	WO2025111607479	776456002	王功泽	20251125	20251201	0	180122801375398	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221870221	2025-11-11 12:57:19.0	664240150820	德保分公司	德保城北综合支局	WO2025110815169	776103065	雍正福	20251111	20251201	NULL	180122801375326	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221881620	2025-11-23 23:08:03.0	664250891366	田阳分公司	田阳西南综合支局	WO2025112306438	XN0006559	陆庆华	20251104	20251201	NULL	180122801373534	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221875261	2025-11-19 11:58:58.0	664246626004	德保分公司	德保燕峒龙光综合支局	WO2025111711781	776141435	凌振鑫	20251124	20251201	NULL	180122801373599	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221878794	2025-11-27 14:38:35.0	664252633622	平果分公司	平果海城综合支局	WO2025112513882	776801629	黄义朗	20251126	20251201	NULL	180122801371795	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221876598	2025-11-04 17:57:44.0	664233352061	隆林分公司	隆林克长综合支局	WO2025110105687	776791198	冉登林	20251101	20251201	NULL	182386871050257	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221871545	2025-11-08 19:43:12.0	664227891157	靖西分公司	靖西禄峒综合支局	WO2025102521588	776902111	李永炼	20251108	20251201	NULL	182386871072526	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221878565	2025-11-20 15:50:21.0	664247313864	德保分公司	德保马隘都安综合支局	WO2025111809728	776902173	黄克界	20251120	20251201	0	180122801373596	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221877499	2025-11-29 14:15:15.0	664245144398	那坡分公司	那坡百省综合支局	WO2025111500545	776777931	叶力晖	20251129	20251201	NULL	180122801411439	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221884545	2025-11-30 18:46:50.0	664252892831	平果分公司	平果海城综合支局	WO2025112524710	776801629	黄义朗	NULL	NULL	NULL	180122801330947	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221881525	2025-11-22 21:42:42.0	664248843791	隆林分公司	隆林猪场综合支局	WO2025112014692	776790342	杨光平	NULL	NULL	NULL	180122801375483	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221877864	2025-11-26 10:13:59.0	664252246463	平果分公司	平果铝城综合支局	WO2025112502083	776780514	陆信忠	20251126	20251201	NULL	180122801373321	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221872243	2025-11-13 20:12:38.0	664243100708	隆林分公司	隆林者浪综合支局	WO2025111212091	776801815	王章文	20250827	20251201	NULL	183910970525196	泛智能终端-无线路由器-锐捷RG-MA3032	未激活	其他
202511	全屋WIFI	97762221870246	2025-11-11 14:38:09.0	664240741845	田阳分公司	田阳百育综合支局	WO2025111109202	776407014	罗飞	20251111	20251201	NULL	182386871082073	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221882387	2025-11-20 17:35:51.0	664248323823	靖西分公司	靖西城北综合支局	WO2025112001989	100040668	谢小科	20251120	20251201	NULL	180122801371909	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221872859	2025-11-04 18:17:58.0	664234542173	田东分公司	田东城北综合支局	WO2025110211871	776353129	张帅	20251104	20251201	NULL	182386871074191	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221876105	2025-11-25 17:59:10.0	664243873764	那坡分公司	那坡百省综合支局	WO2025111311381	776777931	叶力晖	20251125	20251201	NULL	180122801411325	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221880533	2025-11-21 17:44:44.0	664249042617	德保分公司	德保东凌综合支局	WO2025112023731	776791538	李荣振	20251121	20251201	NULL	182386871052319	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221871005	2025-11-05 18:21:05.0	664237552993	右江区分公司	右江区龙景综合支局	WO2025110522989	776177381	黄熙武	NULL	NULL	0	NULL	NULL	未激活	未销串
202511	全屋WIFI	97762221876991	2025-11-13 11:52:08.0	664241395950	隆林分公司	隆林者浪综合支局	WO2025111012675	776801815	王章文	NULL	NULL	NULL	183910970525184	泛智能终端-无线路由器-锐捷RG-MA3032	未激活	其他
202511	全屋WIFI	97762221877074	2025-11-13 14:46:24.0	664243046710	德保分公司	德保燕峒龙光综合支局	WO2025111307162	776141435	凌振鑫	20250818	20251201	NULL	182386871000116	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221879827	2025-11-27 19:01:09.0	664253497797	靖西分公司	靖西果乐综合支局	WO2025112613698	776801173	王海	NULL	NULL	NULL	180122801372025	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221878290	2025-11-12 14:54:06.0	664242455374	靖西分公司	靖西果乐综合支局	WO2025111121402	776801173	王海	20251112	20251201	NULL	180122801375512	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221876363	2025-11-08 19:43:18.0	664227887347	靖西分公司	靖西禄峒综合支局	WO2025102521636	776902111	李永炼	NULL	NULL	NULL	182386871082834	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221884606	2025-11-27 17:39:44.0	664254350585	平果分公司	平果铝城综合支局	WO2025112724450	776780514	陆信忠	20251127	20251201	NULL	180122801372364	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221877522	2025-11-21 15:24:59.0	664245485294	右江区分公司	右江区龙景综合支局	WO2025111510763	776901139	林雨健	20251121	20251201	0	180122801371812	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221877876	2025-11-28 16:26:10.0	664252410336	那坡分公司	那坡政企专业支局	WO2025112507058	776789049	梁忠重	20251128	20251201	0	182386871074222	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221869954	2025-11-04 14:22:27.0	664235660226	靖西分公司	靖西化峒综合支局	WO2025110321398	776790953	何开文	20251103	20251201	NULL	182386871065227	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221870907	2025-11-08 18:25:39.0	664235218050	田东分公司	田东思林综合支局	WO2025110309966	776360003	陆最香	NULL	NULL	NULL	182386870999211	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221883419	2025-11-22 16:45:18.0	664249911297	田阳分公司	田阳坡洪综合支局	WO2025112126257	776779084	韦东礼	20251120	20251201	0	182386871074957	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221876251	2025-11-18 14:33:20.0	664246252637	凌云分公司	凌云浪伏综合支局	WO2025111612631	776659002	杨再冲	20251029	20251201	NULL	180122801313338	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221875992	2025-11-11 13:51:12.0	664241465017	田东分公司	田东作登综合支局	WO2025111015051	776789210	梁海亮	20251111	20251201	NULL	182386871047258	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221877277	2025-11-26 11:06:35.0	664246052536	乐业分公司	乐业花坪综合支局	WO2025111607494	776456002	王功泽	NULL	NULL	0	180122801375402	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221879613	2025-11-24 08:52:41.0	664248933313	德保分公司	德保燕峒龙光综合支局	WO2025112122862	776141435	凌振鑫	20250922	20251201	NULL	180122801191348	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221874236	2025-11-14 09:20:53.0	664243353986	靖西分公司	靖西政企专业支局	WO2025111221035	100015499	黄加辉	20251114	20251201	NULL	180122801371960	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221874738	2025-11-06 12:40:07.0	664236132304	田东分公司	田东城南综合支局	WO2025110408906	XN0006619	卢万祥	20251106	20251201	NULL	182386871081920	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221873166	2025-11-09 18:20:06.0	664239989022	田阳分公司	田阳西南综合支局	WO2025110813389	XN0006559	陆庆华	20251108	20251201	NULL	180122801373195	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221870973	2025-11-09 12:46:03.0	664236970539	乐业分公司	乐业花坪综合支局	WO2025110806074	776456002	王功泽	NULL	NULL	NULL	180122801371817	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221883460	2025-11-26 14:15:10.0	664250921125	平果分公司	平果旧城综合支局	WO2025112307024	776789729	陆兆欢	20251127	20251201	NULL	180122801371733	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221879822	2025-11-27 15:31:02.0	664253430666	隆林分公司	隆林平班综合支局	WO2025112611626	776701816	马定威	20251127	20251201	NULL	182386871067435	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221875665	2025-11-30 16:35:18.0	664234579973	右江区分公司	右江区龙景综合支局	WO2025110210817	776782706	黄雨	NULL	NULL	NULL	182386871104752	NULL	未激活	其他
202511	全屋WIFI	97762221877204	2025-11-23 17:15:47.0	664244742235	隆林分公司	隆林克长综合支局	WO2025111414351	776791198	冉登林	20251123	20251201	NULL	180122801373759	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221876043	2025-11-11 18:40:11.0	664242272624	平果分公司	平果城东综合支局	WO2025111115095	776780516	黄尚官	20251108	20251201	NULL	180122801371993	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221880787	2025-11-29 16:37:09.0	664254887346	平果分公司	平果铝城综合支局	WO2025112835465	776780514	陆信忠	20251128	20251201	NULL	180122801373279	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221875721	2025-11-05 17:57:18.0	664235903199	德保分公司	德保燕峒龙光综合支局	WO2025110408576	776141435	凌振鑫	20251117	20251201	NULL	182386871067740	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221875862	2025-11-07 13:14:41.0	664238711565	田阳分公司	田阳坡洪综合支局	WO2025110704339	776779084	韦东礼	NULL	NULL	0	NULL	NULL	未激活	未销串
202511	全屋WIFI	97762221876629	2025-11-05 12:57:12.0	664234291288	德保分公司	德保城北综合支局	WO2025110205133	776780136	黄海杰	NULL	NULL	0	NULL	NULL	未激活	未销串
202511	全屋WIFI	97762221871481	2025-11-15 13:42:51.0	664226624110	隆林分公司	隆林德峨综合支局	WO2025111423551	776903282	王吉昌	20251106	20251201	NULL	182386871049961	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221879550	2025-11-20 17:41:31.0	664247975878	那坡分公司	那坡城南综合支局	WO2025111910210	100013040	黄仕中	20251120	20251201	NULL	182386871039294	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221874679	2025-11-04 12:27:05.0	664234934192	右江区分公司	右江区龙景综合支局	WO2025110302805	776782707	杨旭	20251103	20251201	0	182386871071893	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221870751	2025-11-03 18:19:06.0	664231871193	隆林分公司	隆林克长综合支局	WO2025103030073	776791198	冉登林	NULL	NULL	NULL	182386871050256	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221882614	2025-11-28 18:31:44.0	664253853882	田林分公司	田林城西综合支局	WO2025112627111	776313007	杨绍远	20251126	20251201	NULL	180122801373233	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221876241	2025-11-17 19:46:03.0	664246067631	靖西分公司	靖西化峒综合支局	WO2025111608936	776520002	陆扬	NULL	NULL	NULL	180122801372449	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221879711	2025-11-24 15:26:41.0	664251533808	靖西分公司	靖西城北综合支局	WO2025112407610	100040668	谢小科	20251124	20251201	NULL	182386871073482	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221881733	2025-11-27 14:39:00.0	664252589527	平果分公司	平果海城综合支局	WO2025112512617	776801629	黄义朗	NULL	NULL	NULL	180122801375381	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221878941	2025-11-29 19:18:17.0	664255924734	田东分公司	田东义圩综合支局	WO2025112933527	776358001	李璜	NULL	NULL	NULL	180122801438042	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221877876	2025-11-28 16:26:10.0	664252410336	那坡分公司	那坡政企专业支局	WO2025112507058	776789049	梁忠重	20251128	20251201	0	182386871075045	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221876623	2025-11-03 00:20:47.0	664233905738	靖西分公司	靖西城北综合支局	WO2025110118094	776504016	陆刚豪	20251102	20251201	NULL	182386871074964	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221879287	2025-11-13 15:44:30.0	664243768523	凌云分公司	凌云泗城综合支局	WO2025111309080	776782724	田宏干	20251113	20251201	NULL	180122801437999	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221869595	2025-11-04 17:58:20.0	664229036378	隆林分公司	隆林者保综合支局	WO2025102714270	776903318	黄荣考	20251104	20251201	NULL	180122801373343	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221878355	2025-11-15 12:58:06.0	664243883445	乐业分公司	乐业城市综合支局	WO2025111311681	776790150	吴显昆	20251121	20251201	NULL	180122801371954	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221880675	2025-11-25 12:19:49.0	664252412681	隆林分公司	隆林隆或综合支局	WO2025112507078	776791807	冉浩成	20251125	20251201	NULL	180122801375433	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221883427	2025-11-25 13:01:02.0	664250120231	右江区分公司	右江区龙景综合支局	WO2025112211707	776901139	林雨健	20251125	20251201	0	180122801371672	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221880750	2025-11-28 14:36:17.0	664253822956	平果分公司	平果榜圩综合支局	WO2025112626286	776051822	苏宝观	20251128	20251201	0	180122801371955	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221871265	2025-11-13 15:42:41.0	664243284892	田东分公司	田东林逢综合支局	WO2025111219095	776354024	刘伟臣	20251112	20251201	NULL	182386871082617	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221880845	2025-11-30 21:04:08.0	664255755709	德保分公司	德保城北综合支局	WO2025113018805	776103065	雍正福	20251130	20251201	NULL	180122801373650	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221877543	2025-11-17 13:32:02.0	664245673211	田东分公司	田东城南综合支局	WO2025111516602	XN0006619	卢万祥	20251117	20251201	NULL	182386871082843	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221874552	2025-11-01 16:06:03.0	664231490160	靖西分公司	靖西城南综合支局	WO2025103018537	776903234	李永将	20251101	20251201	0	180122801373429	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221883561	2025-11-28 16:01:05.0	664253216792	隆林分公司	隆林克长综合支局	WO2025112604468	776791198	冉登林	20251127	20251201	NULL	180122801373763	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221872678	2025-11-02 18:42:08.0	664230267201	田东分公司	田东义圩综合支局	WO2025102830592	776358001	李璜	NULL	NULL	NULL	182386871050275	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221877074	2025-11-13 14:46:24.0	664243046710	德保分公司	德保燕峒龙光综合支局	WO2025111307162	776141435	凌振鑫	20250818	20251201	NULL	182386871000116	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221883600	2025-11-28 16:51:15.0	664253859008	右江区分公司	右江区龙景综合支局	WO2025112627098	776782706	黄雨	NULL	NULL	0	182386871083935	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221874182	2025-11-11 17:20:38.0	664241884354	平果分公司	平果铝城综合支局	WO2025111104427	776153061	马全军	20251111	20251201	NULL	180122801371708	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221873466	2025-11-06 10:25:35.0	664226804596	隆林分公司	隆林隆或综合支局	WO2025110600559	776791807	冉浩成	20251106	20251201	0	182386871051739	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221878513	2025-11-19 17:59:12.0	664246113051	田东分公司	田东城北综合支局	WO2025111609164	776353129	张帅	20251116	20251201	NULL	182386871050224	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221879828	2025-11-27 19:01:04.0	664253497923	靖西分公司	靖西果乐综合支局	WO2025112613704	776801173	王海	NULL	NULL	NULL	180122801372104	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221876512	2025-11-08 18:58:14.0	664231462683	靖西分公司	靖西禄峒综合支局	WO2025103017849	776902111	李永炼	20251102	20251201	NULL	180122801373960	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221884500	2025-11-29 21:21:33.0	664252051747	德保分公司	德保城北综合支局	WO2025112852773	776103065	雍正福	NULL	NULL	NULL	180122801373662	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221882731	2025-11-30 18:23:54.0	664255988160	凌云分公司	凌云泗城综合支局	WO2025112936445	776653044	姚华球	20251127	20251201	NULL	180122801437930	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221880599	2025-11-22 18:09:21.0	664250367327	田东分公司	田东义圩综合支局	WO2025112217848	776358001	李璜	20251122	20251201	NULL	180122801438049	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221883474	2025-11-24 09:04:05.0	664251027558	平果分公司	平果新安综合支局	WO2025112309761	776140445	廖春峥	20251124	20251201	NULL	180122801372086	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221883285	2025-11-24 12:21:59.0	664247198576	右江区分公司	右江区城东综合支局	WO2025111807097	776776673	杨增友	NULL	NULL	0	NULL	NULL	未激活	未销串
202511	全屋WIFI	97762221880575	2025-11-22 14:48:29.0	664250060485	靖西分公司	靖西政企专业支局	WO2025112210310	776521003	杨经星	NULL	NULL	0	180122801375375	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221869875	2025-11-03 12:20:53.0	664234350083	平果分公司	平果铝城综合支局	WO2025110205743	XN0006607	凌承龙	20251102	20251201	NULL	182386871072875	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221879633	2025-11-23 16:58:57.0	664249411924	隆林分公司	隆林者保综合支局	WO2025112108065	776903160	杨银	20251123	20251201	NULL	180122801371776	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221872146	2025-11-10 16:20:21.0	664240731450	靖西分公司	靖西果乐综合支局	WO2025110909663	776801173	王海	20251110	20251201	NULL	180122801375552	智能组网设备-无线路由器-中兴-E1630-256M版	未激活	其他
202511	全屋WIFI	97762221874847	2025-11-08 16:59:21.0	664238338257	靖西分公司	靖西政企专业支局	WO2025110620280	100015499	黄加辉	20251113	20251201	NULL	182386871065225	泛智能终端-无线路由器-创维SK-WR6651X	未激活	其他
202511	全屋WIFI	97762221227371	2025-11-23 16:40:52.0	663771060298	田阳分公司	田阳西南综合支局	WO2023111006003	100027314	韦泽祺	NULL	NULL	NULL	183313821189183	NULL	未激活	其他
\.


--
-- Data for Name: qrtz_blob_triggers; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.qrtz_blob_triggers (sched_name, trigger_name, trigger_group, blob_data) FROM stdin;
\.


--
-- Data for Name: qrtz_calendars; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.qrtz_calendars (sched_name, calendar_name, calendar) FROM stdin;
\.


--
-- Data for Name: qrtz_cron_triggers; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.qrtz_cron_triggers (sched_name, trigger_name, trigger_group, cron_expression, time_zone_id) FROM stdin;
RuoyiScheduler	TASK_CLASS_NAME2	DEFAULT	0/15 * * * * ?	Asia/Shanghai
RuoyiScheduler	TASK_CLASS_NAME3	DEFAULT	0/20 * * * * ?	Asia/Shanghai
RuoyiScheduler	TASK_CLASS_NAME1	DEFAULT	0/10 * * * * ?	Asia/Shanghai
\.


--
-- Data for Name: qrtz_fired_triggers; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.qrtz_fired_triggers (sched_name, entry_id, trigger_name, trigger_group, instance_name, fired_time, sched_time, priority, state, job_name, job_group, is_nonconcurrent, requests_recovery) FROM stdin;
\.


--
-- Data for Name: qrtz_job_details; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) FROM stdin;
RuoyiScheduler	TASK_CLASS_NAME2	DEFAULT	\N	com.ctbc.quartz.util.QuartzDisallowConcurrentExecution	false	true	false	false	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f504552544945537372001d636f6d2e637462632e71756172747a2e646f6d61696e2e5379734a6f6200000000000000010200084c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c000c696e766f6b6554617267657471007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720026636f6d2e637462632e636f6d6d6f6e2e636f72652e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b5974190300007870770800000179a8519b1878707400007070707400013174000e302f3135202a202a202a202a203f74001572795461736b2e7279506172616d7328277279272974000744454641554c547372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000000002740018e7b3bbe7bb9fe9bb98e8aea4efbc88e69c89e58f82efbc8974000133740001317800
RuoyiScheduler	TASK_CLASS_NAME3	DEFAULT	\N	com.ctbc.quartz.util.QuartzDisallowConcurrentExecution	false	true	false	false	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f504552544945537372001d636f6d2e637462632e71756172747a2e646f6d61696e2e5379734a6f6200000000000000010200084c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c000c696e766f6b6554617267657471007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720026636f6d2e637462632e636f6d6d6f6e2e636f72652e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b5974190300007870770800000179a8519b1878707400007070707400013174000e302f3230202a202a202a202a203f74003872795461736b2e72794d756c7469706c65506172616d7328277279272c20747275652c20323030304c2c203331362e3530442c203130302974000744454641554c547372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000000003740018e7b3bbe7bb9fe9bb98e8aea4efbc88e5a49ae58f82efbc8974000133740001317800
RuoyiScheduler	TASK_CLASS_NAME1	DEFAULT	\N	com.ctbc.quartz.util.QuartzDisallowConcurrentExecution	false	true	false	false	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000f5441534b5f50524f504552544945537372001d636f6d2e637462632e71756172747a2e646f6d61696e2e5379734a6f6200000000000000010200084c000a636f6e63757272656e747400124c6a6176612f6c616e672f537472696e673b4c000e63726f6e45787072657373696f6e71007e00094c000c696e766f6b6554617267657471007e00094c00086a6f6247726f757071007e00094c00056a6f6249647400104c6a6176612f6c616e672f4c6f6e673b4c00076a6f624e616d6571007e00094c000d6d697366697265506f6c69637971007e00094c000673746174757371007e000978720026636f6d2e637462632e636f6d6d6f6e2e636f72652e646f6d61696e2e42617365456e7469747900000000000000010200074c0008637265617465427971007e00094c000a63726561746554696d657400104c6a6176612f7574696c2f446174653b4c0006706172616d7371007e00034c000672656d61726b71007e00094c000b73656172636856616c756571007e00094c0008757064617465427971007e00094c000a75706461746554696d6571007e000c787074000561646d696e7372000e6a6176612e7574696c2e44617465686a81014b5974190300007870770800000179a8519b1878707400007070707400013174000e302f3130202a202a202a202a203f74001172795461736b2e72794e6f506172616d7374000744454641554c547372000e6a6176612e6c616e672e4c6f6e673b8be490cc8f23df0200014a000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b02000078700000000000000001740018e7b3bbe7bb9fe9bb98e8aea4efbc88e697a0e58f82efbc8974000133740001317800
\.


--
-- Data for Name: qrtz_locks; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.qrtz_locks (sched_name, lock_name) FROM stdin;
RuoyiScheduler	TRIGGER_ACCESS
RuoyiScheduler	STATE_ACCESS
\.


--
-- Data for Name: qrtz_paused_trigger_grps; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.qrtz_paused_trigger_grps (sched_name, trigger_group) FROM stdin;
\.


--
-- Data for Name: qrtz_scheduler_state; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.qrtz_scheduler_state (sched_name, instance_name, last_checkin_time, checkin_interval) FROM stdin;
RuoyiScheduler	DESKTOP-GV71M5V1770347686973	1770347809184	15000
\.


--
-- Data for Name: qrtz_simple_triggers; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.qrtz_simple_triggers (sched_name, trigger_name, trigger_group, repeat_count, repeat_interval, times_triggered) FROM stdin;
\.


--
-- Data for Name: qrtz_simprop_triggers; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.qrtz_simprop_triggers (sched_name, trigger_name, trigger_group, str_prop_1, str_prop_2, str_prop_3, int_prop_1, int_prop_2, long_prop_1, long_prop_2, dec_prop_1, dec_prop_2, bool_prop_1, bool_prop_2) FROM stdin;
\.


--
-- Data for Name: qrtz_triggers; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.qrtz_triggers (sched_name, trigger_name, trigger_group, job_name, job_group, description, next_fire_time, prev_fire_time, priority, trigger_state, trigger_type, start_time, end_time, calendar_name, misfire_instr, job_data) FROM stdin;
RuoyiScheduler	TASK_CLASS_NAME2	DEFAULT	TASK_CLASS_NAME2	DEFAULT	\N	1770347700000	-1	5	PAUSED	CRON	1770347687000	0	\N	2	\\x
RuoyiScheduler	TASK_CLASS_NAME3	DEFAULT	TASK_CLASS_NAME3	DEFAULT	\N	1770347700000	-1	5	PAUSED	CRON	1770347687000	0	\N	2	\\x
RuoyiScheduler	TASK_CLASS_NAME1	DEFAULT	TASK_CLASS_NAME1	DEFAULT	\N	1770347690000	-1	5	PAUSED	CRON	1770347687000	0	\N	2	\\x
\.


--
-- Data for Name: sys_config; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sys_config (config_id, config_name, config_key, config_value, config_type, create_by, create_time, update_by, update_time, remark) FROM stdin;
1	主框架页-默认皮肤样式名称	sys.index.skinName	skin-blue	Y	admin	2021-05-26 18:56:31	admin	2021-05-27 09:07:43.532263	蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow
2	用户管理-账号初始密码	sys.user.initPassword	123456	Y	admin	2021-05-26 18:56:31	admin	2021-05-27 10:15:52.394492	初始化密码 123456
3	主框架页-侧边栏主题	sys.index.sideTheme	theme-dark	Y	admin	2021-05-26 18:56:31	admin	\N	深色主题theme-dark，浅色主题theme-light
4	账号自助-验证码开关	sys.account.captchaEnabled	true	Y	admin	2025-12-10 03:11:21.819699	admin	\N	是否开启验证码功能（true开启，false关闭）
5	账号自助-是否开启用户注册功能	sys.account.registerUser	false	Y	admin	2025-12-10 03:11:21.819699	admin	\N	是否开启注册用户功能（true开启，false关闭）
\.


--
-- Data for Name: sys_dept; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sys_dept (dept_id, parent_id, ancestors, dept_name, order_num, leader, phone, email, status, del_flag, create_by, create_time, update_by, update_time) FROM stdin;
814	0	0	百色分公司	0	数支	15888888888	shuzhi@189.com	0	0	admin	2021-05-26 18:56:27	admin	2025-11-05 08:15:44.394561
84909	814	0,814	德保分公司	5	\N	\N	\N	0	0	admin	2025-11-05 08:30:15	admin	2025-11-05 08:30:29
84910	814	0,814	靖西分公司	6	\N	\N	\N	0	0	admin	2025-11-05 08:30:15	admin	2025-11-05 08:30:29
84911	814	0,814	乐业分公司	10	\N	\N	\N	0	0	admin	2025-11-05 08:30:15	admin	2025-11-05 08:30:29
84912	814	0,814	凌云分公司	9	\N	\N	\N	0	0	admin	2025-11-05 08:30:15	admin	2025-11-05 08:30:29
84913	814	0,814	隆林分公司	7	\N	\N	\N	0	0	admin	2025-11-05 08:30:15	admin	2025-11-05 08:30:29
84914	814	0,814	那坡分公司	8	\N	\N	\N	0	0	admin	2025-11-05 08:30:15	admin	2025-11-05 08:30:29
84915	814	0,814	平果分公司	2	\N	\N	\N	0	0	admin	2025-11-05 08:30:15	admin	2025-11-05 08:30:29
84916	814	0,814	田东分公司	3	\N	\N	\N	0	0	admin	2025-11-05 08:30:15	admin	2025-11-05 08:30:29
84917	814	0,814	田林分公司	11	\N	\N	\N	0	0	admin	2025-11-05 15:23:20	admin	2025-11-05 15:23:22
84918	814	0,814	田阳分公司	4	\N	\N	\N	0	0	admin	2025-11-05 15:23:58	admin	2025-11-05 15:24:00
84919	814	0,814	西林分公司	12	\N	\N	\N	0	0	admin	2025-11-05 15:24:42	admin	2025-11-05 15:24:48
84908	814	0,814	右江分公司	1	\N	\N	\N	0	0	admin	2025-11-05 08:30:15	admin	2025-11-05 08:30:29
\.


--
-- Data for Name: sys_dict_data; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sys_dict_data (dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark) FROM stdin;
1	1	男	0	sys_user_sex			Y	0	admin	2025-12-10 03:11:21.819699		\N	性别男
2	2	女	1	sys_user_sex			N	0	admin	2025-12-10 03:11:21.819699		\N	性别女
3	3	未知	2	sys_user_sex			N	0	admin	2025-12-10 03:11:21.819699		\N	性别未知
4	1	显示	0	sys_show_hide		primary	Y	0	admin	2025-12-10 03:11:21.819699		\N	显示菜单
5	2	隐藏	1	sys_show_hide		danger	N	0	admin	2025-12-10 03:11:21.819699		\N	隐藏菜单
6	1	正常	0	sys_normal_disable		primary	Y	0	admin	2025-12-10 03:11:21.819699		\N	正常状态
7	2	停用	1	sys_normal_disable		danger	N	0	admin	2025-12-10 03:11:21.819699		\N	停用状态
8	1	正常	0	sys_job_status		primary	Y	0	admin	2025-12-10 03:11:21.819699		\N	正常状态
9	2	暂停	1	sys_job_status		danger	N	0	admin	2025-12-10 03:11:21.819699		\N	停用状态
10	1	默认	DEFAULT	sys_job_group			Y	0	admin	2025-12-10 03:11:21.819699		\N	默认分组
11	2	系统	SYSTEM	sys_job_group			N	0	admin	2025-12-10 03:11:21.819699		\N	系统分组
12	1	是	Y	sys_yes_no		primary	Y	0	admin	2025-12-10 03:11:21.819699		\N	系统默认是
13	2	否	N	sys_yes_no		danger	N	0	admin	2025-12-10 03:11:21.819699		\N	系统默认否
14	1	通知	1	sys_notice_type		warning	Y	0	admin	2025-12-10 03:11:21.819699		\N	通知
15	2	公告	2	sys_notice_type		success	N	0	admin	2025-12-10 03:11:21.819699		\N	公告
16	1	正常	0	sys_notice_status		primary	Y	0	admin	2025-12-10 03:11:21.819699		\N	正常状态
17	2	关闭	1	sys_notice_status		danger	N	0	admin	2025-12-10 03:11:21.819699		\N	关闭状态
18	1	新增	1	sys_oper_type		info	N	0	admin	2025-12-10 03:11:21.819699		\N	新增操作
19	2	修改	2	sys_oper_type		info	N	0	admin	2025-12-10 03:11:21.819699		\N	修改操作
20	3	删除	3	sys_oper_type		danger	N	0	admin	2025-12-10 03:11:21.819699		\N	删除操作
21	4	授权	4	sys_oper_type		primary	N	0	admin	2025-12-10 03:11:21.819699		\N	授权操作
22	5	导出	5	sys_oper_type		warning	N	0	admin	2025-12-10 03:11:21.819699		\N	导出操作
23	6	导入	6	sys_oper_type		warning	N	0	admin	2025-12-10 03:11:21.819699		\N	导入操作
24	7	强退	7	sys_oper_type		danger	N	0	admin	2025-12-10 03:11:21.819699		\N	强退操作
25	8	生成代码	8	sys_oper_type		warning	N	0	admin	2025-12-10 03:11:21.819699		\N	生成操作
26	9	清空数据	9	sys_oper_type		danger	N	0	admin	2025-12-10 03:11:21.819699		\N	清空操作
27	1	成功	0	sys_common_status		primary	N	0	admin	2025-12-10 03:11:21.819699		\N	正常状态
28	2	失败	1	sys_common_status		danger	N	0	admin	2025-12-10 03:11:21.819699		\N	停用状态
\.


--
-- Data for Name: sys_dict_type; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sys_dict_type (dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark) FROM stdin;
2	菜单状态	sys_show_hide	0	admin	2021-05-26 18:56:30		\N	菜单状态列表
3	系统开关	sys_normal_disable	0	admin	2021-05-26 18:56:30		\N	系统开关列表
4	任务状态	sys_job_status	0	admin	2021-05-26 18:56:30		\N	任务状态列表
5	任务分组	sys_job_group	0	admin	2021-05-26 18:56:30		\N	任务分组列表
6	系统是否	sys_yes_no	0	admin	2021-05-26 18:56:30		\N	系统是否列表
7	通知类型	sys_notice_type	0	admin	2021-05-26 18:56:30		\N	通知类型列表
8	通知状态	sys_notice_status	0	admin	2021-05-26 18:56:30		\N	通知状态列表
9	操作类型	sys_oper_type	0	admin	2021-05-26 18:56:30		\N	操作类型列表
10	系统状态	sys_common_status	0	admin	2021-05-26 18:56:30		\N	登录状态列表
1	用户性别	sys_user_sex	0	admin	2021-05-26 18:56:30	admin	2021-05-27 10:07:12.015926	用户性别列表
\.


--
-- Data for Name: sys_file; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sys_file (id, parent_id, is_folder, file_name, original_name, file_type, file_size, file_path, file_url, content_hash, mime_type, business_type, business_id, status, process_progress, error_message, download_count, metadata, create_by, create_time, update_by, update_time, remark) FROM stdin;
8	0	1	1	1	folder	0	system_file/1	/profile/system_file/1	7f5a07cb4d16ce033e4b48b2f4593dda	\N	common	\N	1	\N	\N	\N	\N	admin	2025-12-19 10:06:05.427	\N	\N	\N
9	8	0	backgroud.png	backgroud.png	png	2591403	../upload/system_file/1/2025/12/19/backgroud_20251219100636A001.png	/profile/system_file/1/2025/12/19/backgroud_20251219100636A001.png	72b94476898f07b63c2f428ea6dac5e5	image/png	common	\N	1	100	\N	0	\N	admin	2025-12-19 10:06:36.413	\N	2025-12-19 10:06:48.280362	\N
\.


--
-- Data for Name: sys_job; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sys_job (job_id, job_name, job_group, invoke_target, cron_expression, misfire_policy, concurrent, status, create_by, create_time, update_by, update_time, remark) FROM stdin;
2	系统默认（有参）	DEFAULT	ryTask.ryParams('ry')	0/15 * * * * ?	3	1	1	admin	2021-05-26 18:56:31		\N	
3	系统默认（多参）	DEFAULT	ryTask.ryMultipleParams('ry', true, 2000L, 316.50D, 100)	0/20 * * * * ?	3	1	1	admin	2021-05-26 18:56:31		\N	
1	系统默认（无参）	DEFAULT	ryTask.ryNoParams	0/10 * * * * ?	3	1	1	admin	2021-05-26 18:56:31		2025-12-25 18:26:42.801783	
\.


--
-- Data for Name: sys_job_log; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sys_job_log (job_log_id, job_name, job_group, invoke_target, job_message, status, exception_info, create_time) FROM stdin;
1	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：1毫秒	0	\N	2025-12-25 18:19:50.023821
2	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:20:00.023141
3	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:20:10.018423
4	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:20:20.012423
5	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:20:30.017098
6	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:20:40.016691
7	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:20:50.013011
8	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:21:00.022928
9	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:21:10.015827
10	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:21:20.013846
11	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:21:30.017462
12	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:21:40.014783
13	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:21:50.012102
14	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：1毫秒	0	\N	2025-12-25 18:22:00.014991
15	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:22:10.016244
16	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:22:20.012372
17	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:22:30.017051
18	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:22:40.013999
19	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:22:50.012192
20	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:23:00.016149
21	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:23:10.013437
22	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:23:20.011188
23	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:23:30.016268
24	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:23:40.016146
25	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:23:50.012434
26	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:24:00.017122
27	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:24:10.015445
28	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:24:20.013071
29	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:24:30.015852
30	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:24:40.014657
31	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:24:50.010577
32	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:25:00.016148
33	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:25:10.010257
34	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:25:20.013504
35	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：1毫秒	0	\N	2025-12-25 18:25:30.01313
36	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:25:40.011424
37	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:25:50.014235
38	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:26:00.013589
39	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:26:10.011001
40	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:26:20.011515
41	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:26:30.013284
42	系统默认（无参）	DEFAULT	ryTask.ryNoParams	系统默认（无参） 总共耗时：0毫秒	0	\N	2025-12-25 18:26:40.010736
\.


--
-- Data for Name: sys_logininfor; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sys_logininfor (info_id, user_name, ipaddr, login_location, browser, os, status, msg, login_time) FROM stdin;
1	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	退出成功，Token已失效	2025-12-10 11:45:37.705929
2	ry	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-10 11:45:47.963307
3	ry	127.0.0.1	内网IP	Chrome 14	Windows 10	0	退出成功，Token已失效	2025-12-10 11:46:10.197076
4	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-10 11:46:14.528827
5	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	退出成功，Token已失效	2025-12-10 11:49:15.616063
6	ry	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-10 11:49:26.995092
7	ry	127.0.0.1	内网IP	Chrome 14	Windows 10	0	退出成功，Token已失效	2025-12-10 11:49:40.437988
8	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-10 11:49:45.176537
9	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	退出成功，Token已失效	2025-12-10 11:53:44.713152
10	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-10 11:53:49.375475
11	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	退出成功，Token已失效	2025-12-10 11:53:56.858908
12	ry	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-10 11:54:06.764319
13	ry	127.0.0.1	内网IP	Chrome 14	Windows 10	0	退出成功，Token已失效	2025-12-10 11:54:16.208679
14	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-10 11:54:21.42701
15	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-12 08:36:02.321254
16	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	1	验证码错误	2025-12-15 10:10:05.344695
17	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-15 10:10:10.960774
18	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-16 09:42:46.019246
19	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	退出成功，Token已失效	2025-12-16 09:48:00.006305
20	ry2	127.0.0.1	内网IP	Chrome 14	Windows 10	1	用户不存在/密码错误	2025-12-16 09:48:16.570179
21	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-16 09:49:30.752949
22	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	退出成功，Token已失效	2025-12-16 09:49:47.287263
23	ry	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-16 09:49:55.111141
24	ry	127.0.0.1	内网IP	Chrome 14	Windows 10	0	退出成功，Token已失效	2025-12-16 10:01:06.708734
25	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-16 10:01:12.49426
26	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-17 11:45:57.972611
27	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-17 15:59:47.996287
28	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	退出成功，Token已失效	2025-12-17 15:59:55.779816
29	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	1	验证码错误	2025-12-17 16:07:19.937341
30	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-17 16:07:28.768372
31	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	退出成功，Token已失效	2025-12-17 16:07:32.980711
32	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-17 16:36:30.760373
33	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-18 08:19:54.811157
34	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	退出成功，Token已失效	2025-12-18 08:52:51.644344
35	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-18 08:52:56.514997
36	admin	127.0.0.1	内网IP	Chrome 13	Windows 10	0	登录成功	2025-12-18 10:23:42.11639
37	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	退出成功，Token已失效	2025-12-18 11:16:09.138127
38	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-18 11:16:18.602148
39	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-18 15:59:42.912
40	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-19 08:55:17.861577
41	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	1	验证码已失效	2025-12-19 16:46:37.57919
42	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-19 16:46:40.674924
43	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-25 09:30:08.893902
44	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	退出成功，Token已失效	2025-12-25 09:30:14.092212
45	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-25 09:30:21.559263
46	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	退出成功，Token已失效	2025-12-25 09:31:18.446489
47	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-25 10:37:31.554144
48	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-25 11:09:56.814834
49	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-25 17:27:43.482132
50	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-25 18:19:01.135211
51	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	1	验证码已失效	2025-12-26 08:32:01.184912
52	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-26 08:32:05.500365
53	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-26 15:42:00.342935
54	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2025-12-29 09:12:47.466904
55	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2026-01-14 16:16:36.624077
56	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2026-01-15 08:49:03.242936
57	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2026-01-20 16:57:58.744504
58	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2026-01-20 17:38:51.265262
59	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2026-01-21 10:26:45.633621
60	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	退出成功，Token已失效	2026-01-22 10:44:28.167906
61	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	退出成功，Token已失效	2026-01-22 10:57:55.77498
62	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2026-01-28 17:24:05.450861
63	admin	172.18.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2026-01-28 17:43:27.941998
64	admin	172.18.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2026-01-29 09:55:35.258932
65	admin	172.18.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2026-01-29 16:32:07.811019
66	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	退出成功，Token已失效	2026-01-30 08:14:48.585328
67	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2026-01-30 08:15:22.579685
68	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	退出成功，Token已失效	2026-01-30 08:16:48.495731
69	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2026-01-30 08:17:08.662913
70	admin	172.18.0.1	内网IP	Chrome 14	Windows 10	1	验证码错误	2026-01-30 08:28:57.182171
71	admin	172.18.0.1	内网IP	Chrome 14	Windows 10	1	验证码错误	2026-01-30 08:29:21.691557
72	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	0	登录成功	2026-01-30 08:41:10.344447
73	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	1	验证码错误	2026-02-06 11:03:58.536785
74	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	1	验证码错误	2026-02-06 11:04:07.106451
75	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	1	验证码错误	2026-02-06 11:08:39.56279
76	admin 	127.0.0.1	内网IP	Chrome 14	Windows 10	1	验证码错误	2026-02-06 11:10:05.052801
77	admin	127.0.0.1	内网IP	Chrome 14	Windows 10	1	验证码错误	2026-02-06 11:15:16.933493
\.


--
-- Data for Name: sys_menu; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) FROM stdin;
3	系统工具	0	3	tool	\N			1	0	M	0	0		tool	admin	2025-12-10 03:11:21.819699		\N	系统工具目录
100	用户管理	1	1	user	system/user/index			1	0	C	0	0	system:user:list	user	admin	2025-12-10 03:11:21.819699		\N	用户管理菜单
101	角色管理	1	2	role	system/role/index			1	0	C	0	0	system:role:list	peoples	admin	2025-12-10 03:11:21.819699		\N	角色管理菜单
102	菜单管理	1	3	menu	system/menu/index			1	0	C	0	0	system:menu:list	tree-table	admin	2025-12-10 03:11:21.819699		\N	菜单管理菜单
103	部门管理	1	4	dept	system/dept/index			1	0	C	0	0	system:dept:list	tree	admin	2025-12-10 03:11:21.819699		\N	部门管理菜单
104	岗位管理	1	5	post	system/post/index			1	0	C	0	0	system:post:list	post	admin	2025-12-10 03:11:21.819699		\N	岗位管理菜单
105	字典管理	1	6	dict	system/dict/index			1	0	C	0	0	system:dict:list	dict	admin	2025-12-10 03:11:21.819699		\N	字典管理菜单
106	参数设置	1	7	config	system/config/index			1	0	C	0	0	system:config:list	edit	admin	2025-12-10 03:11:21.819699		\N	参数设置菜单
107	通知公告	1	8	notice	system/notice/index			1	0	C	0	0	system:notice:list	message	admin	2025-12-10 03:11:21.819699		\N	通知公告菜单
108	日志管理	1	9	log				1	0	M	0	0		log	admin	2025-12-10 03:11:21.819699		\N	日志管理菜单
109	在线用户	2	1	online	monitor/online/index			1	0	C	0	0	monitor:online:list	online	admin	2025-12-10 03:11:21.819699		\N	在线用户菜单
110	定时任务	2	2	job	monitor/job/index			1	0	C	0	0	monitor:job:list	job	admin	2025-12-10 03:11:21.819699		\N	定时任务菜单
111	数据监控	2	3	druid	monitor/druid/index			1	0	C	0	0	monitor:druid:list	druid	admin	2025-12-10 03:11:21.819699		\N	数据监控菜单
112	服务监控	2	4	server	monitor/server/index			1	0	C	0	0	monitor:server:list	server	admin	2025-12-10 03:11:21.819699		\N	服务监控菜单
113	缓存监控	2	5	cache	monitor/cache/index			1	0	C	0	0	monitor:cache:list	redis	admin	2025-12-10 03:11:21.819699		\N	缓存监控菜单
114	缓存列表	2	6	cacheList	monitor/cache/list			1	0	C	0	0	monitor:cache:list	redis-list	admin	2025-12-10 03:11:21.819699		\N	缓存列表菜单
115	表单构建	3	1	build	tool/build/index			1	0	C	0	0	tool:build:list	build	admin	2025-12-10 03:11:21.819699		\N	表单构建菜单
116	代码生成	3	2	gen	tool/gen/index			1	0	C	0	0	tool:gen:list	code	admin	2025-12-10 03:11:21.819699		\N	代码生成菜单
117	系统接口	3	3	swagger	tool/swagger/index			1	0	C	0	0	tool:swagger:list	swagger	admin	2025-12-10 03:11:21.819699		\N	系统接口菜单
500	操作日志	108	1	operlog	monitor/operlog/index			1	0	C	0	0	monitor:operlog:list	form	admin	2025-12-10 03:11:21.819699		\N	操作日志菜单
501	登录日志	108	2	logininfor	monitor/logininfor/index			1	0	C	0	0	monitor:logininfor:list	logininfor	admin	2025-12-10 03:11:21.819699		\N	登录日志菜单
1000	用户查询	100	1					1	0	F	0	0	system:user:query	#	admin	2025-12-10 03:11:21.819699		\N	
1001	用户新增	100	2					1	0	F	0	0	system:user:add	#	admin	2025-12-10 03:11:21.819699		\N	
1002	用户修改	100	3					1	0	F	0	0	system:user:edit	#	admin	2025-12-10 03:11:21.819699		\N	
1003	用户删除	100	4					1	0	F	0	0	system:user:remove	#	admin	2025-12-10 03:11:21.819699		\N	
1004	用户导出	100	5					1	0	F	0	0	system:user:export	#	admin	2025-12-10 03:11:21.819699		\N	
1005	用户导入	100	6					1	0	F	0	0	system:user:import	#	admin	2025-12-10 03:11:21.819699		\N	
1006	重置密码	100	7					1	0	F	0	0	system:user:resetPwd	#	admin	2025-12-10 03:11:21.819699		\N	
1007	角色查询	101	1					1	0	F	0	0	system:role:query	#	admin	2025-12-10 03:11:21.819699		\N	
1008	角色新增	101	2					1	0	F	0	0	system:role:add	#	admin	2025-12-10 03:11:21.819699		\N	
1009	角色修改	101	3					1	0	F	0	0	system:role:edit	#	admin	2025-12-10 03:11:21.819699		\N	
1010	角色删除	101	4					1	0	F	0	0	system:role:remove	#	admin	2025-12-10 03:11:21.819699		\N	
1011	角色导出	101	5					1	0	F	0	0	system:role:export	#	admin	2025-12-10 03:11:21.819699		\N	
1012	菜单查询	102	1					1	0	F	0	0	system:menu:query	#	admin	2025-12-10 03:11:21.819699		\N	
1013	菜单新增	102	2					1	0	F	0	0	system:menu:add	#	admin	2025-12-10 03:11:21.819699		\N	
1014	菜单修改	102	3					1	0	F	0	0	system:menu:edit	#	admin	2025-12-10 03:11:21.819699		\N	
1015	菜单删除	102	4					1	0	F	0	0	system:menu:remove	#	admin	2025-12-10 03:11:21.819699		\N	
1016	部门查询	103	1					1	0	F	0	0	system:dept:query	#	admin	2025-12-10 03:11:21.819699		\N	
1017	部门新增	103	2					1	0	F	0	0	system:dept:add	#	admin	2025-12-10 03:11:21.819699		\N	
1018	部门修改	103	3					1	0	F	0	0	system:dept:edit	#	admin	2025-12-10 03:11:21.819699		\N	
1019	部门删除	103	4					1	0	F	0	0	system:dept:remove	#	admin	2025-12-10 03:11:21.819699		\N	
1020	岗位查询	104	1					1	0	F	0	0	system:post:query	#	admin	2025-12-10 03:11:21.819699		\N	
1021	岗位新增	104	2					1	0	F	0	0	system:post:add	#	admin	2025-12-10 03:11:21.819699		\N	
1022	岗位修改	104	3					1	0	F	0	0	system:post:edit	#	admin	2025-12-10 03:11:22.032494		\N	
1023	岗位删除	104	4					1	0	F	0	0	system:post:remove	#	admin	2025-12-10 03:11:22.032494		\N	
1024	岗位导出	104	5					1	0	F	0	0	system:post:export	#	admin	2025-12-10 03:11:22.032494		\N	
1025	字典查询	105	1	#				1	0	F	0	0	system:dict:query	#	admin	2025-12-10 03:11:22.032494		\N	
1026	字典新增	105	2	#				1	0	F	0	0	system:dict:add	#	admin	2025-12-10 03:11:22.032494		\N	
1027	字典修改	105	3	#				1	0	F	0	0	system:dict:edit	#	admin	2025-12-10 03:11:22.032494		\N	
1028	字典删除	105	4	#				1	0	F	0	0	system:dict:remove	#	admin	2025-12-10 03:11:22.032494		\N	
1	系统管理	0	3	system	\N			1	0	M	0	0		system	admin	2025-12-10 03:11:21.819699	admin	2025-12-10 11:44:23.527302	系统管理目录
1029	字典导出	105	5	#				1	0	F	0	0	system:dict:export	#	admin	2025-12-10 03:11:22.032494		\N	
1030	参数查询	106	1	#				1	0	F	0	0	system:config:query	#	admin	2025-12-10 03:11:22.032494		\N	
1031	参数新增	106	2	#				1	0	F	0	0	system:config:add	#	admin	2025-12-10 03:11:22.032494		\N	
1032	参数修改	106	3	#				1	0	F	0	0	system:config:edit	#	admin	2025-12-10 03:11:22.032494		\N	
1033	参数删除	106	4	#				1	0	F	0	0	system:config:remove	#	admin	2025-12-10 03:11:22.032494		\N	
1034	参数导出	106	5	#				1	0	F	0	0	system:config:export	#	admin	2025-12-10 03:11:22.032494		\N	
1035	公告查询	107	1	#				1	0	F	0	0	system:notice:query	#	admin	2025-12-10 03:11:22.032494		\N	
1036	公告新增	107	2	#				1	0	F	0	0	system:notice:add	#	admin	2025-12-10 03:11:22.032494		\N	
1037	公告修改	107	3	#				1	0	F	0	0	system:notice:edit	#	admin	2025-12-10 03:11:22.032494		\N	
1038	公告删除	107	4	#				1	0	F	0	0	system:notice:remove	#	admin	2025-12-10 03:11:22.032494		\N	
1039	操作查询	500	1	#				1	0	F	0	0	monitor:operlog:query	#	admin	2025-12-10 03:11:22.032494		\N	
1040	操作删除	500	2	#				1	0	F	0	0	monitor:operlog:remove	#	admin	2025-12-10 03:11:22.032494		\N	
1041	日志导出	500	3	#				1	0	F	0	0	monitor:operlog:export	#	admin	2025-12-10 03:11:22.032494		\N	
1042	登录查询	501	1	#				1	0	F	0	0	monitor:logininfor:query	#	admin	2025-12-10 03:11:22.032494		\N	
1043	登录删除	501	2	#				1	0	F	0	0	monitor:logininfor:remove	#	admin	2025-12-10 03:11:22.032494		\N	
1044	日志导出	501	3	#				1	0	F	0	0	monitor:logininfor:export	#	admin	2025-12-10 03:11:22.032494		\N	
1045	账户解锁	501	4	#				1	0	F	0	0	monitor:logininfor:unlock	#	admin	2025-12-10 03:11:22.032494		\N	
1046	在线查询	109	1	#				1	0	F	0	0	monitor:online:query	#	admin	2025-12-10 03:11:22.032494		\N	
1047	批量强退	109	2	#				1	0	F	0	0	monitor:online:batchLogout	#	admin	2025-12-10 03:11:22.032494		\N	
1048	单条强退	109	3	#				1	0	F	0	0	monitor:online:forceLogout	#	admin	2025-12-10 03:11:22.032494		\N	
1049	任务查询	110	1	#				1	0	F	0	0	monitor:job:query	#	admin	2025-12-10 03:11:22.032494		\N	
1050	任务新增	110	2	#				1	0	F	0	0	monitor:job:add	#	admin	2025-12-10 03:11:22.032494		\N	
1051	任务修改	110	3	#				1	0	F	0	0	monitor:job:edit	#	admin	2025-12-10 03:11:22.032494		\N	
1052	任务删除	110	4	#				1	0	F	0	0	monitor:job:remove	#	admin	2025-12-10 03:11:22.032494		\N	
1053	状态修改	110	5	#				1	0	F	0	0	monitor:job:changeStatus	#	admin	2025-12-10 03:11:22.032494		\N	
1054	任务导出	110	6	#				1	0	F	0	0	monitor:job:export	#	admin	2025-12-10 03:11:22.032494		\N	
1055	生成查询	116	1	#				1	0	F	0	0	tool:gen:query	#	admin	2025-12-10 03:11:22.032494		\N	
1056	生成修改	116	2	#				1	0	F	0	0	tool:gen:edit	#	admin	2025-12-10 03:11:22.032494		\N	
1057	生成删除	116	3	#				1	0	F	0	0	tool:gen:remove	#	admin	2025-12-10 03:11:22.032494		\N	
1058	导入代码	116	4	#				1	0	F	0	0	tool:gen:import	#	admin	2025-12-10 03:11:22.032494		\N	
1059	预览代码	116	5	#				1	0	F	0	0	tool:gen:preview	#	admin	2025-12-10 03:11:22.032494		\N	
1060	生成代码	116	6	#				1	0	F	0	0	tool:gen:code	#	admin	2025-12-10 03:11:22.032494		\N	
2000	工单汇总	0	1	data_info_detail	data_info_detail/order/index	\N		1	0	C	0	0	\N	build	admin	2025-12-10 11:40:54.658218	\N	\N	\N
2001	查询1	2000	1	\N	\N	\N		1	0	F	0	0	unitdetail:unitdetail:list	\N	admin	2025-12-10 11:41:36.791919	admin	2025-12-10 11:42:26.925099	\N
2002	查询2	2000	2	\N	\N	\N		1	0	F	0	0	unitdetail:unitdetail:listAll	\N	admin	2025-12-10 11:42:02.311588	admin	2025-12-10 11:42:37.291242	\N
2003	工单明细	0	2	order_info_detail	data_info_detail/detail/index	\N		1	0	C	0	0	\N	FundOutlined	admin	2025-12-10 11:43:13.171619	\N	\N	\N
2	系统监控	0	5	monitor	\N			1	0	M	0	0		monitor	admin	2025-12-10 03:11:21.819699	admin	2025-12-10 11:44:38.341895	系统监控目录
2005	数据展示	0	6	\N	\N	\N		1	0	F	0	0	statistics:datainfo:list	\N	admin	2025-12-10 11:47:52.940374	\N	\N	\N
2004	查询1	2003	1	\N	\N	\N		1	0	F	0	0	orderinfo:info:list	\N	admin	2025-12-10 11:43:54.966873	admin	2025-12-10 11:49:10.581859	\N
2006	文件管理	1	11	file	system\\file\\index	\N		1	0	C	0	0	\N	FileTextOutlined	admin	2025-12-18 11:21:04.78023	admin	2025-12-18 11:22:08.803904	\N
\.


--
-- Data for Name: sys_notice; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sys_notice (notice_id, notice_title, notice_type, notice_content, status, create_by, create_time, update_by, update_time, remark) FROM stdin;
2	维护通知：2018-07-01 若依系统凌晨维护	1	\\xe7bbb4e68aa4e58685e5aeb9	0	admin	2021-05-26 18:56:31		\N	管理员
1	温馨提醒：2018-07-01 若依新版本发布啦	2	\\	0	admin	2021-05-26 18:56:31	admin	2021-05-27 09:08:41.403262	管理员
\.


--
-- Data for Name: sys_oper_log; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sys_oper_log (oper_id, title, business_type, method, request_method, operator_type, oper_name, dept_name, oper_url, oper_ip, oper_location, oper_param, json_result, status, error_msg, oper_time, cost_time) FROM stdin;
1	菜单管理	3	com.ctbc.web.controller.system.SysMenuController.remove()	DELETE	1	admin	\N	/system/menu/4	127.0.0.1	内网IP	4	{"msg":"菜单已分配,不允许删除","code":601}	0	\N	2025-12-10 11:34:58.06368	10
2	菜单管理	2	com.ctbc.web.controller.system.SysMenuController.edit()	PUT	1	admin	\N	/system/menu	127.0.0.1	内网IP	{"children":[],"createTime":"2025-12-10 03:11:21","icon":"guide","isCache":"0","isFrame":"0","menuId":4,"menuName":"若依官网","menuType":"M","orderNum":4,"params":{},"parentId":0,"path":"http://ruoyi.vip","query":"","routeName":"","status":"1","updateBy":"admin","visible":"1"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:35:04.681069	13
3	菜单管理	3	com.ctbc.web.controller.system.SysMenuController.remove()	DELETE	1	admin	\N	/system/menu/4	127.0.0.1	内网IP	4	{"msg":"菜单已分配,不允许删除","code":601}	0	\N	2025-12-10 11:35:07.350431	4
4	菜单管理	3	com.ctbc.web.controller.system.SysMenuController.remove()	DELETE	1	admin	\N	/system/menu/4	127.0.0.1	内网IP	4	{"msg":"菜单已分配,不允许删除","code":601}	0	\N	2025-12-10 11:35:22.206351	4
5	角色管理	2	com.ctbc.web.controller.system.SysRoleController.edit()	PUT	1	admin	\N	/system/role	127.0.0.1	内网IP	{"admin":false,"createTime":"2021-05-26 18:56:28","dataScope":"5","delFlag":"0","deptCheckStrictly":false,"deptIds":[],"flag":false,"menuCheckStrictly":false,"menuIds":[100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,500,501,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1039,1040,1041,1042,1043,1044,1045],"params":{},"remark":"普通角色","roleId":2,"roleKey":"common","roleName":"普通角色","roleSort":4,"status":"0","updateBy":"admin"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:37:10.717439	37
6	角色管理	2	com.ctbc.web.controller.system.SysRoleController.dataScope()	PUT	1	admin	\N	/system/role/dataScope	127.0.0.1	内网IP	{"admin":false,"createTime":"2021-05-26 18:56:28","dataScope":"5","delFlag":"0","deptCheckStrictly":false,"deptIds":[],"flag":false,"menuCheckStrictly":false,"menuIds":[100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,500,501,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1039,1040,1041,1042,1043,1044,1045],"params":{},"remark":"普通角色","roleId":2,"roleKey":"common","roleName":"普通角色","roleSort":4,"status":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:37:11.041903	8
7	角色管理	1	com.ctbc.web.controller.system.SysRoleController.add()	POST	1	admin	\N	/system/role	127.0.0.1	内网IP	{"admin":false,"createBy":"admin","dataScope":"4","delFlag":"","deptCheckStrictly":false,"deptIds":[],"flag":false,"menuCheckStrictly":false,"menuIds":[1,100,1000,103,1016],"params":{},"remark":"管控部","roleId":3,"roleKey":"center_manager","roleName":"管控部管理员","roleSort":2,"status":"0","updateBy":""}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:38:30.178945	11
8	角色管理	2	com.ctbc.web.controller.system.SysRoleController.dataScope()	PUT	1	admin	\N	/system/role/dataScope	127.0.0.1	内网IP	{"admin":false,"createBy":"","dataScope":"4","delFlag":"","deptCheckStrictly":false,"deptIds":[],"flag":false,"menuCheckStrictly":false,"menuIds":[1,100,1000,103,1016],"params":{},"remark":"管控部","roleKey":"center_manager","roleName":"管控部管理员","roleSort":2,"status":"0","updateBy":""}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:38:30.427201	6
9	角色管理	1	com.ctbc.web.controller.system.SysRoleController.add()	POST	1	admin	\N	/system/role	127.0.0.1	内网IP	{"admin":false,"createBy":"","dataScope":"4","delFlag":"","deptCheckStrictly":false,"deptIds":[],"flag":false,"menuCheckStrictly":false,"menuIds":[1,100,1000],"params":{},"remark":"管控部","roleKey":"center_manager","roleName":"经营单位管理员","roleSort":3,"status":"0","updateBy":""}	{"msg":"新增角色'经营单位管理员'失败，角色权限已存在","code":500}	0	\N	2025-12-10 11:39:12.637892	5
10	角色管理	1	com.ctbc.web.controller.system.SysRoleController.add()	POST	1	admin	\N	/system/role	127.0.0.1	内网IP	{"admin":false,"createBy":"admin","dataScope":"4","delFlag":"","deptCheckStrictly":false,"deptIds":[],"flag":false,"menuCheckStrictly":false,"menuIds":[1,100,1000],"params":{},"remark":"经营单位","roleId":4,"roleKey":"sale_center_manager","roleName":"经营单位管理员","roleSort":3,"status":"0","updateBy":""}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:39:40.308996	9
11	角色管理	2	com.ctbc.web.controller.system.SysRoleController.dataScope()	PUT	1	admin	\N	/system/role/dataScope	127.0.0.1	内网IP	{"admin":false,"createBy":"","dataScope":"4","delFlag":"","deptCheckStrictly":false,"deptIds":[],"flag":false,"menuCheckStrictly":false,"menuIds":[1,100,1000],"params":{},"remark":"经营单位","roleKey":"sale_center_manager","roleName":"经营单位管理员","roleSort":3,"status":"0","updateBy":""}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:39:40.572065	5
12	用户管理	2	com.ctbc.web.controller.system.SysUserController.edit()	PUT	1	admin	\N	/system/user	127.0.0.1	内网IP	{"admin":false,"avatar":"","createBy":"admin","createTime":"2021-05-26 18:56:28","delFlag":"0","dept":{"ancestors":"0,814","children":[],"deptId":84909,"deptName":"德保分公司","orderNum":5,"params":{},"parentId":814,"status":"0"},"deptId":84909,"email":"ry@qq.com","loginDate":"2021-05-26 18:56:28","loginIp":"127.0.0.1","nickName":"若依","params":{},"phonenumber":"15666666666","postIds":[],"pwdUpdateDate":"2021-05-26 18:56:28","remark":"测试员","roleIds":[4],"roles":[{"admin":false,"dataScope":"5","deptCheckStrictly":false,"flag":false,"menuCheckStrictly":false,"params":{},"roleId":2,"roleKey":"common","roleName":"普通角色","roleSort":4,"status":"0"}],"sex":"1","staffCode":"2","status":"0","updateBy":"admin","userId":2,"userName":"ry"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:40:01.339484	19
13	菜单管理	1	com.ctbc.web.controller.system.SysMenuController.add()	POST	1	admin	\N	/system/menu	127.0.0.1	内网IP	{"children":[],"component":"data_info_detail/order/index","createBy":"admin","icon":"build","isFrame":"1","menuName":"工单汇总","menuType":"C","orderNum":1,"params":{},"parentId":0,"path":"data_info_detail","status":"0","visible":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:40:54.679344	10
14	菜单管理	1	com.ctbc.web.controller.system.SysMenuController.add()	POST	1	admin	\N	/system/menu	127.0.0.1	内网IP	{"children":[],"component":"","createBy":"admin","icon":"","isCache":"","isFrame":"1","menuName":"查询1","menuType":"F","orderNum":1,"params":{},"parentId":2000,"parentName":"","path":"","perms":"/unitdetail/unitdetail/list","query":"","remark":"","routeName":"","status":"0","updateBy":"","visible":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:41:36.816422	8
15	菜单管理	1	com.ctbc.web.controller.system.SysMenuController.add()	POST	1	admin	\N	/system/menu	127.0.0.1	内网IP	{"children":[],"component":"","createBy":"admin","icon":"","isCache":"","isFrame":"1","menuName":"查询2","menuType":"F","orderNum":2,"params":{},"parentId":2000,"parentName":"","path":"","perms":"/unitdetail/unitdetail/listAll","query":"","remark":"","routeName":"","status":"0","updateBy":"","visible":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:42:02.333002	9
16	菜单管理	2	com.ctbc.web.controller.system.SysMenuController.edit()	PUT	1	admin	\N	/system/menu	127.0.0.1	内网IP	{"children":[],"createTime":"2025-12-10 11:41:36","isCache":"0","isFrame":"1","menuId":2001,"menuName":"查询1","menuType":"F","orderNum":1,"params":{},"parentId":2000,"perms":"unitdetail:unitdetail:list","routeName":"","status":"0","updateBy":"admin","visible":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:42:26.947819	7
17	菜单管理	2	com.ctbc.web.controller.system.SysMenuController.edit()	PUT	1	admin	\N	/system/menu	127.0.0.1	内网IP	{"children":[],"createTime":"2025-12-10 11:42:02","isCache":"0","isFrame":"1","menuId":2002,"menuName":"查询2","menuType":"F","orderNum":2,"params":{},"parentId":2000,"perms":"unitdetail:unitdetail:listAll","routeName":"","status":"0","updateBy":"admin","visible":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:42:37.311122	6
18	菜单管理	1	com.ctbc.web.controller.system.SysMenuController.add()	POST	1	admin	\N	/system/menu	127.0.0.1	内网IP	{"children":[],"component":"data_info_detail/detail/index","createBy":"admin","icon":"FundOutlined","isCache":"","isFrame":"1","menuName":"工单明细","menuType":"C","orderNum":2,"params":{},"parentId":0,"parentName":"","path":"order_info_detail","perms":"","query":"","remark":"","routeName":"","status":"0","updateBy":"","visible":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:43:13.196495	5
19	菜单管理	1	com.ctbc.web.controller.system.SysMenuController.add()	POST	1	admin	\N	/system/menu	127.0.0.1	内网IP	{"children":[],"component":"","createBy":"admin","icon":"","isCache":"","isFrame":"1","menuName":"查询1","menuType":"F","orderNum":1,"params":{},"parentId":0,"parentName":"","path":"","perms":"orderinfo:orderinfo:list","query":"","remark":"","routeName":"","status":"0","updateBy":"","visible":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:43:54.99182	6
20	菜单管理	2	com.ctbc.web.controller.system.SysMenuController.edit()	PUT	1	admin	\N	/system/menu	127.0.0.1	内网IP	{"children":[],"createTime":"2025-12-10 11:43:54","isCache":"0","isFrame":"1","menuId":2004,"menuName":"查询1","menuType":"F","orderNum":1,"params":{},"parentId":2003,"perms":"orderinfo:orderinfo:list","routeName":"","status":"0","updateBy":"admin","visible":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:44:08.620946	9
21	菜单管理	2	com.ctbc.web.controller.system.SysMenuController.edit()	PUT	1	admin	\N	/system/menu	127.0.0.1	内网IP	{"children":[],"createTime":"2025-12-10 03:11:21","icon":"system","isCache":"0","isFrame":"1","menuId":1,"menuName":"系统管理","menuType":"M","orderNum":3,"params":{},"parentId":0,"path":"system","query":"","routeName":"","status":"0","updateBy":"admin","visible":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:44:23.549831	9
22	菜单管理	2	com.ctbc.web.controller.system.SysMenuController.edit()	PUT	1	admin	\N	/system/menu	127.0.0.1	内网IP	{"children":[],"createTime":"2025-12-10 03:11:21","icon":"monitor","isCache":"0","isFrame":"1","menuId":2,"menuName":"系统监控","menuType":"M","orderNum":4,"params":{},"parentId":0,"path":"monitor","query":"","routeName":"","status":"0","updateBy":"admin","visible":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:44:33.371979	7
23	菜单管理	2	com.ctbc.web.controller.system.SysMenuController.edit()	PUT	1	admin	\N	/system/menu	127.0.0.1	内网IP	{"children":[],"createTime":"2025-12-10 03:11:21","icon":"monitor","isCache":"0","isFrame":"1","menuId":2,"menuName":"系统监控","menuType":"M","orderNum":5,"params":{},"parentId":0,"path":"monitor","query":"","routeName":"","status":"0","updateBy":"admin","visible":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:44:38.35898	6
30	用户管理	2	com.ctbc.web.controller.system.SysUserController.resetPwd()	PUT	1	admin	\N	/system/user/resetPwd	127.0.0.1	内网IP	{"admin":false,"params":{},"updateBy":"admin","userId":2}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:45:35.997845	70
32	角色管理	2	com.ctbc.web.controller.system.SysRoleController.edit()	PUT	1	admin	百色分公司	/system/role	127.0.0.1	内网IP	{"admin":false,"createTime":"2025-12-10 11:38:30","dataScope":"4","delFlag":"0","deptCheckStrictly":false,"deptIds":[],"flag":false,"menuCheckStrictly":false,"menuIds":[2000,2003,1,100,103,1000,1016,2001,2002,2004,2005],"params":{},"remark":"管控部","roleId":3,"roleKey":"center_manager","roleName":"管控部管理员","roleSort":2,"status":"0","updateBy":"admin"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:48:07.448197	15
33	角色管理	2	com.ctbc.web.controller.system.SysRoleController.dataScope()	PUT	1	admin	百色分公司	/system/role/dataScope	127.0.0.1	内网IP	{"admin":false,"createTime":"2025-12-10 11:38:30","dataScope":"4","delFlag":"0","deptCheckStrictly":false,"deptIds":[],"flag":false,"menuCheckStrictly":false,"menuIds":[2000,2003,1,100,103,1000,1016,2001,2002,2004,2005],"params":{},"remark":"管控部","roleId":3,"roleKey":"center_manager","roleName":"管控部管理员","roleSort":2,"status":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:48:07.773773	7
34	角色管理	2	com.ctbc.web.controller.system.SysRoleController.edit()	PUT	1	admin	百色分公司	/system/role	127.0.0.1	内网IP	{"admin":false,"createTime":"2025-12-10 11:39:40","dataScope":"4","delFlag":"0","deptCheckStrictly":false,"deptIds":[],"flag":false,"menuCheckStrictly":false,"menuIds":[2000,2003,1,100,1000,2001,2002,2004,2005],"params":{},"remark":"经营单位","roleId":4,"roleKey":"sale_center_manager","roleName":"经营单位管理员","roleSort":3,"status":"0","updateBy":"admin"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:48:12.744063	12
35	角色管理	2	com.ctbc.web.controller.system.SysRoleController.dataScope()	PUT	1	admin	百色分公司	/system/role/dataScope	127.0.0.1	内网IP	{"admin":false,"createTime":"2025-12-10 11:39:40","dataScope":"4","delFlag":"0","deptCheckStrictly":false,"deptIds":[],"flag":false,"menuCheckStrictly":false,"menuIds":[2000,2003,1,100,1000,2001,2002,2004,2005],"params":{},"remark":"经营单位","roleId":4,"roleKey":"sale_center_manager","roleName":"经营单位管理员","roleSort":3,"status":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:48:13.07181	7
47	用户头像	2	com.ctbc.web.controller.system.SysProfileController.avatar()	POST	1	admin	百色分公司	/system/user/profile/avatar	127.0.0.1	内网IP		{"msg":"操作成功","imgUrl":"/profile/avatar/2025/12/18/e071da1a7b5e455e9ef2674db5520f6d.png","code":200}	0	\N	2025-12-18 16:38:10.377007	99
48	个人信息	2	com.ctbc.web.controller.system.SysProfileController.updateProfile()	PUT	1	admin	百色分公司	/system/user/profile	127.0.0.1	内网IP	{"admin":false,"email":"ry@163.com","nickName":"电","params":{},"phonenumber":"15888888888","sex":"1"}	{"msg":"操作成功","code":200}	0	\N	2025-12-18 16:38:12.861138	14
24	角色管理	2	com.ctbc.web.controller.system.SysRoleController.edit()	PUT	1	admin	\N	/system/role	127.0.0.1	内网IP	{"admin":false,"createTime":"2025-12-10 11:38:30","dataScope":"4","delFlag":"0","deptCheckStrictly":false,"deptIds":[],"flag":false,"menuCheckStrictly":false,"menuIds":[1,100,103,1000,1016,2000,2001,2002,2003,2004],"params":{},"remark":"管控部","roleId":3,"roleKey":"center_manager","roleName":"管控部管理员","roleSort":2,"status":"0","updateBy":"admin"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:45:01.165618	13
25	角色管理	2	com.ctbc.web.controller.system.SysRoleController.dataScope()	PUT	1	admin	\N	/system/role/dataScope	127.0.0.1	内网IP	{"admin":false,"createTime":"2025-12-10 11:38:30","dataScope":"4","delFlag":"0","deptCheckStrictly":false,"deptIds":[],"flag":false,"menuCheckStrictly":false,"menuIds":[1,100,103,1000,1016,2000,2001,2002,2003,2004],"params":{},"remark":"管控部","roleId":3,"roleKey":"center_manager","roleName":"管控部管理员","roleSort":2,"status":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:45:01.490013	11
26	角色管理	2	com.ctbc.web.controller.system.SysRoleController.edit()	PUT	1	admin	\N	/system/role	127.0.0.1	内网IP	{"admin":false,"createTime":"2021-05-26 18:56:28","dataScope":"5","delFlag":"0","deptCheckStrictly":false,"deptIds":[],"flag":false,"menuCheckStrictly":false,"menuIds":[100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,500,501,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1039,1040,1041,1042,1043,1044,1045,2000,2003,2004,2001,2002],"params":{},"remark":"普通角色","roleId":2,"roleKey":"common","roleName":"普通角色","roleSort":4,"status":"0","updateBy":"admin"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:45:09.517186	18
27	角色管理	2	com.ctbc.web.controller.system.SysRoleController.dataScope()	PUT	1	admin	\N	/system/role/dataScope	127.0.0.1	内网IP	{"admin":false,"createTime":"2021-05-26 18:56:28","dataScope":"5","delFlag":"0","deptCheckStrictly":false,"deptIds":[],"flag":false,"menuCheckStrictly":false,"menuIds":[100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,500,501,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1039,1040,1041,1042,1043,1044,1045,2000,2003,2004,2001,2002],"params":{},"remark":"普通角色","roleId":2,"roleKey":"common","roleName":"普通角色","roleSort":4,"status":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:45:09.837652	11
28	角色管理	2	com.ctbc.web.controller.system.SysRoleController.edit()	PUT	1	admin	\N	/system/role	127.0.0.1	内网IP	{"admin":false,"createTime":"2025-12-10 11:39:40","dataScope":"4","delFlag":"0","deptCheckStrictly":false,"deptIds":[],"flag":false,"menuCheckStrictly":false,"menuIds":[1,100,1000,2002,2001,2000,2004,2003],"params":{},"remark":"经营单位","roleId":4,"roleKey":"sale_center_manager","roleName":"经营单位管理员","roleSort":3,"status":"0","updateBy":"admin"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:45:19.894779	17
29	角色管理	2	com.ctbc.web.controller.system.SysRoleController.dataScope()	PUT	1	admin	\N	/system/role/dataScope	127.0.0.1	内网IP	{"admin":false,"createTime":"2025-12-10 11:39:40","dataScope":"4","delFlag":"0","deptCheckStrictly":false,"deptIds":[],"flag":false,"menuCheckStrictly":false,"menuIds":[1,100,1000,2002,2001,2000,2004,2003],"params":{},"remark":"经营单位","roleId":4,"roleKey":"sale_center_manager","roleName":"经营单位管理员","roleSort":3,"status":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:45:20.218667	11
31	菜单管理	1	com.ctbc.web.controller.system.SysMenuController.add()	POST	1	admin	百色分公司	/system/menu	127.0.0.1	内网IP	{"children":[],"createBy":"admin","isFrame":"1","menuName":"数据展示","menuType":"F","orderNum":6,"params":{},"parentId":0,"perms":"statistics:datainfo:list","status":"0","visible":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:47:52.96068	9
36	角色管理	2	com.ctbc.web.controller.system.SysRoleController.edit()	PUT	1	admin	百色分公司	/system/role	127.0.0.1	内网IP	{"admin":false,"createTime":"2021-05-26 18:56:28","dataScope":"5","delFlag":"0","deptCheckStrictly":false,"deptIds":[],"flag":false,"menuCheckStrictly":false,"menuIds":[2000,2003,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,500,501,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1039,1040,1041,1042,1043,1044,1045,2001,2002,2004,2005],"params":{},"remark":"普通角色","roleId":2,"roleKey":"common","roleName":"普通角色","roleSort":4,"status":"0","updateBy":"admin"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:48:16.74656	18
37	角色管理	2	com.ctbc.web.controller.system.SysRoleController.dataScope()	PUT	1	admin	百色分公司	/system/role/dataScope	127.0.0.1	内网IP	{"admin":false,"createTime":"2021-05-26 18:56:28","dataScope":"5","delFlag":"0","deptCheckStrictly":false,"deptIds":[],"flag":false,"menuCheckStrictly":false,"menuIds":[2000,2003,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1038,500,501,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1058,1059,1060,1039,1040,1041,1042,1043,1044,1045,2001,2002,2004,2005],"params":{},"remark":"普通角色","roleId":2,"roleKey":"common","roleName":"普通角色","roleSort":4,"status":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:48:17.072572	7
38	用户管理	2	com.ctbc.web.controller.system.SysUserController.edit()	PUT	1	admin	百色分公司	/system/user	127.0.0.1	内网IP	{"admin":false,"avatar":"","createBy":"admin","createTime":"2021-05-26 18:56:28","delFlag":"0","dept":{"ancestors":"0,814","children":[],"deptId":84909,"deptName":"德保分公司","orderNum":5,"params":{},"parentId":814,"status":"0"},"deptId":84909,"email":"ry@qq.com","loginDate":"2025-12-10 11:45:47.948","loginIp":"127.0.0.1","nickName":"若依","params":{},"phonenumber":"15666666666","postIds":[],"pwdUpdateDate":"2025-12-10 11:45:35.974","remark":"测试员","roleIds":[4],"roles":[{"admin":false,"dataScope":"4","deptCheckStrictly":false,"flag":false,"menuCheckStrictly":false,"params":{},"roleId":4,"roleKey":"sale_center_manager","roleName":"经营单位管理员","roleSort":3,"status":"0"}],"sex":"1","staffCode":"2","status":"0","updateBy":"admin","userId":2,"userName":"ry"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:48:31.370155	13
39	菜单管理	2	com.ctbc.web.controller.system.SysMenuController.edit()	PUT	1	admin	百色分公司	/system/menu	127.0.0.1	内网IP	{"children":[],"createTime":"2025-12-10 11:43:54","isCache":"0","isFrame":"1","menuId":2004,"menuName":"查询1","menuType":"F","orderNum":1,"params":{},"parentId":2003,"perms":"orderinfo:info:list","routeName":"","status":"0","updateBy":"admin","visible":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-10 11:49:10.59982	7
40	个人信息	2	com.ctbc.web.controller.system.SysProfileController.updateProfile()	PUT	1	admin	百色分公司	/system/user/profile	127.0.0.1	内网IP	{"admin":false,"email":"ry@163.com","nickName":"电","params":{},"phonenumber":"15888888888","sex":"1"}	{"msg":"操作成功","code":200}	0	\N	2025-12-16 09:43:15.001087	14
41	用户管理	2	com.ctbc.web.controller.system.SysUserController.edit()	PUT	1	admin	百色分公司	/system/user	127.0.0.1	内网IP	{"admin":false,"avatar":"","createBy":"admin","createTime":"2021-05-26 18:56:28","delFlag":"0","dept":{"ancestors":"0,814","children":[],"deptId":84909,"deptName":"德保分公司","orderNum":5,"params":{},"parentId":814,"status":"0"},"deptId":84909,"email":"ry@qq.com","loginDate":"2025-12-10 11:54:06.736","loginIp":"127.0.0.1","nickName":"若依","params":{},"phonenumber":"15666666666","postIds":[],"pwdUpdateDate":"2025-12-10 11:45:35.974","remark":"测试员","roleIds":[4],"roles":[{"admin":false,"dataScope":"4","deptCheckStrictly":false,"flag":false,"menuCheckStrictly":false,"params":{},"roleId":4,"roleKey":"sale_center_manager","roleName":"经营单位管理员","roleSort":3,"status":"0"}],"sex":"1","staffCode":"2","status":"0","updateBy":"admin","userId":2,"userName":"ry"}	{"msg":"操作成功","code":200}	0	\N	2025-12-16 09:49:45.573671	26
42	用户头像	2	com.ctbc.web.controller.system.SysProfileController.avatar()	POST	1	admin	百色分公司	/system/user/profile/avatar	127.0.0.1	内网IP		\N	1	Cannot invoke "String.length()" because the return value of "com.ctbc.common.config.RuoYiConfig.getProfile()" is null	2025-12-18 08:57:07.466462	95
43	菜单管理	1	com.ctbc.web.controller.system.SysMenuController.add()	POST	1	admin	百色分公司	/system/menu	127.0.0.1	内网IP	{"children":[],"component":"system\\\\file\\\\index.vue","createBy":"admin","isFrame":"1","menuName":"文件管理","menuType":"C","orderNum":11,"params":{},"parentId":1,"status":"0","visible":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-18 11:21:04.803254	16
44	菜单管理	2	com.ctbc.web.controller.system.SysMenuController.edit()	PUT	1	admin	百色分公司	/system/menu	127.0.0.1	内网IP	{"children":[],"component":"system\\\\file\\\\index","createTime":"2025-12-18 11:21:04","icon":"FileTextOutlined","isCache":"0","isFrame":"1","menuId":2006,"menuName":"文件管理","menuType":"C","orderNum":11,"params":{},"parentId":1,"path":"file","routeName":"","status":"0","updateBy":"admin","visible":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-18 11:22:08.827651	7
45	用户头像	2	com.ctbc.web.controller.system.SysProfileController.avatar()	POST	1	admin	百色分公司	/system/user/profile/avatar	127.0.0.1	内网IP		\N	1	Cannot invoke "String.length()" because the return value of "com.ctbc.common.config.RuoYiConfig.getProfile()" is null	2025-12-18 16:24:37.407939	77
46	文件管理	1	com.ctbc.system.controller.SysFileController.uploadFile()	POST	1	admin	百色分公司	/system/file/upload	127.0.0.1	内网IP	{"businessType":"common","parentId":"0"}	{"msg":"上传文件失败: 文件上传失败: \\r\\n### Error querying database.  Cause: org.postgresql.util.PSQLException: ERROR: operator does not exist: character varying <> integer\\n  建议：No operator matches the given name and argument types. You might need to add explicit type casts.\\n  位置：379\\r\\n### The error may exist in file [D:\\\\CodeDoc\\\\EquipmentM\\\\ctbc-system\\\\target\\\\classes\\\\mapper\\\\system\\\\SysFileMapper.xml]\\r\\n### The error may involve com.ctbc.system.mapper.SysFileMapper.selectFileByContentHash-Inline\\r\\n### The error occurred while setting parameters\\r\\n### SQL: select id, parent_id, is_folder, file_name, original_name, file_type, file_size, file_path, file_url, content_hash, mime_type,                business_type, business_id, status, process_progress, error_message, download_count, metadata,                create_by, create_time, update_by, update_time, remark         from sys_file               where content_hash = ? and status != 0         limit 1\\r\\n### Cause: org.postgresql.util.PSQLException: ERROR: operator does not exist: character varying <> integer\\n  建议：No operator matches the given name and argument types. You might need to add explicit type casts.\\n  位置：379\\n; bad SQL grammar []","code":500}	0	\N	2025-12-18 16:35:35.224044	85
49	文件管理	1	com.ctbc.system.controller.SysFileController.uploadFile()	POST	1	admin	百色分公司	/system/file/upload	127.0.0.1	内网IP	{"businessType":"common","parentId":"0"}	{"msg":"操作成功","code":200,"data":{"businessType":"common","contentHash":"004c32e7e3f7ebd1d4c280959eac33f4","createBy":"admin","createTime":"2025-12-18 16:38:26","downloadCount":0,"fileName":"logo.png","filePath":"../upload//2025/12/18/logo_20251218163826A001.png","fileSize":829855,"fileType":"png","fileUrl":"/profile//2025/12/18/logo_20251218163826A001.png","id":1,"mimeType":"image/png","originalName":"logo.png","params":{},"parentId":0,"processProgress":100,"status":"1"}}	0	\N	2025-12-18 16:38:26.340874	27
50	文件管理	1	com.ctbc.system.controller.SysFileController.uploadFile()	POST	1	admin	百色分公司	/system/file/upload	127.0.0.1	内网IP	{"businessType":"common","parentId":"0"}	{"msg":"上传文件失败: 文件上传失败: null","code":500}	0	\N	2025-12-18 16:44:36.760313	13
51	用户头像	2	com.ctbc.web.controller.system.SysProfileController.avatar()	POST	1	admin	百色分公司	/system/user/profile/avatar	127.0.0.1	内网IP		{"msg":"操作成功","imgUrl":"/profile/avatar/2025/12/18/26cfdbcf3acd441d8caa539c4d0c1f6b.png","code":200}	0	\N	2025-12-18 16:44:57.00502	31
52	个人信息	2	com.ctbc.web.controller.system.SysProfileController.updateProfile()	PUT	1	admin	百色分公司	/system/user/profile	127.0.0.1	内网IP	{"admin":false,"email":"ry@163.com","nickName":"电","params":{},"phonenumber":"15888888888","sex":"1"}	{"msg":"操作成功","code":200}	0	\N	2025-12-18 16:44:58.994822	9
53	用户头像	2	com.ctbc.web.controller.system.SysProfileController.avatar()	POST	1	admin	百色分公司	/system/user/profile/avatar	127.0.0.1	内网IP		{"msg":"操作成功","imgUrl":"/profile/avatar/2025/12/18/37fcdaed789442cbbf9abc815f5f94b5.png","code":200}	0	\N	2025-12-18 16:55:17.627317	15
54	用户头像	2	com.ctbc.web.controller.system.SysProfileController.avatar()	POST	1	admin	百色分公司	/system/user/profile/avatar	127.0.0.1	内网IP		{"msg":"操作成功","imgUrl":"/profile/avatar/2025/12/18/451f392305ba46fb92335b1a2bb34e51.png","code":200}	0	\N	2025-12-18 16:56:47.140857	7
55	个人信息	2	com.ctbc.web.controller.system.SysProfileController.updateProfile()	PUT	1	admin	百色分公司	/system/user/profile	127.0.0.1	内网IP	{"admin":false,"email":"ry@163.com","nickName":"电","params":{},"phonenumber":"15888888888","sex":"1"}	{"msg":"操作成功","code":200}	0	\N	2025-12-18 16:56:48.062621	10
56	个人信息	2	com.ctbc.web.controller.system.SysProfileController.updateProfile()	PUT	1	admin	百色分公司	/system/user/profile	127.0.0.1	内网IP	{"admin":false,"email":"ry@163.com","nickName":"电","params":{},"phonenumber":"15888888888","sex":"1"}	{"msg":"操作成功","code":200}	0	\N	2025-12-18 16:56:49.270397	8
57	文件管理	1	com.ctbc.system.controller.SysFileController.uploadFile()	POST	1	admin	百色分公司	/system/file/upload	127.0.0.1	内网IP	{"businessType":"common","parentId":"0"}	{"msg":"操作成功","code":200,"data":{"businessType":"common","contentHash":"004c32e7e3f7ebd1d4c280959eac33f4","createBy":"admin","createTime":"2025-12-18 16:57:11","downloadCount":0,"fileName":"logo.png","filePath":"../upload//2025/12/18/logo_20251218165711A001.png","fileSize":829855,"fileType":"png","fileUrl":"/profile//2025/12/18/logo_20251218165711A001.png","id":2,"mimeType":"image/png","originalName":"logo.png","params":{},"parentId":0,"processProgress":100,"status":"1"}}	0	\N	2025-12-18 16:57:11.741163	18
58	用户头像	1	com.ctbc.system.controller.SysFileController.uploadUserAvatar()	POST	1	admin	百色分公司	/system/file/upload/avatar	127.0.0.1	内网IP	{"businessId":"1","businessType":"avatar","parentId":"0"}	{"msg":"上传用户头像失败: 文件上传失败: null","code":500}	0	\N	2025-12-18 17:03:37.766305	13
59	个人信息	2	com.ctbc.web.controller.system.SysProfileController.updateProfile()	PUT	1	admin	百色分公司	/system/user/profile	127.0.0.1	内网IP	{"admin":false,"email":"ry@163.com","nickName":"無","params":{},"phonenumber":"15888888888","sex":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-18 17:07:38.143959	12
60	用户头像	2	com.ctbc.web.controller.system.SysProfileController.avatar()	POST	1	admin	百色分公司	/system/user/profile/avatar	127.0.0.1	内网IP		{"msg":"操作成功","imgUrl":"/profile/avatar/2025/12/18/1fb557dccf0e43cea541e2b567c6ffb6.png","code":200}	0	\N	2025-12-18 17:57:00.469107	18
61	个人信息	2	com.ctbc.web.controller.system.SysProfileController.updateProfile()	PUT	1	admin	百色分公司	/system/user/profile	127.0.0.1	内网IP	{"admin":false,"email":"ry@163.com","nickName":"無","params":{},"phonenumber":"15888888888","sex":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-18 17:57:01.53207	12
62	文件管理	1	com.ctbc.system.controller.SysFileController.createFolder()	POST	1	admin	百色分公司	/system/file/createFolder	127.0.0.1	内网IP	{"fileName":"2","params":{},"parentId":0}	\N	1	\r\n### Error querying database.  Cause: org.postgresql.util.PSQLException: ERROR: operator does not exist: character varying = integer\n  建议：No operator matches the given name and argument types. You might need to add explicit type casts.\n  位置：136\r\n### The error may exist in file [D:\\CodeDoc\\EquipmentM\\ctbc-system\\target\\classes\\mapper\\system\\SysFileMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(*) > 0 from sys_file         where parent_id = ?         and file_name = ?         and is_folder = 1         and status = 1\r\n### Cause: org.postgresql.util.PSQLException: ERROR: operator does not exist: character varying = integer\n  建议：No operator matches the given name and argument types. You might need to add explicit type casts.\n  位置：136\n; bad SQL grammar []	2025-12-19 08:55:24.475409	84
63	文件管理	1	com.ctbc.system.controller.SysFileController.uploadFile()	POST	1	admin	百色分公司	/system/file/upload	127.0.0.1	内网IP	{"businessType":"common","parentId":"0"}	{"msg":"上传文件失败: 文件上传失败: null","code":500}	0	\N	2025-12-19 08:56:02.614173	16
64	文件管理	1	com.ctbc.system.controller.SysFileController.createFolder()	POST	1	admin	百色分公司	/system/file/createFolder	127.0.0.1	内网IP	{"fileName":"test","params":{},"parentId":0}	{"msg":"操作成功","code":200,"data":{"createBy":"admin","createTime":"2025-12-19 09:02:42","fileName":"test","id":3,"isFolder":1,"originalName":"test","params":{},"parentId":0,"status":"1"}}	0	\N	2025-12-19 09:02:42.109956	16
65	文件管理	1	com.ctbc.system.controller.SysFileController.createFolder()	POST	1	admin	百色分公司	/system/file/createFolder	127.0.0.1	内网IP	{"fileName":"test","params":{},"parentId":0}	\N	1	文件夹名称已存在	2025-12-19 09:03:12.871541	4
66	文件管理	1	com.ctbc.system.controller.SysFileController.uploadFile()	POST	1	admin	百色分公司	/system/file/upload	127.0.0.1	内网IP	{"businessType":"common","parentId":"0"}	{"msg":"操作成功","code":200,"data":{"businessType":"common","contentHash":"15d03bd3ea13a6920063678003a51c5b","createBy":"admin","createTime":"2025-12-19 09:23:06","downloadCount":0,"fileName":"poster.png","filePath":"../upload//2025/12/19/poster_20251219092306A001.png","fileSize":126703,"fileType":"png","fileUrl":"/profile//2025/12/19/poster_20251219092306A001.png","id":4,"mimeType":"image/png","originalName":"poster.png","params":{},"parentId":0,"processProgress":100,"status":"1"}}	0	\N	2025-12-19 09:23:06.903577	88
67	文件管理	1	com.ctbc.system.controller.SysFileController.createFolder()	POST	1	admin	百色分公司	/system/file/createFolder	127.0.0.1	内网IP	{"fileName":"1","params":{},"parentId":0}	{"msg":"操作成功","code":200,"data":{"createBy":"admin","createTime":"2025-12-19 09:23:16","fileName":"1","id":5,"isFolder":1,"originalName":"1","params":{},"parentId":0,"status":"1"}}	0	\N	2025-12-19 09:23:16.798608	7
68	文件管理	3	com.ctbc.system.controller.SysFileController.deleteFile()	DELETE	1	admin	百色分公司	/system/file/4	127.0.0.1	内网IP	[4]	{"msg":"操作成功","code":200}	0	\N	2025-12-19 09:37:59.243115	9
69	文件管理	2	com.ctbc.system.controller.SysFileController.renameFile()	PUT	1	admin	百色分公司	/system/file/rename	127.0.0.1	内网IP	{"newName":"test1","fileId":"5"}	{"msg":"操作成功","code":200}	0	\N	2025-12-19 09:38:05.416307	9
70	文件管理	3	com.ctbc.system.controller.SysFileController.deleteFile()	DELETE	1	admin	百色分公司	/system/file/5	127.0.0.1	内网IP	[5]	{"msg":"操作成功","code":200}	0	\N	2025-12-19 09:39:06.580267	4
71	文件管理	1	com.ctbc.system.controller.SysFileController.createFolder()	POST	1	admin	百色分公司	/system/file/createFolder	127.0.0.1	内网IP	{"fileName":"123445","params":{},"parentId":0}	{"msg":"操作成功","code":200,"data":{"createBy":"admin","createTime":"2025-12-19 09:39:17","fileName":"123445","id":6,"isFolder":1,"originalName":"123445","params":{},"parentId":0,"status":"1"}}	0	\N	2025-12-19 09:39:17.282779	10
72	文件管理	1	com.ctbc.system.controller.SysFileController.uploadFile()	POST	1	admin	百色分公司	/system/file/upload	127.0.0.1	内网IP	{"businessType":"common","parentId":"6"}	{"msg":"操作成功","code":200,"data":{"businessType":"common","contentHash":"72b94476898f07b63c2f428ea6dac5e5","createBy":"admin","createTime":"2025-12-19 09:39:27","downloadCount":0,"fileName":"backgroud.png","filePath":"../upload//2025/12/19/backgroud_20251219093927A001.png","fileSize":2591403,"fileType":"png","fileUrl":"/profile//2025/12/19/backgroud_20251219093927A001.png","id":7,"mimeType":"image/png","originalName":"backgroud.png","params":{},"parentId":6,"processProgress":100,"status":"1"}}	0	\N	2025-12-19 09:39:27.443191	25
73	文件管理	1	com.ctbc.system.controller.SysFileController.createFolder()	POST	1	admin	百色分公司	/system/file/createFolder	127.0.0.1	内网IP	{"fileName":"1","params":{},"parentId":0}	{"msg":"操作成功","code":200,"data":{"createBy":"admin","createTime":"2025-12-19 10:06:05","fileName":"1","filePath":"system_file/1","fileUrl":"/profile/system_file/1","id":8,"isFolder":1,"originalName":"1","params":{},"parentId":0,"status":"1"}}	0	\N	2025-12-19 10:06:05.4563	21
74	文件管理	1	com.ctbc.system.controller.SysFileController.uploadFile()	POST	1	admin	百色分公司	/system/file/upload	127.0.0.1	内网IP	{"businessType":"common","parentId":"8"}	{"msg":"操作成功","code":200,"data":{"businessType":"common","contentHash":"72b94476898f07b63c2f428ea6dac5e5","createBy":"admin","createTime":"2025-12-19 10:06:36","downloadCount":0,"fileName":"backgroud.png","filePath":"../upload/system_file/1/2025/12/19/backgroud_20251219100636A001.png","fileSize":2591403,"fileType":"png","fileUrl":"/profile/system_file/1/2025/12/19/backgroud_20251219100636A001.png","id":9,"mimeType":"image/png","originalName":"backgroud.png","params":{},"parentId":8,"processProgress":100,"status":"1"}}	0	\N	2025-12-19 10:06:36.439026	122
75	文件管理	2	com.ctbc.system.controller.SysFileController.batchMoveFiles()	PUT	1	admin	百色分公司	/system/file/batchMove	127.0.0.1	内网IP	{"targetParentId":"8","fileIds":"9"}	{"msg":"操作成功","code":200}	0	\N	2025-12-19 10:06:48.295577	6
76	定时任务	2	com.ctbc.quartz.controller.SysJobController.changeStatus()	PUT	1	admin	百色分公司	/monitor/job/changeStatus	127.0.0.1	内网IP	{"jobId":1,"misfirePolicy":"0","params":{},"status":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-25 18:19:17.142172	43
77	定时任务	2	com.ctbc.quartz.controller.SysJobController.changeStatus()	PUT	1	admin	百色分公司	/monitor/job/changeStatus	127.0.0.1	内网IP	{"jobId":1,"misfirePolicy":"0","params":{},"status":"1"}	{"msg":"操作成功","code":200}	0	\N	2025-12-25 18:26:42.82602	11
110	个人信息	2	com.ctbc.web.controller.system.SysProfileController.updateProfile()	PUT	1	admin	百色分公司	/system/user/profile	127.0.0.1	内网IP	{"admin":false,"email":"ry@163.com","nickName":"無","params":{},"phonenumber":"15888888889","sex":"0"}	{"msg":"操作成功","code":200}	0	\N	2025-12-26 08:49:58.705622	16
111	用户管理	2	com.ctbc.web.controller.system.SysUserController.resetPwd()	PUT	1	admin	百色分公司	/system/user/resetPwd	127.0.0.1	内网IP	{"admin":true,"params":{},"userId":1}	\N	1	不允许操作超级管理员用户	2026-01-28 17:26:06.348497	5
112	用户管理	2	com.ctbc.web.controller.system.SysUserController.resetPwd()	PUT	1	admin	百色分公司	/system/user/resetPwd	127.0.0.1	内网IP	{"admin":false,"params":{},"updateBy":"admin","userId":2}	{"msg":"操作成功","code":200}	0	\N	2026-01-28 17:27:50.928993	55
\.


--
-- Data for Name: sys_post; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sys_post (post_id, post_code, post_name, post_sort, status, create_by, create_time, update_by, update_time, remark) FROM stdin;
2	se	项目经理	2	0	admin	2021-05-26 18:56:28		\N	
3	hr	人力资源	3	0	admin	2021-05-26 18:56:28		\N	
4	user	普通员工	4	0	admin	2021-05-26 18:56:28		\N	
1	ceo	董事长	1	0	admin	2021-05-26 18:56:28	admin	2021-05-27 09:07:17.160973	
\.


--
-- Data for Name: sys_role; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sys_role (role_id, role_name, role_key, role_sort, data_scope, menu_check_strictly, dept_check_strictly, status, del_flag, create_by, create_time, update_by, update_time, remark) FROM stdin;
1	超级管理员	admin	1	1	t	t	0	0	admin	2021-05-26 18:56:28		\N	超级管理员
3	管控部管理员	center_manager	2	4	f	f	0	0	admin	2025-12-10 11:38:30.16034	admin	2025-12-10 11:48:07.746847	管控部
4	经营单位管理员	sale_center_manager	3	4	f	f	0	0	admin	2025-12-10 11:39:40.285827	admin	2025-12-10 11:48:13.045169	经营单位
2	普通角色	common	4	5	f	f	0	0	admin	2021-05-26 18:56:28	admin	2025-12-10 11:48:17.046116	普通角色
\.


--
-- Data for Name: sys_role_dept; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sys_role_dept (role_id, dept_id) FROM stdin;
\.


--
-- Data for Name: sys_role_menu; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sys_role_menu (role_id, menu_id) FROM stdin;
3	2000
3	2003
3	1
3	100
3	103
3	1000
3	1016
3	2001
3	2002
3	2004
3	2005
4	2000
4	2003
4	1
4	100
4	1000
4	2001
4	2002
4	2004
4	2005
2	2000
2	2003
2	100
2	101
2	102
2	103
2	104
2	105
2	106
2	107
2	108
2	109
2	110
2	111
2	112
2	113
2	114
2	115
2	116
2	1001
2	1002
2	1003
2	1004
2	1005
2	1006
2	1007
2	1008
2	1009
2	1010
2	1011
2	1012
2	1013
2	1014
2	1015
2	1016
2	1017
2	1018
2	1019
2	1020
2	1021
2	1022
2	1023
2	1024
2	1025
2	1026
2	1027
2	1028
2	1029
2	1030
2	1031
2	1032
2	1033
2	1034
2	1035
2	1036
2	1037
2	1038
2	500
2	501
2	1046
2	1047
2	1048
2	1049
2	1050
2	1051
2	1052
2	1053
2	1054
2	1055
2	1056
2	1057
2	1058
2	1059
2	1060
2	1039
2	1040
2	1041
2	1042
2	1043
2	1044
2	1045
2	2001
2	2002
2	2004
2	2005
\.


--
-- Data for Name: sys_user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, login_ip, login_date, pwd_update_date, create_by, create_time, update_by, update_time, remark, staff_code) FROM stdin;
2	84909	ry	若依	00	ry@qq.com	15666666666	1		$2a$10$jzRdYGsd8XlhHw/yO1zw0O/kWXLUDwPEEY/DbSEfZO2.HplksgLfO	0	0	127.0.0.1	2025-12-16 09:49:55.098	2026-01-28 17:27:50.907898	admin	2021-05-26 18:56:28	admin	2026-01-28 17:27:50.907898	测试员	2
1	814	admin	無	00	ry@163.com	15888888889	0	/profile/avatar/2025/12/18/1fb557dccf0e43cea541e2b567c6ffb6.png	$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2	0	0	127.0.0.1	2026-01-30 08:41:10.332	2021-05-26 18:56:28	admin	2021-05-26 18:56:28		2025-12-26 08:49:58.681609	管理员	1
\.


--
-- Data for Name: sys_user_post; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sys_user_post (user_id, post_id) FROM stdin;
1	1
\.


--
-- Data for Name: sys_user_role; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sys_user_role (user_id, role_id) FROM stdin;
1	1
2	4
\.


--
-- Data for Name: unit_detail; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.unit_detail (month, business_unit, branch_office, employee_id, employee_name, type, completed_num, activation_num) FROM stdin;
202511	靖西分公司	靖西安德综合支局	776791148	黄明芳	全屋WIFI	5	2
202511	平果分公司	平果城东综合支局	776154009	黄笔清	全屋WIFI	2	2
202511	田东分公司	田东城北综合支局	776353129	张帅	全屋WIFI	9	8
202511	右江区分公司	右江区城东综合支局	776790080	唐运千	宽带	1	1
202511	右江区分公司	右江区城西综合支局	776110694	黎政华	宽带	1	1
202511	那坡分公司	那坡城南综合支局	100013040	黄仕中	摄像头	8	5
202511	右江区分公司	右江区澄碧湖综合支局	776032002	黄兴敏	摄像头	9	9
202511	田阳分公司	田阳西南综合支局	776404025	凌尔	摄像头	6	6
202511	田阳分公司	田阳那坡综合支局	776419005	黄忠法	摄像头	5	5
202511	田东分公司	田东林逢综合支局	776790676	甘广标	摄像头	2	1
202511	德保分公司	德保城南综合支局	776104009	黄芨德	摄像头	4	3
202511	右江区分公司	右江区四塘综合支局	776781448	黄承虎	摄像头	4	4
202511	田东分公司	田东城北综合支局	776779041	黄剑	摄像头	8	8
202511	田阳分公司	田阳城东综合支局	776782469	黄海东	摄像头	7	7
202511	田东分公司	田东林逢综合支局	776353120	岑忠友	摄像头	9	9
202511	右江区分公司	右江区城东综合支局	776047025	莫嘉文	摄像头	6	6
202511	右江区分公司	右江区城中综合支局	776781370	唐卡	摄像头	1	0
202511	德保分公司	德保敬德巴头综合支局	776801411	黄荷	摄像头	14	13
202511	田林分公司	田林潞城综合支局	776791413	梁深健	摄像头	7	7
202511	田东分公司	田东祥周综合支局	XN0006622	张立亮	摄像头	14	11
202511	田阳分公司	田阳政企专业支局	776404004	黄武庆	摄像头	1	1
202511	德保分公司	德保燕峒龙光综合支局	776141435	凌振鑫	摄像头	10	7
202511	田东分公司	田东印茶综合支局	776790678	陈毅	摄像头	11	9
202511	隆林分公司	隆林城南综合支局	776605030	农玉兰	摄像头	1	1
202511	田阳分公司	田阳西南综合支局	776405028	黄聪	摄像头	7	6
202511	田阳分公司	田阳西南综合支局	100027314	韦泽祺	摄像头	7	7
202511	那坡分公司	那坡百省综合支局	776782411	韦永亮	摄像头	3	2
202511	西林分公司	西林那佐综合支局	776789115	岑家虎	摄像头	26	23
202511	田东分公司	田东朔良综合支局	776781183	廖忠财	摄像头	2	2
202511	德保分公司	德保城南综合支局	776103061	杨子弟	摄像头	3	3
202511	靖西分公司	靖西地州综合支局	776790955	梁健	摄像头	6	6
202511	隆林分公司	隆林政企专业支局	776776675	李明勇	摄像头	12	12
202511	田阳分公司	田阳玉凤综合支局	776779391	黄永吉	摄像头	4	4
202511	田东分公司	田东思林综合支局	776360003	陆最香	摄像头	1	1
202511	西林分公司	西林古障综合支局	776782504	李林	摄像头	5	5
202511	靖西分公司	靖西城南综合支局	XN0006319	俞小神	摄像头	9	8
202511	右江区分公司	右江区龙景综合支局	776901139	林雨健	摄像头	3	3
202511	平果分公司	平果铝城综合支局	776153061	马全军	摄像头	4	4
202511	右江区分公司	右江区龙景综合支局	776117372	韦晨冬	摄像头	1	0
202511	德保分公司	德保马隘都安综合支局	776902173	黄克界	摄像头	6	4
202511	田东分公司	田东义圩综合支局	776359006	黄立升	摄像头	4	4
202511	靖西分公司	靖西地州综合支局	776779724	李国伟	摄像头	1	1
202511	田阳分公司	田阳城东综合支局	776790591	黄欢	摄像头	4	4
202511	平果分公司	平果新安综合支局	100011762	陆文昭	摄像头	7	6
202511	田林分公司	田林潞城综合支局	776782061	向孙赢	摄像头	2	2
202511	右江区分公司	右江区大王岭综合支局	776902268	邝震	摄像头	3	3
202511	田东分公司	田东林逢综合支局	776359006	黄立升	摄像头	4	2
202511	平果分公司	平果坡造综合支局	776789258	班兆秋	摄像头	1	1
202511	隆林分公司	隆林者浪综合支局	776801815	王章文	摄像头	7	5
202511	右江区分公司	右江区城西综合支局	776177383	邓显武	摄像头	3	0
202511	田林分公司	田林八渡综合支局	776902137	农义忠	摄像头	1	1
202511	靖西分公司	靖西武平综合支局	776153132	何正涛	摄像头	1	1
202511	右江区分公司	右江区城东综合支局	776117379	罗迢	全屋WIFI	2	2
202511	隆林分公司	隆林城北综合支局	776701144	范虹	全屋WIFI	2	2
202511	靖西分公司	靖西城北综合支局	776504020	农继勇	全屋WIFI	18	14
202511	西林分公司	西林古障综合支局	776777061	刘建林	全屋WIFI	5	4
202511	德保分公司	德保城南综合支局	XN0006493	谭朝珠	全屋WIFI	9	3
202511	田阳分公司	田阳头塘综合支局	776791213	黄罗峰	全屋WIFI	4	4
202511	田阳分公司	田阳那坡综合支局	776411016	李羿澄	全屋WIFI	2	2
202511	右江区分公司	右江区城东综合支局	776790080	唐运千	全屋WIFI	4	4
202511	靖西分公司	靖西湖润综合支局	776779725	卢发金	全屋WIFI	9	7
202511	那坡分公司	那坡龙合综合支局	776211001	农京运	全屋WIFI	4	4
202511	隆林分公司	隆林克长综合支局	776603038	张仕明	全屋WIFI	2	2
202511	靖西分公司	靖西新甲综合支局	776503003	韦登昊	全屋WIFI	10	8
202511	田阳分公司	田阳头塘综合支局	776790949	赵名杨	全屋WIFI	9	9
202511	西林分公司	西林古障综合支局	776790461	农何信	全屋WIFI	2	2
202511	右江区分公司	右江区城东综合支局	776047009	黄明德	全屋WIFI	4	2
202511	隆林分公司	隆林德峨综合支局	776790341	王诗宇	全屋WIFI	4	4
202511	凌云分公司	凌云浩坤综合支局	776653052	王道正	全屋WIFI	4	4
202511	隆林分公司	隆林城南综合支局	776903001	冯豈松	全屋WIFI	8	8
202511	田林分公司	田林定安综合支局	776779080	黄强立	全屋WIFI	9	9
202511	靖西分公司	靖西城南综合支局	776518002	黄军	全屋WIFI	2	1
202511	德保分公司	德保那甲隆桑综合支局	776117009	农恒造	全屋WIFI	16	13
202511	德保分公司	德保敬德巴头综合支局	776801411	黄荷	全屋WIFI	6	6
202511	田林分公司	田林潞城综合支局	776782061	向孙赢	全屋WIFI	2	2
202511	隆林分公司	隆林隆或综合支局	776779380	冉登文	全屋WIFI	3	2
202511	那坡分公司	那坡百省综合支局	776206001	农荣锋	全屋WIFI	6	5
202511	右江区分公司	右江区龙景综合支局	776791244	黄伟雄	全屋WIFI	9	8
202511	田阳分公司	田阳玉凤综合支局	776408004	廖瑞鹏	全屋WIFI	6	6
202511	靖西分公司	靖西龙邦综合支局	776507004	韦正策	全屋WIFI	2	2
202511	靖西分公司	靖西湖润综合支局	776903233	马国华	全屋WIFI	1	1
202511	德保分公司	德保马隘都安综合支局	776781373	黄志起	全屋WIFI	17	14
202511	田阳分公司	田阳城东综合支局	776790591	黄欢	全屋WIFI	4	3
202511	平果分公司	平果太平综合支局	776167002	黄寿松	全屋WIFI	2	2
202511	平果分公司	平果铝城综合支局	XN0006607	凌承龙	全屋WIFI	10	10
202511	隆林分公司	隆林平班综合支局	776137039	罗桥廷	全屋WIFI	5	5
202511	靖西分公司	靖西城南综合支局	776791149	凤昌浩	全屋WIFI	9	7
202511	田林分公司	田林六隆综合支局	776324001	韦建交	全屋WIFI	7	5
202511	平果分公司	平果铝城综合支局	776153061	马全军	全屋WIFI	4	4
202511	平果分公司	平果铝城综合支局	776153064	陆信能	全屋WIFI	2	2
202511	田阳分公司	田阳坡洪综合支局	776781789	农吉飞	全屋WIFI	3	3
202511	靖西分公司	武平综合支局	776903110	何振飘	宽带	1	1
202511	德保分公司	燕峒龙光综合支局	776106577	潘寿相	宽带	3	2
202511	田林分公司	定安综合支局	776779080	黄强立	宽带	2	2
202511	西林分公司	西林城北综合支局	776903378	黄健平	宽带	1	1
202511	靖西分公司	果乐综合支局	776801173	王海	宽带	1	1
202511	靖西分公司	地州综合支局	776790955	梁健	宽带	1	1
202511	凌云分公司	茶山综合支局	776903365	冯文伸	宽带	1	1
202511	乐业分公司	乐业城市综合支局	776790150	吴显昆	宽带	4	4
202511	田东分公司	田东祥周综合支局	776365003	刘伟	FTTR	6	6
202511	西林分公司	西林古障综合支局	776782504	李林	FTTR	4	4
202511	隆林分公司	隆林克长综合支局	776603038	张仕明	FTTR	5	5
202511	靖西分公司	靖西安德综合支局	776503084	农昆	FTTR	6	6
202511	平果分公司	平果铝城综合支局	776153064	陆信能	FTTR	15	14
202511	隆林分公司	隆或综合支局	776790485	龙占权	FTTR	1	0
202511	平果分公司	平果装机工程班	776780516	黄尚官	FTTR	1	0
202511	右江区分公司	右江区城东综合支局	776047025	莫嘉文	FTTR	3	3
202511	田阳分公司	田阳西南综合支局	100027314	韦泽祺	FTTR	6	6
202511	凌云分公司	凌云浪伏综合支局	776902293	陆金笑	FTTR	2	2
202511	右江区分公司	右江区龙川综合支局	776028004	韦绍程	FTTR	6	6
202511	凌云分公司	凌云浪伏综合支局	776902269	唐大桉	FTTR	5	5
202511	田阳分公司	田阳头塘综合支局	776107864	潘家明	FTTR	2	2
202511	隆林分公司	隆林者保综合支局	XN0006592	邹文韬	FTTR	1	1
202511	田东分公司	田东城南综合支局	776354008	罗昌嵩	FTTR	5	5
202511	田林分公司	田林八渡综合支局	776782062	韦有富	FTTR	1	1
202511	那坡分公司	那坡城北综合支局	776789851	黎映辰	FTTR	4	4
202511	隆林分公司	隆林者浪综合支局	776620004	王明尚	FTTR	1	1
202511	田林分公司	田林城西综合支局	776315003	伍班恒	FTTR	6	6
202511	靖西分公司	靖西湖润综合支局	776903233	马国华	FTTR	10	10
202511	隆林分公司	隆林克长综合支局	776791198	冉登林	FTTR	2	2
202511	右江区分公司	右江区城中综合支局	776047054	李文照	FTTR	4	3
202511	德保分公司	德保马隘都安综合支局	776781537	陆日宁	FTTR	5	5
202511	平果分公司	平果新安综合支局	776051813	黄新哲	FTTR	8	8
202511	右江区分公司	右江区城中综合支局	776782633	黄新建	FTTR	2	2
202511	靖西分公司	靖西地州综合支局	776782672	农昌健	FTTR	8	8
202511	田东分公司	田东印茶综合支局	776361005	陈佳龙	FTTR	10	10
202511	右江区分公司	右江区龙景综合支局	776117372	韦晨冬	FTTR	11	11
202511	靖西分公司	靖西禄峒综合支局	776156286	杨荇	FTTR	4	2
202511	隆林分公司	隆林城北综合支局	776801641	尤龙	FTTR	4	4
202511	田阳分公司	田阳城东综合支局	776404023	覃山	FTTR	10	10
202511	靖西分公司	靖西城南综合支局	776518002	黄军	FTTR	3	3
202511	田林分公司	田林六隆综合支局	776780495	黄成东	FTTR	9	8
202511	平果分公司	平果海城综合支局	776789581	黄成志	FTTR	4	4
202511	田林分公司	田林旧州综合支局	776789620	陆华斌	FTTR	2	2
202511	田东分公司	田东思林综合支局	776791508	黄培	FTTR	2	2
202511	隆林分公司	隆林猪场综合支局	776790342	杨光平	FTTR	5	5
202511	田林分公司	田林城西综合支局	776323004	李海财	FTTR	7	7
202511	田林分公司	田林浪平综合支局	776701915	黄冰	FTTR	5	5
202511	右江区分公司	右江区阳圩综合支局	776025005	何显文	FTTR	1	1
202511	田东分公司	作登综合支局	776353121	黄振军	FTTR	1	0
202511	右江区分公司	右江区城中综合支局	776051812	李晓明	宽带	4	4
202511	德保分公司	敬德巴头综合支局	776801411	黄荷	宽带	1	1
202511	隆林分公司	者保综合支局	776903160	杨银	宽带	1	0
202511	西林分公司	那佐综合支局	776790469	黄海波	宽带	2	2
202511	隆林分公司	德峨综合支局	776903282	王吉昌	宽带	5	4
202511	靖西分公司	靖西城北综合支局	100040668	谢小科	宽带	2	2
202511	隆林分公司	者浪综合支局	776801815	王章文	宽带	3	3
202511	西林分公司	八达综合支局	776256001	农全荣	宽带	1	1
202511	田阳分公司	洞靖综合支局	776903410	黄承壮	宽带	1	1
202511	田阳分公司	田阳城东综合支局	776404011	梁庆阳	宽带	1	1
202511	右江区分公司	右江区城西综合支局	776177383	邓显武	宽带	2	2
202511	平果分公司	平果城东综合支局	776780516	黄尚官	宽带	1	1
202511	田东分公司	印茶综合支局	776790678	陈毅	宽带	1	1
202511	田林分公司	旧州综合支局	776801680	罗梁闪	宽带	1	0
202511	德保分公司	德保城北综合支局	776107001	梁爽	宽带	2	1
202511	德保分公司	足荣荣华支局	776005003	李洛全	FTTR	2	0
202511	西林分公司	西林八达综合支局	776903223	黄雪龙	FTTR	2	2
202511	西林分公司	西林古障综合支局	776257001	熊忠前	全屋WIFI	1	1
202511	平果分公司	平果海城综合支局	776154010	李继宁	全屋WIFI	1	1
202511	那坡分公司	那坡百省综合支局	776782411	韦永亮	全屋WIFI	1	1
202511	靖西分公司	靖西城南综合支局	776903234	李永将	全屋WIFI	1	1
202511	那坡分公司	那坡平孟综合支局	776203048	叶俊平	全屋WIFI	1	0
202511	德保分公司	德保城北综合支局	776780136	黄海杰	全屋WIFI	11	11
202511	西林分公司	西林八达综合支局	776256001	农全荣	全屋WIFI	7	7
202511	右江区分公司	右江区龙景综合支局	776136775	陈昌维	全屋WIFI	21	20
202511	德保分公司	德保城南综合支局	776108001	罗胜	宽带	6	6
202511	德保分公司	德保城南综合支局	XN0006494	王由好	宽带	5	5
202511	德保分公司	德保城南综合支局	XN0006494	王由好	摄像头	3	3
202511	右江区分公司	右江区龙川综合支局	776902262	梁效彰	摄像头	4	4
202511	右江区分公司	右江区四塘综合支局	776047056	马翔译	摄像头	8	8
202511	平果分公司	平果铝城综合支局	776153064	陆信能	摄像头	4	4
202511	田林分公司	田林浪平综合支局	776701915	黄冰	摄像头	4	4
202511	右江区分公司	右江区城西综合支局	776782705	谷修顿	摄像头	2	2
202511	那坡分公司	那坡城南综合支局	776789519	农尚升	摄像头	11	9
202511	平果分公司	平果新安综合支局	776051813	黄新哲	摄像头	8	8
202511	右江区分公司	右江区城西综合支局	776047026	黎建云	摄像头	10	10
202511	右江区分公司	右江区龙景综合支局	776776365	农新鹏	摄像头	9	9
202511	靖西分公司	靖西城北综合支局	776504016	陆刚豪	摄像头	3	2
202511	田阳分公司	田阳坡洪综合支局	776782412	钟斌奖	摄像头	4	3
202511	右江区分公司	右江区城西综合支局	776112808	何旭	摄像头	10	8
202511	平果分公司	平果太平综合支局	776801478	韦忠棒	摄像头	5	5
202511	平果分公司	平果铝城综合支局	XN0006607	凌承龙	摄像头	2	2
202511	田东分公司	田东城北综合支局	776354021	黄盛华	摄像头	8	8
202511	平果分公司	平果城东综合支局	776051815	陈文禧	摄像头	2	1
202511	乐业分公司	乐业甘田综合支局	776903149	陆义铭	摄像头	2	2
202511	隆林分公司	隆林城北综合支局	776801641	尤龙	摄像头	2	2
202511	平果分公司	平果城东综合支局	XN0006606	梁海	摄像头	6	5
202511	靖西分公司	靖西新甲综合支局	776903232	廖坤	摄像头	2	1
202511	田阳分公司	田阳那坡综合支局	776782470	黄河	摄像头	4	3
202511	右江区分公司	右江区龙景综合支局	776782707	杨旭	摄像头	2	0
202511	田东分公司	田东林逢综合支局	XN0006240	黄忠臣	摄像头	12	9
202511	靖西分公司	靖西化峒综合支局	776790953	何开文	摄像头	5	4
202511	右江区分公司	右江区龙景综合支局	776779294	李生学	摄像头	8	8
202511	田东分公司	田东义圩综合支局	776365009	刘忠世	摄像头	8	6
202511	田阳分公司	田阳百育综合支局	776903198	何晨珲	摄像头	3	3
202511	田东分公司	田东城南综合支局	XN0006619	卢万祥	摄像头	5	4
202511	凌云分公司	凌云泗城综合支局	XN0006717	戴学繁	摄像头	5	5
202511	右江区分公司	右江区龙景综合支局	776791244	黄伟雄	摄像头	2	2
202511	平果分公司	平果城东综合支局	776051808	陆如成	摄像头	2	2
202511	隆林分公司	隆林城北综合支局	776902083	严余	宽带	3	3
202511	德保分公司	德保马隘都安综合支局	776701579	罗世金	摄像头	3	3
202511	靖西分公司	靖西政企专业支局	776521003	杨经星	摄像头	1	1
202511	德保分公司	德保城南综合支局	776104009	黄芨德	全屋WIFI	9	9
202511	那坡分公司	那坡百省综合支局	776777931	叶力晖	全屋WIFI	2	2
202511	凌云分公司	凌云茶山综合支局	776903365	冯文伸	全屋WIFI	3	3
202511	平果分公司	平果坡造综合支局	776051817	石盛宇	全屋WIFI	9	8
202511	右江区分公司	右江区城东综合支局	776701234	黄志基	全屋WIFI	6	3
202511	田东分公司	田东城南综合支局	XN0006617	黄城生	全屋WIFI	10	6
202511	平果分公司	平果铝城综合支局	776780514	陆信忠	全屋WIFI	16	14
202511	凌云分公司	凌云茶山综合支局	776789296	万恒乾	全屋WIFI	3	3
202511	靖西分公司	靖西政企专业支局	100015499	黄加辉	全屋WIFI	10	8
202511	田阳分公司	田阳西南综合支局	776405028	黄聪	全屋WIFI	9	9
202511	靖西分公司	靖西武平综合支局	776153132	何正涛	全屋WIFI	3	3
202511	田林分公司	田林城西综合支局	776903477	明胜聪	全屋WIFI	3	3
202511	平果分公司	平果新安综合支局	776140445	廖春峥	全屋WIFI	5	3
202511	德保分公司	德保燕峒龙光综合支局	776141435	凌振鑫	全屋WIFI	7	5
202511	田阳分公司	田阳城东综合支局	776791329	李文武	全屋WIFI	4	4
202511	那坡分公司	那坡德隆综合支局	776782119	杨贵龙	全屋WIFI	3	3
202511	平果分公司	平果城东综合支局	776168002	黄承东	全屋WIFI	4	4
202511	平果分公司	平果太平综合支局	776801478	韦忠棒	全屋WIFI	3	3
202511	田阳分公司	田阳坡洪综合支局	776782412	钟斌奖	全屋WIFI	1	1
202511	右江区分公司	右江区龙景综合支局	776110696	马均福	全屋WIFI	5	5
202511	右江区分公司	右江区城中综合支局	776051812	李晓明	全屋WIFI	7	2
202511	田阳分公司	田阳那坡综合支局	776419005	黄忠法	全屋WIFI	2	2
202511	那坡分公司	那坡城北综合支局	776791227	马晓东	全屋WIFI	2	2
202511	田东分公司	田东印茶综合支局	776790678	陈毅	全屋WIFI	2	2
202511	田林分公司	田林旧州综合支局	776789620	陆华斌	全屋WIFI	1	1
202511	右江区分公司	右江区城西综合支局	776051811	张靖	全屋WIFI	2	2
202511	德保分公司	德保燕峒龙光综合支局	776005015	黄绍都	全屋WIFI	2	0
202511	靖西分公司	靖西果乐综合支局	776791149	凤昌浩	全屋WIFI	1	1
202511	田东分公司	田东城北综合支局	776779041	黄剑	全屋WIFI	6	6
202511	平果分公司	平果太平综合支局	776141913	班必飞	全屋WIFI	1	0
202511	凌云分公司	凌云浪伏综合支局	776659002	杨再冲	全屋WIFI	2	1
202511	靖西分公司	靖西安德综合支局	776779978	赵明刚	全屋WIFI	1	1
202511	右江区分公司	右江区城中综合支局	776780541	吴东平	全屋WIFI	1	1
202511	右江区分公司	右江区龙景综合支局	776782706	黄雨	全屋WIFI	1	0
202511	德保分公司	德保马隘都安综合支局	776701579	罗世金	全屋WIFI	1	1
202511	靖西分公司	靖西禄峒综合支局	776779729	杨文腾	全屋WIFI	2	1
202511	田林分公司	田林潞城综合支局	776791413	梁深健	FTTR	3	4
202511	田东分公司	田东城南综合支局	776354008	罗昌嵩	宽带	3	3
202511	凌云分公司	浩坤综合支局	776781570	劳建峰	宽带	2	2
202511	田东分公司	田东城北综合支局	776779041	黄剑	宽带	4	4
202511	乐业分公司	花坪综合支局	776456002	王功泽	宽带	1	1
202511	凌云分公司	浪伏综合支局	776659003	周歧稳	宽带	2	1
202511	凌云分公司	茶山综合支局	776789296	万恒乾	宽带	2	2
202511	平果分公司	新安综合支局	100011762	陆文昭	宽带	1	1
202511	田阳分公司	头塘综合支局	776790949	赵名杨	宽带	2	1
202511	西林分公司	西林政企专业支局	776256007	贺刚银	FTTR	0	0
202511	靖西分公司	靖西安德综合支局	776779978	赵明刚	FTTR	2	2
202511	那坡分公司	那坡城南综合支局	776780245	农子文	FTTR	1	1
202511	田阳分公司	田阳百育综合支局	776137911	蒙柯睿	FTTR	14	14
202511	右江区分公司	右江区城东综合支局	776047009	黄明德	FTTR	5	5
202511	田阳分公司	田阳那坡综合支局	776782470	黄河	FTTR	11	10
202511	右江区分公司	右江区城中综合支局	776781370	唐卡	FTTR	4	4
202511	右江区分公司	右江区阳圩综合支局	776781371	黄钰星	FTTR	1	1
202511	隆林分公司	隆林城南综合支局	776903112	黄毅	FTTR	29	29
202511	田林分公司	田林城东综合支局	776303060	阮敬翔	FTTR	1	0
202511	田阳分公司	田阳西南综合支局	XN0006559	陆庆华	FTTR	7	7
202511	靖西分公司	靖西城北综合支局	776504016	陆刚豪	FTTR	5	5
202511	田林分公司	田林城西综合支局	776313007	杨绍远	FTTR	8	8
202511	隆林分公司	隆林城北综合支局	776902083	严余	FTTR	6	6
202511	隆林分公司	隆林政企专业支局	776790368	柳隆文	FTTR	1	1
202511	田东分公司	田东城北综合支局	776354021	黄盛华	FTTR	9	9
202511	田林分公司	田林城西综合支局	776903477	明胜聪	FTTR	7	7
202511	平果分公司	平果榜圩综合支局	XN0006762	陆舜龙	FTTR	2	2
202511	德保分公司	德保城南综合支局	776103061	杨子弟	FTTR	5	5
202511	靖西分公司	靖西禄峒综合支局	776790202	肖祥友	FTTR	4	4
202511	田东分公司	田东印茶综合支局	776790678	陈毅	FTTR	14	14
202511	田东分公司	田东城北综合支局	776353129	张帅	FTTR	2	2
202511	田东分公司	田东作登综合支局	776353121	黄振军	FTTR	13	12
202511	田阳分公司	田阳坡洪综合支局	776781789	农吉飞	FTTR	6	6
202511	右江区分公司	右江区城中综合支局	776791248	梁安龙	FTTR	6	6
202511	那坡分公司	那坡德隆综合支局	776778054	李双宏	FTTR	1	1
202511	田阳分公司	田阳坡洪综合支局	776782412	钟斌奖	FTTR	2	2
202511	乐业分公司	乐业城市综合支局	776789435	袁宏科	FTTR	5	5
202511	凌云分公司	凌云浩坤综合支局	776790241	郁长龙	FTTR	4	4
202511	田阳分公司	田阳洞靖综合支局	776409006	梁文	FTTR	1	1
202511	田林分公司	田林定安综合支局	776701107	农俊杰	FTTR	2	2
202511	田阳分公司	田阳坡洪综合支局	776790251	杨忠敏	FTTR	2	2
202511	凌云分公司	凌云浩坤综合支局	776790051	劳兴新	FTTR	2	2
202511	田阳分公司	田阳头塘综合支局	776790949	赵名杨	FTTR	1	1
202511	右江区分公司	右江区龙景综合支局	776110696	马均福	FTTR	1	1
202511	隆林分公司	隆林城南综合支局	776903112	黄毅	宽带	1	1
202511	田东分公司	义圩综合支局	776359006	黄立升	宽带	1	1
202511	平果分公司	平果城东综合支局	776902443	黄冠文	宽带	1	1
202511	靖西分公司	果乐综合支局	776791149	凤昌浩	宽带	1	1
202511	隆林分公司	隆或综合支局	776701942	吴凯	宽带	2	2
202511	右江区分公司	右江区城东综合支局	776701234	黄志基	宽带	1	1
202511	靖西分公司	龙邦综合支局	776144677	黄盛旺	宽带	1	1
202511	德保分公司	燕峒龙光综合支局	776780134	黄大耕	宽带	1	1
202511	西林分公司	古障综合支局	776777061	刘建林	宽带	1	1
202511	右江区分公司	右江区龙景综合支局	776779294	李生学	宽带	1	1
202511	那坡分公司	那坡平孟综合支局	776782530	农建明	FTTR	1	1
202511	靖西分公司	靖西武平综合支局	776518002	黄军	FTTR	1	1
202511	德保分公司	德保城南综合支局	776104009	黄芨德	FTTR	2	2
202511	右江区分公司	右江区城中综合支局	776782633	黄新建	全屋WIFI	1	1
202511	乐业分公司	乐业新化综合支局	776453066	黎源	全屋WIFI	4	4
202511	隆林分公司	克长综合支局	776791198	冉登林	宽带	2	2
202511	西林分公司	西林古障综合支局	776256005	邓将	摄像头	1	1
202511	田林分公司	田林定安综合支局	776779080	黄强立	摄像头	5	3
202511	西林分公司	西林古障综合支局	776790461	农何信	摄像头	3	3
202511	隆林分公司	隆林猪场综合支局	776701925	杨健	摄像头	17	13
202511	隆林分公司	隆林城南综合支局	776903112	黄毅	摄像头	11	7
202511	那坡分公司	那坡德隆综合支局	776782119	杨贵龙	摄像头	2	2
202511	那坡分公司	那坡百省综合支局	776206001	农荣锋	摄像头	10	9
202511	田阳分公司	田阳头塘综合支局	776790949	赵名杨	摄像头	9	8
202511	靖西分公司	靖西果乐综合支局	776801173	王海	摄像头	9	8
202511	那坡分公司	那坡龙合综合支局	776211005	王启江	摄像头	13	12
202511	右江区分公司	右江区城西综合支局	776779999	岑忠彩	摄像头	6	7
202511	靖西分公司	靖西龙邦综合支局	776507004	韦正策	摄像头	5	5
202511	德保分公司	德保东凌综合支局	776789485	阮荣达	摄像头	9	7
202511	田阳分公司	田阳城东综合支局	776404011	梁庆阳	摄像头	20	7
202511	田林分公司	田林浪平综合支局	776322006	吴定碧	摄像头	1	0
202511	德保分公司	德保马隘都安综合支局	776781537	陆日宁	摄像头	5	5
202511	乐业分公司	乐业城市综合支局	776789435	袁宏科	摄像头	12	11
202511	德保分公司	德保马隘都安综合支局	776781373	黄志起	摄像头	10	8
202511	田林分公司	田林潞城综合支局	776777743	李秉罡	摄像头	17	15
202511	田东分公司	田东义圩综合支局	776358001	李璜	摄像头	8	7
202511	右江区分公司	右江区城西综合支局	776177383	邓显武	摄像头	4	4
202511	田林分公司	田林定安综合支局	776322005	韦宝林	摄像头	3	3
202511	德保分公司	德保城北综合支局	776103065	雍正福	摄像头	4	3
202511	德保分公司	德保足荣荣华综合支局	776902175	杨伟业	摄像头	2	1
202511	田阳分公司	田阳西南综合支局	776790947	李俊麟	摄像头	3	3
202511	平果分公司	平果铝城综合支局	776780514	陆信忠	摄像头	13	12
202511	隆林分公司	隆林隆或综合支局	776790485	龙占权	摄像头	10	7
202511	田东分公司	田东祥周综合支局	776102410	李天北	摄像头	2	2
202511	靖西分公司	靖西城南综合支局	776518002	黄军	摄像头	9	7
202511	田阳分公司	田阳坡洪综合支局	776781789	农吉飞	摄像头	4	4
202511	靖西分公司	靖西城北综合支局	776504020	农继勇	摄像头	11	8
202511	右江区分公司	右江区四塘综合支局	776024001	罗忠良	摄像头	3	3
202511	靖西分公司	靖西湖润综合支局	776779725	卢发金	摄像头	5	5
202511	西林分公司	西林城北综合支局	776801211	陆宇杭	摄像头	2	2
202511	右江区分公司	右江区城东综合支局	776701234	黄志基	摄像头	4	4
202511	田东分公司	田东城北综合支局	776777887	韦忠将	摄像头	4	3
202511	田林分公司	田林城西综合支局	776903477	明胜聪	摄像头	3	1
202511	平果分公司	平果城东综合支局	776701880	农国政	摄像头	6	4
202511	靖西分公司	靖西城南综合支局	776903234	李永将	摄像头	1	1
202511	平果分公司	平果政企专业支局	XN0006605	黄忠站	摄像头	3	3
202511	靖西分公司	靖西安德综合支局	776779978	赵明刚	摄像头	1	1
202511	靖西分公司	靖西地州综合支局	776782672	农昌健	摄像头	4	2
202511	凌云分公司	凌云浪伏综合支局	776902293	陆金笑	摄像头	4	4
202511	右江区分公司	右江区城东综合支局	776136822	肖君	摄像头	1	0
202511	西林分公司	西林政企专业支局	776256007	贺刚银	摄像头	1	1
202511	田东分公司	田东朔良综合支局	776789212	陆问	摄像头	1	0
202511	平果分公司	平果新安综合支局	776120607	李勇	摄像头	5	5
202511	靖西分公司	靖西武平综合支局	776518002	黄军	全屋WIFI	4	4
202511	靖西分公司	靖西化峒综合支局	776520002	陆扬	全屋WIFI	6	3
202511	田东分公司	田东城北综合支局	776354016	农伟	全屋WIFI	7	7
202511	田东分公司	田东城南综合支局	776354006	何雨	全屋WIFI	8	8
202511	德保分公司	德保敬德巴头综合支局	776777811	黄健	全屋WIFI	8	6
202511	那坡分公司	那坡德隆综合支局	776778054	李双宏	全屋WIFI	5	3
202511	靖西分公司	靖西武平综合支局	776903110	何振飘	全屋WIFI	6	6
202511	田林分公司	田林城西综合支局	776801709	赵金寿	全屋WIFI	5	5
202511	田东分公司	田东作登综合支局	776368008	韦寿猛	全屋WIFI	2	2
202511	凌云分公司	凌云浩坤综合支局	776781570	劳建峰	全屋WIFI	6	5
202511	隆林分公司	隆林德峨综合支局	776903536	杨虎	全屋WIFI	4	4
202511	右江区分公司	右江区城东综合支局	776790283	黄波	全屋WIFI	8	8
202511	德保分公司	德保燕峒龙光综合支局	776780134	黄大耕	全屋WIFI	4	3
202511	德保分公司	德保东凌综合支局	776791538	李荣振	全屋WIFI	2	2
202511	凌云分公司	凌云泗城综合支局	776782067	田仁政	全屋WIFI	6	6
202511	田阳分公司	田阳那坡综合支局	776782470	黄河	全屋WIFI	1	1
202511	右江区分公司	右江区城西综合支局	776779999	岑忠彩	全屋WIFI	1	1
202511	乐业分公司	乐业新化综合支局	776791710	罗韶轩	全屋WIFI	5	4
202511	田东分公司	田东印茶综合支局	776358003	农国亮	全屋WIFI	3	3
202511	田阳分公司	田阳坡洪综合支局	776790251	杨忠敏	全屋WIFI	4	4
202511	右江区分公司	右江区城东综合支局	776117367	刘升	全屋WIFI	1	1
202511	隆林分公司	隆林者浪综合支局	776801815	王章文	全屋WIFI	6	4
202511	田东分公司	田东城北综合支局	776354010	宁彬	全屋WIFI	2	2
202511	隆林分公司	隆林克长综合支局	776791198	冉登林	全屋WIFI	2	1
202511	平果分公司	平果榜圩综合支局	776051822	苏宝观	全屋WIFI	3	3
202511	靖西分公司	靖西城北综合支局	776504010	许志欢	全屋WIFI	3	3
202511	靖西分公司	靖西武平综合支局	776790952	李启校	全屋WIFI	4	4
202511	田阳分公司	田阳洞靖综合支局	776409006	梁文	全屋WIFI	1	1
202511	田林分公司	田林旧州综合支局	776801680	罗梁闪	全屋WIFI	1	0
202511	田阳分公司	田阳头塘综合支局	776415002	林凯旋	全屋WIFI	1	1
202511	田东分公司	田东祥周综合支局	776366013	梁福翔	全屋WIFI	2	2
202511	田阳分公司	田阳洞靖综合支局	776406003	李勇	全屋WIFI	2	1
202511	靖西分公司	靖西地州综合支局	776790955	梁健	全屋WIFI	2	2
202511	靖西分公司	靖西城南综合支局	776504025	黄日赞	FTTR	9	10
202511	田阳分公司	百育综合支局	776137911	蒙柯睿	宽带	2	2
202511	右江区分公司	四塘综合支局	776791047	黄承湘	宽带	1	1
202511	田林分公司	田林城西综合支局	776315003	伍班恒	宽带	5	4
202511	德保分公司	德保城南综合支局	776103061	杨子弟	宽带	1	1
202511	凌云分公司	凌云泗城综合支局	776782724	田宏干	FTTR	6	6
202511	田东分公司	田东义圩综合支局	776365009	刘忠世	FTTR	15	14
202511	平果分公司	平果城东综合支局	776780516	黄尚官	FTTR	10	10
202511	右江区分公司	右江区阳圩综合支局	776117376	李京津	FTTR	10	10
202511	平果分公司	平果城东综合支局	776902443	黄冠文	FTTR	12	12
202511	田林分公司	田林六隆综合支局	776307002	罗肖	FTTR	6	6
202511	田阳分公司	田阳玉凤综合支局	776408004	廖瑞鹏	FTTR	3	3
202511	田林分公司	田林城西综合支局	776303060	阮敬翔	FTTR	11	11
202511	田阳分公司	田阳那坡综合支局	776411016	李羿澄	FTTR	9	9
202511	靖西分公司	靖西新甲综合支局	776503003	韦登昊	FTTR	10	10
202511	靖西分公司	靖西城北综合支局	100040668	谢小科	FTTR	4	3
202511	那坡分公司	那坡龙合综合支局	776211001	农京运	FTTR	8	8
202511	隆林分公司	隆林城南综合支局	776791554	杨明顺	FTTR	13	13
202511	平果分公司	平果坡造综合支局	776051817	石盛宇	FTTR	4	4
202511	田阳分公司	田阳玉凤综合支局	776779391	黄永吉	FTTR	11	10
202511	平果分公司	平果铝城综合支局	776780520	杨国立	FTTR	11	11
202511	平果分公司	平果城东综合支局	776153023	陆炜	FTTR	7	7
202511	靖西分公司	靖西武平综合支局	776153132	何正涛	FTTR	3	3
202511	那坡分公司	那坡城南综合支局	100013040	黄仕中	FTTR	6	6
202511	右江区分公司	右江区城西综合支局	776110694	黎政华	FTTR	8	8
202511	德保分公司	德保敬德巴头综合支局	776801411	黄荷	FTTR	5	5
202511	靖西分公司	靖西城南综合支局	100040666	周密根	FTTR	10	10
202511	靖西分公司	靖西地州综合支局	776779724	李国伟	FTTR	4	4
202511	田东分公司	田东林逢综合支局	XN0006240	黄忠臣	FTTR	6	6
202511	隆林分公司	隆林克长综合支局	776902373	曾清	FTTR	4	4
202511	德保分公司	德保城北综合支局	776801421	黄仕全	FTTR	3	3
202511	田东分公司	田东作登综合支局	7763610044	黄作山	FTTR	9	9
202511	德保分公司	德保城北综合支局	776780136	黄海杰	FTTR	3	3
202511	右江区分公司	右江区城西综合支局	776177383	邓显武	FTTR	3	3
202511	德保分公司	德保燕峒龙光综合支局	776780134	黄大耕	FTTR	3	3
202511	右江区分公司	右江区城东综合支局	776701234	黄志基	FTTR	2	2
202511	田东分公司	田东城南综合支局	776354004	黄军权	FTTR	1	0
202511	平果分公司	平果城东综合支局	XN0006606	梁海	FTTR	4	4
202511	平果分公司	平果榜圩综合支局	776051822	苏宝观	FTTR	3	3
202511	凌云分公司	凌云茶山综合支局	776903365	冯文伸	FTTR	6	6
202511	靖西分公司	靖西城北综合支局	776504010	许志欢	FTTR	11	9
202511	靖西分公司	靖西政企专业支局	100015499	黄加辉	FTTR	1	1
202511	靖西分公司	靖西新甲综合支局	776503084	农昆	FTTR	1	1
202511	平果分公司	平果太平综合支局	776167002	黄寿松	FTTR	3	3
202511	靖西分公司	新甲综合支局	776503003	韦登昊	FTTR	1	0
202511	靖西分公司	靖西城北综合支局	776504020	农继勇	FTTR	3	3
202511	靖西分公司	靖西新甲综合支局	776779158	雷平	FTTR	1	1
202511	田林分公司	八桂综合支局	776307002	罗肖	FTTR	0	0
202511	田阳分公司	田阳百育综合支局	776903198	何晨珲	FTTR	1	1
202511	隆林分公司	隆林者浪综合支局	776801815	王章文	FTTR	1	1
202511	田林分公司	八渡综合支局	776701447	梁贵荣	宽带	2	2
202511	田东分公司	田东城北综合支局	776364001	周作弟	宽带	2	2
202511	田阳分公司	田阳西南综合支局	100027314	韦泽祺	宽带	3	3
202511	田林分公司	田林城西综合支局	776323004	李海财	宽带	2	2
202511	靖西分公司	化峒综合支局	776790953	何开文	宽带	2	2
202511	田东分公司	义圩综合支局	776358001	李璜	宽带	2	2
202511	靖西分公司	靖西城北综合支局	776504016	陆刚豪	宽带	2	1
202511	田东分公司	义圩综合支局	776365009	刘忠世	宽带	1	0
202511	右江区分公司	右江区城东综合支局	776117367	刘升	宽带	1	1
202511	平果分公司	平果铝城综合支局	776153064	陆信能	宽带	2	2
202511	乐业分公司	乐业城市综合支局	776901056	杨正国	宽带	3	3
202511	隆林分公司	隆或综合支局	776791807	冉浩成	宽带	1	1
202511	右江区分公司	右江区龙景综合支局	776779294	李生学	宽带	2	2
202511	田东分公司	田东城北综合支局	776354016	农伟	宽带	2	2
202511	靖西分公司	湖润综合支局	776779725	卢发金	宽带	1	1
202511	右江区分公司	四塘综合支局	776781448	黄承虎	宽带	1	1
202511	德保分公司	德保城南综合支局	XN0006493	谭朝珠	宽带	1	1
202511	田阳分公司	玉凤综合支局	776404029	黄中站	FTTR	1	1
202511	乐业分公司	乐业花坪综合支局	776456002	王功泽	FTTR	1	1
202511	田林分公司	田林城西综合支局	XN0006625	韦志兵	全屋WIFI	2	2
202511	田东分公司	田东作登综合支局	776789210	梁海亮	全屋WIFI	2	1
202511	乐业分公司	乐业花坪综合支局	776707813	钟湛烃	全屋WIFI	15	15
202511	凌云分公司	凌云浪伏综合支局	776659003	周歧稳	全屋WIFI	4	4
202511	乐业分公司	乐业城市综合支局	776790150	吴显昆	全屋WIFI	8	7
202511	田阳分公司	田阳玉凤综合支局	776779391	黄永吉	全屋WIFI	2	2
202511	德保分公司	德保城南综合支局	776103061	杨子弟	全屋WIFI	12	8
202511	平果分公司	平果城东综合支局	776791071	黄立程	全屋WIFI	3	2
202511	西林分公司	古障综合支局	776782504	李林	宽带	1	1
202511	田林分公司	田林六隆综合支局	776780329	李斌	摄像头	6	6
202511	隆林分公司	隆林城北综合支局	776903002	田孟法	摄像头	11	8
202511	乐业分公司	乐业城市综合支局	776790150	吴显昆	摄像头	25	22
202511	右江区分公司	右江区龙景综合支局	776782540	黄卓学	摄像头	3	3
202511	德保分公司	德保敬德巴头综合支局	776781441	黄特	摄像头	3	2
202511	隆林分公司	隆林德峨综合支局	776790341	王诗宇	摄像头	17	15
202511	隆林分公司	隆林猪场综合支局	776790342	杨光平	摄像头	20	16
202511	乐业分公司	乐业城市综合支局	776901056	杨正国	摄像头	7	7
202511	隆林分公司	隆林克长综合支局	776791198	冉登林	摄像头	5	4
202511	田阳分公司	田阳百育综合支局	776407015	韦日行	摄像头	5	4
202511	凌云分公司	凌云浩坤综合支局	776781570	劳建峰	摄像头	10	10
202511	田东分公司	田东作登综合支局	7763610044	黄作山	摄像头	9	9
202511	西林分公司	西林那劳综合支局	776903224	蒙智强	摄像头	3	1
202511	德保分公司	德保城北综合支局	776780136	黄海杰	摄像头	3	3
202511	田东分公司	田东祥周综合支局	776365003	刘伟	摄像头	3	3
202511	凌云分公司	凌云茶山综合支局	776789296	万恒乾	摄像头	5	5
202511	田林分公司	田林旧州综合支局	776789620	陆华斌	摄像头	8	7
202511	靖西分公司	靖西城南综合支局	776504025	黄日赞	摄像头	10	8
202511	右江区分公司	右江区城东综合支局	776047009	黄明德	摄像头	2	2
202511	平果分公司	平果榜圩综合支局	776051822	苏宝观	摄像头	4	3
202511	凌云分公司	凌云浪伏综合支局	776902269	唐大桉	摄像头	8	7
202511	隆林分公司	隆林平班综合支局	776701816	马定威	摄像头	7	7
202511	右江区分公司	右江区城中综合支局	776791248	梁安龙	摄像头	7	7
202511	田东分公司	田东城北综合支局	776354016	农伟	摄像头	7	6
202511	隆林分公司	隆林德峨综合支局	776903536	杨虎	摄像头	5	5
202511	乐业分公司	乐业甘田综合支局	776789575	黎明东	摄像头	8	7
202511	田阳分公司	田阳城东综合支局	776404007	黄文华	摄像头	8	7
202511	平果分公司	平果太平综合支局	776903221	黄伟君	摄像头	9	8
202511	隆林分公司	隆林者保综合支局	XN0006592	邹文韬	摄像头	2	1
202511	隆林分公司	隆林隆或综合支局	776791807	冉浩成	摄像头	11	11
202511	平果分公司	平果城东综合支局	776791071	黄立程	摄像头	1	1
202511	田阳分公司	田阳头塘综合支局	776503015	颜力顺	摄像头	9	9
202511	右江区分公司	右江区城东综合支局	776047019	黄镇权	摄像头	1	1
202511	田阳分公司	田阳百育综合支局	776407014	罗飞	摄像头	2	2
202511	右江区分公司	右江区城中综合支局	776781370	唐卡	摄像头	2	2
202511	田东分公司	田东作登综合支局	776368008	韦寿猛	摄像头	10	9
202511	靖西分公司	靖西新甲综合支局	776503003	韦登昊	摄像头	12	8
202511	田林分公司	田林城西综合支局	776323004	李海财	摄像头	1	1
202511	田林分公司	田林潞城综合支局	776779197	黎书醒	摄像头	8	8
202511	右江区分公司	右江区城西综合支局	776782705	谷修顿	摄像头	1	1
202511	田东分公司	田东作登综合支局	776791508	黄培	摄像头	3	3
202511	那坡分公司	那坡百省综合支局	776777931	叶力晖	摄像头	3	2
202511	平果分公司	平果旧城综合支局	776051818	李继文	摄像头	1	1
202511	凌云分公司	凌云茶山综合支局	776655017	陈霖	摄像头	5	5
202511	靖西分公司	靖西武平综合支局	776791324	何大军	摄像头	1	1
202511	田东分公司	田东印茶综合支局	776361005	陈佳龙	摄像头	4	4
202511	田林分公司	田林六隆综合支局	776307002	罗肖	全屋WIFI	6	5
202511	右江区分公司	右江区龙景综合支局	776779294	李生学	全屋WIFI	6	4
202511	右江区分公司	右江区四塘综合支局	776777378	黄高科	全屋WIFI	3	2
202511	平果分公司	平果城东综合支局	776701880	农国政	全屋WIFI	4	4
202511	田阳分公司	田阳西南综合支局	776404025	凌尔	全屋WIFI	8	6
202511	德保分公司	德保城南综合支局	XN0006494	王由好	全屋WIFI	6	6
202511	右江区分公司	右江区城西综合支局	776782705	谷修顿	全屋WIFI	9	8
202511	右江区分公司	右江区澄碧湖综合支局	776144459	梁富林	全屋WIFI	2	1
202511	田林分公司	田林城西综合支局	776323004	李海财	全屋WIFI	9	8
202511	田阳分公司	田阳西南综合支局	100027314	韦泽祺	全屋WIFI	8	5
202511	右江区分公司	右江区龙景综合支局	776901139	林雨健	全屋WIFI	14	8
202511	田阳分公司	田阳洞靖综合支局	776779400	罗朝壮	全屋WIFI	4	4
202511	平果分公司	平果榜圩综合支局	776776539	黄泽锶	全屋WIFI	9	7
202511	平果分公司	平果铝城综合支局	776185061	宋显辉	全屋WIFI	5	5
202511	田林分公司	田林定安综合支局	776701107	农俊杰	全屋WIFI	1	1
202511	乐业分公司	乐业甘田综合支局	776903149	陆义铭	全屋WIFI	4	3
202511	田阳分公司	田阳头塘综合支局	776107864	潘家明	全屋WIFI	4	3
202511	右江区分公司	右江区城西综合支局	776110694	黎政华	全屋WIFI	4	4
202511	平果分公司	平果海城综合支局	776161006	黄炳康	全屋WIFI	3	2
202511	凌云分公司	凌云浪伏综合支局	776902293	陆金笑	全屋WIFI	4	4
202511	乐业分公司	乐业花坪综合支局	776456002	王功泽	全屋WIFI	4	3
202511	田阳分公司	田阳政企专业支局	776404004	黄武庆	全屋WIFI	1	1
202511	右江区分公司	右江区城西综合支局	776177383	邓显武	全屋WIFI	2	1
202511	田东分公司	田东思林综合支局	776360003	陆最香	全屋WIFI	3	3
202511	靖西分公司	靖西城南综合支局	776782673	郭康宝	全屋WIFI	8	8
202511	田阳分公司	田阳城东综合支局	776404007	黄文华	全屋WIFI	2	2
202511	田东分公司	田东城南综合支局	776354008	罗昌嵩	全屋WIFI	4	4
202511	右江区分公司	右江区城东综合支局	776776673	杨增友	全屋WIFI	2	2
202511	乐业分公司	新化综合支局	776791710	罗韶轩	宽带	5	4
202511	田阳分公司	头塘综合支局	776791213	黄罗峰	宽带	2	2
202511	平果分公司	平果城东综合支局	776051815	陈文禧	FTTR	6	6
202511	那坡分公司	龙合综合支局	776901212	黄宏语	宽带	2	2
202511	右江区分公司	右江区龙景综合支局	776779294	李生学	FTTR	9	7
202511	那坡分公司	那坡政企专业支局	776789051	岑博	宽带	2	2
202511	田林分公司	潞城综合支局	776779197	黎书醒	宽带	2	2
202511	田东分公司	田东城北综合支局	776354021	黄盛华	宽带	2	2
202511	田林分公司	田林定安综合支局	776779080	黄强立	FTTR	6	6
202511	德保分公司	马隘都安综合支局	776781373	黄志起	宽带	2	2
202511	田东分公司	田东城北综合支局	776779041	黄剑	FTTR	5	5
202511	靖西分公司	靖西城南综合支局	XN0006319	俞小神	FTTR	15	15
202511	田阳分公司	田阳百育综合支局	776790253	黄林龙	FTTR	4	4
202511	田东分公司	田东城北综合支局	776354016	农伟	FTTR	15	15
202511	田东分公司	田东城南综合支局	776354006	何雨	FTTR	12	12
202511	田林分公司	田林城西综合支局	XN0006625	韦志兵	FTTR	4	4
202511	右江区分公司	右江区四塘综合支局	776047056	马翔译	FTTR	7	7
202511	靖西分公司	靖西化峒综合支局	776790953	何开文	FTTR	5	5
202511	田东分公司	田东祥周综合支局	776366010	班锦波	FTTR	5	5
202511	平果分公司	平果新安综合支局	776140445	廖春峥	FTTR	3	3
202511	田阳分公司	田阳城东综合支局	776404007	黄文华	FTTR	5	5
202511	那坡分公司	那坡城南综合支局	776781551	陈元龙	FTTR	4	3
202511	田东分公司	田东城南综合支局	776791087	王磊	FTTR	11	8
202511	田阳分公司	田阳头塘综合支局	776791213	黄罗峰	FTTR	11	11
202511	德保分公司	德保东凌综合支局	776789485	阮荣达	FTTR	3	2
202511	靖西分公司	靖西武平综合支局	776791324	何大军	FTTR	4	4
202511	隆林分公司	隆林平班综合支局	776137039	罗桥廷	FTTR	12	12
202511	平果分公司	平果榜圩综合支局	776776539	黄泽锶	FTTR	5	5
202511	右江区分公司	右江区城西综合支局	776112808	何旭	FTTR	4	4
202511	田林分公司	田林六隆综合支局	776324001	韦建交	FTTR	7	7
202511	隆林分公司	隆林德峨综合支局	776790341	王诗宇	FTTR	1	1
202511	平果分公司	平果太平综合支局	776801479	韦家盛	FTTR	3	3
202511	田东分公司	田东城北综合支局	776777887	韦忠将	FTTR	7	7
202511	隆林分公司	隆林德峨综合支局	776903282	王吉昌	FTTR	5	5
202511	靖西分公司	靖西城南综合支局	776791149	凤昌浩	FTTR	3	3
202511	凌云分公司	凌云茶山综合支局	776789296	万恒乾	FTTR	1	1
202511	隆林分公司	隆林平班综合支局	776701816	马定威	FTTR	4	4
202511	西林分公司	西林那劳综合支局	776903224	蒙智强	FTTR	10	10
202511	右江区分公司	右江区城东综合支局	776047020	梁冬健	FTTR	1	1
202511	凌云分公司	凌云浩坤综合支局	776653052	王道正	FTTR	4	4
202511	田林分公司	田林八渡综合支局	776902137	农义忠	FTTR	2	2
202511	右江区分公司	右江区城东综合支局	776047019	黄镇权	FTTR	1	1
202511	凌云分公司	泗城综合支局	776653046	廖庆灵	FTTR	1	0
202511	靖西分公司	靖西湖润综合支局	776779725	卢发金	FTTR	9	8
202511	田东分公司	田东作登综合支局	776789210	梁海亮	FTTR	6	5
202511	德保分公司	德保马隘都安综合支局	776781373	黄志起	FTTR	6	6
202511	凌云分公司	凌云泗城综合支局	776653046	廖庆灵	FTTR	5	5
202511	右江区分公司	右江区龙川综合支局	776902262	梁效彰	FTTR	1	1
202511	德保分公司	德保燕峒龙光综合支局	776005015	黄绍都	FTTR	2	1
202511	凌云分公司	浪伏综合支局	776653052	王道正	FTTR	1	0
202511	右江区分公司	右江区澄碧湖综合支局	776144459	梁富林	FTTR	1	1
202511	田阳分公司	田阳西南综合支局	776404025	凌尔	FTTR	6	5
202511	靖西分公司	靖西果乐综合支局	776791149	凤昌浩	FTTR	3	3
202511	凌云分公司	凌云茶山综合支局	776701863	姚才状	FTTR	1	1
202511	靖西分公司	武平综合支局	776524005	黄春	FTTR	1	0
202511	平果分公司	平果城东综合支局	776791071	黄立程	FTTR	2	2
202511	平果分公司	平果铝城综合支局	776780514	陆信忠	宽带	6	6
202511	田阳分公司	百育综合支局	776407014	罗飞	宽带	1	1
202511	右江区分公司	右江区龙景综合支局	776901139	林雨健	宽带	3	3
202511	靖西分公司	靖西城北综合支局	776504020	农继勇	宽带	5	5
202511	右江区分公司	右江区龙景综合支局	776782707	杨旭	宽带	2	2
202511	平果分公司	太平综合支局	776801478	韦忠棒	宽带	2	2
202511	德保分公司	敬德巴头综合支局	776777811	黄健	宽带	2	2
202511	田林分公司	田林城西综合支局	776303060	阮敬翔	宽带	1	1
202511	凌云分公司	浪伏综合支局	776902293	陆金笑	宽带	1	1
202511	德保分公司	那甲隆桑支局	77650049	陆涛	宽带	1	1
202511	右江区分公司	右江区城东综合支局	776136822	肖君	宽带	1	1
202511	德保分公司	足荣荣华支局	776005003	李洛全	宽带	1	1
202511	田林分公司	田林旧州综合支局	776801680	罗梁闪	FTTR	1	1
202511	右江区分公司	右江区城西综合支局	776051811	张靖	全屋WIFI	2	2
202511	田林分公司	田林定安综合支局	776780466	黄左	全屋WIFI	1	1
202511	右江区分公司	右江区龙景综合支局	776782707	杨旭	全屋WIFI	3	1
202511	凌云分公司	凌云浪伏综合支局	776903366	何南华	全屋WIFI	5	1
202511	凌云分公司	凌云浩坤综合支局	776790241	郁长龙	全屋WIFI	3	2
202511	平果分公司	平果新安综合支局	100011762	陆文昭	全屋WIFI	10	5
202511	田林分公司	田林八渡综合支局	776782062	韦有富	全屋WIFI	2	1
202511	靖西分公司	靖西新甲综合支局	776779158	雷平	全屋WIFI	9	8
202511	西林分公司	西林古障综合支局	776902236	贺刚林	摄像头	2	2
202511	靖西分公司	靖西城南综合支局	776504030	邓明克	摄像头	4	4
202511	那坡分公司	那坡龙合综合支局	776211001	农京运	摄像头	19	16
202511	田林分公司	田林城西综合支局	776315003	伍班恒	摄像头	6	4
202511	平果分公司	平果铝城综合支局	776780520	杨国立	摄像头	6	6
202511	那坡分公司	那坡城北综合支局	776779330	莫尚敏	摄像头	8	6
202511	隆林分公司	隆林克长综合支局	776603038	张仕明	摄像头	19	14
202511	右江区分公司	右江区四塘综合支局	776777378	黄高科	摄像头	2	2
202511	凌云分公司	凌云泗城综合支局	776782724	田宏干	摄像头	9	9
202511	德保分公司	德保燕峒龙光综合支局	776780134	黄大耕	摄像头	10	10
202511	隆林分公司	隆林克长综合支局	776902373	曾清	摄像头	4	2
202511	田东分公司	田东思林综合支局	776791508	黄培	摄像头	5	5
202511	那坡分公司	那坡龙合综合支局	776901212	黄宏语	摄像头	14	12
202511	西林分公司	西林古障综合支局	776257001	熊忠前	摄像头	3	2
202511	凌云分公司	凌云茶山综合支局	776903365	冯文伸	摄像头	7	7
202511	田阳分公司	田阳洞靖综合支局	776903410	黄承壮	摄像头	6	6
202511	靖西分公司	靖西政企专业支局	100015499	黄加辉	摄像头	11	5
202511	右江区分公司	右江区城西综合支局	776110694	黎政华	摄像头	6	6
202511	乐业分公司	乐业新化综合支局	776791710	罗韶轩	摄像头	7	7
202511	德保分公司	德保敬德巴头综合支局	776777811	黄健	摄像头	8	8
202511	凌云分公司	凌云浩坤综合支局	776790051	劳兴新	摄像头	6	6
202511	田东分公司	田东思林综合支局	776354004	黄军权	摄像头	1	1
202511	隆林分公司	隆林者浪综合支局	776620004	王明尚	摄像头	6	6
202511	田阳分公司	田阳坡洪综合支局	776790251	杨忠敏	摄像头	20	20
202511	平果分公司	平果政企专业支局	776185063	卢勇	摄像头	4	4
202511	靖西分公司	靖西城北综合支局	776903109	雷国仕	摄像头	2	2
202511	靖西分公司	靖西安德综合支局	776503084	农昆	摄像头	1	1
202511	德保分公司	德保那甲隆桑综合支局	776780133	陆运正	摄像头	1	1
202511	德保分公司	德保敬德巴头综合支局	776789358	罗华义	摄像头	5	5
202511	平果分公司	平果城东综合支局	776780516	黄尚官	摄像头	1	1
202511	靖西分公司	靖西湖润综合支局	776903233	马国华	摄像头	4	2
202511	西林分公司	西林城北综合支局	776903378	黄健平	摄像头	14	9
202511	平果分公司	平果太平综合支局	776167002	黄寿松	摄像头	2	1
202511	田阳分公司	田阳洞靖综合支局	776801040	黄丹皞	摄像头	5	5
202511	右江区分公司	右江区龙川综合支局	776028004	韦绍程	摄像头	1	1
202511	田东分公司	田东林逢综合支局	776354024	刘伟臣	摄像头	1	1
202511	德保分公司	德保燕峒龙光综合支局	776106577	潘寿相	摄像头	2	2
202511	德保分公司	德保东凌综合支局	776791538	李荣振	摄像头	1	0
202511	靖西分公司	靖西化峒综合支局	776153132	何正涛	摄像头	1	1
202511	右江区分公司	右江区城东综合支局	776790080	唐运千	摄像头	1	1
202511	田东分公司	田东城南综合支局	776354006	何雨	摄像头	1	1
202511	靖西分公司	靖西城北综合支局	100040668	谢小科	摄像头	2	2
202511	田林分公司	田林定安综合支局	776701107	农俊杰	摄像头	1	1
202511	靖西分公司	靖西果乐综合支局	776504021	黄涛	摄像头	1	1
202511	那坡分公司	那坡城南综合支局	776789519	农尚升	全屋WIFI	4	2
202511	平果分公司	平果新安综合支局	776789649	黄江涛	全屋WIFI	8	5
202511	田东分公司	田东林逢综合支局	776354024	刘伟臣	全屋WIFI	3	3
202511	乐业分公司	乐业城市综合支局	776789435	袁宏科	全屋WIFI	10	10
202511	右江区分公司	右江区大王岭综合支局	776779763	李荣伟	全屋WIFI	4	4
202511	田林分公司	田林潞城综合支局	776779197	黎书醒	全屋WIFI	5	4
202511	靖西分公司	靖西地州综合支局	776782672	农昌健	全屋WIFI	8	8
202511	靖西分公司	靖西果乐综合支局	776801173	王海	全屋WIFI	9	8
202511	西林分公司	西林城北综合支局	776903378	黄健平	全屋WIFI	9	7
202511	田东分公司	田东城北综合支局	776777887	韦忠将	全屋WIFI	2	2
202511	右江区分公司	右江区龙景综合支局	776177381	黄熙武	全屋WIFI	9	7
202511	田东分公司	田东义圩综合支局	776365009	刘忠世	全屋WIFI	7	7
202511	凌云分公司	凌云茶山综合支局	776701863	姚才状	全屋WIFI	4	4
202511	右江区分公司	右江区四塘综合支局	776791047	黄承湘	全屋WIFI	7	7
202511	那坡分公司	那坡德隆综合支局	776204014	黄德新	全屋WIFI	1	1
202511	右江区分公司	右江区四塘综合支局	776781448	黄承虎	全屋WIFI	3	3
202511	西林分公司	西林古障综合支局	776782504	李林	全屋WIFI	4	3
202511	德保分公司	德保敬德巴头综合支局	776781441	黄特	全屋WIFI	8	8
202511	田东分公司	田东思林综合支局	776354004	黄军权	全屋WIFI	2	2
202511	田东分公司	田东林逢综合支局	776353120	岑忠友	全屋WIFI	5	3
202511	田林分公司	田林定安综合支局	776322005	韦宝林	全屋WIFI	4	4
202511	田东分公司	田东义圩综合支局	776359006	黄立升	全屋WIFI	3	2
202511	右江区分公司	右江区城中综合支局	776047054	李文照	全屋WIFI	3	3
202511	德保分公司	德保城北综合支局	776103065	雍正福	全屋WIFI	8	6
202511	隆林分公司	隆林德峨综合支局	776903282	王吉昌	全屋WIFI	11	10
202511	田阳分公司	田阳西南综合支局	776414014	蒙亮	全屋WIFI	8	8
202511	平果分公司	平果城东综合支局	776902443	黄冠文	全屋WIFI	7	6
202511	平果分公司	平果海城综合支局	776801629	黄义朗	全屋WIFI	3	2
202511	右江区分公司	右江区城中综合支局	776791248	梁安龙	全屋WIFI	4	2
202511	右江区分公司	右江区大王岭综合支局	776776827	朱诚能	全屋WIFI	3	3
202511	平果分公司	平果铝城综合支局	776154024	冯健洋	全屋WIFI	4	4
202511	田阳分公司	田阳百育综合支局	776137911	蒙柯睿	全屋WIFI	4	4
202511	乐业分公司	乐业城市综合支局	776901056	杨正国	全屋WIFI	7	5
202511	右江区分公司	右江区龙景综合支局	776782540	黄卓学	全屋WIFI	1	1
202511	隆林分公司	隆林者保综合支局	776903318	黄荣考	全屋WIFI	1	1
202511	凌云分公司	凌云浩坤综合支局	776790051	劳兴新	全屋WIFI	3	3
202511	那坡分公司	那坡城南综合支局	776781551	陈元龙	全屋WIFI	2	1
202511	靖西分公司	靖西政企专业支局	776521003	杨经星	全屋WIFI	7	7
202511	隆林分公司	隆林猪场综合支局	776701925	杨健	全屋WIFI	2	1
202511	靖西分公司	靖西禄峒综合支局	776902111	李永炼	全屋WIFI	4	3
202511	右江区分公司	右江区四塘综合支局	776047056	马翔译	全屋WIFI	1	1
202511	右江区分公司	右江区阳圩综合支局	776025005	何显文	全屋WIFI	1	1
202511	右江区分公司	右江区阳圩综合支局	776025005	何显文	全屋WIFI	3	1
202511	乐业分公司	甘田综合支局	776789575	黎明东	宽带	2	2
202511	那坡分公司	那坡城北综合支局	776791227	马晓东	宽带	1	1
202511	右江区分公司	右江区龙景综合支局	776791244	黄伟雄	宽带	3	3
202511	德保分公司	那甲隆桑支局	776117009	农恒造	宽带	3	3
202511	田阳分公司	玉凤综合支局	776779391	黄永吉	宽带	1	1
202511	右江区分公司	右江区城东综合支局	776790283	黄波	宽带	1	1
202511	隆林分公司	德峨综合支局	776790341	王诗宇	宽带	1	1
202511	隆林分公司	隆林城南综合支局	776903001	冯豈松	FTTR	16	16
202511	靖西分公司	靖西城南综合支局	776782673	郭康宝	FTTR	4	4
202511	靖西分公司	靖西果乐综合支局	776801173	王海	FTTR	11	5
202511	平果分公司	平果城东综合支局	776154009	黄笔清	FTTR	8	8
202511	田东分公司	田东朔良综合支局	776789212	陆问	FTTR	8	7
202511	德保分公司	德保马隘都安综合支局	776801339	林世吉	FTTR	1	1
202511	田阳分公司	田阳玉凤综合支局	776404029	黄中站	FTTR	1	1
202511	田东分公司	田东林逢综合支局	776354024	刘伟臣	FTTR	5	5
202511	隆林分公司	隆林隆或综合支局	776779380	冉登文	FTTR	5	5
202511	田阳分公司	田阳西南综合支局	776405028	黄聪	FTTR	4	4
202511	靖西分公司	靖西武平综合支局	776790952	李启校	FTTR	7	6
202511	右江区分公司	右江区大王岭综合支局	776776827	朱诚能	FTTR	1	1
202511	田东分公司	田东祥周综合支局	776156810	黄佐清	FTTR	3	3
202511	田东分公司	田东思林综合支局	776354004	黄军权	FTTR	3	3
202511	田东分公司	田东作登综合支局	776791508	黄培	FTTR	4	4
202511	那坡分公司	那坡城北综合支局	776777638	李绍龙	FTTR	12	12
202511	凌云分公司	凌云浪伏综合支局	776659002	杨再冲	FTTR	5	5
202511	德保分公司	德保城南综合支局	XN0006493	谭朝珠	FTTR	7	6
202511	右江区分公司	右江区龙景综合支局	776136775	陈昌维	FTTR	14	14
202511	田东分公司	田东作登综合支局	776368008	韦寿猛	FTTR	7	7
202511	田阳分公司	田阳百育综合支局	776407015	韦日行	FTTR	13	13
202511	隆林分公司	隆林猪场综合支局	776701925	杨健	FTTR	3	2
202511	那坡分公司	那坡德隆综合支局	776204014	黄德新	FTTR	2	2
202511	平果分公司	平果新安综合支局	100011762	陆文昭	FTTR	2	2
202511	靖西分公司	化峒综合支局	776520002	陆扬	FTTR	1	0
202511	乐业分公司	乐业新化综合支局	776902138	蒙世昌	FTTR	6	6
202511	平果分公司	平果铝城综合支局	776153061	马全军	FTTR	8	8
202511	德保分公司	德保足荣荣华综合支局	776005003	李洛全	FTTR	9	9
202511	田东分公司	田东义圩综合支局	776358001	李璜	FTTR	4	4
202511	右江区分公司	右江区澄碧湖综合支局	776032002	黄兴敏	FTTR	3	3
202511	右江区分公司	右江区城西综合支局	776047026	黎建云	FTTR	7	7
202511	凌云分公司	凌云泗城综合支局	776653044	姚华球	FTTR	3	3
202511	那坡分公司	那坡平孟综合支局	776203048	叶俊平	FTTR	3	3
202511	平果分公司	平果坡造综合支局	776789258	班兆秋	FTTR	2	2
202511	隆林分公司	隆林隆或综合支局	776791807	冉浩成	FTTR	3	3
202511	右江区分公司	右江区城中综合支局	776051812	李晓明	FTTR	6	6
202511	右江区分公司	右江区城东综合支局	776117367	刘升	FTTR	4	4
202511	田阳分公司	田阳城东综合支局	776790591	黄欢	FTTR	3	3
202511	那坡分公司	那坡龙合综合支局	776211005	王启江	FTTR	3	3
202511	隆林分公司	猪场综合支局	776790342	杨光平	FTTR	1	0
202511	右江区分公司	右江区大王岭综合支局	776789424	黄春江	FTTR	3	3
202511	乐业分公司	乐业甘田综合支局	776903149	陆义铭	FTTR	2	2
202511	右江区分公司	右江区城东综合支局	776136822	肖君	FTTR	2	2
202511	右江区分公司	右江区城西综合支局	776051811	张靖	FTTR	5	5
202511	右江区分公司	右江区四塘综合支局	776777378	黄高科	FTTR	7	7
202511	西林分公司	西林城北综合支局	776903378	黄健平	FTTR	10	10
202511	德保分公司	德保敬德巴头综合支局	776777811	黄健	FTTR	3	3
202511	那坡分公司	那坡德隆综合支局	776782119	杨贵龙	FTTR	2	2
202511	田阳分公司	田阳坡洪综合支局	776779084	韦东礼	FTTR	2	2
202511	德保分公司	德保足荣荣华综合支局	776902175	杨伟业	FTTR	1	1
202511	隆林分公司	者保综合支局	776903318	黄荣考	宽带	1	1
202511	田阳分公司	田阳西南综合支局	776405028	黄聪	宽带	2	2
202511	田林分公司	六隆综合支局	776780329	李斌	宽带	2	2
202511	隆林分公司	猪场综合支局	776701925	杨健	宽带	1	1
202511	靖西分公司	靖西城北综合支局	776903109	雷国仕	宽带	2	2
202511	田林分公司	六隆综合支局	776307002	罗肖	宽带	1	1
202511	乐业分公司	花坪综合支局	776707813	钟湛烃	宽带	4	4
202511	靖西分公司	靖西政企专业支局	100015499	黄加辉	宽带	2	2
202511	平果分公司	海城综合支局	776789581	黄成志	宽带	2	2
202511	凌云分公司	浪伏综合支局	776902269	唐大桉	宽带	1	1
202511	凌云分公司	泗城综合支局	776782067	田仁政	宽带	2	2
202511	靖西分公司	新甲综合支局	776503003	韦登昊	宽带	1	1
202511	平果分公司	平果城东综合支局	776051815	陈文禧	宽带	3	3
202511	德保分公司	马隘都安综合支局	776902173	黄克界	宽带	1	0
202511	平果分公司	平果城东综合支局	776051808	陆如成	宽带	1	1
202511	平果分公司	平果城东综合支局	776154009	黄笔清	宽带	1	1
202511	德保分公司	敬德巴头综合支局	776781441	黄特	宽带	1	1
202511	田阳分公司	田东义圩综合支局	776365009	刘忠世	FTTR	1	1
202511	右江区分公司	右江区城西综合支局	776779999	岑忠彩	FTTR	1	1
202511	右江区分公司	右江区四塘综合支局	776781448	黄承虎	FTTR	1	1
202511	田东分公司	田东祥周综合支局	776365003	刘伟	全屋WIFI	1	1
202511	田阳分公司	田阳百育综合支局	776407015	韦日行	全屋WIFI	1	1
202511	田林分公司	田林潞城综合支局	776791413	梁深健	全屋WIFI	5	5
202511	田阳分公司	田阳城东综合支局	776404023	覃山	全屋WIFI	5	5
202511	田林分公司	田林八渡综合支局	776902137	农义忠	全屋WIFI	3	3
202511	田林分公司	田林六隆综合支局	776780329	李斌	全屋WIFI	8	8
202511	右江区分公司	右江区龙景综合支局	776136775	陈昌维	摄像头	5	4
202511	平果分公司	平果海城综合支局	776161006	黄炳康	摄像头	8	8
202511	平果分公司	平果城东综合支局	776902443	黄冠文	摄像头	2	2
202511	田阳分公司	田阳头塘综合支局	776107864	潘家明	摄像头	8	8
202511	田阳分公司	田阳洞靖综合支局	776406003	李勇	摄像头	4	3
202511	那坡分公司	那坡德隆综合支局	776204014	黄德新	摄像头	3	3
202511	平果分公司	平果海城综合支局	776154010	李继宁	摄像头	1	1
202511	田东分公司	田东城南综合支局	776354008	罗昌嵩	摄像头	4	4
202511	隆林分公司	隆林平班综合支局	776137039	罗桥廷	摄像头	45	36
202511	田东分公司	田东城北综合支局	776354010	宁彬	摄像头	8	6
202511	田林分公司	田林城西综合支局	776313007	杨绍远	摄像头	4	4
202511	田东分公司	田东城北综合支局	776364001	周作弟	摄像头	2	2
202511	凌云分公司	凌云茶山综合支局	776701863	姚才状	摄像头	4	4
202511	右江区分公司	右江区龙景综合支局	776110696	马均福	摄像头	4	4
202511	右江区分公司	右江区城中综合支局	776782633	黄新建	摄像头	4	4
202511	田东分公司	田东城南综合支局	XN0006617	黄城生	摄像头	5	5
202511	田阳分公司	田阳城东综合支局	776404023	覃山	摄像头	6	6
202511	德保分公司	德保足荣荣华综合支局	776005003	李洛全	摄像头	11	11
202511	右江区分公司	右江区阳圩综合支局	776117376	李京津	摄像头	1	1
202511	平果分公司	平果太平综合支局	776801479	韦家盛	摄像头	1	0
202511	平果分公司	平果榜圩综合支局	776776539	黄泽锶	摄像头	8	8
202511	德保分公司	德保那甲隆桑综合支局	77650049	陆涛	摄像头	7	6
202511	隆林分公司	隆林政企专业支局	776790368	柳隆文	摄像头	7	7
202511	田阳分公司	田阳洞靖综合支局	776409006	梁文	摄像头	2	2
202511	右江区分公司	右江区城东综合支局	776136771	黄景玉	宽带	2	2
202511	靖西分公司	靖西禄峒综合支局	776902111	李永炼	摄像头	4	2
202511	西林分公司	西林城北综合支局	100028194	农文师	摄像头	8	8
202511	平果分公司	平果坡造综合支局	776051817	石盛宇	摄像头	7	7
202511	隆林分公司	隆林者保综合支局	776903318	黄荣考	摄像头	1	1
202511	田林分公司	田林八渡综合支局	776782062	韦有富	摄像头	2	1
202511	右江区分公司	右江区城东综合支局	776047009	黄明德	宽带	1	1
202511	平果分公司	平果榜圩综合支局	XN0006762	陆舜龙	摄像头	1	1
202511	右江区分公司	右江区四塘综合支局	776781448	黄承虎	摄像头	2	0
202511	右江区分公司	右江区城西综合支局	776051811	张靖	摄像头	5	5
202511	西林分公司	西林古障综合支局	776777061	刘建林	摄像头	6	5
202511	凌云分公司	凌云泗城综合支局	776653044	姚华球	摄像头	4	4
202511	隆林分公司	隆林城北综合支局	776902083	严余	摄像头	1	1
202511	乐业分公司	乐业新化综合支局	776453066	黎源	摄像头	3	2
202511	平果分公司	平果铝城综合支局	776185061	宋显辉	摄像头	2	2
202511	田阳分公司	田阳洞靖综合支局	776801040	黄丹皞	全屋WIFI	2	2
202511	平果分公司	平果城东综合支局	776051815	陈文禧	全屋WIFI	15	13
202511	田东分公司	田东作登综合支局	7763610044	黄作山	全屋WIFI	2	2
202511	德保分公司	德保足荣荣华综合支局	776005003	李洛全	全屋WIFI	10	9
202511	德保分公司	德保马隘都安综合支局	776902173	黄克界	全屋WIFI	10	8
202511	右江区分公司	右江区龙景综合支局	776117372	韦晨冬	全屋WIFI	5	4
202511	平果分公司	平果铝城综合支局	776780520	杨国立	全屋WIFI	11	11
202511	靖西分公司	靖西城南综合支局	776504025	黄日赞	全屋WIFI	9	7
202511	田阳分公司	田阳百育综合支局	776790253	黄林龙	全屋WIFI	2	1
202511	那坡分公司	那坡城北综合支局	776777638	李绍龙	全屋WIFI	2	2
202511	田东分公司	田东城南综合支局	776791087	王磊	全屋WIFI	5	3
202511	靖西分公司	靖西化峒综合支局	776790953	何开文	全屋WIFI	14	8
202511	隆林分公司	隆林猪场综合支局	776790342	杨光平	全屋WIFI	14	10
202511	田阳分公司	田阳头塘综合支局	776503015	颜力顺	全屋WIFI	3	1
202511	西林分公司	西林城北综合支局	776801211	陆宇杭	全屋WIFI	1	1
202511	靖西分公司	靖西城北综合支局	776504016	陆刚豪	全屋WIFI	4	4
202511	右江区分公司	右江区城西综合支局	776047026	黎建云	全屋WIFI	4	4
202511	靖西分公司	靖西禄峒综合支局	776156286	杨荇	全屋WIFI	4	4
202511	田林分公司	田林潞城综合支局	776777743	李秉罡	全屋WIFI	13	12
202511	田阳分公司	田阳坡洪综合支局	776779084	韦东礼	全屋WIFI	4	3
202511	右江区分公司	右江区城西综合支局	776177383	邓显武	全屋WIFI	1	1
202511	隆林分公司	隆林隆或综合支局	776701942	吴凯	全屋WIFI	6	3
202511	靖西分公司	靖西禄峒综合支局	776790202	肖祥友	全屋WIFI	3	2
202511	乐业分公司	乐业城市综合支局	776779381	黄朝浩	全屋WIFI	4	4
202511	田东分公司	田东城北综合支局	776364001	周作弟	全屋WIFI	7	5
202511	平果分公司	平果城东综合支局	776153023	陆炜	全屋WIFI	2	2
202511	田东分公司	田东义圩综合支局	776358001	李璜	全屋WIFI	7	5
202511	右江区分公司	右江区城东综合支局	776136771	黄景玉	全屋WIFI	4	4
202511	那坡分公司	那坡龙合综合支局	776211005	王启江	全屋WIFI	7	6
202511	隆林分公司	隆林隆或综合支局	776791807	冉浩成	全屋WIFI	3	3
202511	靖西分公司	靖西城北综合支局	100040668	谢小科	全屋WIFI	6	6
202511	西林分公司	西林那佐综合支局	776790469	黄海波	全屋WIFI	10	10
202511	西林分公司	西林那佐综合支局	776781782	李卫	全屋WIFI	3	1
202511	平果分公司	平果旧城综合支局	776153049	黄忠诚	全屋WIFI	3	1
202511	田东分公司	田东祥周综合支局	776102410	李天北	全屋WIFI	1	1
202511	右江区分公司	右江区四塘综合支局	776024001	罗忠良	全屋WIFI	5	3
202511	德保分公司	德保足荣荣华综合支局	776902175	杨伟业	全屋WIFI	3	2
202511	田阳分公司	田阳百育综合支局	776407014	罗飞	全屋WIFI	2	2
202511	西林分公司	西林政企专业支局	776256007	贺刚银	全屋WIFI	1	0
202511	凌云分公司	凌云泗城综合支局	776653046	廖庆灵	全屋WIFI	2	2
202511	靖西分公司	靖西城南综合支局	776518002	黄军	宽带	1	1
202511	平果分公司	平果铝城综合支局	776780520	杨国立	宽带	1	1
202511	靖西分公司	安德综合支局	776791148	黄明芳	宽带	2	2
202511	右江区分公司	右江区城东综合支局	776136771	黄景玉	FTTR	6	5
202511	右江区分公司	右江区城西综合支局	776782705	谷修顿	宽带	4	3
202511	右江区分公司	右江区澄碧湖综合支局	776032002	黄兴敏	宽带	5	5
202511	乐业分公司	新化综合支局	776902138	蒙世昌	宽带	1	1
202511	右江区分公司	右江区四塘综合支局	776781448	黄承虎	FTTR	3	3
202511	右江区分公司	右江区城东综合支局	776790080	唐运千	FTTR	2	2
202511	田东分公司	田东城南综合支局	XN0006619	卢万祥	FTTR	9	9
202511	凌云分公司	凌云浪伏综合支局	776903366	何南华	FTTR	6	6
202511	乐业分公司	乐业城市综合支局	776901056	杨正国	FTTR	6	6
202511	平果分公司	平果铝城综合支局	776780514	陆信忠	FTTR	15	15
202511	右江区分公司	右江区龙景综合支局	776782707	杨旭	FTTR	7	7
202511	田阳分公司	田阳头塘综合支局	776503015	颜力顺	FTTR	1	1
202511	德保分公司	德保燕峒龙光综合支局	776141435	凌振鑫	FTTR	5	3
202511	隆林分公司	隆林城北综合支局	776701144	范虹	FTTR	8	8
202511	右江区分公司	右江区龙景综合支局	776901139	林雨健	FTTR	8	8
202511	田阳分公司	田阳城东综合支局	776791329	李文武	FTTR	3	3
202511	那坡分公司	那坡平孟综合支局	776789146	何国强	FTTR	8	8
202511	隆林分公司	隆林隆或综合支局	776790485	龙占权	FTTR	7	7
202511	平果分公司	平果铝城综合支局	XN0006607	凌承龙	FTTR	7	7
202511	隆林分公司	隆林平班综合支局	776603036	黄运	FTTR	2	0
202511	那坡分公司	那坡城南综合支局	776789519	农尚升	FTTR	5	5
202511	田东分公司	田东城北综合支局	776354010	宁彬	FTTR	2	2
202511	凌云分公司	凌云浪伏综合支局	776653052	王道正	FTTR	1	0
202511	右江区分公司	右江区龙景综合支局	776776365	农新鹏	FTTR	6	6
202511	右江区分公司	右江区城东综合支局	776117379	罗迢	FTTR	4	4
202511	平果分公司	平果旧城综合支局	776780515	黄新淋	FTTR	9	9
202511	德保分公司	德保城南综合支局	776108001	罗胜	FTTR	5	5
202511	平果分公司	平果太平综合支局	776801478	韦忠棒	FTTR	2	2
202511	平果分公司	平果旧城综合支局	776153049	黄忠诚	FTTR	2	2
202511	隆林分公司	隆林者保综合支局	776903160	杨银	FTTR	2	2
202511	平果分公司	平果新安综合支局	776801477	韦银	FTTR	1	1
202511	田林分公司	田林潞城综合支局	776777743	李秉罡	FTTR	5	5
202511	靖西分公司	靖西武平综合支局	776524005	黄春	FTTR	1	0
202511	那坡分公司	那坡城北综合支局	776791227	马晓东	FTTR	8	8
202511	西林分公司	西林古障综合支局	776790461	农何信	FTTR	7	7
202511	靖西分公司	靖西龙邦综合支局	776507004	韦正策	FTTR	2	2
202511	田阳分公司	田阳百育综合支局	776407014	罗飞	FTTR	2	2
202511	平果分公司	平果海城综合支局	776161006	黄炳康	FTTR	4	4
202511	田东分公司	田东林逢综合支局	776359006	黄立升	FTTR	1	0
202511	田阳分公司	田阳政企专业支局	776801355	蒙常流	FTTR	3	3
202511	平果分公司	平果装机工程班	776701962	黄亨	FTTR	1	0
202511	右江区分公司	右江区澄碧湖综合支局	776103077	何贵仕	FTTR	1	1
202511	靖西分公司	龙邦综合支局	776144677	黄盛旺	FTTR	1	0
202511	田林分公司	田林旧州综合支局	776308002	班雄雨	FTTR	3	3
202511	西林分公司	西林八达综合支局	776256001	农全荣	FTTR	1	1
202511	凌云分公司	茶山综合支局	776701863	姚才状	宽带	1	0
202511	德保分公司	燕峒龙光综合支局	776141435	凌振鑫	宽带	1	1
202511	右江区分公司	龙川综合支局	776028004	韦绍程	宽带	1	1
202511	田阳分公司	头塘综合支局	776503015	颜力顺	宽带	2	2
202511	那坡分公司	龙合综合支局	776211001	农京运	宽带	1	1
202511	隆林分公司	隆或综合支局	776790485	龙占权	宽带	2	2
202511	田阳分公司	洞靖综合支局	776406003	李勇	宽带	1	1
202511	田阳分公司	田阳城东综合支局	776790591	黄欢	宽带	1	1
202511	靖西分公司	武平综合支局	776790952	李启校	宽带	1	1
202511	田林分公司	田林城西综合支局	776801709	赵金寿	宽带	2	2
202511	田阳分公司	百育综合支局	776407015	韦日行	宽带	1	1
202511	田东分公司	田东城北综合支局	776353129	张帅	宽带	2	2
202511	德保分公司	德保城南综合支局	776104009	黄芨德	宽带	1	1
202511	凌云分公司	右江区龙景综合支局	776136775	陈昌维	FTTR	1	1
202511	右江区分公司	右江区大王岭综合支局	776902268	邝震	FTTR	1	1
202511	右江区分公司	右江区龙景综合支局	776782540	黄卓学	全屋WIFI	2	1
202511	那坡分公司	那坡平孟综合支局	776789146	何国强	全屋WIFI	1	1
202511	右江区分公司	右江区阳圩综合支局	776117376	李京津	全屋WIFI	1	1
202511	乐业分公司	乐业新化综合支局	776902138	蒙世昌	全屋WIFI	7	7
202511	平果分公司	平果太平综合支局	776903221	黄伟君	全屋WIFI	2	2
202511	德保分公司	德保城北综合支局	776107001	梁爽	全屋WIFI	6	5
202511	隆林分公司	隆林隆或综合支局	776790485	龙占权	全屋WIFI	3	2
202511	田东分公司	作登综合支局	776791508	黄培	宽带	1	1
202511	隆林分公司	猪场综合支局	776790342	杨光平	宽带	1	1
202511	乐业分公司	乐业城市综合支局	776779381	黄朝浩	宽带	2	1
202511	乐业分公司	新化综合支局	776453066	黎源	宽带	1	1
202511	靖西分公司	靖西安德综合支局	776791148	黄明芳	摄像头	9	7
202511	德保分公司	德保城北综合支局	776107001	梁爽	摄像头	12	12
202511	田东分公司	田东印茶综合支局	776358003	农国亮	摄像头	4	3
202511	右江区分公司	右江区城中综合支局	776047054	李文照	摄像头	3	3
202511	隆林分公司	隆林德峨综合支局	776903282	王吉昌	摄像头	23	23
202511	田阳分公司	田阳百育综合支局	776137911	蒙柯睿	摄像头	1	1
202511	右江区分公司	右江区城东综合支局	776047020	梁冬健	摄像头	4	4
202511	田林分公司	田林城西综合支局	776303060	阮敬翔	摄像头	7	3
202511	田林分公司	田林六隆综合支局	776324001	韦建交	摄像头	8	8
202511	田东分公司	田东祥周综合支局	776366013	梁福翔	摄像头	4	4
202511	右江区分公司	右江区龙景综合支局	776177381	黄熙武	摄像头	9	1
202511	靖西分公司	靖西禄峒综合支局	776156286	杨荇	摄像头	3	3
202511	田林分公司	田林定安综合支局	776780466	黄左	摄像头	5	2
202511	隆林分公司	隆林者保综合支局	776903160	杨银	摄像头	4	2
202511	平果分公司	平果新安综合支局	776801477	韦银	摄像头	1	1
202511	靖西分公司	靖西禄峒综合支局	776790202	肖祥友	摄像头	8	5
202511	平果分公司	平果旧城综合支局	776789729	陆兆欢	摄像头	5	5
202511	田林分公司	田林城西综合支局	776801709	赵金寿	摄像头	8	6
202511	西林分公司	西林政企专业支局	776136629	罗昌福	摄像头	7	7
202511	田东分公司	田东城北综合支局	776353129	张帅	摄像头	7	7
202511	西林分公司	西林八达综合支局	776256001	农全荣	摄像头	6	5
202511	田东分公司	田东祥周综合支局	776366010	班锦波	摄像头	3	2
202511	田阳分公司	田阳洞靖综合支局	776779400	罗朝壮	摄像头	4	4
202511	凌云分公司	凌云浩坤综合支局	776790241	郁长龙	摄像头	4	4
202511	隆林分公司	隆林隆或综合支局	776701942	吴凯	摄像头	16	16
202511	田阳分公司	田阳西南综合支局	XN0006559	陆庆华	摄像头	4	3
202511	田东分公司	田东作登综合支局	776353121	黄振军	摄像头	4	2
202511	隆林分公司	隆林隆或综合支局	776776283	黄昌谋	摄像头	2	1
202511	田阳分公司	田阳玉凤综合支局	776408004	廖瑞鹏	摄像头	2	2
202511	那坡分公司	那坡平孟综合支局	776782530	农建明	摄像头	1	0
202511	田阳分公司	田阳百育综合支局	776790253	黄林龙	摄像头	1	0
202511	田东分公司	田东祥周综合支局	776156810	黄佐清	摄像头	15	14
202511	隆林分公司	隆林城北综合支局	776701144	范虹	摄像头	6	6
202511	乐业分公司	乐业花坪综合支局	776456002	王功泽	摄像头	3	2
202511	田林分公司	田林六隆综合支局	776780495	黄成东	摄像头	3	3
202511	那坡分公司	那坡百省综合支局	776902426	姚明	摄像头	3	3
202511	凌云分公司	凌云政企专业支局	776653031	杨再升	摄像头	7	7
202511	平果分公司	平果新安综合支局	776789649	黄江涛	摄像头	9	7
202511	那坡分公司	那坡平孟综合支局	776789146	何国强	摄像头	1	1
202511	右江区分公司	右江区城中综合支局	776051812	李晓明	摄像头	3	3
202511	靖西分公司	靖西龙邦综合支局	776144677	黄盛旺	FTTR	19	20
202511	右江区分公司	右江区龙景综合支局	776782707	杨旭	摄像头	3	3
202511	田阳分公司	田阳那坡综合支局	776411016	李羿澄	摄像头	1	1
202511	西林分公司	西林八达综合支局	776903223	黄雪龙	摄像头	4	4
202511	右江区分公司	右江区城中综合支局	776047054	李文照	摄像头	1	0
202511	隆林分公司	隆林者浪综合支局	776603031	杨腾英	摄像头	1	1
202511	靖西分公司	靖西禄峒综合支局	776779729	杨文腾	摄像头	2	0
202511	右江区分公司	右江区龙景综合支局	776782706	黄雨	摄像头	3	1
202511	右江区分公司	右江区龙景综合支局	776776365	农新鹏	全屋WIFI	3	2
202511	右江区分公司	右江区龙景综合支局	776782540	黄卓学	全屋WIFI	3	3
202511	田林分公司	田林城西综合支局	776315003	伍班恒	全屋WIFI	10	7
202511	田林分公司	田林城西综合支局	776303060	阮敬翔	全屋WIFI	4	3
202511	右江区分公司	右江区龙川综合支局	776028004	韦绍程	全屋WIFI	3	2
202511	德保分公司	德保马隘都安综合支局	776781537	陆日宁	全屋WIFI	8	8
202511	田东分公司	田东城北综合支局	776354021	黄盛华	全屋WIFI	7	7
202511	田林分公司	田林八渡综合支局	776701447	梁贵荣	全屋WIFI	2	1
202511	靖西分公司	靖西城南综合支局	776504030	邓明克	全屋WIFI	4	4
202511	德保分公司	德保城南综合支局	776108001	罗胜	全屋WIFI	16	14
202511	田东分公司	田东作登综合支局	776791508	黄培	全屋WIFI	1	1
202511	靖西分公司	靖西城北综合支局	776903109	雷国仕	全屋WIFI	7	5
202511	隆林分公司	隆林城北综合支局	776902083	严余	全屋WIFI	3	3
202511	平果分公司	平果旧城综合支局	776789729	陆兆欢	全屋WIFI	3	3
202511	田林分公司	田林六隆综合支局	776780495	黄成东	全屋WIFI	7	5
202511	靖西分公司	靖西龙邦综合支局	776144677	黄盛旺	全屋WIFI	6	6
202511	平果分公司	平果海城综合支局	776789581	黄成志	全屋WIFI	11	8
202511	右江区分公司	右江区城东综合支局	776136822	肖君	全屋WIFI	3	3
202511	右江区分公司	右江区澄碧湖综合支局	776032002	黄兴敏	全屋WIFI	5	5
202511	隆林分公司	隆林政企专业支局	776790368	柳隆文	全屋WIFI	1	1
202511	凌云分公司	凌云泗城综合支局	776782724	田宏干	全屋WIFI	4	4
202511	平果分公司	平果坡造综合支局	776789258	班兆秋	全屋WIFI	4	3
202511	德保分公司	德保东凌综合支局	776789485	阮荣达	全屋WIFI	6	5
202511	隆林分公司	隆林城北综合支局	776801641	尤龙	全屋WIFI	3	2
202511	右江区分公司	右江区大王岭综合支局	776789424	黄春江	全屋WIFI	3	2
202511	平果分公司	平果城东综合支局	XN0006606	梁海	全屋WIFI	2	2
202511	德保分公司	德保那甲隆桑综合支局	77650049	陆涛	全屋WIFI	6	5
202511	右江区分公司	右江区大王岭综合支局	776902268	邝震	全屋WIFI	2	2
202511	田东分公司	田东思林综合支局	776791508	黄培	全屋WIFI	2	2
202511	平果分公司	平果城东综合支局	776051808	陆如成	全屋WIFI	3	3
202511	靖西分公司	新甲综合支局	776779158	雷平	宽带	3	3
202511	那坡分公司	那坡城南综合支局	776789519	农尚升	宽带	1	1
202511	西林分公司	西林城北综合支局	100028194	农文师	FTTR	10	10
202511	德保分公司	德保城北综合支局	776103065	雍正福	宽带	4	4
202511	田东分公司	作登综合支局	776368008	韦寿猛	宽带	1	1
202511	平果分公司	平果铝城综合支局	776153061	马全军	宽带	1	1
202511	德保分公司	德保敬德巴头综合支局	776781441	黄特	FTTR	1	1
202511	右江区分公司	右江区龙景综合支局	776110696	马均福	FTTR	5	5
202511	德保分公司	德保马隘都安综合支局	776701579	罗世金	FTTR	9	9
202511	田林分公司	田林城西综合支局	776801709	赵金寿	FTTR	12	11
202511	平果分公司	平果旧城综合支局	776051818	李继文	FTTR	2	2
202511	田东分公司	田东祥周综合支局	776366013	梁福翔	FTTR	5	5
202511	靖西分公司	靖西地州综合支局	776790955	梁健	FTTR	11	11
202511	田东分公司	田东城南综合支局	XN0006617	黄城生	FTTR	8	8
202511	平果分公司	平果铝城综合支局	776153031	农国营	FTTR	6	6
202511	右江区分公司	右江区龙景综合支局	776782706	黄雨	FTTR	6	6
202511	田东分公司	田东印茶综合支局	776358003	农国亮	FTTR	6	6
202511	田林分公司	田林六隆综合支局	776780329	李斌	FTTR	6	6
202511	右江区分公司	右江区龙景综合支局	776177381	黄熙武	FTTR	8	8
202511	德保分公司	德保城北综合支局	776107001	梁爽	FTTR	4	3
202511	隆林分公司	隆林城北综合支局	776903002	田孟法	FTTR	15	15
202511	右江区分公司	右江区大王岭综合支局	776779763	李荣伟	FTTR	2	2
202511	田东分公司	田东祥周综合支局	XN0006622	张立亮	FTTR	11	10
202511	西林分公司	西林那佐综合支局	776790469	黄海波	FTTR	16	16
202511	平果分公司	平果旧城综合支局	776789729	陆兆欢	FTTR	4	4
202511	乐业分公司	乐业城市综合支局	776790150	吴显昆	FTTR	10	10
202511	平果分公司	平果城东综合支局	776168002	黄承东	FTTR	11	11
202511	凌云分公司	凌云茶山综合支局	776655017	陈霖	FTTR	3	3
202511	那坡分公司	那坡百省综合支局	776206001	农荣锋	FTTR	3	3
202511	西林分公司	西林古障综合支局	776257001	熊忠前	FTTR	3	3
202511	靖西分公司	地州综合支局	776782672	农昌健	FTTR	1	0
202511	田阳分公司	田阳洞靖综合支局	776406003	李勇	FTTR	3	3
202511	平果分公司	平果铝城综合支局	776154024	冯健洋	FTTR	3	3
202511	田林分公司	田林定安综合支局	776780466	黄左	FTTR	3	3
202511	田阳分公司	田阳那坡综合支局	776419005	黄忠法	FTTR	8	8
202511	平果分公司	平果铝城综合支局	776185061	宋显辉	FTTR	2	2
202511	西林分公司	西林城北综合支局	776801211	陆宇杭	FTTR	9	9
202511	那坡分公司	那坡龙合综合支局	776901212	黄宏语	FTTR	2	2
202511	平果分公司	平果坡造综合支局	776165002	杨志州	FTTR	1	1
202511	平果分公司	平果太平综合支局	776903221	黄伟君	FTTR	7	7
202511	靖西分公司	靖西化峒综合支局	776520002	陆扬	FTTR	5	4
202511	隆林分公司	隆林隆或综合支局	776701942	吴凯	FTTR	3	3
202511	田东分公司	田东思林综合支局	776360003	陆最香	FTTR	2	2
202511	右江区分公司	右江区城西综合支局	776782705	谷修顿	FTTR	2	2
202511	右江区分公司	右江区城东综合支局	776790283	黄波	FTTR	3	3
202511	隆林分公司	隆林克长综合支局	776801393	张传	FTTR	1	0
202511	田东分公司	田东义圩综合支局	776359006	黄立升	FTTR	2	1
202511	田阳分公司	田阳城东综合支局	776782469	黄海东	FTTR	1	1
202511	西林分公司	西林古障综合支局	776902236	贺刚林	FTTR	2	2
202511	乐业分公司	乐业甘田综合支局	776789575	黎明东	FTTR	3	3
202511	平果分公司	太平综合支局	776903221	黄伟君	宽带	3	3
202511	田东分公司	田东城南综合支局	XN0006619	卢万祥	宽带	4	4
202511	平果分公司	榜圩综合支局	776776539	黄泽锶	宽带	3	2
202511	田林分公司	六隆综合支局	776780495	黄成东	宽带	1	1
202511	平果分公司	旧城综合支局	776789729	陆兆欢	宽带	1	1
202511	右江区分公司	右江区城东综合支局	776776673	杨增友	宽带	1	1
202511	右江区分公司	右江区城西综合支局	776112808	何旭	宽带	2	2
202511	凌云分公司	浩坤综合支局	776653052	王道正	宽带	1	1
202511	右江区分公司	右江区城中综合支局	776791248	梁安龙	宽带	2	2
202511	田东分公司	思林综合支局	776360003	陆最香	宽带	2	0
202511	平果分公司	坡造综合支局	776789258	班兆秋	宽带	1	1
202511	田东分公司	林逢综合支局	776353120	岑忠友	宽带	1	1
202511	靖西分公司	禄峒综合支局	776156286	杨荇	宽带	1	1
202511	隆林分公司	隆林城北综合支局	776801641	尤龙	宽带	1	1
202511	右江区分公司	右江区龙景综合支局	776782707	杨旭	全屋WIFI	1	1
202511	平果分公司	平果铝城综合支局	776153024	许康安	全屋WIFI	1	1
202511	平果分公司	平果新安综合支局	776051813	黄新哲	全屋WIFI	2	2
202511	德保分公司	德保城北综合支局	776801421	黄仕全	全屋WIFI	1	1
202511	右江区分公司	右江区城东综合支局	776047019	黄镇权	全屋WIFI	1	1
202511	右江区分公司	右江区龙川综合支局	776902262	梁效彰	全屋WIFI	1	0
202511	右江区分公司	右江区城西综合支局	776112808	何旭	全屋WIFI	5	5
202511	平果分公司	平果旧城综合支局	776051818	李继文	全屋WIFI	2	2
202511	右江区分公司	右江区龙景综合支局	776776365	农新鹏	宽带	4	4
202511	平果分公司	平果新安综合支局	776140445	廖春峥	摄像头	7	6
202511	田东分公司	田东作登综合支局	776789210	梁海亮	摄像头	6	5
202511	西林分公司	西林那佐综合支局	776790469	黄海波	摄像头	18	18
202511	凌云分公司	凌云浪伏综合支局	776903366	何南华	摄像头	7	7
202511	田阳分公司	田阳城东综合支局	776791329	李文武	摄像头	10	10
202511	那坡分公司	那坡城北综合支局	776777638	李绍龙	摄像头	15	11
202511	右江区分公司	右江区城东综合支局	776136822	肖君	摄像头	2	2
202511	那坡分公司	那坡德隆综合支局	776778054	李双宏	摄像头	10	2
202511	德保分公司	德保城南综合支局	776108001	罗胜	摄像头	13	13
202511	那坡分公司	那坡城北综合支局	776791227	马晓东	摄像头	10	4
202511	靖西分公司	靖西城南综合支局	100040666	周密根	摄像头	5	5
202511	隆林分公司	隆林隆或综合支局	776779380	冉登文	摄像头	11	9
202511	那坡分公司	那坡平孟综合支局	776212001	凌正伟	摄像头	5	4
202511	靖西分公司	靖西武平综合支局	776903110	何振飘	摄像头	4	3
202511	德保分公司	德保城南综合支局	XN0006493	谭朝珠	摄像头	9	8
202511	田阳分公司	田阳坡洪综合支局	776779084	韦东礼	摄像头	4	4
202511	平果分公司	平果海城综合支局	776789581	黄成志	摄像头	5	5
202511	右江区分公司	右江区城东综合支局	776117379	罗迢	摄像头	5	5
202511	凌云分公司	凌云泗城综合支局	776782067	田仁政	摄像头	6	3
202511	靖西分公司	靖西新甲综合支局	776779158	雷平	摄像头	15	15
202511	那坡分公司	那坡城南综合支局	776781551	陈元龙	摄像头	13	12
202511	凌云分公司	凌云浪伏综合支局	776659003	周歧稳	摄像头	3	3
202511	田阳分公司	田阳头塘综合支局	776791213	黄罗峰	摄像头	11	12
202511	田阳分公司	田阳西南综合支局	776414014	蒙亮	摄像头	7	7
202511	田林分公司	田林六隆综合支局	776307002	罗肖	摄像头	3	3
202511	德保分公司	德保城北综合支局	776801421	黄仕全	摄像头	13	12
202511	右江区分公司	右江区大王岭综合支局	776779763	李荣伟	摄像头	2	2
202511	右江区分公司	右江区城西综合支局	776779999	岑忠彩	摄像头	2	0
202511	靖西分公司	靖西化峒综合支局	776520002	陆扬	摄像头	5	4
202511	右江区分公司	右江区城中综合支局	776780541	吴东平	摄像头	3	2
202511	凌云分公司	凌云政企专业支局	776791111	肖仕杰	摄像头	1	1
202511	乐业分公司	乐业城市综合支局	776779381	黄朝浩	摄像头	16	9
202511	德保分公司	德保那甲隆桑综合支局	776117009	农恒造	摄像头	5	5
202511	右江区分公司	右江区大王岭综合支局	776789424	黄春江	摄像头	3	3
202511	乐业分公司	乐业新化综合支局	776902138	蒙世昌	摄像头	2	2
202511	田林分公司	田林旧州综合支局	776308002	班雄雨	摄像头	3	3
202511	靖西分公司	靖西武平综合支局	776790952	李启校	摄像头	6	4
202511	乐业分公司	乐业花坪综合支局	776707813	钟湛烃	摄像头	9	9
202511	西林分公司	西林那佐综合支局	776781782	李卫	摄像头	15	9
202511	隆林分公司	隆林城南综合支局	776903001	冯豈松	摄像头	11	7
202511	右江区分公司	右江区大王岭综合支局	776776827	朱诚能	摄像头	2	2
202511	田东分公司	田东城南综合支局	776791087	王磊	摄像头	1	1
202511	凌云分公司	凌云泗城综合支局	776653046	廖庆灵	摄像头	5	4
202511	右江区分公司	右江区四塘综合支局	776791047	黄承湘	摄像头	7	7
202511	田阳分公司	田阳头塘综合支局	776415002	林凯旋	摄像头	11	5
202511	田阳分公司	头塘综合支局	776107864	潘家明	宽带	1	0
202511	右江区分公司	右江区城东综合支局	776136771	黄景玉	摄像头	1	1
202511	右江区分公司	右江区城东综合支局	776047025	莫嘉文	摄像头	1	0
202511	平果分公司	平果铝城综合支局	776153024	许康安	摄像头	1	1
202511	右江区分公司	右江区城东综合支局	776117367	刘升	摄像头	1	1
202511	靖西分公司	靖西城南综合支局	776782673	郭康宝	摄像头	5	5
202511	平果分公司	平果旧城综合支局	776153049	黄忠诚	摄像头	3	1
202511	隆林分公司	隆林城南综合支局	776791554	杨明顺	摄像头	2	0
202511	平果分公司	平果政企专业支局	776154006	韦彦武	摄像头	6	6
202511	右江区分公司	右江区澄碧湖综合支局	776144459	梁富林	摄像头	1	1
202511	德保分公司	德保足荣荣华综合支局	776902213	黄辉	摄像头	1	1
202511	凌云分公司	凌云浪伏综合支局	776659002	杨再冲	摄像头	1	1
202511	凌云分公司	凌云浩坤综合支局	776653052	王道正	摄像头	1	1
202511	靖西分公司	靖西城南综合支局	XN0006319	俞小神	全屋WIFI	8	8
202511	那坡分公司	那坡城北综合支局	776779330	莫尚敏	全屋WIFI	3	2
202511	田林分公司	田林城西综合支局	776313007	杨绍远	全屋WIFI	9	6
202511	田阳分公司	田阳西南综合支局	XN0006559	陆庆华	全屋WIFI	9	8
202511	隆林分公司	隆林者保综合支局	776903160	杨银	全屋WIFI	1	1
202511	田阳分公司	田阳城东综合支局	776404011	梁庆阳	全屋WIFI	7	7
202511	平果分公司	平果城东综合支局	776780516	黄尚官	全屋WIFI	8	8
202511	凌云分公司	凌云浪伏综合支局	776902269	唐大桉	全屋WIFI	5	5
202511	隆林分公司	隆林城北综合支局	776903002	田孟法	全屋WIFI	18	15
202511	西林分公司	西林城北综合支局	100028194	农文师	全屋WIFI	10	7
202511	平果分公司	平果太平综合支局	776801479	韦家盛	全屋WIFI	7	5
202511	右江区分公司	右江区城东综合支局	776047025	莫嘉文	全屋WIFI	10	10
202511	田东分公司	田东朔良综合支局	776781183	廖忠财	全屋WIFI	7	5
202511	那坡分公司	那坡城南综合支局	100013040	黄仕中	全屋WIFI	7	5
202511	右江区分公司	右江区城西综合支局	776047026	黎建云	全屋WIFI	1	1
202511	靖西分公司	靖西城南综合支局	100040666	周密根	全屋WIFI	7	6
202511	凌云分公司	凌云泗城综合支局	XN0006717	戴学繁	全屋WIFI	5	5
202511	田阳分公司	田阳洞靖综合支局	776903410	黄承壮	全屋WIFI	1	1
202511	隆林分公司	隆林者浪综合支局	776620004	王明尚	全屋WIFI	1	1
202511	田东分公司	田东林逢综合支局	XN0006240	黄忠臣	全屋WIFI	5	4
202511	乐业分公司	乐业甘田综合支局	776789575	黎明东	全屋WIFI	7	5
202511	德保分公司	德保那甲隆桑综合支局	776780133	陆运正	全屋WIFI	3	3
202511	西林分公司	西林那佐综合支局	776789115	岑家虎	全屋WIFI	1	1
202511	右江区分公司	右江区澄碧湖综合支局	776103077	何贵仕	全屋WIFI	1	1
202511	隆林分公司	隆林城南综合支局	776903112	黄毅	全屋WIFI	4	2
202511	田林分公司	田林浪平综合支局	776322006	吴定碧	全屋WIFI	2	1
202511	田东分公司	田东城南综合支局	XN0006619	卢万祥	全屋WIFI	6	6
202511	田阳分公司	洞靖综合支局	776779400	罗朝壮	宽带	1	0
202511	右江区分公司	右江区城西综合支局	776779999	岑忠彩	FTTR	8	8
202511	平果分公司	平果城东综合支局	776051808	陆如成	FTTR	10	10
202511	平果分公司	平果城东综合支局	776791071	黄立程	宽带	1	1
202511	田林分公司	田林城西综合支局	776903477	明胜聪	宽带	2	2
202511	那坡分公司	那坡城北综合支局	776779330	莫尚敏	FTTR	10	10
202511	凌云分公司	凌云泗城综合支局	776782067	田仁政	FTTR	6	6
202511	田东分公司	田东城北综合支局	776364001	周作弟	FTTR	13	13
202511	凌云分公司	凌云浪伏综合支局	776659003	周歧稳	FTTR	6	6
202511	右江区分公司	右江区龙景综合支局	776791244	黄伟雄	FTTR	8	7
202511	田阳分公司	田阳头塘综合支局	776415002	林凯旋	FTTR	5	5
202511	平果分公司	平果城东综合支局	776701880	农国政	FTTR	9	9
202511	乐业分公司	乐业新化综合支局	776791710	罗韶轩	FTTR	3	3
202511	乐业分公司	乐业城市综合支局	776779381	黄朝浩	FTTR	4	4
202511	西林分公司	西林那劳综合支局	776902355	刘福成	FTTR	7	7
202511	右江区分公司	右江区城东综合支局	776776673	杨增友	FTTR	4	4
202511	德保分公司	马隘综合支局	776701579	罗世金	FTTR	1	0
202511	凌云分公司	凌云浩坤综合支局	776781570	劳建峰	FTTR	8	8
202511	田阳分公司	田阳西南综合支局	776790947	李俊麟	FTTR	3	3
202511	靖西分公司	靖西新甲综合支局	776903232	廖坤	FTTR	6	6
202511	德保分公司	德保敬德巴头综合支局	776789358	罗华义	FTTR	1	1
202511	右江区分公司	右江区四塘综合支局	776791047	黄承湘	FTTR	4	4
202511	平果分公司	平果铝城综合支局	776153063	陆信新	FTTR	4	4
202511	右江区分公司	右江区龙景综合支局	776782540	黄卓学	FTTR	3	3
202511	德保分公司	德保城南综合支局	XN0006494	王由好	FTTR	2	2
202511	平果分公司	平果新安综合支局	776789649	黄江涛	FTTR	6	6
202511	德保分公司	德保那甲隆桑综合支局	776780133	陆运正	FTTR	2	2
202511	田东分公司	田东林逢综合支局	776790676	甘广标	FTTR	2	2
202511	平果分公司	平果新安综合支局	776120607	李勇	FTTR	2	2
202511	靖西分公司	靖西禄峒综合支局	776782671	何国猛	FTTR	2	2
202511	田林分公司	田林浪平综合支局	776322006	吴定碧	FTTR	1	1
202511	德保分公司	德保城北综合支局	776103065	雍正福	FTTR	2	2
202511	靖西分公司	靖西安德综合支局	776791148	黄明芳	FTTR	6	6
202511	田东分公司	田东祥周综合支局	776102410	李天北	FTTR	5	5
202511	靖西分公司	靖西城南综合支局	776504030	邓明克	FTTR	5	5
202511	田阳分公司	田阳西南综合支局	776414014	蒙亮	FTTR	4	4
202511	田林分公司	田林潞城综合支局	776779197	黎书醒	FTTR	3	3
202511	西林分公司	西林那佐综合支局	776789115	岑家虎	FTTR	8	8
202511	西林分公司	西林古障综合支局	776777061	刘建林	FTTR	2	2
202511	靖西分公司	靖西武平综合支局	776903110	何振飘	FTTR	2	2
202511	田阳分公司	田阳洞靖综合支局	776903410	黄承壮	FTTR	1	1
202511	平果分公司	平果海城综合支局	776801629	黄义朗	FTTR	1	1
202511	田阳分公司	田阳洞靖综合支局	776779400	罗朝壮	FTTR	1	1
202511	西林分公司	西林那佐综合支局	776781782	李卫	FTTR	6	5
202511	田东分公司	印茶综合支局	776358003	农国亮	FTTR	1	0
202511	那坡分公司	那坡平孟综合支局	776212001	凌正伟	FTTR	1	1
202511	平果分公司	平果政企专业支局	776154006	韦彦武	FTTR	1	1
202511	凌云分公司	泗城综合支局	776782724	田宏干	宽带	1	1
202511	田阳分公司	坡洪综合支局	776779084	韦东礼	宽带	1	1
202511	田林分公司	潞城综合支局	776777743	李秉罡	宽带	5	5
202511	右江区分公司	右江区龙景综合支局	776136775	陈昌维	宽带	2	2
202511	西林分公司	西林城北综合支局	100028194	农文师	宽带	1	1
202511	田东分公司	田东城南综合支局	XN0006617	黄城生	宽带	2	2
202511	凌云分公司	泗城综合支局	XN0006717	戴学繁	宽带	2	2
202511	靖西分公司	靖西城南综合支局	100040666	周密根	宽带	1	1
202511	隆林分公司	隆林城北综合支局	776903002	田孟法	宽带	1	1
202511	右江区分公司	右江区城中综合支局	776782633	黄新建	宽带	1	1
202511	凌云分公司	浩坤综合支局	776790051	劳兴新	宽带	3	3
202511	田阳分公司	田阳西南综合支局	XN0006559	陆庆华	宽带	1	1
202511	那坡分公司	那坡城南综合支局	100013040	黄仕中	宽带	1	1
202511	右江区分公司	右江区城西综合支局	776051811	张靖	宽带	1	1
202511	田林分公司	定安综合支局	776701107	农俊杰	宽带	1	1
202511	靖西分公司	武平综合支局	776518002	黄军	宽带	2	2
202511	德保分公司	德保足荣荣华综合支局	776902213	黄辉	FTTR	1	1
202511	靖西分公司	果乐综合支局	776801173	王海	FTTR	1	1
202511	田阳分公司	田阳城东综合支局	776782469	黄海东	全屋WIFI	2	2
\.


--
-- Name: gen_table_column_column_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.gen_table_column_column_id_seq', 1, false);


--
-- Name: gen_table_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.gen_table_table_id_seq', 1, false);


--
-- Name: sys_config_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sys_config_config_id_seq', 100, false);


--
-- Name: sys_dict_data_dict_code_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sys_dict_data_dict_code_seq', 29, false);


--
-- Name: sys_dict_type_dict_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sys_dict_type_dict_id_seq', 11, false);


--
-- Name: sys_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sys_file_id_seq', 9, true);


--
-- Name: sys_job_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sys_job_job_id_seq', 4, false);


--
-- Name: sys_job_log_job_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sys_job_log_job_log_id_seq', 72, true);


--
-- Name: sys_logininfor_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sys_logininfor_info_id_seq', 77, true);


--
-- Name: sys_menu_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sys_menu_menu_id_seq', 2006, true);


--
-- Name: sys_notice_notice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sys_notice_notice_id_seq', 3, false);


--
-- Name: sys_oper_log_oper_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sys_oper_log_oper_id_seq', 112, true);


--
-- Name: sys_post_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sys_post_post_id_seq', 5, false);


--
-- Name: sys_role_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sys_role_role_id_seq', 4, true);


--
-- Name: sys_user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.sys_user_user_id_seq', 3, false);


--
-- Name: qrtz_blob_triggers QRTZ_BLOB_TRIGGERS_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.qrtz_blob_triggers
    ADD CONSTRAINT "QRTZ_BLOB_TRIGGERS_pkey" PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_calendars QRTZ_CALENDARS_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.qrtz_calendars
    ADD CONSTRAINT "QRTZ_CALENDARS_pkey" PRIMARY KEY (sched_name, calendar_name);


--
-- Name: qrtz_cron_triggers QRTZ_CRON_TRIGGERS_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.qrtz_cron_triggers
    ADD CONSTRAINT "QRTZ_CRON_TRIGGERS_pkey" PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_fired_triggers QRTZ_FIRED_TRIGGERS_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.qrtz_fired_triggers
    ADD CONSTRAINT "QRTZ_FIRED_TRIGGERS_pkey" PRIMARY KEY (sched_name, entry_id);


--
-- Name: qrtz_job_details QRTZ_JOB_DETAILS_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.qrtz_job_details
    ADD CONSTRAINT "QRTZ_JOB_DETAILS_pkey" PRIMARY KEY (sched_name, job_name, job_group);


--
-- Name: qrtz_locks QRTZ_LOCKS_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.qrtz_locks
    ADD CONSTRAINT "QRTZ_LOCKS_pkey" PRIMARY KEY (sched_name, lock_name);


--
-- Name: qrtz_paused_trigger_grps QRTZ_PAUSED_TRIGGER_GRPS_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.qrtz_paused_trigger_grps
    ADD CONSTRAINT "QRTZ_PAUSED_TRIGGER_GRPS_pkey" PRIMARY KEY (sched_name, trigger_group);


--
-- Name: qrtz_scheduler_state QRTZ_SCHEDULER_STATE_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.qrtz_scheduler_state
    ADD CONSTRAINT "QRTZ_SCHEDULER_STATE_pkey" PRIMARY KEY (sched_name, instance_name);


--
-- Name: qrtz_simple_triggers QRTZ_SIMPLE_TRIGGERS_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.qrtz_simple_triggers
    ADD CONSTRAINT "QRTZ_SIMPLE_TRIGGERS_pkey" PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simprop_triggers QRTZ_SIMPROP_TRIGGERS_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.qrtz_simprop_triggers
    ADD CONSTRAINT "QRTZ_SIMPROP_TRIGGERS_pkey" PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_triggers QRTZ_TRIGGERS_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.qrtz_triggers
    ADD CONSTRAINT "QRTZ_TRIGGERS_pkey" PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: gen_table_column gen_table_column_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.gen_table_column
    ADD CONSTRAINT gen_table_column_pkey PRIMARY KEY (column_id);


--
-- Name: gen_table gen_table_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.gen_table
    ADD CONSTRAINT gen_table_pkey PRIMARY KEY (table_id);


--
-- Name: sys_config sys_config_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_config
    ADD CONSTRAINT sys_config_pkey PRIMARY KEY (config_id);


--
-- Name: sys_dept sys_dept_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_dept
    ADD CONSTRAINT sys_dept_pkey PRIMARY KEY (dept_id);


--
-- Name: sys_dict_data sys_dict_data_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_dict_data
    ADD CONSTRAINT sys_dict_data_pkey PRIMARY KEY (dict_code);


--
-- Name: sys_dict_type sys_dict_type_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_dict_type
    ADD CONSTRAINT sys_dict_type_pkey PRIMARY KEY (dict_id);


--
-- Name: sys_file sys_file_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_file
    ADD CONSTRAINT sys_file_pkey PRIMARY KEY (id);


--
-- Name: sys_job_log sys_job_log_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_job_log
    ADD CONSTRAINT sys_job_log_pkey PRIMARY KEY (job_log_id);


--
-- Name: sys_job sys_job_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_job
    ADD CONSTRAINT sys_job_pkey PRIMARY KEY (job_id, job_name, job_group);


--
-- Name: sys_logininfor sys_logininfor_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_logininfor
    ADD CONSTRAINT sys_logininfor_pkey PRIMARY KEY (info_id);


--
-- Name: sys_menu sys_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_menu
    ADD CONSTRAINT sys_menu_pkey PRIMARY KEY (menu_id);


--
-- Name: sys_notice sys_notice_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_notice
    ADD CONSTRAINT sys_notice_pkey PRIMARY KEY (notice_id);


--
-- Name: sys_oper_log sys_oper_log_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_oper_log
    ADD CONSTRAINT sys_oper_log_pkey PRIMARY KEY (oper_id);


--
-- Name: sys_post sys_post_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_post
    ADD CONSTRAINT sys_post_pkey PRIMARY KEY (post_id);


--
-- Name: sys_role_dept sys_role_dept_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_role_dept
    ADD CONSTRAINT sys_role_dept_pkey PRIMARY KEY (role_id, dept_id);


--
-- Name: sys_role_menu sys_role_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_role_menu
    ADD CONSTRAINT sys_role_menu_pkey PRIMARY KEY (role_id, menu_id);


--
-- Name: sys_role sys_role_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_role
    ADD CONSTRAINT sys_role_pkey PRIMARY KEY (role_id);


--
-- Name: sys_user sys_user_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_user
    ADD CONSTRAINT sys_user_pkey PRIMARY KEY (user_id);


--
-- Name: sys_user_post sys_user_post_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_user_post
    ADD CONSTRAINT sys_user_post_pkey PRIMARY KEY (user_id, post_id);


--
-- Name: sys_user_role sys_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.sys_user_role
    ADD CONSTRAINT sys_user_role_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: dict_type; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX dict_type ON public.sys_dict_type USING btree (dict_type);


--
-- Name: sched_name; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sched_name ON public.qrtz_triggers USING btree (sched_name, job_name, job_group);


--
-- Name: qrtz_blob_triggers QRTZ_BLOB_TRIGGERS_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.qrtz_blob_triggers
    ADD CONSTRAINT "QRTZ_BLOB_TRIGGERS_ibfk_1" FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_cron_triggers QRTZ_CRON_TRIGGERS_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.qrtz_cron_triggers
    ADD CONSTRAINT "QRTZ_CRON_TRIGGERS_ibfk_1" FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simple_triggers QRTZ_SIMPLE_TRIGGERS_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.qrtz_simple_triggers
    ADD CONSTRAINT "QRTZ_SIMPLE_TRIGGERS_ibfk_1" FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simprop_triggers QRTZ_SIMPROP_TRIGGERS_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.qrtz_simprop_triggers
    ADD CONSTRAINT "QRTZ_SIMPROP_TRIGGERS_ibfk_1" FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_triggers QRTZ_TRIGGERS_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.qrtz_triggers
    ADD CONSTRAINT "QRTZ_TRIGGERS_ibfk_1" FOREIGN KEY (sched_name, job_name, job_group) REFERENCES public.qrtz_job_details(sched_name, job_name, job_group);


--
-- PostgreSQL database dump complete
--

