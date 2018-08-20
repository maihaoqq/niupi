package Socket;

import Quartz.MyJob;
import Quartz.RedisUtil;
import Serviceapi.NoreadmessageService;
import Serviceimpl.NoreadmessageServiceimpl;
import enity.Noreadmessage;
import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.ContextLoader;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.CopyOnWriteArraySet;


/**
 * @ServerEndpoint 注解是一个类层次的注解，它的功能主要是将目前的类定义成一个websocket服务器端,
 * 注解的值将被用于监听用户连接的终端访问URL地址,客户端可以通过这个URL来连接到WebSocket服务器端
 * @author uptop
 */

@ServerEndpoint("/websocket")
public class WebSocketTest {
//    静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
    private static int onlineCount = 0;

    int id;

    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
    public static CopyOnWriteArraySet<WebSocketTest> webSocketSet = new CopyOnWriteArraySet<WebSocketTest>();

    public static ConcurrentHashMap<Integer,WebSocketTest> webSocketMap =new ConcurrentHashMap<Integer,WebSocketTest>();

    boolean flag=false;

    //与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;

    private NoreadmessageServiceimpl noreadmessageService=(NoreadmessageServiceimpl) ContextLoader.getCurrentWebApplicationContext().getBean("noreadmessageServiceimpl");
    /**
     * 连接建立成功调用的方法
     *
     * @param session 可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */

    private Scheduler scheduler;

    @Autowired


    @OnOpen
    public void onOpen(Session session) {
        this.session = session;
        webSocketSet.add(this);     //加入set中
        addOnlineCount();           //在线数加1
        System.out.println("有新连接加入！当前在线人数为" + getOnlineCount());

    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        webSocketSet.remove(this);  //从set中删除

        subOnlineCount();           //在线数减1
        System.out.println("有一连接关闭！当前在线人数为" + getOnlineCount());
//        try {
//            scheduler.shutdown();
//        } catch (SchedulerException e) {
//            e.printStackTrace();
//        }
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 客户端发送过来的消息
     * @param session 可选的参数
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("来自客户端的消息:" + message);
        if(flag){
      int rid = Integer.valueOf(message.charAt(message.length()-1)-'0');
        String nomessage = message.substring(0,message.length()-1);
            Noreadmessage nrm = new Noreadmessage();
            nrm.setMessage(nomessage);
            nrm.setSid(id);
            nrm.setRid(rid);
            noreadmessageService.addNoMessage(nrm);
            WebSocketTest r = webSocketMap.get(rid);
            try {
               sendMessage("Noread");

            } catch (IOException e) {
                e.printStackTrace();
            }
            if(r!=null) {
                try {
                    r.sendMessage("Noread");

                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }else{
            id=Integer.valueOf(message);
            webSocketMap.put(id,this);
            if(noreadmessageService.hasNoMessagebyid(id)) {
                try {
                    sendMessage("Noread");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            flag=true;
        }

        //群发消息
//        for (WebSocketTest item : webSocketSet) {
//            try {
//                item.sendMessage(message);
//            } catch (IOException e) {
//                e.printStackTrace();
//                continue;
//            }
//        }
    }

    /**
     * 发生错误时调用
     *
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error) {

        System.out.println("发生错误");
        error.printStackTrace();
    }

    public  Scheduler getScheduler() throws SchedulerException {
        SchedulerFactory schedulerFactory = new StdSchedulerFactory();
        System.out.println("能进来吗");
        return schedulerFactory.getScheduler();
    }


    public  void schedulerJob(int id) throws SchedulerException{
        //创建任务

        JobDetail jobDetail = JobBuilder.newJob(MyJob.class).build();
        jobDetail.getJobDataMap().put("fuck",this);

        jobDetail.getJobDataMap().put("you",noreadmessageService);
        jobDetail.getJobDataMap().put("id",id);


        RedisUtil re = (RedisUtil)ContextLoader.getCurrentWebApplicationContext().getBean("redisUtil");
        jobDetail.getJobDataMap().put("redisUtil",re);
        //创建触发器 每3秒钟执行一次
        Trigger trigger = TriggerBuilder.newTrigger()
                .withSchedule(SimpleScheduleBuilder.simpleSchedule().withIntervalInSeconds(1).repeatForever())
                .build();
        scheduler = getScheduler();
        //将任务及其触发器放入调度器
        scheduler.scheduleJob(jobDetail, trigger);
        //调度器开始调度任务
        scheduler.start();
    }


    /**
     * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
     *
     * @param message
     * @throws IOException
     */
    public void sendMessage(String message) throws IOException {
        this.session.getBasicRemote().sendText(message);

    }

    public static synchronized int getOnlineCount() {
        return onlineCount;
    }

    public static synchronized void addOnlineCount() {
        WebSocketTest.onlineCount++;
    }

    public static synchronized void subOnlineCount() {
        WebSocketTest.onlineCount--;
    }

    public void sendMsg(String msg) {
        for (WebSocketTest item : webSocketSet) {
            try {
                item.sendMessage(msg);
            } catch (IOException e) {
                e.printStackTrace();
                continue;
            }
        }
    }











}
