DROP TABLE IF EXISTS GEN_TABLE;
DROP TABLE IF EXISTS GEN_TABLE_COLUMN;
DROP TABLE IF EXISTS SYS_CONFIG;
DROP TABLE IF EXISTS SYS_DEPT;
DROP TABLE IF EXISTS SYS_DICT_DATA;
DROP TABLE IF EXISTS SYS_DICT_TYPE;
DROP TABLE IF EXISTS SYS_JOB;
DROP TABLE IF EXISTS SYS_JOB_LOG;
DROP TABLE IF EXISTS SYS_LOGININFOR;
DROP TABLE IF EXISTS SYS_MENU;
DROP TABLE IF EXISTS SYS_NOTICE;
DROP TABLE IF EXISTS SYS_OPER_LOG;
DROP TABLE IF EXISTS SYS_POST;
DROP TABLE IF EXISTS SYS_ROLE;
DROP TABLE IF EXISTS SYS_ROLE_DEPT;
DROP TABLE IF EXISTS SYS_ROLE_MENU;
DROP TABLE IF EXISTS SYS_USER;
DROP TABLE IF EXISTS SYS_USER_POST;
DROP TABLE IF EXISTS SYS_USER_ROLE;



/*==============================================================*/
/* TABLE: GEN_TABLE                                             */
/*==============================================================*/
CREATE TABLE GEN_TABLE (
   TABLE_ID             BIGSERIAL NOT NULL,
   TABLE_NAME           VARCHAR(200)         NULL DEFAULT '',
   TABLE_COMMENT        VARCHAR(500)         NULL DEFAULT '',
   CLASS_NAME           VARCHAR(100)         NULL DEFAULT '',
   TPL_CATEGORY         VARCHAR(200)         NULL DEFAULT 'crud',
   PACKAGE_NAME         VARCHAR(100)         NULL DEFAULT NULL,
   MODULE_NAME          VARCHAR(30)          NULL DEFAULT NULL,
   BUSINESS_NAME        VARCHAR(30)          NULL DEFAULT NULL,
   FUNCTION_NAME        VARCHAR(50)          NULL DEFAULT NULL,
   FUNCTION_AUTHOR      VARCHAR(50)          NULL DEFAULT NULL,
   OPTIONS              VARCHAR(1000)        NULL DEFAULT NULL,
   CREATE_BY            VARCHAR(64)          NULL DEFAULT '',
   CREATE_TIME          DATE                 NULL DEFAULT NULL,
   UPDATE_BY            VARCHAR(64)          NULL DEFAULT '',
   UPDATE_TIME          DATE                 NULL DEFAULT NULL,
   REMARK               VARCHAR(500)         NULL DEFAULT NULL,
   CONSTRAINT PK_GEN_TABLE PRIMARY KEY (TABLE_ID)
);

COMMENT ON TABLE GEN_TABLE IS
'代码生成业务表';

COMMENT ON COLUMN GEN_TABLE.TABLE_ID IS
'编号';

COMMENT ON COLUMN GEN_TABLE.TABLE_NAME IS
'表名称';

COMMENT ON COLUMN GEN_TABLE.TABLE_COMMENT IS
'表描述';

COMMENT ON COLUMN GEN_TABLE.CLASS_NAME IS
'实体类名称';

COMMENT ON COLUMN GEN_TABLE.TPL_CATEGORY IS
'使用的模板（CRUD单表操作 TREE树表操作）';

COMMENT ON COLUMN GEN_TABLE.PACKAGE_NAME IS
'生成包路径';

COMMENT ON COLUMN GEN_TABLE.MODULE_NAME IS
'生成模块名';

COMMENT ON COLUMN GEN_TABLE.BUSINESS_NAME IS
'生成业务名';

COMMENT ON COLUMN GEN_TABLE.FUNCTION_NAME IS
'生成功能名';

COMMENT ON COLUMN GEN_TABLE.FUNCTION_AUTHOR IS
'生成功能作者';

COMMENT ON COLUMN GEN_TABLE.OPTIONS IS
'其它生成选项';

COMMENT ON COLUMN GEN_TABLE.CREATE_BY IS
'创建者';

COMMENT ON COLUMN GEN_TABLE.CREATE_TIME IS
'创建时间';

COMMENT ON COLUMN GEN_TABLE.UPDATE_BY IS
'更新者';

COMMENT ON COLUMN GEN_TABLE.UPDATE_TIME IS
'更新时间';

COMMENT ON COLUMN GEN_TABLE.REMARK IS
'备注';

/*==============================================================*/
/* TABLE: GEN_TABLE_COLUMN                                      */
/*==============================================================*/
CREATE TABLE GEN_TABLE_COLUMN (
   COLUMN_ID            BIGSERIAL NOT NULL,
   TABLE_ID             VARCHAR(64)          NULL DEFAULT NULL,
   COLUMN_NAME          VARCHAR(200)         NULL DEFAULT NULL,
   COLUMN_COMMENT       VARCHAR(500)         NULL DEFAULT NULL,
   COLUMN_TYPE          VARCHAR(100)         NULL DEFAULT NULL,
   JAVA_TYPE            VARCHAR(500)         NULL DEFAULT NULL,
   JAVA_FIELD           VARCHAR(200)         NULL DEFAULT NULL,
   IS_PK                CHAR(1)              NULL DEFAULT NULL,
   IS_INCREMENT         CHAR(1)              NULL DEFAULT NULL,
   IS_REQUIRED          CHAR(1)              NULL DEFAULT NULL,
   IS_INSERT            CHAR(1)              NULL DEFAULT NULL,
   IS_EDIT              CHAR(1)              NULL DEFAULT NULL,
   IS_LIST              CHAR(1)              NULL DEFAULT NULL,
   IS_QUERY             CHAR(1)              NULL DEFAULT NULL,
   QUERY_TYPE           VARCHAR(200)         NULL DEFAULT 'EQ',
   HTML_TYPE            VARCHAR(200)         NULL DEFAULT NULL,
   DICT_TYPE            VARCHAR(200)         NULL DEFAULT '',
   SORT                 INT4                 NULL DEFAULT NULL,
   CREATE_BY            VARCHAR(64)          NULL DEFAULT '',
   CREATE_TIME          DATE                 NULL DEFAULT NULL,
   UPDATE_BY            VARCHAR(64)          NULL DEFAULT '',
   UPDATE_TIME          DATE                 NULL DEFAULT NULL,
   CONSTRAINT PK_GEN_TABLE_COLUMN PRIMARY KEY (COLUMN_ID)
);

COMMENT ON TABLE GEN_TABLE_COLUMN IS
'代码生成业务表字段';

COMMENT ON COLUMN GEN_TABLE_COLUMN.COLUMN_ID IS
'编号';

COMMENT ON COLUMN GEN_TABLE_COLUMN.TABLE_ID IS
'归属表编号';

COMMENT ON COLUMN GEN_TABLE_COLUMN.COLUMN_NAME IS
'列名称';

COMMENT ON COLUMN GEN_TABLE_COLUMN.COLUMN_COMMENT IS
'列描述';

COMMENT ON COLUMN GEN_TABLE_COLUMN.COLUMN_TYPE IS
'列类型';

COMMENT ON COLUMN GEN_TABLE_COLUMN.JAVA_TYPE IS
'JAVA类型';

COMMENT ON COLUMN GEN_TABLE_COLUMN.JAVA_FIELD IS
'JAVA字段名';

COMMENT ON COLUMN GEN_TABLE_COLUMN.IS_PK IS
'是否主键（1是）';

COMMENT ON COLUMN GEN_TABLE_COLUMN.IS_INCREMENT IS
'是否自增（1是）';

COMMENT ON COLUMN GEN_TABLE_COLUMN.IS_REQUIRED IS
'是否必填（1是）';

COMMENT ON COLUMN GEN_TABLE_COLUMN.IS_INSERT IS
'是否为插入字段（1是）';

COMMENT ON COLUMN GEN_TABLE_COLUMN.IS_EDIT IS
'是否编辑字段（1是）';

COMMENT ON COLUMN GEN_TABLE_COLUMN.IS_LIST IS
'是否列表字段（1是）';

COMMENT ON COLUMN GEN_TABLE_COLUMN.IS_QUERY IS
'是否查询字段（1是）';

COMMENT ON COLUMN GEN_TABLE_COLUMN.QUERY_TYPE IS
'查询方式（等于、不等于、大于、小于、范围）';

COMMENT ON COLUMN GEN_TABLE_COLUMN.HTML_TYPE IS
'显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）';

COMMENT ON COLUMN GEN_TABLE_COLUMN.DICT_TYPE IS
'字典类型';

COMMENT ON COLUMN GEN_TABLE_COLUMN.SORT IS
'排序';

COMMENT ON COLUMN GEN_TABLE_COLUMN.CREATE_BY IS
'创建者';

COMMENT ON COLUMN GEN_TABLE_COLUMN.CREATE_TIME IS
'创建时间';

COMMENT ON COLUMN GEN_TABLE_COLUMN.UPDATE_BY IS
'更新者';

COMMENT ON COLUMN GEN_TABLE_COLUMN.UPDATE_TIME IS
'更新时间';

/*==============================================================*/
/* TABLE: SYS_CONFIG                                            */
/*==============================================================*/
CREATE TABLE SYS_CONFIG (
   CONFIG_ID            BIGSERIAL NOT NULL,
   CONFIG_NAME          VARCHAR(100)         NULL DEFAULT '',
   CONFIG_KEY           VARCHAR(100)         NULL DEFAULT '',
   CONFIG_VALUE         VARCHAR(500)         NULL DEFAULT '',
   CONFIG_TYPE          CHAR(1)              NULL DEFAULT 'N',
   CREATE_BY            VARCHAR(64)          NULL DEFAULT '',
   CREATE_TIME          DATE                 NULL DEFAULT NULL,
   UPDATE_BY            VARCHAR(64)          NULL DEFAULT '',
   UPDATE_TIME          DATE                 NULL DEFAULT NULL,
   REMARK               VARCHAR(500)         NULL DEFAULT NULL,
   CONSTRAINT PK_SYS_CONFIG PRIMARY KEY (CONFIG_ID)
);

COMMENT ON TABLE SYS_CONFIG IS
'参数配置表';

COMMENT ON COLUMN SYS_CONFIG.CONFIG_ID IS
'参数主键';

COMMENT ON COLUMN SYS_CONFIG.CONFIG_NAME IS
'参数名称';

COMMENT ON COLUMN SYS_CONFIG.CONFIG_KEY IS
'参数键名';

COMMENT ON COLUMN SYS_CONFIG.CONFIG_VALUE IS
'参数键值';

COMMENT ON COLUMN SYS_CONFIG.CONFIG_TYPE IS
'系统内置（Y是 N否）';

COMMENT ON COLUMN SYS_CONFIG.CREATE_BY IS
'创建者';

COMMENT ON COLUMN SYS_CONFIG.CREATE_TIME IS
'创建时间';

COMMENT ON COLUMN SYS_CONFIG.UPDATE_BY IS
'更新者';

COMMENT ON COLUMN SYS_CONFIG.UPDATE_TIME IS
'更新时间';

COMMENT ON COLUMN SYS_CONFIG.REMARK IS
'备注';

/*==============================================================*/
/* TABLE: SYS_DEPT                                              */
/*==============================================================*/
CREATE TABLE SYS_DEPT (
   DEPT_ID              BIGSERIAL NOT NULL,
   PARENT_ID            INT8                 NULL DEFAULT 0,
   ANCESTORS            VARCHAR(50)          NULL DEFAULT '',
   DEPT_NAME            VARCHAR(30)          NULL DEFAULT '',
   ORDER_NUM            INT4                 NULL DEFAULT 0,
   LEADER               VARCHAR(20)          NULL DEFAULT NULL,
   PHONE                VARCHAR(11)          NULL DEFAULT NULL,
   EMAIL                VARCHAR(50)          NULL DEFAULT NULL,
   STATUS               CHAR(1)              NULL DEFAULT '0',
   DEL_FLAG             CHAR(1)              NULL DEFAULT '0',
   CREATE_BY            VARCHAR(64)          NULL DEFAULT '',
   CREATE_TIME          DATE                 NULL DEFAULT NULL,
   UPDATE_BY            VARCHAR(64)          NULL DEFAULT '',
   UPDATE_TIME          DATE                 NULL DEFAULT NULL,
   CONSTRAINT PK_SYS_DEPT PRIMARY KEY (DEPT_ID)
);

COMMENT ON TABLE SYS_DEPT IS
'部门表';

COMMENT ON COLUMN SYS_DEPT.DEPT_ID IS
'部门ID';

COMMENT ON COLUMN SYS_DEPT.PARENT_ID IS
'父部门ID';

COMMENT ON COLUMN SYS_DEPT.ANCESTORS IS
'祖级列表';

COMMENT ON COLUMN SYS_DEPT.DEPT_NAME IS
'部门名称';

COMMENT ON COLUMN SYS_DEPT.ORDER_NUM IS
'显示顺序';

COMMENT ON COLUMN SYS_DEPT.LEADER IS
'负责人';

COMMENT ON COLUMN SYS_DEPT.PHONE IS
'联系电话';

COMMENT ON COLUMN SYS_DEPT.EMAIL IS
'邮箱';

COMMENT ON COLUMN SYS_DEPT.STATUS IS
'部门状态（0正常 1停用）';

COMMENT ON COLUMN SYS_DEPT.DEL_FLAG IS
'删除标志（0代表存在 2代表删除）';

COMMENT ON COLUMN SYS_DEPT.CREATE_BY IS
'创建者';

COMMENT ON COLUMN SYS_DEPT.CREATE_TIME IS
'创建时间';

COMMENT ON COLUMN SYS_DEPT.UPDATE_BY IS
'更新者';

COMMENT ON COLUMN SYS_DEPT.UPDATE_TIME IS
'更新时间';

/*==============================================================*/
/* TABLE: SYS_DICT_DATA                                         */
/*==============================================================*/
CREATE TABLE SYS_DICT_DATA (
   DICT_CODE            BIGSERIAL NOT NULL,
   DICT_SORT            INT4                 NULL DEFAULT 0,
   DICT_LABEL           VARCHAR(100)         NULL DEFAULT '',
   DICT_VALUE           VARCHAR(100)         NULL DEFAULT '',
   DICT_TYPE            VARCHAR(100)         NULL DEFAULT '',
   CSS_CLASS            VARCHAR(100)         NULL DEFAULT NULL,
   LIST_CLASS           VARCHAR(100)         NULL DEFAULT NULL,
   IS_DEFAULT           CHAR(1)              NULL DEFAULT 'N',
   STATUS               CHAR(1)              NULL DEFAULT '0',
   CREATE_BY            VARCHAR(64)          NULL DEFAULT '',
   CREATE_TIME          DATE                 NULL DEFAULT NULL,
   UPDATE_BY            VARCHAR(64)          NULL DEFAULT '',
   UPDATE_TIME          DATE                 NULL DEFAULT NULL,
   REMARK               VARCHAR(500)         NULL DEFAULT NULL,
   CONSTRAINT PK_SYS_DICT_DATA PRIMARY KEY (DICT_CODE)
);

COMMENT ON TABLE SYS_DICT_DATA IS
'字典数据表';

COMMENT ON COLUMN SYS_DICT_DATA.DICT_CODE IS
'字典编码';

COMMENT ON COLUMN SYS_DICT_DATA.DICT_SORT IS
'字典排序';

COMMENT ON COLUMN SYS_DICT_DATA.DICT_LABEL IS
'字典标签';

COMMENT ON COLUMN SYS_DICT_DATA.DICT_VALUE IS
'字典键值';

COMMENT ON COLUMN SYS_DICT_DATA.DICT_TYPE IS
'字典类型';

COMMENT ON COLUMN SYS_DICT_DATA.CSS_CLASS IS
'样式属性（其他样式扩展）';

COMMENT ON COLUMN SYS_DICT_DATA.LIST_CLASS IS
'表格回显样式';

COMMENT ON COLUMN SYS_DICT_DATA.IS_DEFAULT IS
'是否默认（Y是 N否）';

COMMENT ON COLUMN SYS_DICT_DATA.STATUS IS
'状态（0正常 1停用）';

COMMENT ON COLUMN SYS_DICT_DATA.CREATE_BY IS
'创建者';

COMMENT ON COLUMN SYS_DICT_DATA.CREATE_TIME IS
'创建时间';

COMMENT ON COLUMN SYS_DICT_DATA.UPDATE_BY IS
'更新者';

COMMENT ON COLUMN SYS_DICT_DATA.UPDATE_TIME IS
'更新时间';

COMMENT ON COLUMN SYS_DICT_DATA.REMARK IS
'备注';

/*==============================================================*/
/* TABLE: SYS_DICT_TYPE                                         */
/*==============================================================*/
CREATE TABLE SYS_DICT_TYPE (
   DICT_ID              BIGSERIAL NOT NULL,
   DICT_NAME            VARCHAR(100)         NULL DEFAULT '',
   DICT_TYPE            VARCHAR(100)         NULL DEFAULT '',
   STATUS               CHAR(1)              NULL DEFAULT '0',
   CREATE_BY            VARCHAR(64)          NULL DEFAULT '',
   CREATE_TIME          DATE                 NULL DEFAULT NULL,
   UPDATE_BY            VARCHAR(64)          NULL DEFAULT '',
   UPDATE_TIME          DATE                 NULL DEFAULT NULL,
   REMARK               VARCHAR(500)         NULL DEFAULT NULL,
   CONSTRAINT PK_SYS_DICT_TYPE PRIMARY KEY (DICT_ID),
   CONSTRAINT DICT_TYPE UNIQUE (DICT_TYPE)
);

COMMENT ON TABLE SYS_DICT_TYPE IS
'字典类型表';

COMMENT ON COLUMN SYS_DICT_TYPE.DICT_ID IS
'字典主键';

COMMENT ON COLUMN SYS_DICT_TYPE.DICT_NAME IS
'字典名称';

COMMENT ON COLUMN SYS_DICT_TYPE.DICT_TYPE IS
'字典类型';

COMMENT ON COLUMN SYS_DICT_TYPE.STATUS IS
'状态（0正常 1停用）';

COMMENT ON COLUMN SYS_DICT_TYPE.CREATE_BY IS
'创建者';

COMMENT ON COLUMN SYS_DICT_TYPE.CREATE_TIME IS
'创建时间';

COMMENT ON COLUMN SYS_DICT_TYPE.UPDATE_BY IS
'更新者';

COMMENT ON COLUMN SYS_DICT_TYPE.UPDATE_TIME IS
'更新时间';

COMMENT ON COLUMN SYS_DICT_TYPE.REMARK IS
'备注';

/*==============================================================*/
/* TABLE: SYS_JOB                                               */
/*==============================================================*/
CREATE TABLE SYS_JOB (
   JOB_ID               BIGSERIAL NOT NULL,
   JOB_NAME             VARCHAR(64)          NOT NULL DEFAULT '',
   JOB_GROUP            VARCHAR(64)          NOT NULL DEFAULT 'DEFAULT',
   INVOKE_TARGET        VARCHAR(500)         NOT NULL,
   CRON_EXPRESSION      VARCHAR(255)         NULL DEFAULT '',
   MISFIRE_POLICY       VARCHAR(20)          NULL DEFAULT '3',
   CONCURRENT           CHAR(1)              NULL DEFAULT '1',
   STATUS               CHAR(1)              NULL DEFAULT '0',
   CREATE_BY            VARCHAR(64)          NULL DEFAULT '',
   CREATE_TIME          DATE                 NULL DEFAULT NULL,
   UPDATE_BY            VARCHAR(64)          NULL DEFAULT '',
   UPDATE_TIME          DATE                 NULL DEFAULT NULL,
   REMARK               VARCHAR(500)         NULL DEFAULT '',
   CONSTRAINT PK_SYS_JOB PRIMARY KEY (JOB_ID, JOB_NAME, JOB_GROUP)
);

COMMENT ON TABLE SYS_JOB IS
'定时任务调度表';

COMMENT ON COLUMN SYS_JOB.JOB_ID IS
'任务ID';

COMMENT ON COLUMN SYS_JOB.JOB_NAME IS
'任务名称';

COMMENT ON COLUMN SYS_JOB.JOB_GROUP IS
'任务组名';

COMMENT ON COLUMN SYS_JOB.INVOKE_TARGET IS
'调用目标字符串';

COMMENT ON COLUMN SYS_JOB.CRON_EXPRESSION IS
'CRON执行表达式';

COMMENT ON COLUMN SYS_JOB.MISFIRE_POLICY IS
'计划执行错误策略（1立即执行 2执行一次 3放弃执行）';

COMMENT ON COLUMN SYS_JOB.CONCURRENT IS
'是否并发执行（0允许 1禁止）';

COMMENT ON COLUMN SYS_JOB.STATUS IS
'状态（0正常 1暂停）';

COMMENT ON COLUMN SYS_JOB.CREATE_BY IS
'创建者';

COMMENT ON COLUMN SYS_JOB.CREATE_TIME IS
'创建时间';

COMMENT ON COLUMN SYS_JOB.UPDATE_BY IS
'更新者';

COMMENT ON COLUMN SYS_JOB.UPDATE_TIME IS
'更新时间';

COMMENT ON COLUMN SYS_JOB.REMARK IS
'备注信息';

/*==============================================================*/
/* TABLE: SYS_JOB_LOG                                           */
/*==============================================================*/
CREATE TABLE SYS_JOB_LOG (
   JOB_LOG_ID           BIGSERIAL NOT NULL,
   JOB_NAME             VARCHAR(64)          NOT NULL,
   JOB_GROUP            VARCHAR(64)          NOT NULL,
   INVOKE_TARGET        VARCHAR(500)         NOT NULL,
   JOB_MESSAGE          VARCHAR(500)         NULL DEFAULT NULL,
   STATUS               CHAR(1)              NULL DEFAULT '0',
   EXCEPTION_INFO       VARCHAR(2000)        NULL DEFAULT '',
   CREATE_TIME          DATE                 NULL DEFAULT NULL,
   CONSTRAINT PK_SYS_JOB_LOG PRIMARY KEY (JOB_LOG_ID)
);

COMMENT ON TABLE SYS_JOB_LOG IS
'定时任务调度日志表';

COMMENT ON COLUMN SYS_JOB_LOG.JOB_LOG_ID IS
'任务日志ID';

COMMENT ON COLUMN SYS_JOB_LOG.JOB_NAME IS
'任务名称';

COMMENT ON COLUMN SYS_JOB_LOG.JOB_GROUP IS
'任务组名';

COMMENT ON COLUMN SYS_JOB_LOG.INVOKE_TARGET IS
'调用目标字符串';

COMMENT ON COLUMN SYS_JOB_LOG.JOB_MESSAGE IS
'日志信息';

COMMENT ON COLUMN SYS_JOB_LOG.STATUS IS
'执行状态（0正常 1失败）';

COMMENT ON COLUMN SYS_JOB_LOG.EXCEPTION_INFO IS
'异常信息';

COMMENT ON COLUMN SYS_JOB_LOG.CREATE_TIME IS
'创建时间';

/*==============================================================*/
/* TABLE: SYS_LOGININFOR                                        */
/*==============================================================*/
CREATE TABLE SYS_LOGININFOR (
   INFO_ID              BIGSERIAL NOT NULL,
   USER_NAME            VARCHAR(50)          NULL DEFAULT '',
   IPADDR               VARCHAR(50)          NULL DEFAULT '',
   LOGIN_LOCATION       VARCHAR(255)         NULL DEFAULT '',
   BROWSER              VARCHAR(50)          NULL DEFAULT '',
   OS                   VARCHAR(50)          NULL DEFAULT '',
   STATUS               CHAR(1)              NULL DEFAULT '0',
   MSG                  VARCHAR(255)         NULL DEFAULT '',
   LOGIN_TIME           DATE                 NULL DEFAULT NULL,
   CONSTRAINT PK_SYS_LOGININFOR PRIMARY KEY (INFO_ID)
);

COMMENT ON TABLE SYS_LOGININFOR IS
'系统访问记录';

COMMENT ON COLUMN SYS_LOGININFOR.INFO_ID IS
'访问ID';

COMMENT ON COLUMN SYS_LOGININFOR.USER_NAME IS
'用户账号';

COMMENT ON COLUMN SYS_LOGININFOR.IPADDR IS
'登录IP地址';

COMMENT ON COLUMN SYS_LOGININFOR.LOGIN_LOCATION IS
'登录地点';

COMMENT ON COLUMN SYS_LOGININFOR.BROWSER IS
'浏览器类型';

COMMENT ON COLUMN SYS_LOGININFOR.OS IS
'操作系统';

COMMENT ON COLUMN SYS_LOGININFOR.STATUS IS
'登录状态（0成功 1失败）';

COMMENT ON COLUMN SYS_LOGININFOR.MSG IS
'提示消息';

COMMENT ON COLUMN SYS_LOGININFOR.LOGIN_TIME IS
'访问时间';

/*==============================================================*/
/* TABLE: SYS_MENU                                              */
/*==============================================================*/
CREATE TABLE SYS_MENU (
   MENU_ID              BIGSERIAL NOT NULL,
   MENU_NAME            VARCHAR(50)          NOT NULL,
   PARENT_ID            INT8                 NULL DEFAULT 0,
   ORDER_NUM            INT4                 NULL DEFAULT 0,
   PATH                 VARCHAR(200)         NULL DEFAULT '',
   COMPONENT            VARCHAR(255)         NULL DEFAULT NULL,
   IS_FRAME             INT4                 NULL DEFAULT 1,
   MENU_TYPE            CHAR(1)              NULL DEFAULT '',
   VISIBLE              CHAR(1)              NULL DEFAULT '0',
   STATUS               CHAR(1)              NULL DEFAULT '0',
   PERMS                VARCHAR(100)         NULL DEFAULT NULL,
   ICON                 VARCHAR(100)         NULL DEFAULT '#',
   CREATE_BY            VARCHAR(64)          NULL DEFAULT '',
   CREATE_TIME          DATE                 NULL DEFAULT NULL,
   UPDATE_BY            VARCHAR(64)          NULL DEFAULT '',
   UPDATE_TIME          DATE                 NULL DEFAULT NULL,
   REMARK               VARCHAR(500)         NULL DEFAULT '',
   CONSTRAINT PK_SYS_MENU PRIMARY KEY (MENU_ID)
);

COMMENT ON TABLE SYS_MENU IS
'菜单权限表';

COMMENT ON COLUMN SYS_MENU.MENU_ID IS
'菜单ID';

COMMENT ON COLUMN SYS_MENU.MENU_NAME IS
'菜单名称';

COMMENT ON COLUMN SYS_MENU.PARENT_ID IS
'父菜单ID';

COMMENT ON COLUMN SYS_MENU.ORDER_NUM IS
'显示顺序';

COMMENT ON COLUMN SYS_MENU.PATH IS
'路由地址';

COMMENT ON COLUMN SYS_MENU.COMPONENT IS
'组件路径';

COMMENT ON COLUMN SYS_MENU.IS_FRAME IS
'是否为外链（0是 1否）';

COMMENT ON COLUMN SYS_MENU.MENU_TYPE IS
'菜单类型（M目录 C菜单 F按钮）';

COMMENT ON COLUMN SYS_MENU.VISIBLE IS
'菜单状态（0显示 1隐藏）';

COMMENT ON COLUMN SYS_MENU.STATUS IS
'菜单状态（0正常 1停用）';

COMMENT ON COLUMN SYS_MENU.PERMS IS
'权限标识';

COMMENT ON COLUMN SYS_MENU.ICON IS
'菜单图标';

COMMENT ON COLUMN SYS_MENU.CREATE_BY IS
'创建者';

COMMENT ON COLUMN SYS_MENU.CREATE_TIME IS
'创建时间';

COMMENT ON COLUMN SYS_MENU.UPDATE_BY IS
'更新者';

COMMENT ON COLUMN SYS_MENU.UPDATE_TIME IS
'更新时间';

COMMENT ON COLUMN SYS_MENU.REMARK IS
'备注';

/*==============================================================*/
/* TABLE: SYS_NOTICE                                            */
/*==============================================================*/
CREATE TABLE SYS_NOTICE (
   NOTICE_ID            BIGSERIAL NOT NULL,
   NOTICE_TITLE         VARCHAR(50)          NOT NULL,
   NOTICE_TYPE          CHAR(1)              NOT NULL,
   NOTICE_CONTENT       VARCHAR(2000)        NULL DEFAULT NULL,
   STATUS               CHAR(1)              NULL DEFAULT '0',
   CREATE_BY            VARCHAR(64)          NULL DEFAULT '',
   CREATE_TIME          DATE                 NULL DEFAULT NULL,
   UPDATE_BY            VARCHAR(64)          NULL DEFAULT '',
   UPDATE_TIME          DATE                 NULL DEFAULT NULL,
   REMARK               VARCHAR(255)         NULL DEFAULT NULL,
   CONSTRAINT PK_SYS_NOTICE PRIMARY KEY (NOTICE_ID)
);

COMMENT ON TABLE SYS_NOTICE IS
'通知公告表';

COMMENT ON COLUMN SYS_NOTICE.NOTICE_ID IS
'公告ID';

COMMENT ON COLUMN SYS_NOTICE.NOTICE_TITLE IS
'公告标题';

COMMENT ON COLUMN SYS_NOTICE.NOTICE_TYPE IS
'公告类型（1通知 2公告）';

COMMENT ON COLUMN SYS_NOTICE.NOTICE_CONTENT IS
'公告内容';

COMMENT ON COLUMN SYS_NOTICE.STATUS IS
'公告状态（0正常 1关闭）';

COMMENT ON COLUMN SYS_NOTICE.CREATE_BY IS
'创建者';

COMMENT ON COLUMN SYS_NOTICE.CREATE_TIME IS
'创建时间';

COMMENT ON COLUMN SYS_NOTICE.UPDATE_BY IS
'更新者';

COMMENT ON COLUMN SYS_NOTICE.UPDATE_TIME IS
'更新时间';

COMMENT ON COLUMN SYS_NOTICE.REMARK IS
'备注';

/*==============================================================*/
/* TABLE: SYS_OPER_LOG                                          */
/*==============================================================*/
CREATE TABLE SYS_OPER_LOG (
   OPER_ID              BIGSERIAL NOT NULL,
   TITLE                VARCHAR(50)          NULL DEFAULT '',
   BUSINESS_TYPE        INT4                 NULL DEFAULT 0,
   METHOD               VARCHAR(100)         NULL DEFAULT '',
   REQUEST_METHOD       VARCHAR(10)          NULL DEFAULT '',
   OPERATOR_TYPE        INT4                 NULL DEFAULT 0,
   OPER_NAME            VARCHAR(50)          NULL DEFAULT '',
   DEPT_NAME            VARCHAR(50)          NULL DEFAULT '',
   OPER_URL             VARCHAR(255)         NULL DEFAULT '',
   OPER_IP              VARCHAR(50)          NULL DEFAULT '',
   OPER_LOCATION        VARCHAR(255)         NULL DEFAULT '',
   OPER_PARAM           VARCHAR(2000)        NULL DEFAULT '',
   JSON_RESULT          VARCHAR(2000)        NULL DEFAULT '',
   STATUS               INT4                 NULL DEFAULT 0,
   ERROR_MSG            VARCHAR(2000)        NULL DEFAULT '',
   OPER_TIME            DATE                 NULL DEFAULT NULL,
   CONSTRAINT PK_SYS_OPER_LOG PRIMARY KEY (OPER_ID)
);

COMMENT ON TABLE SYS_OPER_LOG IS
'操作日志记录';

COMMENT ON COLUMN SYS_OPER_LOG.OPER_ID IS
'日志主键';

COMMENT ON COLUMN SYS_OPER_LOG.TITLE IS
'模块标题';

COMMENT ON COLUMN SYS_OPER_LOG.BUSINESS_TYPE IS
'业务类型（0其它 1新增 2修改 3删除）';

COMMENT ON COLUMN SYS_OPER_LOG.METHOD IS
'方法名称';

COMMENT ON COLUMN SYS_OPER_LOG.REQUEST_METHOD IS
'请求方式';

COMMENT ON COLUMN SYS_OPER_LOG.OPERATOR_TYPE IS
'操作类别（0其它 1后台用户 2手机端用户）';

COMMENT ON COLUMN SYS_OPER_LOG.OPER_NAME IS
'操作人员';

COMMENT ON COLUMN SYS_OPER_LOG.DEPT_NAME IS
'部门名称';

COMMENT ON COLUMN SYS_OPER_LOG.OPER_URL IS
'请求URL';

COMMENT ON COLUMN SYS_OPER_LOG.OPER_IP IS
'主机地址';

COMMENT ON COLUMN SYS_OPER_LOG.OPER_LOCATION IS
'操作地点';

COMMENT ON COLUMN SYS_OPER_LOG.OPER_PARAM IS
'请求参数';

COMMENT ON COLUMN SYS_OPER_LOG.JSON_RESULT IS
'返回参数';

COMMENT ON COLUMN SYS_OPER_LOG.STATUS IS
'操作状态（0正常 1异常）';

COMMENT ON COLUMN SYS_OPER_LOG.ERROR_MSG IS
'错误消息';

COMMENT ON COLUMN SYS_OPER_LOG.OPER_TIME IS
'操作时间';

/*==============================================================*/
/* TABLE: SYS_POST                                              */
/*==============================================================*/
CREATE TABLE SYS_POST (
   POST_ID              BIGSERIAL NOT NULL,
   POST_CODE            VARCHAR(64)          NOT NULL,
   POST_NAME            VARCHAR(50)          NOT NULL,
   POST_SORT            INT4                 NOT NULL,
   STATUS               CHAR(1)              NOT NULL,
   CREATE_BY            VARCHAR(64)          NULL DEFAULT '',
   CREATE_TIME          DATE                 NULL DEFAULT NULL,
   UPDATE_BY            VARCHAR(64)          NULL DEFAULT '',
   UPDATE_TIME          DATE                 NULL DEFAULT NULL,
   REMARK               VARCHAR(500)         NULL DEFAULT NULL,
   CONSTRAINT PK_SYS_POST PRIMARY KEY (POST_ID)
);

COMMENT ON TABLE SYS_POST IS
'岗位信息表';

COMMENT ON COLUMN SYS_POST.POST_ID IS
'岗位ID';

COMMENT ON COLUMN SYS_POST.POST_CODE IS
'岗位编码';

COMMENT ON COLUMN SYS_POST.POST_NAME IS
'岗位名称';

COMMENT ON COLUMN SYS_POST.POST_SORT IS
'显示顺序';

COMMENT ON COLUMN SYS_POST.STATUS IS
'状态（0正常 1停用）';

COMMENT ON COLUMN SYS_POST.CREATE_BY IS
'创建者';

COMMENT ON COLUMN SYS_POST.CREATE_TIME IS
'创建时间';

COMMENT ON COLUMN SYS_POST.UPDATE_BY IS
'更新者';

COMMENT ON COLUMN SYS_POST.UPDATE_TIME IS
'更新时间';

COMMENT ON COLUMN SYS_POST.REMARK IS
'备注';

/*==============================================================*/
/* TABLE: SYS_ROLE                                              */
/*==============================================================*/
CREATE TABLE SYS_ROLE (
   ROLE_ID              BIGSERIAL NOT NULL,
   ROLE_NAME            VARCHAR(30)          NOT NULL,
   ROLE_KEY             VARCHAR(100)         NOT NULL,
   ROLE_SORT            INT4                 NOT NULL,
   DATA_SCOPE           CHAR(1)              NULL DEFAULT '1',
   STATUS               CHAR(1)              NOT NULL,
   DEL_FLAG             CHAR(1)              NULL DEFAULT '0',
   CREATE_BY            VARCHAR(64)          NULL DEFAULT '',
   CREATE_TIME          DATE                 NULL DEFAULT NULL,
   UPDATE_BY            VARCHAR(64)          NULL DEFAULT '',
   UPDATE_TIME          DATE                 NULL DEFAULT NULL,
   REMARK               VARCHAR(500)         NULL DEFAULT NULL,
   CONSTRAINT PK_SYS_ROLE PRIMARY KEY (ROLE_ID)
);

COMMENT ON TABLE SYS_ROLE IS
'角色信息表';

COMMENT ON COLUMN SYS_ROLE.ROLE_ID IS
'角色ID';

COMMENT ON COLUMN SYS_ROLE.ROLE_NAME IS
'角色名称';

COMMENT ON COLUMN SYS_ROLE.ROLE_KEY IS
'角色权限字符串';

COMMENT ON COLUMN SYS_ROLE.ROLE_SORT IS
'显示顺序';

COMMENT ON COLUMN SYS_ROLE.DATA_SCOPE IS
'数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）';

COMMENT ON COLUMN SYS_ROLE.STATUS IS
'角色状态（0正常 1停用）';

COMMENT ON COLUMN SYS_ROLE.DEL_FLAG IS
'删除标志（0代表存在 2代表删除）';

COMMENT ON COLUMN SYS_ROLE.CREATE_BY IS
'创建者';

COMMENT ON COLUMN SYS_ROLE.CREATE_TIME IS
'创建时间';

COMMENT ON COLUMN SYS_ROLE.UPDATE_BY IS
'更新者';

COMMENT ON COLUMN SYS_ROLE.UPDATE_TIME IS
'更新时间';

COMMENT ON COLUMN SYS_ROLE.REMARK IS
'备注';

/*==============================================================*/
/* TABLE: SYS_ROLE_DEPT                                         */
/*==============================================================*/
CREATE TABLE SYS_ROLE_DEPT (
   ROLE_ID              INT8                 NOT NULL,
   DEPT_ID              INT8                 NOT NULL,
   CONSTRAINT PK_SYS_ROLE_DEPT PRIMARY KEY (ROLE_ID, DEPT_ID)
);

COMMENT ON TABLE SYS_ROLE_DEPT IS
'角色和部门关联表';

COMMENT ON COLUMN SYS_ROLE_DEPT.ROLE_ID IS
'角色ID';

COMMENT ON COLUMN SYS_ROLE_DEPT.DEPT_ID IS
'部门ID';

/*==============================================================*/
/* TABLE: SYS_ROLE_MENU                                         */
/*==============================================================*/
CREATE TABLE SYS_ROLE_MENU (
   ROLE_ID              INT8                 NOT NULL,
   MENU_ID              INT8                 NOT NULL,
   CONSTRAINT PK_SYS_ROLE_MENU PRIMARY KEY (ROLE_ID, MENU_ID)
);

COMMENT ON TABLE SYS_ROLE_MENU IS
'角色和菜单关联表';

COMMENT ON COLUMN SYS_ROLE_MENU.ROLE_ID IS
'角色ID';

COMMENT ON COLUMN SYS_ROLE_MENU.MENU_ID IS
'菜单ID';

/*==============================================================*/
/* TABLE: SYS_USER                                              */
/*==============================================================*/
CREATE TABLE SYS_USER (
   USER_ID              BIGSERIAL NOT NULL,
   DEPT_ID              INT8                 NULL DEFAULT NULL,
   USER_NAME            VARCHAR(30)          NOT NULL,
   NICK_NAME            VARCHAR(30)          NOT NULL,
   USER_TYPE            VARCHAR(2)           NULL DEFAULT '00',
   EMAIL                VARCHAR(50)          NULL DEFAULT '',
   PHONENUMBER          VARCHAR(11)          NULL DEFAULT '',
   SEX                  CHAR(1)              NULL DEFAULT '0',
   AVATAR               VARCHAR(100)         NULL DEFAULT '',
   PASSWORD             VARCHAR(100)         NULL DEFAULT '',
   STATUS               CHAR(1)              NULL DEFAULT '0',
   DEL_FLAG             CHAR(1)              NULL DEFAULT '0',
   LOGIN_IP             VARCHAR(50)          NULL DEFAULT '',
   LOGIN_DATE           DATE                 NULL DEFAULT NULL,
   CREATE_BY            VARCHAR(64)          NULL DEFAULT '',
   CREATE_TIME          DATE                 NULL DEFAULT NULL,
   UPDATE_BY            VARCHAR(64)          NULL DEFAULT '',
   UPDATE_TIME          DATE                 NULL DEFAULT NULL,
   REMARK               VARCHAR(500)         NULL DEFAULT NULL,
   CONSTRAINT PK_SYS_USER PRIMARY KEY (USER_ID)
);

COMMENT ON TABLE SYS_USER IS
'用户信息表';

COMMENT ON COLUMN SYS_USER.USER_ID IS
'用户ID';

COMMENT ON COLUMN SYS_USER.DEPT_ID IS
'部门ID';

COMMENT ON COLUMN SYS_USER.USER_NAME IS
'用户账号';

COMMENT ON COLUMN SYS_USER.NICK_NAME IS
'用户昵称';

COMMENT ON COLUMN SYS_USER.USER_TYPE IS
'用户类型（00系统用户）';

COMMENT ON COLUMN SYS_USER.EMAIL IS
'用户邮箱';

COMMENT ON COLUMN SYS_USER.PHONENUMBER IS
'手机号码';

COMMENT ON COLUMN SYS_USER.SEX IS
'用户性别（0男 1女 2未知）';

COMMENT ON COLUMN SYS_USER.AVATAR IS
'头像地址';

COMMENT ON COLUMN SYS_USER.PASSWORD IS
'密码';

COMMENT ON COLUMN SYS_USER.STATUS IS
'帐号状态（0正常 1停用）';

COMMENT ON COLUMN SYS_USER.DEL_FLAG IS
'删除标志（0代表存在 2代表删除）';

COMMENT ON COLUMN SYS_USER.LOGIN_IP IS
'最后登陆IP';

COMMENT ON COLUMN SYS_USER.LOGIN_DATE IS
'最后登陆时间';

COMMENT ON COLUMN SYS_USER.CREATE_BY IS
'创建者';

COMMENT ON COLUMN SYS_USER.CREATE_TIME IS
'创建时间';

COMMENT ON COLUMN SYS_USER.UPDATE_BY IS
'更新者';

COMMENT ON COLUMN SYS_USER.UPDATE_TIME IS
'更新时间';

COMMENT ON COLUMN SYS_USER.REMARK IS
'备注';

/*==============================================================*/
/* TABLE: SYS_USER_POST                                         */
/*==============================================================*/
CREATE TABLE SYS_USER_POST (
   USER_ID              INT8                 NOT NULL,
   POST_ID              INT8                 NOT NULL,
   CONSTRAINT PK_SYS_USER_POST PRIMARY KEY (USER_ID, POST_ID)
);

COMMENT ON TABLE SYS_USER_POST IS
'用户与岗位关联表';

COMMENT ON COLUMN SYS_USER_POST.USER_ID IS
'用户ID';

COMMENT ON COLUMN SYS_USER_POST.POST_ID IS
'岗位ID';

/*==============================================================*/
/* TABLE: SYS_USER_ROLE                                         */
/*==============================================================*/
CREATE TABLE SYS_USER_ROLE (
   USER_ID              INT8                 NOT NULL,
   ROLE_ID              INT8                 NOT NULL,
   CONSTRAINT PK_SYS_USER_ROLE PRIMARY KEY (USER_ID, ROLE_ID)
);

COMMENT ON TABLE SYS_USER_ROLE IS
'用户和角色关联表';

COMMENT ON COLUMN SYS_USER_ROLE.USER_ID IS
'用户ID';

COMMENT ON COLUMN SYS_USER_ROLE.ROLE_ID IS
'角色ID';

CREATE OR REPLACE VIEW LIST_TABLE(TABLE_NAME, TABLE_COMMENT, CREATE_TIME, UPDATE_TIME) AS
SELECT C.RELNAME AS TABLE_NAME,
       OBJ_DESCRIPTION(C.OID) AS TABLE_COMMENT,
       CURRENT_TIMESTAMP AS CREATE_TIME,
       CURRENT_TIMESTAMP AS UPDATE_TIME
FROM PG_CLASS C
         LEFT JOIN PG_NAMESPACE N ON N.OID = C.RELNAMESPACE
WHERE C.RELKIND = ANY (ARRAY ['r'::"char", 'p'::"char"])
  AND C.RELNAME NOT LIKE 'spatial_%'
  AND N.NSPNAME = 'public'
  AND N.NSPNAME <> '';

CREATE OR REPLACE VIEW LIST_COLUMN(TABLE_NAME, COLUMN_NAME, COLUMN_COMMENT, IS_REQUIRE, IS_PK, SORT, IS_INCREMENT, COLUMN_TYPE) AS
SELECT
    C.RELNAME AS TABLE_NAME, A.ATTNAME AS COLUMN_NAME, D.DESCRIPTION AS COLUMN_COMMENT,
    (CASE WHEN A.ATTNOTNULL AND CON.CONNAME IS NULL THEN 1 ELSE 0 END) AS IS_REQUIRE,
    (CASE WHEN CON.CONNAME IS NOT NULL THEN 1 ELSE 0 END ) AS IS_PK,
    A.ATTNUM AS SORT,
    (CASE WHEN POSITION(C.RELNAME ||'_'|| A.ATTNAME||'_seq' IN PG_GET_EXPR(AD.ADBIN, AD.ADRELID)) > 0 THEN 1 ELSE 0 END) AS IS_INCREMENT,
    TRIM(BOTH '"' FROM (CASE
                            WHEN T.TYPELEM <> 0 AND T.TYPLEN = -1 THEN 'ARRAY'
                            ELSE
                                CASE
                                    WHEN T.TYPTYPE = 'd' THEN FORMAT_TYPE(T.TYPBASETYPE, NULL)
                                    ELSE FORMAT_TYPE(A.ATTTYPID, NULL)
                                    END
        END)) AS COLUMN_TYPE
FROM PG_ATTRIBUTE A
         JOIN ( PG_CLASS C JOIN PG_NAMESPACE N ON C.RELNAMESPACE = N.OID ) ON A.ATTRELID = C.OID
         LEFT JOIN PG_DESCRIPTION D ON D.OBJOID = C.OID AND A.ATTNUM = D.OBJSUBID
         LEFT JOIN PG_CONSTRAINT CON ON CON.CONRELID = C.OID AND A.ATTNUM = ANY(CON.CONKEY)
         LEFT JOIN PG_ATTRDEF AD ON A.ATTRELID = AD.ADRELID AND A.ATTNUM = AD.ADNUM
         LEFT JOIN PG_TYPE T ON A.ATTTYPID = T.OID
WHERE C.RELKIND = ANY (ARRAY ['r'::"char", 'p'::"char"])
  AND A.ATTNUM > 0
  AND N.NSPNAME = 'public'
ORDER BY C.RELNAME, A.ATTNUM;

CREATE OR REPLACE FUNCTION FIND_IN_SET(BIGINT,VARCHAR)
RETURNS BOOLEAN
AS $BODY$
DECLARE
  STR ALIAS FOR $1;
  STRS ALIAS FOR $2;
  POS INTEGER;
  STATUS BOOLEAN;
BEGIN
	SELECT POSITION( ','||STR||',' IN ','||STRS||',') INTO POS;
	IF POS >= 0 THEN
	  STATUS = TRUE;
	ELSE
	  STATUS = FALSE;
	END IF;
	RETURN STATUS; 
END;
$BODY$ LANGUAGE PLPGSQL;


insert into sys_dept values(100,  0,   '0',          '若依科技',   0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
insert into sys_dept values(101,  100, '0,100',      '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
insert into sys_dept values(102,  100, '0,100',      '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
insert into sys_dept values(103,  101, '0,100,101',  '研发部门',   1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
insert into sys_dept values(104,  101, '0,100,101',  '市场部门',   2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
insert into sys_dept values(105,  101, '0,100,101',  '测试部门',   3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
insert into sys_dept values(106,  101, '0,100,101',  '财务部门',   4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
insert into sys_dept values(107,  101, '0,100,101',  '运维部门',   5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
insert into sys_dept values(108,  102, '0,100,102',  '市场部门',   1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
insert into sys_dept values(109,  102, '0,100,102',  '财务部门',   2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

ALTER SEQUENCE IF EXISTS sys_dept_DEPT_ID_SEQ RESTART WITH 110;

insert into sys_user values(1,  103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
insert into sys_user values(2,  105, 'ry',    '若依', '00', 'ry@qq.com',  '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员');

ALTER SEQUENCE IF EXISTS sys_user_USER_ID_SEQ RESTART WITH 3;

insert into sys_post values(1, 'ceo',  '董事长',    1, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_post values(2, 'se',   '项目经理',  2, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_post values(3, 'hr',   '人力资源',  3, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_post values(4, 'user', '普通员工',  4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

ALTER SEQUENCE IF EXISTS sys_post_POST_ID_SEQ RESTART WITH 5;

insert into sys_role values('1', '管理员',   'admin',  1, 1, '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
insert into sys_role values('2', '普通角色', 'common', 2, 2, '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');

ALTER SEQUENCE IF EXISTS sys_role_role_id_SEQ RESTART WITH 5;

insert into sys_menu values('1', '系统管理', '0', '1', 'system',           null,   1, 'M', '0', '0', '', 'system',   'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
insert into sys_menu values('2', '系统监控', '0', '2', 'monitor',          null,   1, 'M', '0', '0', '', 'monitor',  'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
insert into sys_menu values('3', '系统工具', '0', '3', 'tool',             null,   1, 'M', '0', '0', '', 'tool',     'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
insert into sys_menu values('4', '若依官网', '0', '4', 'http://ruoyi.vip', null ,  0, 'M', '0', '0', '', 'guide',    'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '若依官网地址');
-- 二级菜单
insert into sys_menu values('100',  '用户管理', '1',   '1', 'user',       'system/user/index',        1, 'C', '0', '0', 'system:user:list',        'user',          'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
insert into sys_menu values('101',  '角色管理', '1',   '2', 'role',       'system/role/index',        1, 'C', '0', '0', 'system:role:list',        'peoples',       'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
insert into sys_menu values('102',  '菜单管理', '1',   '3', 'menu',       'system/menu/index',        1, 'C', '0', '0', 'system:menu:list',        'tree-table',    'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
insert into sys_menu values('103',  '部门管理', '1',   '4', 'dept',       'system/dept/index',        1, 'C', '0', '0', 'system:dept:list',        'tree',          'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
insert into sys_menu values('104',  '岗位管理', '1',   '5', 'post',       'system/post/index',        1, 'C', '0', '0', 'system:post:list',        'post',          'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
insert into sys_menu values('105',  '字典管理', '1',   '6', 'dict',       'system/dict/index',        1, 'C', '0', '0', 'system:dict:list',        'dict',          'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
insert into sys_menu values('106',  '参数设置', '1',   '7', 'config',     'system/config/index',      1, 'C', '0', '0', 'system:config:list',      'edit',          'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
insert into sys_menu values('107',  '通知公告', '1',   '8', 'notice',     'system/notice/index',      1, 'C', '0', '0', 'system:notice:list',      'message',       'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
insert into sys_menu values('108',  '日志管理', '1',   '9', 'log',        'system/log/index',         1, 'M', '0', '0', '',                        'log',           'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
insert into sys_menu values('109',  '在线用户', '2',   '1', 'online',     'monitor/online/index',     1, 'C', '0', '0', 'monitor:online:list',     'online',        'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
insert into sys_menu values('110',  '定时任务', '2',   '2', 'job',        'monitor/job/index',        1, 'C', '0', '0', 'monitor:job:list',        'job',           'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
insert into sys_menu values('111',  '数据监控', '2',   '3', 'druid',      'monitor/druid/index',      1, 'C', '0', '0', 'monitor:druid:list',      'druid',         'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
insert into sys_menu values('112',  '服务监控', '2',   '4', 'server',     'monitor/server/index',     1, 'C', '0', '0', 'monitor:server:list',     'server',        'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
insert into sys_menu values('113',  '表单构建', '3',   '1', 'build',      'tool/build/index',         1 ,'C', '0', '0', 'tool:build:list',         'build',         'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
insert into sys_menu values('114',  '代码生成', '3',   '2', 'gen',        'tool/gen/index',           1, 'C', '0', '0', 'tool:gen:list',           'code',          'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
insert into sys_menu values('115',  '系统接口', '3',   '3', 'swagger',    'tool/swagger/index',       1, 'C', '0', '0', 'tool:swagger:list',       'swagger',       'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
-- 三级菜单
insert into sys_menu values('500',  '操作日志', '108', '1', 'operlog',    'monitor/operlog/index',    1, 'C', '0', '0', 'monitor:operlog:list',    'form',          'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
insert into sys_menu values('501',  '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', 1, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor',    'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
-- 用户管理按钮
insert into sys_menu values('1001', '用户查询', '100', '1',  '', '', 1, 'F', '0', '0', 'system:user:query',          '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1002', '用户新增', '100', '2',  '', '', 1, 'F', '0', '0', 'system:user:add',            '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1003', '用户修改', '100', '3',  '', '', 1, 'F', '0', '0', 'system:user:edit',           '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1004', '用户删除', '100', '4',  '', '', 1, 'F', '0', '0', 'system:user:remove',         '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1005', '用户导出', '100', '5',  '', '', 1, 'F', '0', '0', 'system:user:export',         '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1006', '用户导入', '100', '6',  '', '', 1, 'F', '0', '0', 'system:user:import',         '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1007', '重置密码', '100', '7',  '', '', 1, 'F', '0', '0', 'system:user:resetPwd',       '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
-- 角色管理按钮
insert into sys_menu values('1008', '角色查询', '101', '1',  '', '', 1, 'F', '0', '0', 'system:role:query',          '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1009', '角色新增', '101', '2',  '', '', 1, 'F', '0', '0', 'system:role:add',            '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1010', '角色修改', '101', '3',  '', '', 1, 'F', '0', '0', 'system:role:edit',           '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1011', '角色删除', '101', '4',  '', '', 1, 'F', '0', '0', 'system:role:remove',         '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1012', '角色导出', '101', '5',  '', '', 1, 'F', '0', '0', 'system:role:export',         '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
-- 菜单管理按钮
insert into sys_menu values('1013', '菜单查询', '102', '1',  '', '', 1, 'F', '0', '0', 'system:menu:query',          '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1014', '菜单新增', '102', '2',  '', '', 1, 'F', '0', '0', 'system:menu:add',            '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1015', '菜单修改', '102', '3',  '', '', 1, 'F', '0', '0', 'system:menu:edit',           '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1016', '菜单删除', '102', '4',  '', '', 1, 'F', '0', '0', 'system:menu:remove',         '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
-- 部门管理按钮
insert into sys_menu values('1017', '部门查询', '103', '1',  '', '', 1, 'F', '0', '0', 'system:dept:query',          '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1018', '部门新增', '103', '2',  '', '', 1, 'F', '0', '0', 'system:dept:add',            '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1019', '部门修改', '103', '3',  '', '', 1, 'F', '0', '0', 'system:dept:edit',           '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1020', '部门删除', '103', '4',  '', '', 1, 'F', '0', '0', 'system:dept:remove',         '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
-- 岗位管理按钮
insert into sys_menu values('1021', '岗位查询', '104', '1',  '', '', 1, 'F', '0', '0', 'system:post:query',          '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1022', '岗位新增', '104', '2',  '', '', 1, 'F', '0', '0', 'system:post:add',            '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1023', '岗位修改', '104', '3',  '', '', 1, 'F', '0', '0', 'system:post:edit',           '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1024', '岗位删除', '104', '4',  '', '', 1, 'F', '0', '0', 'system:post:remove',         '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1025', '岗位导出', '104', '5',  '', '', 1, 'F', '0', '0', 'system:post:export',         '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
-- 字典管理按钮
insert into sys_menu values('1026', '字典查询', '105', '1', '#', '', 1, 'F', '0', '0', 'system:dict:query',          '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1027', '字典新增', '105', '2', '#', '', 1, 'F', '0', '0', 'system:dict:add',            '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1028', '字典修改', '105', '3', '#', '', 1, 'F', '0', '0', 'system:dict:edit',           '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1029', '字典删除', '105', '4', '#', '', 1, 'F', '0', '0', 'system:dict:remove',         '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1030', '字典导出', '105', '5', '#', '', 1, 'F', '0', '0', 'system:dict:export',         '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
-- 参数设置按钮
insert into sys_menu values('1031', '参数查询', '106', '1', '#', '', 1, 'F', '0', '0', 'system:config:query',        '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1032', '参数新增', '106', '2', '#', '', 1, 'F', '0', '0', 'system:config:add',          '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1033', '参数修改', '106', '3', '#', '', 1, 'F', '0', '0', 'system:config:edit',         '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1034', '参数删除', '106', '4', '#', '', 1, 'F', '0', '0', 'system:config:remove',       '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1035', '参数导出', '106', '5', '#', '', 1, 'F', '0', '0', 'system:config:export',       '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
-- 通知公告按钮
insert into sys_menu values('1036', '公告查询', '107', '1', '#', '', 1, 'F', '0', '0', 'system:notice:query',        '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1037', '公告新增', '107', '2', '#', '', 1, 'F', '0', '0', 'system:notice:add',          '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1038', '公告修改', '107', '3', '#', '', 1, 'F', '0', '0', 'system:notice:edit',         '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1039', '公告删除', '107', '4', '#', '', 1, 'F', '0', '0', 'system:notice:remove',       '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
-- 操作日志按钮
insert into sys_menu values('1040', '操作查询', '500', '1', '#', '', 1, 'F', '0', '0', 'monitor:operlog:query',      '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1041', '操作删除', '500', '2', '#', '', 1, 'F', '0', '0', 'monitor:operlog:remove',     '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1042', '日志导出', '500', '4', '#', '', 1, 'F', '0', '0', 'monitor:operlog:export',     '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
-- 登录日志按钮
insert into sys_menu values('1043', '登录查询', '501', '1', '#', '', 1, 'F', '0', '0', 'monitor:logininfor:query',   '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1044', '登录删除', '501', '2', '#', '', 1, 'F', '0', '0', 'monitor:logininfor:remove',  '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1045', '日志导出', '501', '3', '#', '', 1, 'F', '0', '0', 'monitor:logininfor:export',  '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
-- 在线用户按钮
insert into sys_menu values('1046', '在线查询', '109', '1', '#', '', 1, 'F', '0', '0', 'monitor:online:query',       '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1047', '批量强退', '109', '2', '#', '', 1, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1048', '单条强退', '109', '3', '#', '', 1, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
-- 定时任务按钮
insert into sys_menu values('1049', '任务查询', '110', '1', '#', '', 1, 'F', '0', '0', 'monitor:job:query',          '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1050', '任务新增', '110', '2', '#', '', 1, 'F', '0', '0', 'monitor:job:add',            '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1051', '任务修改', '110', '3', '#', '', 1, 'F', '0', '0', 'monitor:job:edit',           '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1052', '任务删除', '110', '4', '#', '', 1, 'F', '0', '0', 'monitor:job:remove',         '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1053', '状态修改', '110', '5', '#', '', 1, 'F', '0', '0', 'monitor:job:changeStatus',   '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1054', '任务导出', '110', '7', '#', '', 1, 'F', '0', '0', 'monitor:job:export',         '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
-- 代码生成按钮
insert into sys_menu values('1055', '生成查询', '114', '1', '#', '', 1, 'F', '0', '0', 'tool:gen:query',             '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1056', '生成修改', '114', '2', '#', '', 1, 'F', '0', '0', 'tool:gen:edit',              '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1057', '生成删除', '114', '3', '#', '', 1, 'F', '0', '0', 'tool:gen:remove',            '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1058', '导入代码', '114', '2', '#', '', 1, 'F', '0', '0', 'tool:gen:import',            '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1059', '预览代码', '114', '4', '#', '', 1, 'F', '0', '0', 'tool:gen:preview',           '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_menu values('1060', '生成代码', '114', '5', '#', '', 1, 'F', '0', '0', 'tool:gen:code',              '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

ALTER SEQUENCE IF EXISTS sys_menu_menu_id_SEQ RESTART WITH 1061;

insert into sys_user_role values ('1', '1');
insert into sys_user_role values ('2', '2');

insert into sys_role_menu values ('2', '1');
insert into sys_role_menu values ('2', '2');
insert into sys_role_menu values ('2', '3');
insert into sys_role_menu values ('2', '4');
insert into sys_role_menu values ('2', '100');
insert into sys_role_menu values ('2', '101');
insert into sys_role_menu values ('2', '102');
insert into sys_role_menu values ('2', '103');
insert into sys_role_menu values ('2', '104');
insert into sys_role_menu values ('2', '105');
insert into sys_role_menu values ('2', '106');
insert into sys_role_menu values ('2', '107');
insert into sys_role_menu values ('2', '108');
insert into sys_role_menu values ('2', '109');
insert into sys_role_menu values ('2', '110');
insert into sys_role_menu values ('2', '111');
insert into sys_role_menu values ('2', '112');
insert into sys_role_menu values ('2', '113');
insert into sys_role_menu values ('2', '114');
insert into sys_role_menu values ('2', '115');
insert into sys_role_menu values ('2', '500');
insert into sys_role_menu values ('2', '501');
insert into sys_role_menu values ('2', '1000');
insert into sys_role_menu values ('2', '1001');
insert into sys_role_menu values ('2', '1002');
insert into sys_role_menu values ('2', '1003');
insert into sys_role_menu values ('2', '1004');
insert into sys_role_menu values ('2', '1005');
insert into sys_role_menu values ('2', '1006');
insert into sys_role_menu values ('2', '1007');
insert into sys_role_menu values ('2', '1008');
insert into sys_role_menu values ('2', '1009');
insert into sys_role_menu values ('2', '1010');
insert into sys_role_menu values ('2', '1011');
insert into sys_role_menu values ('2', '1012');
insert into sys_role_menu values ('2', '1013');
insert into sys_role_menu values ('2', '1014');
insert into sys_role_menu values ('2', '1015');
insert into sys_role_menu values ('2', '1016');
insert into sys_role_menu values ('2', '1017');
insert into sys_role_menu values ('2', '1018');
insert into sys_role_menu values ('2', '1019');
insert into sys_role_menu values ('2', '1020');
insert into sys_role_menu values ('2', '1021');
insert into sys_role_menu values ('2', '1022');
insert into sys_role_menu values ('2', '1023');
insert into sys_role_menu values ('2', '1024');
insert into sys_role_menu values ('2', '1025');
insert into sys_role_menu values ('2', '1026');
insert into sys_role_menu values ('2', '1027');
insert into sys_role_menu values ('2', '1028');
insert into sys_role_menu values ('2', '1029');
insert into sys_role_menu values ('2', '1030');
insert into sys_role_menu values ('2', '1031');
insert into sys_role_menu values ('2', '1032');
insert into sys_role_menu values ('2', '1033');
insert into sys_role_menu values ('2', '1034');
insert into sys_role_menu values ('2', '1035');
insert into sys_role_menu values ('2', '1036');
insert into sys_role_menu values ('2', '1037');
insert into sys_role_menu values ('2', '1038');
insert into sys_role_menu values ('2', '1039');
insert into sys_role_menu values ('2', '1040');
insert into sys_role_menu values ('2', '1041');
insert into sys_role_menu values ('2', '1042');
insert into sys_role_menu values ('2', '1043');
insert into sys_role_menu values ('2', '1044');
insert into sys_role_menu values ('2', '1045');
insert into sys_role_menu values ('2', '1046');
insert into sys_role_menu values ('2', '1047');
insert into sys_role_menu values ('2', '1048');
insert into sys_role_menu values ('2', '1049');
insert into sys_role_menu values ('2', '1050');
insert into sys_role_menu values ('2', '1051');
insert into sys_role_menu values ('2', '1052');
insert into sys_role_menu values ('2', '1053');
insert into sys_role_menu values ('2', '1054');
insert into sys_role_menu values ('2', '1055');
insert into sys_role_menu values ('2', '1056');
insert into sys_role_menu values ('2', '1057');
insert into sys_role_menu values ('2', '1058');
insert into sys_role_menu values ('2', '1059');
insert into sys_role_menu values ('2', '1060');

insert into sys_role_dept values ('2', '100');
insert into sys_role_dept values ('2', '101');
insert into sys_role_dept values ('2', '105');

insert into sys_user_post values ('1', '1');
insert into sys_user_post values ('2', '2');

insert into sys_dict_type values(1,  '用户性别', 'sys_user_sex',        '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
insert into sys_dict_type values(2,  '菜单状态', 'sys_show_hide',       '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
insert into sys_dict_type values(3,  '系统开关', 'sys_normal_disable',  '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
insert into sys_dict_type values(4,  '任务状态', 'sys_job_status',      '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
insert into sys_dict_type values(5,  '任务分组', 'sys_job_group',       '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
insert into sys_dict_type values(6,  '系统是否', 'sys_yes_no',          '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
insert into sys_dict_type values(7,  '通知类型', 'sys_notice_type',     '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
insert into sys_dict_type values(8,  '通知状态', 'sys_notice_status',   '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
insert into sys_dict_type values(9,  '操作类型', 'sys_oper_type',       '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
insert into sys_dict_type values(10, '系统状态', 'sys_common_status',   '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

ALTER SEQUENCE IF EXISTS sys_dict_type_dict_id_SEQ RESTART WITH 11;

insert into sys_dict_data values(1,  1,  '男',       '0',       'sys_user_sex',        '',   '',        'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
insert into sys_dict_data values(2,  2,  '女',       '1',       'sys_user_sex',        '',   '',        'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
insert into sys_dict_data values(3,  3,  '未知',     '2',       'sys_user_sex',        '',   '',        'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
insert into sys_dict_data values(4,  1,  '显示',     '0',       'sys_show_hide',       '',   'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
insert into sys_dict_data values(5,  2,  '隐藏',     '1',       'sys_show_hide',       '',   'danger',  'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
insert into sys_dict_data values(6,  1,  '正常',     '0',       'sys_normal_disable',  '',   'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
insert into sys_dict_data values(7,  2,  '停用',     '1',       'sys_normal_disable',  '',   'danger',  'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
insert into sys_dict_data values(8,  1,  '正常',     '0',       'sys_job_status',      '',   'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
insert into sys_dict_data values(9,  2,  '暂停',     '1',       'sys_job_status',      '',   'danger',  'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
insert into sys_dict_data values(10, 1,  '默认',     'DEFAULT', 'sys_job_group',       '',   '',        'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
insert into sys_dict_data values(11, 2,  '系统',     'SYSTEM',  'sys_job_group',       '',   '',        'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
insert into sys_dict_data values(12, 1,  '是',       'Y',       'sys_yes_no',          '',   'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
insert into sys_dict_data values(13, 2,  '否',       'N',       'sys_yes_no',          '',   'danger',  'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
insert into sys_dict_data values(14, 1,  '通知',     '1',       'sys_notice_type',     '',   'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
insert into sys_dict_data values(15, 2,  '公告',     '2',       'sys_notice_type',     '',   'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
insert into sys_dict_data values(16, 1,  '正常',     '0',       'sys_notice_status',   '',   'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
insert into sys_dict_data values(17, 2,  '关闭',     '1',       'sys_notice_status',   '',   'danger',  'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
insert into sys_dict_data values(18, 1,  '新增',     '1',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
insert into sys_dict_data values(19, 2,  '修改',     '2',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
insert into sys_dict_data values(20, 3,  '删除',     '3',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
insert into sys_dict_data values(21, 4,  '授权',     '4',       'sys_oper_type',       '',   'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
insert into sys_dict_data values(22, 5,  '导出',     '5',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
insert into sys_dict_data values(23, 6,  '导入',     '6',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
insert into sys_dict_data values(24, 7,  '强退',     '7',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
insert into sys_dict_data values(25, 8,  '生成代码', '8',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
insert into sys_dict_data values(26, 9,  '清空数据', '9',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
insert into sys_dict_data values(27, 1,  '成功',     '0',       'sys_common_status',   '',   'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
insert into sys_dict_data values(28, 2,  '失败',     '1',       'sys_common_status',   '',   'danger',  'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

ALTER SEQUENCE IF EXISTS sys_dict_data_dict_code_SEQ RESTART WITH 29;

insert into sys_config values(1, '主框架页-默认皮肤样式名称', 'sys.index.skinName',     'skin-blue',     'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow' );
insert into sys_config values(2, '用户管理-账号初始密码',     'sys.user.initPassword',  '123456',        'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456' );
insert into sys_config values(3, '主框架页-侧边栏主题',       'sys.index.sideTheme',    'theme-dark',    'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深色主题theme-dark，浅色主题theme-light' );

ALTER SEQUENCE IF EXISTS sys_config_config_id_SEQ RESTART WITH 4;

insert into sys_job values(1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams',        '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_job values(2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams("ry")',  '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
insert into sys_job values(3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams("ry", true, 2000L, 316.50D, 100)',  '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

ALTER SEQUENCE IF EXISTS sys_job_job_id_SEQ RESTART WITH 4;

insert into sys_notice values('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
insert into sys_notice values('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容',   '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

ALTER SEQUENCE IF EXISTS sys_notice_notice_id_SEQ RESTART WITH 3;