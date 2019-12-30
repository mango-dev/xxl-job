## 《XXL-JOB二开修改记录》
### 1.1 数据库
#### 1.1.1 调度信息表添加任务主题
```
    ALTER TABLE `xxl_job_info` ADD COLUMN `job_topic` VARCHAR(10) COMMENT '任务主题' AFTER `job_desc`;
```
### 1.2 功能修改
- 任务管理添加topic主题字段
![avatar](images/341341412412412.png)<br>
![avatar](images/sadadasfga.png)<br>
- 调度日志默认显示失败状态 
- 调度日志显示任务描述
- 调度日志执行日志查看打开新页面
![avatar](images/2201ca9e47da3e3483551448202bae5.png)<br>
### 1.3 代码截图
* 不多做记录了就是对应的controller model service dao freemarke 进行修改
- jobinfo.index.ftl<br>
![avatar](images/1cfe4dcffb4e7d435144fcf9dccdd5f.png)<br>
![avatar](images/01ef8732faa503d16c94e2a622d525a.png)<br>
![avatar](images/2a4187c591821d03326a62118bfad04.png)<br>
![avatar](images/0a0566192e9331ef7960fe7ea00cd96.png)<br>
- joblog.index.ftl<br>
![avatar](images/32588eff550855a944189d7b91e8e95.png)<br>
![avatar](images/bb7098d43109180fe5280e14074718f.png)<br>
- jobinfo.index.1.js<br>
![avatar](images/639dbe18ae91017ab8705e401b91dd0.png)<br>
![avatar](images/6d2ddb527fc0637f3d854231301a56a.png)<br>
![avatar](images/eca6dc456dfe5a7ed527fcaa2c5190a.png)<br>
![avatar](images/07af895c89d124110f487ae8691e1dd.png)<br>
- joblog.index.1.js<br>
![avatar](images/823a1a53ef3479720800d8f6726457d.png)<br>
![avatar](images/b706843d83a0a1fba959a082fdc7628.png)<br>
![avatar](images/86a958e4273bc01b9b46d5dbdb1f0cc.png)<br>
![avatar](images/48c84980b1b4f2bcf8abcd8ee41d387.png)<br>
![avatar](images/b96cf069475ffc1a17aa609d7de1259.png)<br>
- jobinfo.java<br>
![avatar](images/f457bf0fbeac8930f70fef08ff89213.png)<br>
- joblog.java<br>
![avatar](images/13d5ac3d697b36781c2c37c61f45042.png)<br>
- mybatis <br>
![avatar](images/9d2333a90ea63199f0174598c341797.png)<br>
![avatar](images/ea67a87cd5b1837f23e895806d79dfa.png)<br>


