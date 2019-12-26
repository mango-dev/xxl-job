# xxl_job_info表添加job_topic字段
use xxl_job;
ALTER TABLE `xxl_job_info` ADD COLUMN `job_topic` VARCHAR(10) COMMENT '任务主题' AFTER `job_desc`;