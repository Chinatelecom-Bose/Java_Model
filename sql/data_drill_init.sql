-- ----------------------------
-- 数据下钻表结构定义
-- 包括主表(data_drill_info)和节点表(data_drill_node)
-- ----------------------------

-- ----------------------------
-- data_drill_info 表结构
-- ----------------------------
CREATE TABLE ct_equipmentm.data_drill_info (
    report_name character varying(255) NOT NULL,
    id serial NOT NULL,
    uuid character varying(64),
    status character varying(10) DEFAULT '0'::character varying NOT NULL,
    description text,
    created_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_id integer,
    updated_id integer,
    CONSTRAINT data_drill_info_pkey PRIMARY KEY (id)
);
ALTER TABLE ct_equipmentm.data_drill_info OWNER TO root;

-- ----------------------------
-- data_drill_info 表注释
-- ----------------------------
COMMENT ON TABLE ct_equipmentm.data_drill_info IS '下钻报表定义';
COMMENT ON COLUMN ct_equipmentm.data_drill_info.report_name IS '报表名称';
COMMENT ON COLUMN ct_equipmentm.data_drill_info.status IS '是否启用(0:启用 1:禁用)';
COMMENT ON COLUMN ct_equipmentm.data_drill_info.id IS '主键ID';
COMMENT ON COLUMN ct_equipmentm.data_drill_info.uuid IS 'UUID全局唯一标识';
COMMENT ON COLUMN ct_equipmentm.data_drill_info.description IS '备注/描述';
COMMENT ON COLUMN ct_equipmentm.data_drill_info.created_time IS '创建时间';
COMMENT ON COLUMN ct_equipmentm.data_drill_info.updated_time IS '更新时间';
COMMENT ON COLUMN ct_equipmentm.data_drill_info.created_id IS '创建人ID';
COMMENT ON COLUMN ct_equipmentm.data_drill_info.updated_id IS '更新人ID';

-- ----------------------------
-- data_drill_info 序列结构
-- ----------------------------
CREATE SEQUENCE ct_equipmentm.data_drill_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE ct_equipmentm.data_drill_info_id_seq OWNER TO root;

ALTER SEQUENCE ct_equipmentm.data_drill_info_id_seq OWNED BY ct_equipmentm.data_drill_info.id;

-- ----------------------------
-- data_drill_info 表索引
-- ----------------------------
CREATE INDEX ix_data_drill_info_created_id ON ct_equipmentm.data_drill_info USING btree (created_id);
CREATE INDEX ix_data_drill_info_updated_id ON ct_equipmentm.data_drill_info USING btree (updated_id);

-- ----------------------------
-- data_drill_info 表外键约束
-- ----------------------------
ALTER TABLE ct_equipmentm.data_drill_info ADD CONSTRAINT data_drill_info_created_id_fkey FOREIGN KEY (created_id) REFERENCES ct_equipmentm.sys_user(id) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE ct_equipmentm.data_drill_info ADD CONSTRAINT data_drill_info_updated_id_fkey FOREIGN KEY (updated_id) REFERENCES ct_equipmentm.sys_user(id) ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- data_drill_node 表结构
-- ----------------------------
CREATE TABLE ct_equipmentm.data_drill_node (
    info_id integer NOT NULL,
    parent_id integer,
    node_name character varying(255) NOT NULL,
    sql_text text,
    link_field character varying(255),
    param_name character varying(255),
    id serial NOT NULL,
    uuid character varying(64),
    status character varying(10) DEFAULT '0'::character varying NOT NULL,
    description text,
    created_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    created_id integer,
    updated_id integer,
    pass_field character varying(255),
    CONSTRAINT data_drill_node_pkey PRIMARY KEY (id)
);
ALTER TABLE ct_equipmentm.data_drill_node OWNER TO root;

-- ----------------------------
-- data_drill_node 表注释
-- ----------------------------
COMMENT ON TABLE ct_equipmentm.data_drill_node IS '下钻报表节点';
COMMENT ON COLUMN ct_equipmentm.data_drill_node.info_id IS '主表ID';
COMMENT ON COLUMN ct_equipmentm.data_drill_node.parent_id IS '父节点ID';
COMMENT ON COLUMN ct_equipmentm.data_drill_node.node_name IS '节点名称';
COMMENT ON COLUMN ct_equipmentm.data_drill_node.sql_text IS '查询SQL';
COMMENT ON COLUMN ct_equipmentm.data_drill_node.link_field IS '父级关联字段';
COMMENT ON COLUMN ct_equipmentm.data_drill_node.param_name IS '参数名';
COMMENT ON COLUMN ct_equipmentm.data_drill_node.id IS '主键ID';
COMMENT ON COLUMN ct_equipmentm.data_drill_node.uuid IS 'UUID全局唯一标识';
COMMENT ON COLUMN ct_equipmentm.data_drill_node.status IS '是否启用(0:启用 1:禁用)';
COMMENT ON COLUMN ct_equipmentm.data_drill_node.description IS '备注/描述';
COMMENT ON COLUMN ct_equipmentm.data_drill_node.created_time IS '创建时间';
COMMENT ON COLUMN ct_equipmentm.data_drill_node.updated_time IS '更新时间';
COMMENT ON COLUMN ct_equipmentm.data_drill_node.created_id IS '创建人ID';
COMMENT ON COLUMN ct_equipmentm.data_drill_node.updated_id IS '更新人ID';
COMMENT ON COLUMN ct_equipmentm.data_drill_node.pass_field IS '传递字段，用于节点间数据传递';

-- ----------------------------
-- data_drill_node 序列结构
-- ----------------------------
CREATE SEQUENCE ct_equipmentm.data_drill_node_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE ct_equipmentm.data_drill_node_id_seq OWNER TO root;

ALTER SEQUENCE ct_equipmentm.data_drill_node_id_seq OWNED BY ct_equipmentm.data_drill_node.id;

-- ----------------------------
-- data_drill_node 表索引
-- ----------------------------
CREATE INDEX ix_data_drill_node_info_id ON ct_equipmentm.data_drill_node USING btree (info_id);
CREATE INDEX ix_data_drill_node_parent_id ON ct_equipmentm.data_drill_node USING btree (parent_id);
CREATE INDEX ix_data_drill_node_created_id ON ct_equipmentm.data_drill_node USING btree (created_id);
CREATE INDEX ix_data_drill_node_updated_id ON ct_equipmentm.data_drill_node USING btree (updated_id);

-- ----------------------------
-- data_drill_node 表外键约束
-- ----------------------------
ALTER TABLE ct_equipmentm.data_drill_node ADD CONSTRAINT data_drill_node_info_id_fkey FOREIGN KEY (info_id) REFERENCES ct_equipmentm.data_drill_info(id) ON DELETE CASCADE;
ALTER TABLE ct_equipmentm.data_drill_node ADD CONSTRAINT data_drill_node_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES ct_equipmentm.data_drill_node(id);
ALTER TABLE ct_equipmentm.data_drill_node ADD CONSTRAINT data_drill_node_created_id_fkey FOREIGN KEY (created_id) REFERENCES ct_equipmentm.sys_user(id) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE ct_equipmentm.data_drill_node ADD CONSTRAINT data_drill_node_updated_id_fkey FOREIGN KEY (updated_id) REFERENCES ct_equipmentm.sys_user(id) ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- 列默认值
-- ----------------------------
ALTER TABLE ONLY ct_equipmentm.data_drill_info ALTER COLUMN id SET DEFAULT nextval('ct_equipmentm.data_drill_info_id_seq'::regclass);
ALTER TABLE ONLY ct_equipmentm.data_drill_node ALTER COLUMN id SET DEFAULT nextval('ct_equipmentm.data_drill_node_id_seq'::regclass);

-- ----------------------------
-- 表数据（初始空数据）
-- ----------------------------
COPY ct_equipmentm.data_drill_info (id, uuid, report_name, status, description, created_time, updated_time, created_id, updated_id) FROM stdin;
\.

COPY ct_equipmentm.data_drill_node (id, uuid, info_id, parent_id, node_name, sql_text, link_field, param_name, status, description, created_time, updated_time) FROM stdin;
\.

-- ----------------------------
-- 序列值
-- ----------------------------
SELECT pg_catalog.setval('ct_equipmentm.data_drill_info_id_seq', 1, false);
SELECT pg_catalog.setval('ct_equipmentm.data_drill_node_id_seq', 1, false);

-- ----------------------------
-- 初始化菜单数据
-- ----------------------------

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


--
-- 创建 jf_nodrop_cch_gongmianxinxi 表
CREATE TABLE ct_equipmentm.jf_nodrop_cch_gongmianxinxi (
    "p_day_id" VARCHAR(50),
    "用户号码" VARCHAR(50),
    "本地网标识" VARCHAR(50),
    "营业区id" VARCHAR(50),
    "免单号" VARCHAR(50),
    "集团公免单号" VARCHAR(50),
    "公免标志" VARCHAR(50),
    "用户id" VARCHAR(50),
    "订单竣工时间" TIMESTAMP,
    "产品规格id" VARCHAR(50),
    "受理工号" VARCHAR(50),
    "用户客户id" VARCHAR(50),
    "地址详情" VARCHAR(250),
    "公免申请部门" VARCHAR(50),
    "公免申请公司" VARCHAR(50),
    "公免申请人联系方式" VARCHAR(50),
    "公免生效时间" TIMESTAMP,
    "公免失效时间" TIMESTAMP,
    "公免有效期" VARCHAR(50),
    "公免产品范围" VARCHAR(50),
    "公免数量" VARCHAR(50),
    "公免申请人" VARCHAR(50)
);

-- 设置表所有者
ALTER TABLE ct_equipmentm.jf_nodrop_cch_gongmianxinxi OWNER TO root;

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
