-- DROP SCHEMA ct_equipmentm;


CREATE SCHEMA ct_equipmentm AUTHORIZATION pg_database_owner;


-- DROP SEQUENCE ct_equipmentm.data_drill_info_id_seq;

CREATE SEQUENCE ct_equipmentm.data_drill_info_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ct_equipmentm.data_drill_node_id_seq;

CREATE SEQUENCE ct_equipmentm.data_drill_node_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ct_equipmentm.gen_table_column_column_id_seq;

CREATE SEQUENCE ct_equipmentm.gen_table_column_column_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ct_equipmentm.gen_table_table_id_seq;

CREATE SEQUENCE ct_equipmentm.gen_table_table_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ct_equipmentm.sys_config_config_id_seq;

CREATE SEQUENCE ct_equipmentm.sys_config_config_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ct_equipmentm.sys_dict_data_dict_code_seq;

CREATE SEQUENCE ct_equipmentm.sys_dict_data_dict_code_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ct_equipmentm.sys_dict_type_dict_id_seq;

CREATE SEQUENCE ct_equipmentm.sys_dict_type_dict_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ct_equipmentm.sys_job_job_id_seq;

CREATE SEQUENCE ct_equipmentm.sys_job_job_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ct_equipmentm.sys_job_log_job_log_id_seq;

CREATE SEQUENCE ct_equipmentm.sys_job_log_job_log_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ct_equipmentm.sys_logininfor_info_id_seq;

CREATE SEQUENCE ct_equipmentm.sys_logininfor_info_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ct_equipmentm.sys_menu_menu_id_seq;

CREATE SEQUENCE ct_equipmentm.sys_menu_menu_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ct_equipmentm.sys_notice_notice_id_seq;

CREATE SEQUENCE ct_equipmentm.sys_notice_notice_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ct_equipmentm.sys_oper_log_oper_id_seq;

CREATE SEQUENCE ct_equipmentm.sys_oper_log_oper_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ct_equipmentm.sys_post_post_id_seq;

CREATE SEQUENCE ct_equipmentm.sys_post_post_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ct_equipmentm.sys_role_role_id_seq;

CREATE SEQUENCE ct_equipmentm.sys_role_role_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ct_equipmentm.sys_sms_log_id_seq;

CREATE SEQUENCE ct_equipmentm.sys_sms_log_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ct_equipmentm.sys_user_user_id_seq;

CREATE SEQUENCE ct_equipmentm.sys_user_user_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;


-- ct_equipmentm.gen_table definition

-- Drop table

-- DROP TABLE ct_equipmentm.gen_table;

CREATE TABLE ct_equipmentm.gen_table (
	table_id bigserial NOT NULL,
	table_name varchar(200) NULL,
	table_comment varchar(500) NULL,
	sub_table_name varchar(64) NULL,
	sub_table_fk_name varchar(64) NULL,
	class_name varchar(100) NULL,
	tpl_category varchar(200) NULL,
	tpl_web_type varchar(30) NULL,
	package_name varchar(100) NULL,
	module_name varchar(30) NULL,
	business_name varchar(30) NULL,
	function_name varchar(50) NULL,
	function_author varchar(50) NULL,
	gen_type bpchar(1) NULL,
	gen_path varchar(200) NULL,
	"options" varchar(1000) NULL,
	create_by varchar(64) NULL,
	create_time timestamp(6) NULL,
	update_by varchar(64) NULL,
	update_time timestamp(6) NULL,
	remark varchar(500) NULL,
	CONSTRAINT gen_table_pkey PRIMARY KEY (table_id)
);


-- ct_equipmentm.gen_table_column definition

-- Drop table

-- DROP TABLE ct_equipmentm.gen_table_column;

CREATE TABLE ct_equipmentm.gen_table_column (
	column_id bigserial NOT NULL,
	table_id varchar(64) NULL,
	column_name varchar(200) NULL,
	column_comment varchar(500) NULL,
	column_type varchar(100) NULL,
	java_type varchar(500) NULL,
	java_field varchar(200) NULL,
	is_pk bpchar(1) NULL,
	is_increment bpchar(1) NULL,
	is_required bpchar(1) NULL,
	is_insert bpchar(1) NULL,
	is_edit bpchar(1) NULL,
	is_list bpchar(1) NULL,
	is_query bpchar(1) NULL,
	query_type varchar(200) NULL,
	html_type varchar(200) NULL,
	dict_type varchar(200) DEFAULT ''::character varying NULL,
	sort int4 NULL,
	create_by varchar(64) NULL,
	create_time timestamp(6) NULL,
	update_by varchar(64) NULL,
	update_time timestamp(6) NULL,
	CONSTRAINT gen_table_column_pkey PRIMARY KEY (column_id)
);


-- ct_equipmentm.qrtz_calendars definition

-- Drop table

-- DROP TABLE ct_equipmentm.qrtz_calendars;

CREATE TABLE ct_equipmentm.qrtz_calendars (
	sched_name varchar(120) NOT NULL,
	calendar_name varchar(200) NOT NULL,
	calendar bytea NOT NULL,
	CONSTRAINT "QRTZ_CALENDARS_pkey" PRIMARY KEY (sched_name, calendar_name)
);


-- ct_equipmentm.qrtz_fired_triggers definition

-- Drop table

-- DROP TABLE ct_equipmentm.qrtz_fired_triggers;

CREATE TABLE ct_equipmentm.qrtz_fired_triggers (
	sched_name varchar(120) NOT NULL,
	entry_id varchar(95) NOT NULL,
	trigger_name varchar(200) NOT NULL,
	trigger_group varchar(200) NOT NULL,
	instance_name varchar(200) NOT NULL,
	fired_time int8 NOT NULL,
	sched_time int8 NOT NULL,
	priority int4 NOT NULL,
	state varchar(16) NOT NULL,
	job_name varchar(200) NULL,
	job_group varchar(200) NULL,
	is_nonconcurrent varchar(20) NULL,
	requests_recovery varchar(20) NULL,
	CONSTRAINT "QRTZ_FIRED_TRIGGERS_pkey" PRIMARY KEY (sched_name, entry_id)
);


-- ct_equipmentm.qrtz_job_details definition

-- Drop table

-- DROP TABLE ct_equipmentm.qrtz_job_details;

CREATE TABLE ct_equipmentm.qrtz_job_details (
	sched_name varchar(120) NOT NULL,
	job_name varchar(200) NOT NULL,
	job_group varchar(200) NOT NULL,
	description varchar(250) NULL,
	job_class_name varchar(250) NOT NULL,
	is_durable varchar(50) NOT NULL,
	is_nonconcurrent varchar(50) NOT NULL,
	is_update_data varchar(50) NOT NULL,
	requests_recovery varchar(50) NOT NULL,
	job_data bytea NULL,
	CONSTRAINT "QRTZ_JOB_DETAILS_pkey" PRIMARY KEY (sched_name, job_name, job_group)
);


-- ct_equipmentm.qrtz_locks definition

-- Drop table

-- DROP TABLE ct_equipmentm.qrtz_locks;

CREATE TABLE ct_equipmentm.qrtz_locks (
	sched_name varchar(120) NOT NULL,
	lock_name varchar(40) NOT NULL,
	CONSTRAINT "QRTZ_LOCKS_pkey" PRIMARY KEY (sched_name, lock_name)
);


-- ct_equipmentm.qrtz_paused_trigger_grps definition

-- Drop table

-- DROP TABLE ct_equipmentm.qrtz_paused_trigger_grps;

CREATE TABLE ct_equipmentm.qrtz_paused_trigger_grps (
	sched_name varchar(120) NOT NULL,
	trigger_group varchar(200) NOT NULL,
	CONSTRAINT "QRTZ_PAUSED_TRIGGER_GRPS_pkey" PRIMARY KEY (sched_name, trigger_group)
);


-- ct_equipmentm.qrtz_scheduler_state definition

-- Drop table

-- DROP TABLE ct_equipmentm.qrtz_scheduler_state;

CREATE TABLE ct_equipmentm.qrtz_scheduler_state (
	sched_name varchar(120) NOT NULL,
	instance_name varchar(200) NOT NULL,
	last_checkin_time int8 NOT NULL,
	checkin_interval int8 NOT NULL,
	CONSTRAINT "QRTZ_SCHEDULER_STATE_pkey" PRIMARY KEY (sched_name, instance_name)
);


-- ct_equipmentm.sys_config definition

-- Drop table

-- DROP TABLE ct_equipmentm.sys_config;

CREATE TABLE ct_equipmentm.sys_config (
	config_id bigserial NOT NULL,
	config_name varchar(100) NULL,
	config_key varchar(100) NULL,
	config_value varchar(500) NULL,
	config_type bpchar(1) NULL,
	create_by varchar(64) NULL,
	create_time timestamp(6) NULL,
	update_by varchar(64) NULL,
	update_time timestamp(6) NULL,
	remark varchar(500) NULL,
	CONSTRAINT sys_config_pkey PRIMARY KEY (config_id)
);


-- ct_equipmentm.sys_dept definition

-- Drop table

-- DROP TABLE ct_equipmentm.sys_dept;

CREATE TABLE ct_equipmentm.sys_dept (
	dept_id int8 NOT NULL,
	parent_id int8 DEFAULT 0 NULL,
	ancestors varchar(50) NULL,
	dept_name varchar(30) NULL,
	order_num int4 NULL,
	leader varchar(20) NULL,
	phone varchar(11) NULL,
	email varchar(50) NULL,
	status bpchar(1) NULL,
	del_flag bpchar(1) DEFAULT '0' NULL,
	create_by varchar(64) NULL,
	create_time timestamp(6) NULL,
	update_by varchar(64) NULL,
	update_time timestamp(6) NULL,
	CONSTRAINT sys_dept_pkey PRIMARY KEY (dept_id)
);


-- ct_equipmentm.sys_dict_data definition

-- Drop table

-- DROP TABLE ct_equipmentm.sys_dict_data;

CREATE TABLE ct_equipmentm.sys_dict_data (
	dict_code bigserial NOT NULL,
	dict_sort int4 NULL,
	dict_label varchar(100) NULL,
	dict_value varchar(100) NULL,
	dict_type varchar(100) NULL,
	css_class varchar(100) NULL,
	list_class varchar(100) NULL,
	is_default bpchar(1) NULL,
	status bpchar(1) NULL,
	create_by varchar(64) NULL,
	create_time timestamp(6) NULL,
	update_by varchar(64) NULL,
	update_time timestamp(6) NULL,
	remark varchar(500) NULL,
	CONSTRAINT sys_dict_data_pkey PRIMARY KEY (dict_code)
);


-- ct_equipmentm.sys_dict_type definition

-- Drop table

-- DROP TABLE ct_equipmentm.sys_dict_type;

CREATE TABLE ct_equipmentm.sys_dict_type (
	dict_id bigserial NOT NULL,
	dict_name varchar(100) NULL,
	dict_type varchar(100) NULL,
	status bpchar(1) NULL,
	create_by varchar(64) NULL,
	create_time timestamp(6) NULL,
	update_by varchar(64) NULL,
	update_time timestamp(6) NULL,
	remark varchar(500) NULL,
	CONSTRAINT sys_dict_type_pkey PRIMARY KEY (dict_id)
);
CREATE INDEX dict_type ON ct_equipmentm.sys_dict_type USING btree (dict_type);


-- ct_equipmentm.sys_job definition

-- Drop table

-- DROP TABLE ct_equipmentm.sys_job;

CREATE TABLE ct_equipmentm.sys_job (
	job_id bigserial NOT NULL,
	job_name varchar(64) NOT NULL,
	job_group varchar(64) NOT NULL,
	invoke_target varchar(500) NOT NULL,
	cron_expression varchar(255) NULL,
	misfire_policy varchar(20) NULL,
	concurrent bpchar(1) NULL,
	status bpchar(1) NULL,
	create_by varchar(64) NULL,
	create_time timestamp(6) NULL,
	update_by varchar(64) NULL,
	update_time timestamp(6) NULL,
	remark varchar(500) NULL,
	CONSTRAINT sys_job_pkey PRIMARY KEY (job_id, job_name, job_group)
);


-- ct_equipmentm.sys_job_log definition

-- Drop table

-- DROP TABLE ct_equipmentm.sys_job_log;

CREATE TABLE ct_equipmentm.sys_job_log (
	job_log_id bigserial NOT NULL,
	job_name varchar(64) NOT NULL,
	job_group varchar(64) NOT NULL,
	invoke_target varchar(500) NOT NULL,
	job_message varchar(500) NULL,
	status bpchar(1) NULL,
	exception_info varchar(2000) NULL,
	create_time timestamp(6) NULL,
	CONSTRAINT sys_job_log_pkey PRIMARY KEY (job_log_id)
);


-- ct_equipmentm.sys_logininfor definition

-- Drop table

-- DROP TABLE ct_equipmentm.sys_logininfor;

CREATE TABLE ct_equipmentm.sys_logininfor (
	info_id bigserial NOT NULL,
	user_name varchar(50) NULL,
	ipaddr varchar(128) NULL,
	login_location varchar(255) NULL,
	browser varchar(50) NULL,
	os varchar(50) NULL,
	status bpchar(1) NULL,
	msg varchar(255) NULL,
	login_time timestamp(6) NULL,
	CONSTRAINT sys_logininfor_pkey PRIMARY KEY (info_id)
);


-- ct_equipmentm.sys_menu definition

-- Drop table

-- DROP TABLE ct_equipmentm.sys_menu;

CREATE TABLE ct_equipmentm.sys_menu (
	menu_id bigserial NOT NULL,
	menu_name varchar(50) NOT NULL,
	parent_id int8 DEFAULT 0 NULL,
	order_num int4 NULL,
	"path" varchar(200) NULL,
	component varchar(255) NULL,
	query varchar(255) NULL,
	route_name varchar(50) DEFAULT ''::character varying NULL,
	is_frame int4 NULL,
	is_cache int4 DEFAULT 0 NULL,
	menu_type bpchar(1) NULL,
	visible bpchar(1) NULL,
	status int2 NULL,
	perms varchar(100) NULL,
	icon varchar(100) NULL,
	create_by varchar(64) NULL,
	create_time timestamp(6) NULL,
	update_by varchar(64) NULL,
	update_time timestamp(6) NULL,
	remark varchar(500) NULL,
	CONSTRAINT sys_menu_pkey PRIMARY KEY (menu_id)
);


-- ct_equipmentm.sys_notice definition

-- Drop table

-- DROP TABLE ct_equipmentm.sys_notice;

CREATE TABLE ct_equipmentm.sys_notice (
	notice_id bigserial NOT NULL,
	notice_title varchar(50) NOT NULL,
	notice_type bpchar(1) NOT NULL,
	notice_content text NULL,
	status bpchar(1) NULL,
	create_by varchar(64) NULL,
	create_time timestamp(6) NULL,
	update_by varchar(64) NULL,
	update_time timestamp(6) NULL,
	remark varchar(255) NULL,
	CONSTRAINT sys_notice_pkey PRIMARY KEY (notice_id)
);


-- ct_equipmentm.sys_oper_log definition

-- Drop table

-- DROP TABLE ct_equipmentm.sys_oper_log;

CREATE TABLE ct_equipmentm.sys_oper_log (
	oper_id bigserial NOT NULL,
	title varchar(50) NULL,
	business_type int4 NULL,
	"method" varchar(100) NULL,
	request_method varchar(10) NULL,
	operator_type int4 NULL,
	oper_name varchar(50) NULL,
	dept_name varchar(50) NULL,
	oper_url varchar(255) NULL,
	oper_ip varchar(128) NULL,
	oper_location varchar(255) NULL,
	oper_param varchar(2000) NULL,
	json_result varchar(2000) NULL,
	status int4 NULL,
	error_msg varchar(2000) NULL,
	oper_time timestamp(6) NULL,
	cost_time int8 DEFAULT 0 NULL,
	CONSTRAINT sys_oper_log_pkey PRIMARY KEY (oper_id)
);


-- ct_equipmentm.sys_post definition

-- Drop table

-- DROP TABLE ct_equipmentm.sys_post;

CREATE TABLE ct_equipmentm.sys_post (
	post_id bigserial NOT NULL,
	post_code varchar(64) NOT NULL,
	post_name varchar(50) NOT NULL,
	post_sort int4 NOT NULL,
	status bpchar(1) NOT NULL,
	create_by varchar(64) NULL,
	create_time timestamp(6) NULL,
	update_by varchar(64) NULL,
	update_time timestamp(6) NULL,
	remark varchar(500) NULL,
	CONSTRAINT sys_post_pkey PRIMARY KEY (post_id)
);


-- ct_equipmentm.sys_role definition

-- Drop table

-- DROP TABLE ct_equipmentm.sys_role;

CREATE TABLE ct_equipmentm.sys_role (
	role_id bigserial NOT NULL,
	role_name varchar(30) NOT NULL,
	role_key varchar(100) NOT NULL,
	role_sort int4 NOT NULL,
	data_scope bpchar(1) NULL,
	menu_check_strictly bool NULL,
	dept_check_strictly bool NULL,
	status bpchar(1) NOT NULL,
	del_flag bpchar(1) DEFAULT '0' NULL,
	create_by varchar(64) NULL,
	create_time timestamp(6) NULL,
	update_by varchar(64) NULL,
	update_time timestamp(6) NULL,
	remark varchar(500) NULL,
	CONSTRAINT sys_role_pkey PRIMARY KEY (role_id)
);


-- ct_equipmentm.sys_role_dept definition

-- Drop table

-- DROP TABLE ct_equipmentm.sys_role_dept;

CREATE TABLE ct_equipmentm.sys_role_dept (
	role_id int8 NOT NULL,
	dept_id int8 NOT NULL,
	CONSTRAINT sys_role_dept_pkey PRIMARY KEY (role_id, dept_id)
);


-- ct_equipmentm.sys_role_menu definition

-- Drop table

-- DROP TABLE ct_equipmentm.sys_role_menu;

CREATE TABLE ct_equipmentm.sys_role_menu (
	role_id int8 NOT NULL,
	menu_id int8 NOT NULL,
	CONSTRAINT sys_role_menu_pkey PRIMARY KEY (role_id, menu_id)
);


-- ct_equipmentm.sys_sms_log definition

-- Drop table

-- DROP TABLE ct_equipmentm.sys_sms_log;

CREATE TABLE ct_equipmentm.sys_sms_log (
	id bigserial NOT NULL,
	sms_phone_number varchar(20) NULL,
	sms_send_time varchar(20) NULL,
	sms_content text NULL,
	sms_response text NULL,
	sms_code varchar(10) NULL,
	sms_msg varchar(200) NULL,
	sms_success varchar(10) NULL,
	create_time timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	update_time timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT sys_sms_log_pkey PRIMARY KEY (id)
);
CREATE INDEX idx_sms_code ON ct_equipmentm.sys_sms_log USING btree (sms_code);
CREATE INDEX idx_sms_phone_number ON ct_equipmentm.sys_sms_log USING btree (sms_phone_number);
CREATE INDEX idx_sms_send_time ON ct_equipmentm.sys_sms_log USING btree (sms_send_time);


-- ct_equipmentm.sys_user definition

-- Drop table

-- DROP TABLE ct_equipmentm.sys_user;

CREATE TABLE ct_equipmentm.sys_user (
	user_id bigserial NOT NULL,
	dept_id int8 NULL,
	user_name varchar(30) NOT NULL,
	nick_name varchar(30) NOT NULL,
	user_type varchar(2) NULL,
	email varchar(50) NULL,
	phonenumber varchar(11) NULL,
	sex bpchar(1) NULL,
	avatar varchar(100) NULL,
	"password" varchar(100) NULL,
	status bpchar(1) NULL,
	del_flag bpchar(1) DEFAULT '0'::bpchar NULL,
	login_ip varchar(128) NULL,
	login_date timestamp(6) NULL,
	pwd_update_date timestamp(6) NULL,
	create_by varchar(64) NULL,
	create_time timestamp(6) NULL,
	update_by varchar(64) NULL,
	update_time timestamp(6) NULL,
	remark varchar(500) NULL,
	staff_code varchar(64) NULL,
	CONSTRAINT sys_user_pkey PRIMARY KEY (user_id)
);


-- ct_equipmentm.sys_user_post definition

-- Drop table

-- DROP TABLE ct_equipmentm.sys_user_post;

CREATE TABLE ct_equipmentm.sys_user_post (
	user_id int8 NOT NULL,
	post_id int8 NOT NULL,
	CONSTRAINT sys_user_post_pkey PRIMARY KEY (user_id, post_id)
);


-- ct_equipmentm.sys_user_role definition

-- Drop table

-- DROP TABLE ct_equipmentm.sys_user_role;

CREATE TABLE ct_equipmentm.sys_user_role (
	user_id int8 NOT NULL,
	role_id int8 NOT NULL,
	CONSTRAINT sys_user_role_pkey PRIMARY KEY (user_id, role_id)
);


-- ct_equipmentm.data_drill_info definition

-- Drop table

-- DROP TABLE ct_equipmentm.data_drill_info;

CREATE TABLE ct_equipmentm.data_drill_info (
	report_name varchar(255) NOT NULL,
	id serial4 NOT NULL,
	"uuid" varchar(64) NULL,
	status varchar(10) NOT NULL,
	description text NULL,
	created_time timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_time timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	created_id int4 NULL,
	updated_id int4 NULL,
	CONSTRAINT data_drill_info_pkey PRIMARY KEY (id),
	CONSTRAINT data_drill_info_created_id_fkey FOREIGN KEY (created_id) REFERENCES ct_equipmentm.sys_user(user_id) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT data_drill_info_updated_id_fkey FOREIGN KEY (updated_id) REFERENCES ct_equipmentm.sys_user(user_id) ON DELETE SET NULL ON UPDATE CASCADE
);
CREATE INDEX ix_data_drill_info_created_id ON ct_equipmentm.data_drill_info USING btree (created_id);
CREATE INDEX ix_data_drill_info_updated_id ON ct_equipmentm.data_drill_info USING btree (updated_id);


-- ct_equipmentm.data_drill_node definition

-- Drop table

-- DROP TABLE ct_equipmentm.data_drill_node;

CREATE TABLE ct_equipmentm.data_drill_node (
	info_id int4 NOT NULL,
	parent_id int4 NULL,
	node_name varchar(255) NOT NULL,
	sql_text text NULL,
	link_field varchar(255) NULL,
	param_name varchar(255) NULL,
	id serial4 NOT NULL,
	"uuid" varchar(64) NULL,
	status varchar(10) NOT NULL,
	description text NULL,
	created_time timestamp NOT NULL,
	updated_time timestamp NOT NULL,
	created_id int4 NULL,
	updated_id int4 NULL,
	pass_field varchar(255) NULL,
	CONSTRAINT data_drill_node_pkey PRIMARY KEY (id),
	CONSTRAINT data_drill_node_created_id_fkey FOREIGN KEY (created_id) REFERENCES ct_equipmentm.sys_user(user_id) ON DELETE SET NULL ON UPDATE CASCADE,
	CONSTRAINT data_drill_node_updated_id_fkey FOREIGN KEY (updated_id) REFERENCES ct_equipmentm.sys_user(user_id) ON DELETE SET NULL ON UPDATE CASCADE
);
CREATE INDEX ix_data_drill_node_created_id ON ct_equipmentm.data_drill_node USING btree (created_id);
CREATE INDEX ix_data_drill_node_info_id ON ct_equipmentm.data_drill_node USING btree (info_id);
CREATE INDEX ix_data_drill_node_parent_id ON ct_equipmentm.data_drill_node USING btree (parent_id);
CREATE INDEX ix_data_drill_node_updated_id ON ct_equipmentm.data_drill_node USING btree (updated_id);


-- ct_equipmentm.qrtz_triggers definition

-- Drop table

-- DROP TABLE ct_equipmentm.qrtz_triggers;

CREATE TABLE ct_equipmentm.qrtz_triggers (
	sched_name varchar(120) NOT NULL,
	trigger_name varchar(200) NOT NULL,
	trigger_group varchar(200) NOT NULL,
	job_name varchar(200) NOT NULL,
	job_group varchar(200) NOT NULL,
	description varchar(250) NULL,
	next_fire_time int8 NULL,
	prev_fire_time int8 NULL,
	priority int4 NULL,
	trigger_state varchar(16) NOT NULL,
	trigger_type varchar(8) NOT NULL,
	start_time int8 NOT NULL,
	end_time int8 NULL,
	calendar_name varchar(200) NULL,
	misfire_instr int2 NULL,
	job_data bytea NULL,
	CONSTRAINT "QRTZ_TRIGGERS_pkey" PRIMARY KEY (sched_name, trigger_name, trigger_group),
	CONSTRAINT "QRTZ_TRIGGERS_ibfk_1" FOREIGN KEY (sched_name,job_name,job_group) REFERENCES ct_equipmentm.qrtz_job_details(sched_name,job_name,job_group)
);
CREATE INDEX sched_name ON ct_equipmentm.qrtz_triggers USING btree (sched_name, job_name, job_group);


-- ct_equipmentm.qrtz_blob_triggers definition

-- Drop table

-- DROP TABLE ct_equipmentm.qrtz_blob_triggers;

CREATE TABLE ct_equipmentm.qrtz_blob_triggers (
	sched_name varchar(120) NOT NULL,
	trigger_name varchar(200) NOT NULL,
	trigger_group varchar(200) NOT NULL,
	blob_data bytea NULL,
	CONSTRAINT "QRTZ_BLOB_TRIGGERS_pkey" PRIMARY KEY (sched_name, trigger_name, trigger_group),
	CONSTRAINT "QRTZ_BLOB_TRIGGERS_ibfk_1" FOREIGN KEY (sched_name,trigger_name,trigger_group) REFERENCES ct_equipmentm.qrtz_triggers(sched_name,trigger_name,trigger_group)
);


-- ct_equipmentm.qrtz_cron_triggers definition

-- Drop table

-- DROP TABLE ct_equipmentm.qrtz_cron_triggers;

CREATE TABLE ct_equipmentm.qrtz_cron_triggers (
	sched_name varchar(120) NOT NULL,
	trigger_name varchar(200) NOT NULL,
	trigger_group varchar(200) NOT NULL,
	cron_expression varchar(200) NOT NULL,
	time_zone_id varchar(80) NULL,
	CONSTRAINT "QRTZ_CRON_TRIGGERS_pkey" PRIMARY KEY (sched_name, trigger_name, trigger_group),
	CONSTRAINT "QRTZ_CRON_TRIGGERS_ibfk_1" FOREIGN KEY (sched_name,trigger_name,trigger_group) REFERENCES ct_equipmentm.qrtz_triggers(sched_name,trigger_name,trigger_group)
);


-- ct_equipmentm.qrtz_simple_triggers definition

-- Drop table

-- DROP TABLE ct_equipmentm.qrtz_simple_triggers;

CREATE TABLE ct_equipmentm.qrtz_simple_triggers (
	sched_name varchar(120) NOT NULL,
	trigger_name varchar(200) NOT NULL,
	trigger_group varchar(200) NOT NULL,
	repeat_count int8 NOT NULL,
	repeat_interval int8 NOT NULL,
	times_triggered int8 NOT NULL,
	CONSTRAINT "QRTZ_SIMPLE_TRIGGERS_pkey" PRIMARY KEY (sched_name, trigger_name, trigger_group),
	CONSTRAINT "QRTZ_SIMPLE_TRIGGERS_ibfk_1" FOREIGN KEY (sched_name,trigger_name,trigger_group) REFERENCES ct_equipmentm.qrtz_triggers(sched_name,trigger_name,trigger_group)
);


-- ct_equipmentm.qrtz_simprop_triggers definition

-- Drop table

-- DROP TABLE ct_equipmentm.qrtz_simprop_triggers;

CREATE TABLE ct_equipmentm.qrtz_simprop_triggers (
	sched_name varchar(120) NOT NULL,
	trigger_name varchar(200) NOT NULL,
	trigger_group varchar(200) NOT NULL,
	str_prop_1 varchar(512) NULL,
	str_prop_2 varchar(512) NULL,
	str_prop_3 varchar(512) NULL,
	int_prop_1 int4 NULL,
	int_prop_2 int4 NULL,
	long_prop_1 int8 NULL,
	long_prop_2 int8 NULL,
	dec_prop_1 numeric(13, 4) NULL,
	dec_prop_2 numeric(13, 4) NULL,
	bool_prop_1 varchar(2) NULL,
	bool_prop_2 varchar(2) NULL,
	CONSTRAINT "QRTZ_SIMPROP_TRIGGERS_pkey" PRIMARY KEY (sched_name, trigger_name, trigger_group),
	CONSTRAINT "QRTZ_SIMPROP_TRIGGERS_ibfk_1" FOREIGN KEY (sched_name,trigger_name,trigger_group) REFERENCES ct_equipmentm.qrtz_triggers(sched_name,trigger_name,trigger_group)
);


-- ct_equipmentm.list_column source

CREATE OR REPLACE VIEW ct_equipmentm.list_column
AS SELECT c.relname AS table_name,
    a.attname AS column_name,
    d.description AS column_comment,
        CASE
            WHEN a.attnotnull AND con.conname IS NULL THEN 1
            ELSE 0
        END AS is_required,
        CASE
            WHEN con.conname IS NOT NULL THEN 1
            ELSE 0
        END AS is_pk,
    a.attnum AS sort,
        CASE
            WHEN "position"(pg_get_expr(ad.adbin, ad.adrelid), ((c.relname::text || '_'::text) || a.attname::text) || '_seq'::text) > 0 THEN 1
            ELSE 0
        END AS is_increment,
    btrim(
        CASE
            WHEN t.typelem <> 0::oid AND t.typlen = '-1'::integer THEN 'ARRAY'::text
            ELSE
            CASE
                WHEN t.typtype = 'd'::"char" THEN format_type(t.typbasetype, NULL::integer)
                ELSE format_type(a.atttypid, NULL::integer)
            END
        END, '"'::text) AS column_type
   FROM pg_attribute a
     JOIN (pg_class c
     JOIN pg_namespace n ON c.relnamespace = n.oid) ON a.attrelid = c.oid
     LEFT JOIN pg_description d ON d.objoid = c.oid AND a.attnum = d.objsubid
     LEFT JOIN pg_constraint con ON con.conrelid = c.oid AND (a.attnum = ANY (con.conkey))
     LEFT JOIN pg_attrdef ad ON a.attrelid = ad.adrelid AND a.attnum = ad.adnum
     LEFT JOIN pg_type t ON a.atttypid = t.oid
  WHERE (c.relkind = ANY (ARRAY['r'::"char", 'p'::"char"])) AND a.attnum > 0 AND n.nspname = 'ct_equipmentm'::name AND NOT a.attisdropped
  ORDER BY c.relname, a.attnum;


-- ct_equipmentm.list_table source

CREATE OR REPLACE VIEW ct_equipmentm.list_table
AS SELECT c.relname AS table_name,
    obj_description(c.oid) AS table_comment,
    CURRENT_TIMESTAMP AS create_time,
    CURRENT_TIMESTAMP AS update_time
   FROM pg_class c
     LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
  WHERE (c.relkind = ANY (ARRAY['r'::"char", 'p'::"char"])) AND c.relname !~~ 'spatial_%'::text AND n.nspname = 'ct_equipmentm'::name AND n.nspname <> ''::name;



-- DROP FUNCTION ct_equipmentm.find_in_set(int8, varchar);

CREATE OR REPLACE FUNCTION ct_equipmentm.find_in_set(bigint, character varying)
 RETURNS boolean
 LANGUAGE plpgsql
AS $function$
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
$function$
;

-- DROP FUNCTION ct_equipmentm.substring_index(varchar, varchar, int4);

CREATE OR REPLACE FUNCTION ct_equipmentm.substring_index(character varying, character varying, integer)
 RETURNS character varying
 LANGUAGE plpgsql
 IMMUTABLE STRICT
AS $function$
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
$function$
;

-- 1. 插入一级目录: 数据下钻 (ID: 2100)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) 
VALUES(2100, '数据下钻', 0, 100, 'drill', NULL, '', 'ModuleDataDrill', 1, 0, 'M', '0', 0, '', 'data-analysis', 'admin', NOW(), '', NULL, '数据下钻模块根目录');

-- 2. 插入菜单: 报表配置管理 (ID: 2101)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) 
VALUES(2101, '报表配置管理', 2100, 1, 'info', 'drill/info/index', '', 'PxmDataDrillInfo', 1, 0, 'C', '0', 0, 'drill:info:list', 'setting', 'admin', NOW(), '', NULL, '下钻报表配置');

-- 按钮权限: 配置查询 (ID: 2102)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) 
VALUES(2102, '配置查询', 2101, 1, '', '', '', '', 1, 0, 'F', '0', 0, 'drill:info:query', '#', 'admin', NOW(), '', NULL, '');

-- 按钮权限: 配置新增 (ID: 2103)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) 
VALUES(2103, '配置新增', 2101, 2, '', '', '', '', 1, 0, 'F', '0', 0, 'drill:info:add', '#', 'admin', NOW(), '', NULL, '');

-- 按钮权限: 配置修改 (ID: 2104)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) 
VALUES(2104, '配置修改', 2101, 3, '', '', '', '', 1, 0, 'F', '0', 0, 'drill:info:edit', '#', 'admin', NOW(), '', NULL, '');

-- 按钮权限: 配置删除 (ID: 2105)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) 
VALUES(2105, '配置删除', 2101, 4, '', '', '', '', 1, 0, 'F', '0', 0, 'drill:info:remove', '#', 'admin', NOW(), '', NULL, '');

-- 按钮权限: SQL校验 (ID: 2106)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) 
VALUES(2106, 'SQL校验', 2101, 5, '', '', '', '', 1, 0, 'F', '0', 0, 'drill:execute:validate', '#', 'admin', NOW(), '', NULL, '');

-- 3. 插入菜单: 报表数据展示 (ID: 2107)
INSERT INTO sys_menu (menu_id, menu_name, parent_id, order_num, path, component, query, route_name, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark) 
VALUES(2107, '报表数据展示', 2100, 2, 'display', 'drill/display/index', '', 'PxmDataDrillDisplay', 1, 0, 'C', '0', 0, 'drill:execute:query', 'chart', 'admin', NOW(), '', NULL, '下钻报表展示');



-- ct_equipmentm.jf_nodrop_cch_gongmianxinxi definition

-- Drop table

-- DROP TABLE ct_equipmentm.jf_nodrop_cch_gongmianxinxi;

CREATE TABLE ct_equipmentm.jf_nodrop_cch_gongmianxinxi (
    "p_day_id" VARCHAR(50) NULL,
    "用户号码" VARCHAR(50) NULL,
    "本地网标识" VARCHAR(50) NULL,
    "营业区id" VARCHAR(50) NULL,
    "免单号" VARCHAR(50) NULL,
    "集团公免单号" VARCHAR(50) NULL,
    "公免标志" VARCHAR(50) NULL,
    "用户id" VARCHAR(50) NULL,
    "订单竣工时间" TIMESTAMP NULL,
    "产品规格id" VARCHAR(50) NULL,
    "受理工号" VARCHAR(50) NULL,
    "用户客户id" VARCHAR(50) NULL,
    "地址详情" VARCHAR(250) NULL,
    "公免申请部门" VARCHAR(50) NULL,
    "公免申请公司" VARCHAR(50) NULL,
    "公免申请人联系方式" VARCHAR(50) NULL,
    "公免生效时间" TIMESTAMP NULL,
    "公免失效时间" TIMESTAMP NULL,
    "公免有效期" VARCHAR(50) NULL,
    "公免产品范围" VARCHAR(50) NULL,
    "公免数量" VARCHAR(50) NULL,
    "公免申请人" VARCHAR(50) NULL
);


-- 设置表注释
COMMENT ON TABLE ct_equipmentm.jf_nodrop_cch_gongmianxinxi IS '公免公纳业务数据表';

-- 设置字段注释
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."p_day_id" IS '日期ID';
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."用户号码" IS '用户号码';
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."本地网标识" IS '本地网标识';
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."营业区id" IS '营业区ID';
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."免单号" IS '免单号';
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."集团公免单号" IS '集团公免单号';
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."公免标志" IS '公免标志';
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."用户id" IS '用户ID';
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."订单竣工时间" IS '订单竣工时间';
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."产品规格id" IS '产品规格ID';
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."受理工号" IS '受理工号';
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."用户客户id" IS '用户客户ID';
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."地址详情" IS '地址详情';
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."公免申请部门" IS '公免申请部门';
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."公免申请公司" IS '公免申请公司';
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."公免申请人联系方式" IS '公免申请人联系方式';
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."公免生效时间" IS '公免生效时间';
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."公免失效时间" IS '公免失效时间';
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."公免有效期" IS '公免有效期';
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."公免产品范围" IS '公免产品范围';
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."公免数量" IS '公免数量';  
COMMENT ON COLUMN ct_equipmentm.jf_nodrop_cch_gongmianxinxi."公免申请人" IS '公免申请人';