## 《XXL-JOB二开修改记录》
### 1.1 数据库
#### 1.1.1 调度信息表添加任务主题
```
    ALTER TABLE `xxl_job_info` ADD COLUMN `job_topic` VARCHAR(10) COMMENT '任务主题' AFTER `job_desc`;
```
### 1.2 页面
- jobinfo.index.ftl
![avatar](images/3d3495a7d403a1b9fb1854c0f355e40.png)
