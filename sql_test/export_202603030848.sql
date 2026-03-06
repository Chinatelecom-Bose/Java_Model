INSERT INTO ct_equipmentm.qrtz_cron_triggers (sched_name,trigger_name,trigger_group,cron_expression,time_zone_id) VALUES
	 ('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','0/15 * * * * ?','Asia/Shanghai'),
	 ('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','0/20 * * * * ?','Asia/Shanghai'),
	 ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','0/10 * * * * ?','Asia/Shanghai');
INSERT INTO ct_equipmentm.qrtz_job_details (sched_name,job_name,job_group,description,job_class_name,is_durable,is_nonconcurrent,is_update_data,requests_recovery,job_data) VALUES
	 ('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT',NULL,'com.ctbc.quartz.util.QuartzDisallowConcurrentExecution','false','true','false','false',decode('ACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001D636F6D2E637462632E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720026636F6D2E637462632E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000179A8519B1878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800','hex')),
	 ('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT',NULL,'com.ctbc.quartz.util.QuartzDisallowConcurrentExecution','false','true','false','false',decode('ACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001D636F6D2E637462632E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720026636F6D2E637462632E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000179A8519B1878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800','hex')),
	 ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT',NULL,'com.ctbc.quartz.util.QuartzDisallowConcurrentExecution','false','true','false','false',decode('ACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001D636F6D2E637462632E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720026636F6D2E637462632E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000179A8519B1878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800','hex'));
INSERT INTO ct_equipmentm.qrtz_locks (sched_name,lock_name) VALUES
	 ('RuoyiScheduler','TRIGGER_ACCESS'),
	 ('RuoyiScheduler','STATE_ACCESS');
INSERT INTO ct_equipmentm.qrtz_scheduler_state (sched_name,instance_name,last_checkin_time,checkin_interval) VALUES
	 ('RuoyiScheduler','DESKTOP-GV71M5V1770347686973',1770347809184,15000);
INSERT INTO ct_equipmentm.qrtz_triggers (sched_name,trigger_name,trigger_group,job_name,job_group,description,next_fire_time,prev_fire_time,priority,trigger_state,trigger_type,start_time,end_time,calendar_name,misfire_instr,job_data) VALUES
	 ('RuoyiScheduler','TASK_CLASS_NAME2','DEFAULT','TASK_CLASS_NAME2','DEFAULT',NULL,1770347700000,-1,5,'PAUSED','CRON',1770347687000,0,NULL,2,decode('','hex')),
	 ('RuoyiScheduler','TASK_CLASS_NAME3','DEFAULT','TASK_CLASS_NAME3','DEFAULT',NULL,1770347700000,-1,5,'PAUSED','CRON',1770347687000,0,NULL,2,decode('','hex')),
	 ('RuoyiScheduler','TASK_CLASS_NAME1','DEFAULT','TASK_CLASS_NAME1','DEFAULT',NULL,1770347690000,-1,5,'PAUSED','CRON',1770347687000,0,NULL,2,decode('','hex'));
INSERT INTO ct_equipmentm.sys_config (config_name,config_key,config_value,config_type,create_by,create_time,update_by,update_time,remark) VALUES
	 ('主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2021-05-26 18:56:31','admin','2021-05-27 09:07:43.532263','蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
	 ('用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2021-05-26 18:56:31','admin','2021-05-27 10:15:52.394492','初始化密码 123456'),
	 ('主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2021-05-26 18:56:31','admin',NULL,'深色主题theme-dark，浅色主题theme-light'),
	 ('账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2025-12-10 03:11:21.819699','admin',NULL,'是否开启验证码功能（true开启，false关闭）'),
	 ('账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2025-12-10 03:11:21.819699','admin',NULL,'是否开启注册用户功能（true开启，false关闭）');
INSERT INTO ct_equipmentm.sys_dept (dept_id,parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) VALUES
	 (814,0,'0','百色分公司',0,'数支','15888888888','shuzhi@189.com','0','0','admin','2021-05-26 18:56:27','admin','2025-11-05 08:15:44.394561'),
	 (84909,814,'0,814','德保分公司',5,NULL,NULL,NULL,'0','0','admin','2025-11-05 08:30:15','admin','2025-11-05 08:30:29'),
	 (84910,814,'0,814','靖西分公司',6,NULL,NULL,NULL,'0','0','admin','2025-11-05 08:30:15','admin','2025-11-05 08:30:29'),
	 (84911,814,'0,814','乐业分公司',10,NULL,NULL,NULL,'0','0','admin','2025-11-05 08:30:15','admin','2025-11-05 08:30:29'),
	 (84912,814,'0,814','凌云分公司',9,NULL,NULL,NULL,'0','0','admin','2025-11-05 08:30:15','admin','2025-11-05 08:30:29'),
	 (84913,814,'0,814','隆林分公司',7,NULL,NULL,NULL,'0','0','admin','2025-11-05 08:30:15','admin','2025-11-05 08:30:29'),
	 (84914,814,'0,814','那坡分公司',8,NULL,NULL,NULL,'0','0','admin','2025-11-05 08:30:15','admin','2025-11-05 08:30:29'),
	 (84915,814,'0,814','平果分公司',2,NULL,NULL,NULL,'0','0','admin','2025-11-05 08:30:15','admin','2025-11-05 08:30:29'),
	 (84916,814,'0,814','田东分公司',3,NULL,NULL,NULL,'0','0','admin','2025-11-05 08:30:15','admin','2025-11-05 08:30:29'),
	 (84917,814,'0,814','田林分公司',11,NULL,NULL,NULL,'0','0','admin','2025-11-05 15:23:20','admin','2025-11-05 15:23:22');
INSERT INTO ct_equipmentm.sys_dept (dept_id,parent_id,ancestors,dept_name,order_num,leader,phone,email,status,del_flag,create_by,create_time,update_by,update_time) VALUES
	 (84918,814,'0,814','田阳分公司',4,NULL,NULL,NULL,'0','0','admin','2025-11-05 15:23:58','admin','2025-11-05 15:24:00'),
	 (84919,814,'0,814','西林分公司',12,NULL,NULL,NULL,'0','0','admin','2025-11-05 15:24:42','admin','2025-11-05 15:24:48'),
	 (84908,814,'0,814','右江分公司',1,NULL,NULL,NULL,'0','0','admin','2025-11-05 08:30:15','admin','2025-11-05 08:30:29');
INSERT INTO ct_equipmentm.sys_dict_data (dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) VALUES
	 (1,'男','0','sys_user_sex','','','Y','0','admin','2025-12-10 03:11:21.819699','',NULL,'性别男'),
	 (2,'女','1','sys_user_sex','','','N','0','admin','2025-12-10 03:11:21.819699','',NULL,'性别女'),
	 (3,'未知','2','sys_user_sex','','','N','0','admin','2025-12-10 03:11:21.819699','',NULL,'性别未知'),
	 (1,'显示','0','sys_show_hide','','primary','Y','0','admin','2025-12-10 03:11:21.819699','',NULL,'显示菜单'),
	 (2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2025-12-10 03:11:21.819699','',NULL,'隐藏菜单'),
	 (1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2025-12-10 03:11:21.819699','',NULL,'正常状态'),
	 (2,'停用','1','sys_normal_disable','','danger','N','0','admin','2025-12-10 03:11:21.819699','',NULL,'停用状态'),
	 (1,'正常','0','sys_job_status','','primary','Y','0','admin','2025-12-10 03:11:21.819699','',NULL,'正常状态'),
	 (2,'暂停','1','sys_job_status','','danger','N','0','admin','2025-12-10 03:11:21.819699','',NULL,'停用状态'),
	 (1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2025-12-10 03:11:21.819699','',NULL,'默认分组');
INSERT INTO ct_equipmentm.sys_dict_data (dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) VALUES
	 (2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2025-12-10 03:11:21.819699','',NULL,'系统分组'),
	 (1,'是','Y','sys_yes_no','','primary','Y','0','admin','2025-12-10 03:11:21.819699','',NULL,'系统默认是'),
	 (2,'否','N','sys_yes_no','','danger','N','0','admin','2025-12-10 03:11:21.819699','',NULL,'系统默认否'),
	 (1,'通知','1','sys_notice_type','','warning','Y','0','admin','2025-12-10 03:11:21.819699','',NULL,'通知'),
	 (2,'公告','2','sys_notice_type','','success','N','0','admin','2025-12-10 03:11:21.819699','',NULL,'公告'),
	 (1,'正常','0','sys_notice_status','','primary','Y','0','admin','2025-12-10 03:11:21.819699','',NULL,'正常状态'),
	 (2,'关闭','1','sys_notice_status','','danger','N','0','admin','2025-12-10 03:11:21.819699','',NULL,'关闭状态'),
	 (1,'新增','1','sys_oper_type','','info','N','0','admin','2025-12-10 03:11:21.819699','',NULL,'新增操作'),
	 (2,'修改','2','sys_oper_type','','info','N','0','admin','2025-12-10 03:11:21.819699','',NULL,'修改操作'),
	 (3,'删除','3','sys_oper_type','','danger','N','0','admin','2025-12-10 03:11:21.819699','',NULL,'删除操作');
INSERT INTO ct_equipmentm.sys_dict_data (dict_sort,dict_label,dict_value,dict_type,css_class,list_class,is_default,status,create_by,create_time,update_by,update_time,remark) VALUES
	 (4,'授权','4','sys_oper_type','','primary','N','0','admin','2025-12-10 03:11:21.819699','',NULL,'授权操作'),
	 (5,'导出','5','sys_oper_type','','warning','N','0','admin','2025-12-10 03:11:21.819699','',NULL,'导出操作'),
	 (6,'导入','6','sys_oper_type','','warning','N','0','admin','2025-12-10 03:11:21.819699','',NULL,'导入操作'),
	 (7,'强退','7','sys_oper_type','','danger','N','0','admin','2025-12-10 03:11:21.819699','',NULL,'强退操作'),
	 (8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2025-12-10 03:11:21.819699','',NULL,'生成操作'),
	 (9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2025-12-10 03:11:21.819699','',NULL,'清空操作'),
	 (1,'成功','0','sys_common_status','','primary','N','0','admin','2025-12-10 03:11:21.819699','',NULL,'正常状态'),
	 (2,'失败','1','sys_common_status','','danger','N','0','admin','2025-12-10 03:11:21.819699','',NULL,'停用状态');
INSERT INTO ct_equipmentm.sys_dict_type (dict_name,dict_type,status,create_by,create_time,update_by,update_time,remark) VALUES
	 ('菜单状态','sys_show_hide','0','admin','2021-05-26 18:56:30','',NULL,'菜单状态列表'),
	 ('系统开关','sys_normal_disable','0','admin','2021-05-26 18:56:30','',NULL,'系统开关列表'),
	 ('任务状态','sys_job_status','0','admin','2021-05-26 18:56:30','',NULL,'任务状态列表'),
	 ('任务分组','sys_job_group','0','admin','2021-05-26 18:56:30','',NULL,'任务分组列表'),
	 ('系统是否','sys_yes_no','0','admin','2021-05-26 18:56:30','',NULL,'系统是否列表'),
	 ('通知类型','sys_notice_type','0','admin','2021-05-26 18:56:30','',NULL,'通知类型列表'),
	 ('通知状态','sys_notice_status','0','admin','2021-05-26 18:56:30','',NULL,'通知状态列表'),
	 ('操作类型','sys_oper_type','0','admin','2021-05-26 18:56:30','',NULL,'操作类型列表'),
	 ('系统状态','sys_common_status','0','admin','2021-05-26 18:56:30','',NULL,'登录状态列表'),
	 ('用户性别','sys_user_sex','0','admin','2021-05-26 18:56:30','admin','2021-05-27 10:07:12.015926','用户性别列表');
INSERT INTO ct_equipmentm.sys_file (parent_id,is_folder,file_name,original_name,file_type,file_size,file_path,file_url,content_hash,mime_type,business_type,business_id,status,process_progress,error_message,download_count,metadata,create_by,create_time,update_by,update_time,remark) VALUES
	 (0,1,'1','1','folder',0,'system_file/1','/profile/system_file/1','7f5a07cb4d16ce033e4b48b2f4593dda',NULL,'common',NULL,'1',NULL,NULL,NULL,NULL,'admin','2025-12-19 10:06:05.427',NULL,NULL,NULL),
	 (8,0,'backgroud.png','backgroud.png','png',2591403,'../upload/system_file/1/2025/12/19/backgroud_20251219100636A001.png','/profile/system_file/1/2025/12/19/backgroud_20251219100636A001.png','72b94476898f07b63c2f428ea6dac5e5','image/png','common',NULL,'1',100,NULL,0,NULL,'admin','2025-12-19 10:06:36.413',NULL,'2025-12-19 10:06:48.280362',NULL);
INSERT INTO ct_equipmentm.sys_job (job_name,job_group,invoke_target,cron_expression,misfire_policy,concurrent,status,create_by,create_time,update_by,update_time,remark) VALUES
	 ('系统默认（有参）','DEFAULT','ryTask.ryParams(''ry'')','0/15 * * * * ?','3','1','1','admin','2021-05-26 18:56:31','',NULL,''),
	 ('系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(''ry'', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2021-05-26 18:56:31','',NULL,''),
	 ('系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2021-05-26 18:56:31','','2025-12-25 18:26:42.801783','');
INSERT INTO ct_equipmentm.sys_menu (menu_name,parent_id,order_num,"path",component,query,route_name,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) VALUES
	 ('系统工具',0,3,'tool',NULL,'','',1,0,'M','0',0,'','tool','admin','2025-12-10 03:11:21.819699','',NULL,'系统工具目录'),
	 ('用户管理',1,1,'user','system/user/index','','',1,0,'C','0',0,'system:user:list','user','admin','2025-12-10 03:11:21.819699','',NULL,'用户管理菜单'),
	 ('角色管理',1,2,'role','system/role/index','','',1,0,'C','0',0,'system:role:list','peoples','admin','2025-12-10 03:11:21.819699','',NULL,'角色管理菜单'),
	 ('菜单管理',1,3,'menu','system/menu/index','','',1,0,'C','0',0,'system:menu:list','tree-table','admin','2025-12-10 03:11:21.819699','',NULL,'菜单管理菜单'),
	 ('部门管理',1,4,'dept','system/dept/index','','',1,0,'C','0',0,'system:dept:list','tree','admin','2025-12-10 03:11:21.819699','',NULL,'部门管理菜单'),
	 ('岗位管理',1,5,'post','system/post/index','','',1,0,'C','0',0,'system:post:list','post','admin','2025-12-10 03:11:21.819699','',NULL,'岗位管理菜单'),
	 ('字典管理',1,6,'dict','system/dict/index','','',1,0,'C','0',0,'system:dict:list','dict','admin','2025-12-10 03:11:21.819699','',NULL,'字典管理菜单'),
	 ('参数设置',1,7,'config','system/config/index','','',1,0,'C','0',0,'system:config:list','edit','admin','2025-12-10 03:11:21.819699','',NULL,'参数设置菜单'),
	 ('通知公告',1,8,'notice','system/notice/index','','',1,0,'C','0',0,'system:notice:list','message','admin','2025-12-10 03:11:21.819699','',NULL,'通知公告菜单'),
	 ('日志管理',1,9,'log','','','',1,0,'M','0',0,'','log','admin','2025-12-10 03:11:21.819699','',NULL,'日志管理菜单');
INSERT INTO ct_equipmentm.sys_menu (menu_name,parent_id,order_num,"path",component,query,route_name,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) VALUES
	 ('在线用户',2,1,'online','monitor/online/index','','',1,0,'C','0',0,'monitor:online:list','online','admin','2025-12-10 03:11:21.819699','',NULL,'在线用户菜单'),
	 ('定时任务',2,2,'job','monitor/job/index','','',1,0,'C','0',0,'monitor:job:list','job','admin','2025-12-10 03:11:21.819699','',NULL,'定时任务菜单'),
	 ('数据监控',2,3,'druid','monitor/druid/index','','',1,0,'C','0',0,'monitor:druid:list','druid','admin','2025-12-10 03:11:21.819699','',NULL,'数据监控菜单'),
	 ('服务监控',2,4,'server','monitor/server/index','','',1,0,'C','0',0,'monitor:server:list','server','admin','2025-12-10 03:11:21.819699','',NULL,'服务监控菜单'),
	 ('缓存监控',2,5,'cache','monitor/cache/index','','',1,0,'C','0',0,'monitor:cache:list','redis','admin','2025-12-10 03:11:21.819699','',NULL,'缓存监控菜单'),
	 ('缓存列表',2,6,'cacheList','monitor/cache/list','','',1,0,'C','0',0,'monitor:cache:list','redis-list','admin','2025-12-10 03:11:21.819699','',NULL,'缓存列表菜单'),
	 ('表单构建',3,1,'build','tool/build/index','','',1,0,'C','0',0,'tool:build:list','build','admin','2025-12-10 03:11:21.819699','',NULL,'表单构建菜单'),
	 ('代码生成',3,2,'gen','tool/gen/index','','',1,0,'C','0',0,'tool:gen:list','code','admin','2025-12-10 03:11:21.819699','',NULL,'代码生成菜单'),
	 ('系统接口',3,3,'swagger','tool/swagger/index','','',1,0,'C','0',0,'tool:swagger:list','swagger','admin','2025-12-10 03:11:21.819699','',NULL,'系统接口菜单'),
	 ('操作日志',108,1,'operlog','monitor/operlog/index','','',1,0,'C','0',0,'monitor:operlog:list','form','admin','2025-12-10 03:11:21.819699','',NULL,'操作日志菜单');
INSERT INTO ct_equipmentm.sys_menu (menu_name,parent_id,order_num,"path",component,query,route_name,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) VALUES
	 ('登录日志',108,2,'logininfor','monitor/logininfor/index','','',1,0,'C','0',0,'monitor:logininfor:list','logininfor','admin','2025-12-10 03:11:21.819699','',NULL,'登录日志菜单'),
	 ('用户查询',100,1,'','','','',1,0,'F','0',0,'system:user:query','#','admin','2025-12-10 03:11:21.819699','',NULL,''),
	 ('用户新增',100,2,'','','','',1,0,'F','0',0,'system:user:add','#','admin','2025-12-10 03:11:21.819699','',NULL,''),
	 ('用户修改',100,3,'','','','',1,0,'F','0',0,'system:user:edit','#','admin','2025-12-10 03:11:21.819699','',NULL,''),
	 ('用户删除',100,4,'','','','',1,0,'F','0',0,'system:user:remove','#','admin','2025-12-10 03:11:21.819699','',NULL,''),
	 ('用户导出',100,5,'','','','',1,0,'F','0',0,'system:user:export','#','admin','2025-12-10 03:11:21.819699','',NULL,''),
	 ('用户导入',100,6,'','','','',1,0,'F','0',0,'system:user:import','#','admin','2025-12-10 03:11:21.819699','',NULL,''),
	 ('重置密码',100,7,'','','','',1,0,'F','0',0,'system:user:resetPwd','#','admin','2025-12-10 03:11:21.819699','',NULL,''),
	 ('角色查询',101,1,'','','','',1,0,'F','0',0,'system:role:query','#','admin','2025-12-10 03:11:21.819699','',NULL,''),
	 ('角色新增',101,2,'','','','',1,0,'F','0',0,'system:role:add','#','admin','2025-12-10 03:11:21.819699','',NULL,'');
INSERT INTO ct_equipmentm.sys_menu (menu_name,parent_id,order_num,"path",component,query,route_name,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) VALUES
	 ('角色修改',101,3,'','','','',1,0,'F','0',0,'system:role:edit','#','admin','2025-12-10 03:11:21.819699','',NULL,''),
	 ('角色删除',101,4,'','','','',1,0,'F','0',0,'system:role:remove','#','admin','2025-12-10 03:11:21.819699','',NULL,''),
	 ('角色导出',101,5,'','','','',1,0,'F','0',0,'system:role:export','#','admin','2025-12-10 03:11:21.819699','',NULL,''),
	 ('菜单查询',102,1,'','','','',1,0,'F','0',0,'system:menu:query','#','admin','2025-12-10 03:11:21.819699','',NULL,''),
	 ('菜单新增',102,2,'','','','',1,0,'F','0',0,'system:menu:add','#','admin','2025-12-10 03:11:21.819699','',NULL,''),
	 ('菜单修改',102,3,'','','','',1,0,'F','0',0,'system:menu:edit','#','admin','2025-12-10 03:11:21.819699','',NULL,''),
	 ('菜单删除',102,4,'','','','',1,0,'F','0',0,'system:menu:remove','#','admin','2025-12-10 03:11:21.819699','',NULL,''),
	 ('部门查询',103,1,'','','','',1,0,'F','0',0,'system:dept:query','#','admin','2025-12-10 03:11:21.819699','',NULL,''),
	 ('部门新增',103,2,'','','','',1,0,'F','0',0,'system:dept:add','#','admin','2025-12-10 03:11:21.819699','',NULL,''),
	 ('部门修改',103,3,'','','','',1,0,'F','0',0,'system:dept:edit','#','admin','2025-12-10 03:11:21.819699','',NULL,'');
INSERT INTO ct_equipmentm.sys_menu (menu_name,parent_id,order_num,"path",component,query,route_name,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) VALUES
	 ('部门删除',103,4,'','','','',1,0,'F','0',0,'system:dept:remove','#','admin','2025-12-10 03:11:21.819699','',NULL,''),
	 ('岗位查询',104,1,'','','','',1,0,'F','0',0,'system:post:query','#','admin','2025-12-10 03:11:21.819699','',NULL,''),
	 ('岗位新增',104,2,'','','','',1,0,'F','0',0,'system:post:add','#','admin','2025-12-10 03:11:21.819699','',NULL,''),
	 ('岗位修改',104,3,'','','','',1,0,'F','0',0,'system:post:edit','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('岗位删除',104,4,'','','','',1,0,'F','0',0,'system:post:remove','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('岗位导出',104,5,'','','','',1,0,'F','0',0,'system:post:export','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('字典查询',105,1,'#','','','',1,0,'F','0',0,'system:dict:query','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('字典新增',105,2,'#','','','',1,0,'F','0',0,'system:dict:add','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('字典修改',105,3,'#','','','',1,0,'F','0',0,'system:dict:edit','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('字典删除',105,4,'#','','','',1,0,'F','0',0,'system:dict:remove','#','admin','2025-12-10 03:11:22.032494','',NULL,'');
INSERT INTO ct_equipmentm.sys_menu (menu_name,parent_id,order_num,"path",component,query,route_name,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) VALUES
	 ('系统管理',0,3,'system',NULL,'','',1,0,'M','0',0,'','system','admin','2025-12-10 03:11:21.819699','admin','2025-12-10 11:44:23.527302','系统管理目录'),
	 ('字典导出',105,5,'#','','','',1,0,'F','0',0,'system:dict:export','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('参数查询',106,1,'#','','','',1,0,'F','0',0,'system:config:query','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('参数新增',106,2,'#','','','',1,0,'F','0',0,'system:config:add','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('参数修改',106,3,'#','','','',1,0,'F','0',0,'system:config:edit','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('参数删除',106,4,'#','','','',1,0,'F','0',0,'system:config:remove','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('参数导出',106,5,'#','','','',1,0,'F','0',0,'system:config:export','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('公告查询',107,1,'#','','','',1,0,'F','0',0,'system:notice:query','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('公告新增',107,2,'#','','','',1,0,'F','0',0,'system:notice:add','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('公告修改',107,3,'#','','','',1,0,'F','0',0,'system:notice:edit','#','admin','2025-12-10 03:11:22.032494','',NULL,'');
INSERT INTO ct_equipmentm.sys_menu (menu_name,parent_id,order_num,"path",component,query,route_name,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) VALUES
	 ('公告删除',107,4,'#','','','',1,0,'F','0',0,'system:notice:remove','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('操作查询',500,1,'#','','','',1,0,'F','0',0,'monitor:operlog:query','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('操作删除',500,2,'#','','','',1,0,'F','0',0,'monitor:operlog:remove','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('日志导出',500,3,'#','','','',1,0,'F','0',0,'monitor:operlog:export','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('登录查询',501,1,'#','','','',1,0,'F','0',0,'monitor:logininfor:query','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('登录删除',501,2,'#','','','',1,0,'F','0',0,'monitor:logininfor:remove','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('日志导出',501,3,'#','','','',1,0,'F','0',0,'monitor:logininfor:export','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('账户解锁',501,4,'#','','','',1,0,'F','0',0,'monitor:logininfor:unlock','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('在线查询',109,1,'#','','','',1,0,'F','0',0,'monitor:online:query','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('批量强退',109,2,'#','','','',1,0,'F','0',0,'monitor:online:batchLogout','#','admin','2025-12-10 03:11:22.032494','',NULL,'');
INSERT INTO ct_equipmentm.sys_menu (menu_name,parent_id,order_num,"path",component,query,route_name,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) VALUES
	 ('单条强退',109,3,'#','','','',1,0,'F','0',0,'monitor:online:forceLogout','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('任务查询',110,1,'#','','','',1,0,'F','0',0,'monitor:job:query','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('任务新增',110,2,'#','','','',1,0,'F','0',0,'monitor:job:add','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('任务修改',110,3,'#','','','',1,0,'F','0',0,'monitor:job:edit','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('任务删除',110,4,'#','','','',1,0,'F','0',0,'monitor:job:remove','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('状态修改',110,5,'#','','','',1,0,'F','0',0,'monitor:job:changeStatus','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('任务导出',110,6,'#','','','',1,0,'F','0',0,'monitor:job:export','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('生成查询',116,1,'#','','','',1,0,'F','0',0,'tool:gen:query','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('生成修改',116,2,'#','','','',1,0,'F','0',0,'tool:gen:edit','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('生成删除',116,3,'#','','','',1,0,'F','0',0,'tool:gen:remove','#','admin','2025-12-10 03:11:22.032494','',NULL,'');
INSERT INTO ct_equipmentm.sys_menu (menu_name,parent_id,order_num,"path",component,query,route_name,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) VALUES
	 ('导入代码',116,4,'#','','','',1,0,'F','0',0,'tool:gen:import','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('预览代码',116,5,'#','','','',1,0,'F','0',0,'tool:gen:preview','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('生成代码',116,6,'#','','','',1,0,'F','0',0,'tool:gen:code','#','admin','2025-12-10 03:11:22.032494','',NULL,''),
	 ('工单汇总',0,1,'data_info_detail','data_info_detail/order/index',NULL,'',1,0,'C','0',0,NULL,'build','admin','2025-12-10 11:40:54.658218',NULL,NULL,NULL),
	 ('查询1',2000,1,NULL,NULL,NULL,'',1,0,'F','0',0,'unitdetail:unitdetail:list',NULL,'admin','2025-12-10 11:41:36.791919','admin','2025-12-10 11:42:26.925099',NULL),
	 ('查询2',2000,2,NULL,NULL,NULL,'',1,0,'F','0',0,'unitdetail:unitdetail:listAll',NULL,'admin','2025-12-10 11:42:02.311588','admin','2025-12-10 11:42:37.291242',NULL),
	 ('工单明细',0,2,'order_info_detail','data_info_detail/detail/index',NULL,'',1,0,'C','0',0,NULL,'FundOutlined','admin','2025-12-10 11:43:13.171619',NULL,NULL,NULL),
	 ('系统监控',0,5,'monitor',NULL,'','',1,0,'M','0',0,'','monitor','admin','2025-12-10 03:11:21.819699','admin','2025-12-10 11:44:38.341895','系统监控目录'),
	 ('数据展示',0,6,NULL,NULL,NULL,'',1,0,'F','0',0,'statistics:datainfo:list',NULL,'admin','2025-12-10 11:47:52.940374',NULL,NULL,NULL),
	 ('查询1',2003,1,NULL,NULL,NULL,'',1,0,'F','0',0,'orderinfo:info:list',NULL,'admin','2025-12-10 11:43:54.966873','admin','2025-12-10 11:49:10.581859',NULL);
INSERT INTO ct_equipmentm.sys_menu (menu_name,parent_id,order_num,"path",component,query,route_name,is_frame,is_cache,menu_type,visible,status,perms,icon,create_by,create_time,update_by,update_time,remark) VALUES
	 ('文件管理',1,11,'file','system\file\index',NULL,'',1,0,'C','0',0,NULL,'FileTextOutlined','admin','2025-12-18 11:21:04.78023','admin','2025-12-18 11:22:08.803904',NULL);
INSERT INTO ct_equipmentm.sys_notice (notice_title,notice_type,notice_content,status,create_by,create_time,update_by,update_time,remark) VALUES
	 ('维护通知：2018-07-01 若依系统凌晨维护','1','\xe7bbb4e68aa4e58685e5aeb9','0','admin','2021-05-26 18:56:31','',NULL,'管理员'),
	 ('温馨提醒：2018-07-01 若依新版本发布啦','2','\','0','admin','2021-05-26 18:56:31','admin','2021-05-27 09:08:41.403262','管理员');
INSERT INTO ct_equipmentm.sys_post (post_code,post_name,post_sort,status,create_by,create_time,update_by,update_time,remark) VALUES
	 ('se','项目经理',2,'0','admin','2021-05-26 18:56:28','',NULL,''),
	 ('hr','人力资源',3,'0','admin','2021-05-26 18:56:28','',NULL,''),
	 ('user','普通员工',4,'0','admin','2021-05-26 18:56:28','',NULL,''),
	 ('ceo','董事长',1,'0','admin','2021-05-26 18:56:28','admin','2021-05-27 09:07:17.160973','');
INSERT INTO ct_equipmentm.sys_role (role_name,role_key,role_sort,data_scope,menu_check_strictly,dept_check_strictly,status,del_flag,create_by,create_time,update_by,update_time,remark) VALUES
	 ('超级管理员','admin',1,'1',true,true,'0','0','admin','2021-05-26 18:56:28','',NULL,'超级管理员'),
	 ('管控部管理员','center_manager',2,'4',false,false,'0','0','admin','2025-12-10 11:38:30.16034','admin','2025-12-10 11:48:07.746847','管控部'),
	 ('经营单位管理员','sale_center_manager',3,'4',false,false,'0','0','admin','2025-12-10 11:39:40.285827','admin','2025-12-10 11:48:13.045169','经营单位'),
	 ('普通角色','common',4,'5',false,false,'0','0','admin','2021-05-26 18:56:28','admin','2025-12-10 11:48:17.046116','普通角色');
INSERT INTO ct_equipmentm.sys_role_menu (role_id,menu_id) VALUES
	 (3,2000),
	 (3,2003),
	 (3,1),
	 (3,100),
	 (3,103),
	 (3,1000),
	 (3,1016),
	 (3,2001),
	 (3,2002),
	 (3,2004);
INSERT INTO ct_equipmentm.sys_role_menu (role_id,menu_id) VALUES
	 (3,2005),
	 (4,2000),
	 (4,2003),
	 (4,1),
	 (4,100),
	 (4,1000),
	 (4,2001),
	 (4,2002),
	 (4,2004),
	 (4,2005);
INSERT INTO ct_equipmentm.sys_role_menu (role_id,menu_id) VALUES
	 (2,2000),
	 (2,2003),
	 (2,100),
	 (2,101),
	 (2,102),
	 (2,103),
	 (2,104),
	 (2,105),
	 (2,106),
	 (2,107);
INSERT INTO ct_equipmentm.sys_role_menu (role_id,menu_id) VALUES
	 (2,108),
	 (2,109),
	 (2,110),
	 (2,111),
	 (2,112),
	 (2,113),
	 (2,114),
	 (2,115),
	 (2,116),
	 (2,1001);
INSERT INTO ct_equipmentm.sys_role_menu (role_id,menu_id) VALUES
	 (2,1002),
	 (2,1003),
	 (2,1004),
	 (2,1005),
	 (2,1006),
	 (2,1007),
	 (2,1008),
	 (2,1009),
	 (2,1010),
	 (2,1011);
INSERT INTO ct_equipmentm.sys_role_menu (role_id,menu_id) VALUES
	 (2,1012),
	 (2,1013),
	 (2,1014),
	 (2,1015),
	 (2,1016),
	 (2,1017),
	 (2,1018),
	 (2,1019),
	 (2,1020),
	 (2,1021);
INSERT INTO ct_equipmentm.sys_role_menu (role_id,menu_id) VALUES
	 (2,1022),
	 (2,1023),
	 (2,1024),
	 (2,1025),
	 (2,1026),
	 (2,1027),
	 (2,1028),
	 (2,1029),
	 (2,1030),
	 (2,1031);
INSERT INTO ct_equipmentm.sys_role_menu (role_id,menu_id) VALUES
	 (2,1032),
	 (2,1033),
	 (2,1034),
	 (2,1035),
	 (2,1036),
	 (2,1037),
	 (2,1038),
	 (2,500),
	 (2,501),
	 (2,1046);
INSERT INTO ct_equipmentm.sys_role_menu (role_id,menu_id) VALUES
	 (2,1047),
	 (2,1048),
	 (2,1049),
	 (2,1050),
	 (2,1051),
	 (2,1052),
	 (2,1053),
	 (2,1054),
	 (2,1055),
	 (2,1056);
INSERT INTO ct_equipmentm.sys_role_menu (role_id,menu_id) VALUES
	 (2,1057),
	 (2,1058),
	 (2,1059),
	 (2,1060),
	 (2,1039),
	 (2,1040),
	 (2,1041),
	 (2,1042),
	 (2,1043),
	 (2,1044);
INSERT INTO ct_equipmentm.sys_role_menu (role_id,menu_id) VALUES
	 (2,1045),
	 (2,2001),
	 (2,2002),
	 (2,2004),
	 (2,2005);
INSERT INTO ct_equipmentm.sys_user (dept_id,user_name,nick_name,user_type,email,phonenumber,sex,avatar,"password",status,del_flag,login_ip,login_date,pwd_update_date,create_by,create_time,update_by,update_time,remark,staff_code) VALUES
	 (84909,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$jzRdYGsd8XlhHw/yO1zw0O/kWXLUDwPEEY/DbSEfZO2.HplksgLfO','0','0','127.0.0.1','2025-12-16 09:49:55.098','2026-01-28 17:27:50.907898','admin','2021-05-26 18:56:28','admin','2026-01-28 17:27:50.907898','测试员','2'),
	 (814,'admin','無','00','ry@163.com','15888888889','0','/profile/avatar/2025/12/18/1fb557dccf0e43cea541e2b567c6ffb6.png','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-30 08:41:10.332','2021-05-26 18:56:28','admin','2021-05-26 18:56:28','','2025-12-26 08:49:58.681609','管理员','1');
INSERT INTO ct_equipmentm.sys_user_post (user_id,post_id) VALUES
	 (1,1);
INSERT INTO ct_equipmentm.sys_user_role (user_id,role_id) VALUES
	 (1,1),
	 (2,4);
