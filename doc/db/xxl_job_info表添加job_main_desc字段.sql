use xxl_job;
alter table xxl_job_info add column job_topic varchar(50);
ALTER TABLE xxl_job_info MODIFY COLUMN job_topic VARCHAR(10) COMMENT '任务主题';