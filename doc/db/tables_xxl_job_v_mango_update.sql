use xxl_job;

# 修改表格编码集
ALTER TABLE xxl_job_group DEFAULT CHARACTER SET utf8mb4;
ALTER TABLE xxl_job_info DEFAULT CHARACTER SET utf8mb4;
ALTER TABLE xxl_job_lock DEFAULT CHARACTER SET utf8mb4;
ALTER TABLE xxl_job_log DEFAULT CHARACTER SET utf8mb4;
ALTER TABLE xxl_job_logglue DEFAULT CHARACTER SET utf8mb4;
ALTER TABLE xxl_job_registry DEFAULT CHARACTER SET utf8mb4;
ALTER TABLE xxl_job_user DEFAULT CHARACTER SET utf8mb4;

# 修改时间格式
ALTER TABLE xxl_job_logglue MODIFY COLUMN add_time datetime DEFAULT NULL;
ALTER TABLE xxl_job_logglue MODIFY COLUMN update_time datetime DEFAULT NULL;
ALTER TABLE xxl_job_registry MODIFY COLUMN update_time datetime DEFAULT NULL;
