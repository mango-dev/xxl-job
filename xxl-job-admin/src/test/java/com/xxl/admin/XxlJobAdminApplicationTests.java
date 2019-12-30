package com.xxl.admin;

import cn.snowheart.dingtalk.robot.starter.client.DingTalkRobotClient;
import com.xxl.job.admin.XxlJobAdminApplication;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = XxlJobAdminApplication.class)
public class XxlJobAdminApplicationTests {

    @Autowired
    private DingTalkRobotClient client;

    @Test
    public void testSendMessageWithText() {
        client.sendTextMessage("1111111111111");
    }

}
