
import DTO.CommentDTO;
import DTO.ForunDTO;
import DTO.ThingDTO;
import DTO.UserDTO;
import Dao.CommentDao;
import Dao.UserDao;
import Serviceapi.*;
import Serviceimpl.*;
import com.alibaba.dubbo.common.json.JSON;
import com.alibaba.dubbo.common.json.JSONObject;
import enity.Comment;
import enity.User;
import org.hibernate.SessionFactory;
import org.junit.runner.RunWith;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath*:application.xml"})
public class niuniu extends
        AbstractJUnit4SpringContextTests {


    public UserServiceimpl getFriendService() {
        return (UserServiceimpl)userService;
    }
    @Autowired
    public UserService userService;

    public ForunServiceimpl getForunService(){ return (ForunServiceimpl)forunService; }
    @Autowired
    public ForunService forunService;


    public CommentServiceimpl getCommentServiceimpl(){ return (CommentServiceimpl)commentService; }
    @Autowired
    public CommentService commentService;

    public FriendServiceimpl getFriendService2() {
        return (FriendServiceimpl)friendService;
    }
    @Autowired
    public FriendService friendService;


    public ThingServiceimpl getThingServiceimpl() {
        return (ThingServiceimpl)thingServiceimpl;
    }
    @Autowired
    public ThingService thingServiceimpl;

      @Test
      public void existPhone(){
          System.out.println("测试开始");
          User u1 = new User();
          u1.setPhone(13249249670l);
          u1.setPassword("qweqwe");
          System.out.println(getFriendService().logIn(u1));


      }

    @Test
    public void addForun(){
        System.out.println("测试开始");
        ForunDTO dto = new ForunDTO();
        dto.setA_href("www.baidu.com");
        dto.setComment(123);
        dto.setImg("images/touxiang/2.jpg");
        dto.setLastest(new Date());
        dto.setSchool("日你");
        dto.setSex("谨慎一");
        dto.setStart(new Date());
        dto.setTop(true);
        dto.setTopic("水蛇");
        dto.setTt("王子");
        dto.setUser_id(2);
        dto.setYear("14年");
        dto.setUser_name("绿本伟");
        dto.setUser_id(1);
        dto.setTxt("FFFFFFFFFFFFFFFFFFFUUUUUUUUUUUUUUUCCCCCCCCCKKKKKKKKK");
        getForunService().addForun(dto);


//        ForunDTO dto = new ForunDTO();
//        dto.setA_href("www.baidu.com");
//        dto.setComment(123);
//        dto.setImg("images/touxiang/3.jpg");
//        dto.setLastest(new Date());
//        dto.setSchool("FUCK");
//        dto.setSex("女");
//        dto.setStart(new Date());
//        dto.setTop(true);
//        dto.setTopic("老紧");
//        dto.setTt("日你");
//        dto.setUser_id(3);
//        dto.setYear("14年");
//        getForunService().addForun(dto);



    }


    @Test
    public void addForun2(){
        System.out.println("测试开始");
        ForunDTO dto = new ForunDTO();
//        dto.setA_href("www.baidu.com");
//        dto.setComment(123);
//        dto.setImg("images/touxiang/2.jpg");
//        dto.setLastest(new Date());
//        dto.setSchool("日你");
//        dto.setSex("谨慎一");
//        dto.setStart(new Date());
//        dto.setTop(true);
        dto.setTopic("水蛇");
        dto.setTt("王子");
        dto.setUser_id(1);
//        dto.setYear("14年");
//        dto.setUser_name("绿本伟");
        dto.setTxt("FFFFFFFFFFFFFFFFFFFUUUUUUUUUUUUUUUCCCCCCCCCKKKKKKKKK");
        getForunService().addForun(dto);



    }

    @Test
    public void listForun(){
        System.out.println("开始开始");
        List<ForunDTO> list= getForunService().listForunUser(1);
        for(int i=0;i<list.size();i++){
            ForunDTO jb = list.get(i);
            System.out.println(jb.toString());
        }
       ;


    }


    @Test
    public void addcomment(){
        CommentDTO dto = new CommentDTO();
        dto.setForun_id(39);
        dto.setTxt("日你吗水蛇");
        dto.setUser_id(2);
        getCommentServiceimpl().addComment(dto);
    }

    @Test
    public void commentlist(){
        List<CommentDTO> dto = getCommentServiceimpl().listCommnet(39);
        for(int i =0;i<dto.size();i++){
            System.out.println(dto.get(i).toString());
        }
    }


    @Test
    public void makefriend(){
        User u = new User();
        u.setId(1);
        System.out.println(getFriendService2().addFriend(u,2));
    }

    @Test
    public void deleteforun(){
                getForunService().deleteForun(42);
    }

    @Test
    public void deletefriend(){
        getFriendService2().deleteFriend(1,2);
    }


    @Test
    public void updateUser(){
        UserDTO u = new UserDTO();
        u.setPhone(13660449184L);
        u.setLoc("迷");
        u.setMajor("迷");
        u.setUserName("迷");
        u.setSex("迷");
        u.setSchool("迷");
        u.setAge("迷");
        getFriendService().updateUser(u);
    }

    @Test
    public void addThing(){
        ThingDTO dto = new ThingDTO();
        dto.setPhone(13249249670L);
        dto.setThings_name("杜蕾斯");
        dto.setThings_loc("烂春袋");
        dto.setThings_pirce(1);

        getThingServiceimpl().addThing(dto);
    }


    @Test
    public void shabigou() throws IOException {
        long begintime = System.currentTimeMillis();
        for(int i=0;i<100000;i++) {
    URL url = new URL("https://s.weibo.com/weibo/%25E5%25B9%25BF%25E5%25B7%259E%25E5%2595%2586%25E5%25AD%25A6%25E9%2599%25A2%2520%25E5%25A4%2596%25E5%258D%2596?topnav=1&wvr=6&b=1");
    URLConnection urlcon = url.openConnection();
    InputStream is = urlcon.getInputStream();
    BufferedReader buffer = new BufferedReader(new InputStreamReader(is));
    StringBuffer bs = new StringBuffer();
    String l = null;
    while ((l = buffer.readLine()) != null) {
        bs.append(l).append("/n");
    }
    System.out.println(bs.toString());


            System.out.println("总共执行时间为："+(System.currentTimeMillis()-begintime)+"毫秒");
            System.out.println("能上热搜吗");
}
    }
}
