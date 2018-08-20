package Quartz;

import Serviceapi.NoreadmessageService;
import Serviceimpl.NoreadmessageServiceimpl;
import Socket.WebSocketTest;
import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class MyJob implements Job {


    static int i=1;


    public void execute(JobExecutionContext context)
            throws JobExecutionException {

        JobDataMap dataMap = context.getJobDetail().getJobDataMap();


        WebSocketTest webSocketTest = (WebSocketTest)dataMap.get("fuck");
        NoreadmessageServiceimpl noreadmessageServiceimpl = (NoreadmessageServiceimpl)dataMap.get("you");
        RedisUtil redis = (RedisUtil) dataMap.get("redisUtil");


//        if(noreadmessageServiceimpl==null)
//            System.out.println("爆炸");
//        else
//            System.out.println("没爆炸");
        int id =(Integer) dataMap.get("id");

        List<Integer> old = (List<Integer>)redis.get(id+"_noreadmessage");
        List<Integer> re = noreadmessageServiceimpl.loadNoMessagebyid(id);

            try {
                if(re.size()>0&&!old.equals(re)) {
                    webSocketTest.sendMessage("Noread");
                    System.out.println("FUCK");
                    redis.set(id+"_noreadmessage",re);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }




//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//        try {
//            webSocketTest.sendMessage(sdf.format(new Date()));
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        System.out.println(sdf.format(new Date()));
    }

}