use xxl_job;

# 修改表格编码集
ALTER TABLE xxl_job_group DEFAULT CHARACTER SET utf8mb4;
ALTER TABLE xxl_job_info DEFAULT CHARACTER SET utf8mb4;
ALTER TABLE xxl_job_lock DEFAULT CHARACTER SET utf8mb4;
ALTER TABLE xxl_job_log DEFAULT CHARACTER SET utf8mb4;
ALTER TABLE xxl_job_logglue DEFAULT CHARACTER SET utf8mb4;
ALTER TABLE xxl_job_registry DEFAULT CHARACTER SET utf8mb4;
ALTER TABLE xxl_job_user DEFAULT CHARACTER SET utf8mb4;

# 添加表格
CREATE TABLE `xxl_job_log_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime DEFAULT NULL COMMENT '调度-时间',
  `running_count` int(11) NOT NULL DEFAULT '0' COMMENT '运行中-日志数量',
  `suc_count` int(11) NOT NULL DEFAULT '0' COMMENT '执行成功-日志数量',
  `fail_count` int(11) NOT NULL DEFAULT '0' COMMENT '执行失败-日志数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `i_trigger_day` (`trigger_day`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

# 修改字段属性格式
ALTER TABLE `xxl_job_logglue` MODIFY COLUMN `add_time` datetime DEFAULT NULL;
ALTER TABLE `xxl_job_logglue` MODIFY COLUMN `update_time` datetime DEFAULT NULL;
ALTER TABLE `xxl_job_registry` MODIFY COLUMN `update_time` datetime DEFAULT NULL;
ALTER TABLE `xxl_job_registry` MODIFY COLUMN registry_group VARCHAR (50);
ALTER TABLE `xxl_job_group` MODIFY COLUMN `order` INT(11);

# 添加索引
ALTER TABLE `xxl_job_registry` ADD  INDEX  i_u ( `update_time` );