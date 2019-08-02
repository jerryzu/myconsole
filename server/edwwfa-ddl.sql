DROP TABLE
    json_ctrl;
CREATE TABLE
    json_ctrl
    (
        json_id INT NOT NULL AUTO_INCREMENT,
        reader_db_type VARCHAR(100) COMMENT '源库类型 mysql|oracle',
        reader_dbname VARCHAR(100) COMMENT '源库数据库名',
        reader_tablename VARCHAR(400),
        reader_table_type VARCHAR(100) COMMENT '源表类型 partition|normal',
        write_db_type VARCHAR(100) COMMENT '目标库类型 mysql|oracle',
        writer_dbname VARCHAR(100) COMMENT '目标库数据库名',
        writer_tablename VARCHAR(100) COMMENT '目标库表名',
        writer_table_type VARCHAR(100) COMMENT '目标表类型 partition|normal',
        json_path VARCHAR(100) COMMENT '生成json存放的目录',
        json_name VARCHAR(100) COMMENT '生成json的名称',
        write_mode VARCHAR(20) DEFAULT 'insert' COMMENT '插入表的方式 insert/replace/update',
        channel VARCHAR(10) COMMENT '单个任务的并行度',
        is_valid VARCHAR(10) COMMENT '是否有效 Y|N',
        business_type VARCHAR(10) COMMENT '类型',
        task_id INT NOT NULL COMMENT '任务id',
        preprocessing VARCHAR(500) COMMENT '预处理',
        reader_fieldlist VARCHAR(2000) COMMENT '源库字段列表',
        writer_fieldlist VARCHAR(2000) COMMENT '目标库字段列表',
        params VARCHAR(2000) COMMENT '扩展参数，json格式',
        PRIMARY KEY (json_id)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE=utf8_general_ci;
DROP TABLE
    t_task;
CREATE TABLE
    t_task
    (
        task_id INT NOT NULL AUTO_INCREMENT COMMENT '任务id',
        task_name VARCHAR(50) DEFAULT '无' NOT NULL COMMENT '任务名称',
        task_type CHAR(1) NOT NULL COMMENT '任务类型',
        path VARCHAR(200) COLLATE utf8_bin COMMENT '任务路径',
        svn_path VARCHAR(200) COMMENT 'svn路径',
        is_root_task CHAR(1) NOT NULL COMMENT '0:非根任务 1:根任务',
        is_virtual_task CHAR(1) NOT NULL COMMENT '0:非虚任务 1:虚任务',
        params VARCHAR(2000) COLLATE utf8_bin COMMENT '参数',
        priority INT(1) NOT NULL COMMENT '优先级(0-9值越大优先级越高)',
        status CHAR(1) NOT NULL COMMENT '状态(0:失效,1:生效)',
        owner INT NOT NULL COMMENT '责任人',
        SCHEDULE VARCHAR(50) COMMENT '定时',
        create_user INT NOT NULL COMMENT '创建人',
        create_time DATETIME NOT NULL COMMENT '创建时间',
        update_user INT COMMENT '修改人',
        update_time DATETIME COMMENT '修改时间',
        path_run VARCHAR(200) COLLATE utf8_bin COMMENT '运行路径',
        early_warning_type CHAR(1) DEFAULT '3' NOT NULL COMMENT '预警类型 0：不预警1：成功或失败预警2：成功预警3：失败预警',
        early_warning_mode VARCHAR(20) DEFAULT '0' NOT NULL COMMENT
        '预警方式 0：邮件报警一次1：短信报警一次2：钉钉报警一次3：邮件报警多次4：短信报警多次5：钉钉报警多次',
        PRIMARY KEY (task_id)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE=utf8_general_ci;
DROP TABLE
    t_task_action;
CREATE TABLE
    t_task_action
    (
        action_id INT NOT NULL AUTO_INCREMENT COMMENT '执行任务id',
        task_id INT NOT NULL COMMENT '任务id',
        biz_date DATE NOT NULL COMMENT '业务日期',
        task_name VARCHAR(50) COMMENT '任务名称',
        task_type CHAR(1) NOT NULL COMMENT '任务类型 0:shell;1:sql;2:根任务;3:datax同步',
        path VARCHAR(200) COLLATE utf8_bin COMMENT '任务路径',
        svn_path VARCHAR(200) COMMENT 'svn路径',
        is_root_task CHAR(1) NOT NULL COMMENT '0:非根任务 1:根任务',
        is_virtual_task CHAR(1) NOT NULL COMMENT '0:非虚任务 1:虚任务',
        params VARCHAR(1000) COLLATE utf8_bin COMMENT '参数',
        priority INT NOT NULL COMMENT '优先级:0-9值越大优先级越高',
        plan_time DATETIME NOT NULL COMMENT '计划执行时间',
        is_close CHAR(1) NOT NULL COMMENT '报警关闭标识 1:关闭;0:开启',
        is_delete CHAR(1) NOT NULL COMMENT '删除标识 1:删除;0:开启',
        status CHAR(1) NOT NULL COMMENT '状态 0:notReady;1:ready;2:running;3:fail;4:succ;5:autoSucc',
        owner INT NOT NULL COMMENT '责任人',
        SCHEDULE VARCHAR(50) COMMENT '定时 每个任务都有',
        schedule_flag CHAR(1) NOT NULL COMMENT '调度方式 0: schedule;1:人工',
        period CHAR(1) NOT NULL COMMENT '执行方式 0:每天;1:每月;2:每周;3:每季度;4:每年;5:小时',
        rerun_flag CHAR(1) NOT NULL COMMENT
        '重跑方式 0:正常运行;1:重跑本节点;2:重跑本节点及子节点;3: 修复性重跑(重跑本身及子任务中错误的任务)',
        start_time DATETIME COMMENT '任务开始时间',
        end_time DATETIME COMMENT '任务结束时间',
        create_user INT NOT NULL COMMENT '创建人',
        create_time DATETIME NOT NULL COMMENT '创建时间',
        update_user INT COMMENT '修改人',
        update_time DATETIME COMMENT '修改时间',
        path_run VARCHAR(200) COLLATE utf8_bin COMMENT '运行路径',
        early_warning_type CHAR(1) DEFAULT '3' NOT NULL COMMENT '预警类型 0：不预警1：成功或失败预警2：成功预警3：失败预警',
        early_warning_mode VARCHAR(20) DEFAULT '0' NOT NULL COMMENT
        '预警方式 0：邮件报警一次1：短信报警一次2：钉钉报警一次3：邮件报警多次4：短信报警多次5：钉钉报警多次',
        PRIMARY KEY (action_id)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE=utf8_general_ci;
    
DROP TABLE
    t_task_relation;
CREATE TABLE
    t_task_relation
    (
        task_id INT NOT NULL COMMENT '任务id',
        parent_id INT NOT NULL COMMENT '父任务id'
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE=utf8_general_ci;
DROP TABLE
    t_task_sql;
CREATE TABLE
    t_task_sql
    (
        task_id INT NOT NULL COMMENT '任务id',
        path VARCHAR(200) COLLATE utf8_bin COMMENT '任务路径',
        content text COLLATE utf8_bin COMMENT 'sql内容',
        PRIMARY KEY (task_id)
    )
    ENGINE=InnoDB DEFAULT CHARSET=utf8 DEFAULT COLLATE=utf8_general_ci;