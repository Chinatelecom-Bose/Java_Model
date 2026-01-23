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
-- Name: data_drill_info; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.data_drill_info (
    id integer NOT NULL,
    uuid character varying(64) NOT NULL,
    report_name character varying(255) NOT NULL,
    status character varying(10) DEFAULT '0'::character varying NOT NULL,
    description text,
    created_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_id integer,
    updated_id integer
);


ALTER TABLE public.data_drill_info OWNER TO root;

--
-- Name: TABLE data_drill_info; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.data_drill_info IS '下钻报表定义';


--
-- Name: COLUMN data_drill_info.report_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.data_drill_info.report_name IS '报表名称';


--
-- Name: COLUMN data_drill_info.status; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.data_drill_info.status IS '是否启用(0:启用 1:禁用)';


--
-- Name: data_drill_info_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.data_drill_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_drill_info_id_seq OWNER TO root;

--
-- Name: data_drill_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.data_drill_info_id_seq OWNED BY public.data_drill_info.id;


--
-- Name: data_drill_node; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.data_drill_node (
    id integer NOT NULL,
    uuid character varying(64) NOT NULL,
    info_id integer NOT NULL,
    parent_id integer,
    node_name character varying(255) NOT NULL,
    sql_text text,
    link_field character varying(255),
    param_name character varying(255),
    status character varying(10) DEFAULT '0'::character varying NOT NULL,
    description text,
    created_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.data_drill_node OWNER TO root;

--
-- Name: TABLE data_drill_node; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON TABLE public.data_drill_node IS '下钻报表节点';


--
-- Name: COLUMN data_drill_node.info_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.data_drill_node.info_id IS '主表ID';


--
-- Name: COLUMN data_drill_node.parent_id; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.data_drill_node.parent_id IS '父节点ID';


--
-- Name: COLUMN data_drill_node.sql_text; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.data_drill_node.sql_text IS '查询SQL';


--
-- Name: COLUMN data_drill_node.link_field; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.data_drill_node.link_field IS '父级关联字段';


--
-- Name: COLUMN data_drill_node.param_name; Type: COMMENT; Schema: public; Owner: root
--

COMMENT ON COLUMN public.data_drill_node.param_name IS '参数名';


--
-- Name: data_drill_node_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.data_drill_node_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_drill_node_id_seq OWNER TO root;

--
-- Name: data_drill_node_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.data_drill_node_id_seq OWNED BY public.data_drill_node.id;


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
-- Name: data_drill_info id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.data_drill_info ALTER COLUMN id SET DEFAULT nextval('public.data_drill_info_id_seq'::regclass);


--
-- Name: data_drill_node id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.data_drill_node ALTER COLUMN id SET DEFAULT nextval('public.data_drill_node_id_seq'::regclass);


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
-- Data for Name: data_drill_info; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.data_drill_info (id, uuid, report_name, status, description, created_time, updated_time, created_id, updated_id) FROM stdin;
\.


--
-- Data for Name: data_drill_node; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.data_drill_node (id, uuid, info_id, parent_id, node_name, sql_text, link_field, param_name, status, description, created_time, updated_time) FROM stdin;
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
RuoyiScheduler	DESKTOP-GV71M5V1768987027396	1768987555648	15000
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
RuoyiScheduler	TASK_CLASS_NAME1	DEFAULT	TASK_CLASS_NAME1	DEFAULT	\N	1768987030000	-1	5	PAUSED	CRON	1768987027000	0	\N	2	\\x
RuoyiScheduler	TASK_CLASS_NAME2	DEFAULT	TASK_CLASS_NAME2	DEFAULT	\N	1768987035000	-1	5	PAUSED	CRON	1768987027000	0	\N	2	\\x
RuoyiScheduler	TASK_CLASS_NAME3	DEFAULT	TASK_CLASS_NAME3	DEFAULT	\N	1768987040000	-1	5	PAUSED	CRON	1768987027000	0	\N	2	\\x
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
\.


--
-- Data for Name: sys_logininfor; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sys_logininfor (info_id, user_name, ipaddr, login_location, browser, os, status, msg, login_time) FROM stdin;
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
2	系统监控	0	5	monitor	\N			1	0	M	0	0		monitor	admin	2025-12-10 03:11:21.819699	admin	2025-12-10 11:44:38.341895	系统监控目录
2006	文件管理	1	11	file	system\\file\\index	\N		1	0	C	0	0	\N	FileTextOutlined	admin	2025-12-18 11:21:04.78023	admin	2025-12-18 11:22:08.803904	\N
2102	配置查询	2101	1					1	0	F	0	0	drill:info:query	#	admin	2026-01-21 09:07:22.406727		\N	
2103	配置新增	2101	2					1	0	F	0	0	drill:info:add	#	admin	2026-01-21 09:07:22.408645		\N	
2104	配置修改	2101	3					1	0	F	0	0	drill:info:edit	#	admin	2026-01-21 09:07:22.410659		\N	
2105	配置删除	2101	4					1	0	F	0	0	drill:info:remove	#	admin	2026-01-21 09:07:22.4126		\N	
2106	SQL校验	2101	5					1	0	F	0	0	drill:execute:validate	#	admin	2026-01-21 09:07:22.414451		\N	
2100	数据下钻	0	100	drill	\N			1	0	M	0	0		data-analysis	admin	2026-01-21 09:07:22.401985		\N	数据下钻模块根目录
2101	报表配置管理	2100	1	info	drill/info/index			1	0	C	0	0	drill:info:list	setting	admin	2026-01-21 09:07:22.404878		\N	下钻报表配置
2107	报表数据展示	2100	2	display	drill/display/index			1	0	C	0	0	drill:execute:query	chart	admin	2026-01-21 09:07:22.416295		\N	下钻报表展示
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
\.


--
-- Data for Name: sys_user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.sys_user (user_id, dept_id, user_name, nick_name, user_type, email, phonenumber, sex, avatar, password, status, del_flag, login_ip, login_date, pwd_update_date, create_by, create_time, update_by, update_time, remark, staff_code) FROM stdin;
1	814	admin	無	00	ry@163.com	15888888889	0	/profile/avatar/2025/12/18/1fb557dccf0e43cea541e2b567c6ffb6.png	$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2	0	0	127.0.0.1	2026-01-21 16:52:37	2021-05-26 18:56:28	admin	2021-05-26 18:56:28		2025-12-26 08:49:58.681609	管理员	1
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
\.


--
-- Name: data_drill_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.data_drill_info_id_seq', 1, false);


--
-- Name: data_drill_node_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.data_drill_node_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.sys_logininfor_info_id_seq', 61, true);


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

SELECT pg_catalog.setval('public.sys_oper_log_oper_id_seq', 131, true);


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
-- Name: data_drill_info data_drill_info_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.data_drill_info
    ADD CONSTRAINT data_drill_info_pkey PRIMARY KEY (id);


--
-- Name: data_drill_info data_drill_info_uuid_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.data_drill_info
    ADD CONSTRAINT data_drill_info_uuid_key UNIQUE (uuid);


--
-- Name: data_drill_node data_drill_node_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.data_drill_node
    ADD CONSTRAINT data_drill_node_pkey PRIMARY KEY (id);


--
-- Name: data_drill_node data_drill_node_uuid_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.data_drill_node
    ADD CONSTRAINT data_drill_node_uuid_key UNIQUE (uuid);


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
-- Name: data_drill_node data_drill_node_info_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.data_drill_node
    ADD CONSTRAINT data_drill_node_info_id_fkey FOREIGN KEY (info_id) REFERENCES public.data_drill_info(id) ON DELETE CASCADE;


--
-- Name: data_drill_node data_drill_node_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.data_drill_node
    ADD CONSTRAINT data_drill_node_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.data_drill_node(id);


--
-- PostgreSQL database dump complete
--