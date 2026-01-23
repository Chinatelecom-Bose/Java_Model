-- ----------------------------
-- 1. 初始化表结构
-- ----------------------------

-- 下钻报表主表
CREATE TABLE IF NOT EXISTS data_drill_info (
    id SERIAL PRIMARY KEY,
    uuid VARCHAR(64) NOT NULL UNIQUE,
    report_name VARCHAR(255) NOT NULL,
    status VARCHAR(10) DEFAULT '0' NOT NULL,
    description TEXT,
    created_time TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_time TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_id INTEGER,
    updated_id INTEGER
);
COMMENT ON TABLE data_drill_info IS '下钻报表定义';
COMMENT ON COLUMN data_drill_info.report_name IS '报表名称';
COMMENT ON COLUMN data_drill_info.status IS '是否启用(0:启用 1:禁用)';

-- 下钻报表节点表
CREATE TABLE IF NOT EXISTS data_drill_node (
    id SERIAL PRIMARY KEY,
    uuid VARCHAR(64) NOT NULL UNIQUE,
    info_id INTEGER NOT NULL REFERENCES data_drill_info(id) ON DELETE CASCADE,
    parent_id INTEGER REFERENCES data_drill_node(id),
    node_name VARCHAR(255) NOT NULL,
    sql_text TEXT,
    link_field VARCHAR(255),
    param_name VARCHAR(255),
    status VARCHAR(10) DEFAULT '0' NOT NULL,
    description TEXT,
    created_time TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_time TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);
COMMENT ON TABLE data_drill_node IS '下钻报表节点';
COMMENT ON COLUMN data_drill_node.info_id IS '主表ID';
COMMENT ON COLUMN data_drill_node.parent_id IS '父节点ID';
COMMENT ON COLUMN data_drill_node.sql_text IS '查询SQL';
COMMENT ON COLUMN data_drill_node.link_field IS '父级关联字段';
COMMENT ON COLUMN data_drill_node.param_name IS '参数名';

-- ----------------------------
-- 2. 初始化菜单数据
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
