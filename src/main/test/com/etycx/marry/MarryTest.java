package com.etycx.marry;

import com.etycx.marry.remote.redis.ICoreRedisService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath*:spring-context.xml"})
public class MarryTest {

    @Resource
    ICoreRedisService coreRedisService;

    @Test
    public void testAddToRedis(){
        coreRedisService.addToRedis("kkk","123456",600);
    }

}
