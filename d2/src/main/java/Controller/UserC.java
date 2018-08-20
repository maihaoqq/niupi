package Controller;

import DTO.CommentDTO;
import DTO.ForunDTO;
import DTO.ThingDTO;
import DTO.UserDTO;
import Dao.CommentDao;
import Serviceapi.*;
import Serviceimpl.*;
import enity.Friend;
import enity.Noreadmessage;
import enity.User;
import org.apache.catalina.Session;
import org.apache.commons.io.FileUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class UserC {

    public ThingServiceimpl getThingServiceimpl() {
        return (ThingServiceimpl)thingServiceimpl;
    }
    @Autowired
    public ThingService thingServiceimpl;


    public FriendServiceimpl getFriendService() {
        return (FriendServiceimpl)friendService;
    }
    @Autowired
    public FriendService friendService;


    public ForunServiceimpl getForunService() {
        return (ForunServiceimpl)forunService;
    }
    @Autowired
    public ForunService forunService;


    public UserServiceimpl getUserService() {
        return (UserServiceimpl)userService;
    }

    @Autowired
    public UserService userService;


    public NoreadmessageServiceimpl getNoreadmessageService() {
        return (NoreadmessageServiceimpl)noreadmessageService;
    }

    @Autowired
    public NoreadmessageService noreadmessageService;


    public MessageServiceimpl getMessageService() {
        return (MessageServiceimpl)messageService;
    }

    @Autowired
    public MessageService messageService;

    public CommentServiceimpl getCommentServiceimpl(){ return (CommentServiceimpl)commentService; }
    @Autowired
    public CommentService commentService;


    @RequestMapping("qq")
    public  String fuck(){

        return "indexx";
    }

    @RequestMapping("bbs")
    public  String fuck2(){

        return "bbs";
    }

    @RequestMapping("jb")
    public String addFriend(User u,int friendid){
        getFriendService().addFriend(u,friendid);
        System.out.println(u.getId()+"    "+friendid);
        return "success";
    }

    @RequestMapping("bb")
    public String addUser(Noreadmessage noreadmessage){
        System.out.println(noreadmessage.getMessage());
        getNoreadmessageService().addNoMessage(noreadmessage);
        return "success";
    }




    @RequestMapping("char-message")
    public @ResponseBody Object niupi(@RequestParam("id")int uid,@RequestParam("tid") int tid){
//        System.out.println("uid="+uid+"   tid="+tid);
        List<String> re =getMessageService().getMessage(uid,tid);

        return re;
    }

    @RequestMapping(value = "register", method = {RequestMethod.POST })
    public @ResponseBody Object register (@RequestBody User user){
        System.out.println("phone="+user.getPhone()+"   password="+user.getPassword());
        String result=getUserService().addUser(user);
        Map<String,String> re=new HashMap<String, String>();
        System.out.println(result);
        if(result.equals("true")){
            re.put("flag","true");
        }else{
            re.put("flag","false");
            re.put("falseMsg",result);
        }
        return re;
    }

    @RequestMapping(value = "login", method = {RequestMethod.POST })
    public @ResponseBody Object Login (@RequestBody User user){
        System.out.println("phone="+user.getPhone()+"   password="+user.getPassword());
        String result=getUserService().logIn(user);
        Map<String,Object> re=new HashMap<String, Object>();
        Map<String,Object> u=new HashMap<String, Object>();

        if(result.equals("true")){
            User u1 = getUserService().findUserbyphone(user.getPhone());
            re.put("flag","true");
            u.put("phone",u1.getPhone());
            u.put("name",u1.getUserName());
            if(u1.getIstouxiang()==1){
                u.put("head_src","images/touxiang/"+u1.getId()+".jpg");
                u.put("item_head_src","images/touxiang/"+u1.getId()+".jpg");
            }else{
                u.put("head_src","images/local/init.jpg");
                u.put("item_head_src","images/local/init.jpg");
            }

            u.put("head_id",u1.getId());
            re.put("user_id",u);
        }else{
            re.put("flag","false");
            re.put("falseMsg",result);
        }
        return re;
    }


    @RequestMapping(value = "getforun", method = {RequestMethod.GET })
    public @ResponseBody Object get8Forun (){
        HashMap<String,Object> shuishe = new HashMap<String, Object>();
        List<ForunDTO> item = getForunService().listForunOne();
        shuishe.put("item",item);
        return shuishe;
    }

    @RequestMapping(value = "getlistforun", method = {RequestMethod.POST })
    public @ResponseBody Object getForun (@RequestBody (required=true) Map<String,Object> map){
        System.out.println(map.get("index"));
        HashMap<String,Object> shuishe = new HashMap<String, Object>();
        List<ForunDTO> item = getForunService().listForunTwo(Integer.valueOf((String)map.get("index")));
        shuishe.put("item",item);
        return shuishe;
    }

    @RequestMapping(value = "page")
    public  String Forun (HttpServletRequest request,int id){
        request.setAttribute("id",id);

        return "bbs_item";
    }

    @RequestMapping(value = "thingpage")
    public  String thingpage (HttpServletRequest request,int id){
        request.setAttribute("id",id);

        return "sale_things";
    }

    //帖子详情
    @RequestMapping(value = "getforunContent", method = {RequestMethod.POST })
    public @ResponseBody Object getForunContent (@RequestBody (required=true) Map<String,Object> map){

        ForunDTO dto = getForunService().findForunbyid(Integer.valueOf((String)map.get("cur_tieid")));
        //评论列表
        List<CommentDTO> list = getCommentServiceimpl().listCommnet(Integer.valueOf((String)map.get("cur_tieid")));
        dto.setComment_mes(list);
        System.out.println("FUCKFUCK");
        return dto;
    }


    //帖子详情
    @RequestMapping(value = "makefriend", method = {RequestMethod.POST })
 public @ResponseBody Object makeFriend (@RequestBody (required=true) Map<String,Object> map){

        int id = Integer.valueOf((String)map.get("uid"));
        User u = getUserService().findUserbyid(id);
        //评论列表
        int friend_id = Integer.valueOf((String)map.get("friend_id"));



        return getFriendService().addFriend(u,friend_id);
    }


    //发帖子
    @RequestMapping(value = "addForun", method = {RequestMethod.POST })
    public @ResponseBody Object addForun (@RequestBody (required=true) ForunDTO dto){

        getForunService().addForun(dto);
        Map<String,String> re=new HashMap<String, String>();


        re.put("flag","true");

        return re;
    }

    @RequestMapping(value = "addcomment", method = {RequestMethod.POST })
    public @ResponseBody Object addComment (@RequestBody (required=true) CommentDTO dto){


        getCommentServiceimpl().addComment(dto);

        Map<String,String> re=new HashMap<String, String>();

        re.put("flag","true");

        return re;
    }

    @RequestMapping("center")
    public  String zhongxin(){
        return "person-center";

    }








    @RequestMapping(value = "json1", method = {RequestMethod.POST })
    public @ResponseBody Object t1(@RequestBody User user){
        System.out.println("uid="+user.getPhone()+"   tid="+user.getPassword());

        return null;
    }


    @RequestMapping("test")
    public String test(int id,HttpServletRequest request){

        String result="阿萨德";
        User u = getUserService().findUserbyid(id);

        request.setAttribute("u",u);
//        List<User> friends = getFriendService().touxiangid(u);
//        request.setAttribute("f",friends);
        System.out.println(id);
        return "upload";
    }


//@RequestBody 将json对象转成java对象

//@ResponseBody 表示返回的是json对象
    @RequestMapping("fuck")

    public  @ResponseBody Object jsonSource(@RequestParam("id") int id){

        User u = getUserService().findUserbyid(id);
        List<User> friends = getFriendService().touxiangid(u);
        List<String> niupi= getNoreadmessageService().getnoreadfriend(id,friends);

//
//       List<User> friends=(List<User>)map.get("frieds");
//       System.out.println(friends.size());

        return  niupi;

    }



    @RequestMapping("sendMessage")
    public  @ResponseBody Object sendMessage(@RequestParam("id") int id,@RequestParam("tid") int tid,@RequestParam("Message") String message){

        Noreadmessage nm = new Noreadmessage();

        nm.setSid(id);
        nm.setRid(tid);
        nm.setMessage(message);
       System.out.println(message);
        getNoreadmessageService().addNoMessage(nm);

//
//       List<User> friends=(List<User>)map.get("frieds");
//       System.out.println(friends.size());

        return  null;

    }


    //获取好友列表
    @RequestMapping(value = "getfriends", method = {RequestMethod.POST })
    public @ResponseBody Object getfriends (@RequestBody (required=true) Map<String,Object> map){

        Map<String,Object> re = new HashMap<String,Object>();
        User u = getUserService().findUserbyphone(Long.valueOf((String)map.get("phone")));
        System.out.println(u==null);
        UserDTO dto = new UserDTO();
        dto.setId(u.getId());
        dto.setPhone(u.getPhone());
        dto.setUserName(u.getUserName());

        if(u.getIstouxiang()==1)
            dto.setHead_img("images/touxiang/"+u.getId()+".jpg");
        else
            dto.setHead_img("images/local/init.jpg");

        re.put("user",dto);
        List<User> friends = getFriendService().touxiangid(u);
        List<UserDTO> friend = new ArrayList<UserDTO>();
        for(int i=0; i<friends.size();i++){
            User u1 = friends.get(i);
            UserDTO dto1 = new UserDTO();
            dto1.setId(u1.getId());
            dto1.setPhone(u1.getPhone());
            dto1.setUserName(u1.getUserName());

            if(u1.getIstouxiang()==1)
                dto1.setHead_img("images/touxiang/"+u1.getId()+".jpg");
            else
                dto1.setHead_img("images/local/init.jpg");
            friend.add(dto1);
        }
        re.put("friend",friend);
        return re;
    }


    @RequestMapping(value = "userDetail", method = {RequestMethod.POST })
    public @ResponseBody Object userDetail (@RequestBody (required=true) Map<String,Object> map){
        Map<String,Object> re = new HashMap<String,Object>();
        Long phone = Long.valueOf((String)map.get("phone"));

        UserDTO dto = getUserService().userDetail(phone);
        List<ForunDTO> fdto = getForunService().listForunUser(dto.getId());
        User u = new User();
        u.setId(dto.getId());
        List<UserDTO> friend = getFriendService().touxiangidDTO(u);
        re.put("flag","true");
        re.put("user",dto);
        re.put("forun",fdto);
        re.put("friend",friend);
        return re;
    }


    @RequestMapping(value = "deleteForun", method = {RequestMethod.POST })
    public @ResponseBody Object deleteForun (@RequestBody (required=true) Map<String,Object> map){
        Map<String,Object> re = new HashMap<String,Object>();
       int id= Integer.valueOf((String)map.get("id"));


       boolean flag = getForunService().deleteForun(id);

       if(flag)
           re.put("flag","true");
       else
           re.put("flag","false");

        return re;
    }


    @RequestMapping(value = "deletefriend", method = {RequestMethod.POST })
    public @ResponseBody Object deletefriend (@RequestBody (required=true) Map<String,Object> map){
        Map<String,Object> re = new HashMap<String,Object>();
        Long phone= Long.valueOf((String)map.get("phone"));
        int fid= Integer.valueOf((String)map.get("fid"));

        int id = getUserService().findUserbyphone(phone).getId();
        boolean flag = getFriendService().deleteFriend(id,fid);

        if(flag)
            re.put("flag","true");
        else
            re.put("flag","false");

        return re;
    }


    @RequestMapping(value = "updateUser", method = {RequestMethod.POST })
    public @ResponseBody Object deletefriend (@RequestBody (required=true) UserDTO dto){
        Map<String,Object> re = new HashMap<String,Object>();
        getUserService().updateUser(dto);

        re.put("flag","true");

        return re;
    }

    @RequestMapping(value = "yanzhengmima", method = {RequestMethod.POST })
    public @ResponseBody Object yanzhengmima (@RequestBody (required=true) Map<String,Object> map){
        Map<String,Object> re = new HashMap<String,Object>();
        Long phone= Long.valueOf((String)map.get("phone"));
        String password = (String)map.get("password");
        User u = new User();
        u.setPhone(phone);
        u.setPassword(password);
        String flag = getUserService().logIn(u);

        if(flag.equals("true"))
        re.put("flag",flag);
        else
            re.put("flag","false");


        return re;
    }


    @RequestMapping(value = "updatemima", method = {RequestMethod.POST })
    public @ResponseBody Object updatemima (@RequestBody (required=true) UserDTO dto){
        Map<String,Object> re = new HashMap<String,Object>();

        if(getUserService().updateUser(dto));
        re.put("flag","true");

        return re;
    }


    @RequestMapping(value = "friendDetail", method = {RequestMethod.POST })
    public @ResponseBody Object friendDetail (@RequestBody (required=true) UserDTO dto){




        User u = getUserService().findUserbyid(dto.getId());

        dto.setId(u.getId());
        dto.setPhone(u.getPhone());
        dto.setUserName(u.getUserName());

        if(u.getIstouxiang()==1)
            dto.setHead_img("images/touxiang/"+u.getId()+".jpg");
        else
            dto.setHead_img("images/local/init.jpg");
        dto.setSex(u.getSex());
        dto.setLoc(u.getLoc());
        dto.setSchool(u.getSchool());
        dto.setAge(u.getAge());


        return dto;
    }


    @RequestMapping(value = "touxiangUpload", method = {RequestMethod.POST })
    public @ResponseBody Object touxiangUpload (HttpServletRequest  request,@RequestParam("file") MultipartFile file){


        String path1="C:\\Users\\Administrator\\Desktop\\d2\\src\\main\\webapp\\images\\touxiang";

        String path2="C:\\Users\\Administrator\\Desktop\\d2\\target\\niupi\\images\\touxiang";

        User u = getUserService().findUserbyphone(Long.valueOf((String)request.getParameter("phone")));
        u.setIstouxiang(1);
        try {

            //这里将上传得到的文件保存至 d:\\temp\\file 目录
            FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path1,
                    u.getId()+".jpg"));

            FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path2,
                    u.getId()+".jpg"));
        } catch (IOException e) {
            e.printStackTrace();
        }


        return "true";
    }



    @RequestMapping(value = "addThing", method = {RequestMethod.POST })
    public @ResponseBody Object addThing (HttpServletRequest  request,@RequestParam("file") MultipartFile file){


        String path="C:\\Users\\Administrator\\Desktop\\d2\\src\\main\\webapp\\images\\thing";

        ThingDTO dto = new ThingDTO();

        dto.setThings_pirce(Integer.valueOf((String)request.getParameter("things_price")));
        dto.setPhone(Long.valueOf((String)request.getParameter("phone")));
        dto.setThings_loc((String)request.getParameter("things_loc"));
        dto.setThings_name((String)request.getParameter("things_name"));
        dto.setThings_txt((String)request.getParameter("things_txt"));

        int id=getThingServiceimpl().addThing(dto);




        try {

            //这里将上传得到的文件保存至 d:\\temp\\file 目录
            FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path,
                    id+".jpg"));
        } catch (IOException e) {
            e.printStackTrace();
        }


        return "true";
    }



    @RequestMapping(value = "listThing", method = {RequestMethod.GET })
    public @ResponseBody Object listThing (){
        HashMap<String,Object> map = new HashMap<String, Object>();
        map.put("things",getThingServiceimpl().listThing());

        return map;
    }

    @RequestMapping(value = "thingDetail", method = {RequestMethod.POST })
    public @ResponseBody Object thingDetail (@RequestBody (required=true) Map<String,Object> map){





        return getThingServiceimpl().thingDetail(Integer.valueOf((String)map.get("id")));
    }


    @RequestMapping("thing")
    public String addUser(HttpServletRequest request){



        return "sale";
    }




    @RequestMapping("sb")
    public String addUser(int id,HttpServletRequest request){

        String result="阿萨德";
        User u = getUserService().findUserbyid(id);

        request.setAttribute("u",u);
        List<User> friends = getFriendService().touxiangid(u);
        request.setAttribute("f",friends);

        request.setAttribute("noread",getNoreadmessageService());

        request.setAttribute("user",getUserService());

        return "niupi";
    }

    @RequestMapping(value="upload", method= RequestMethod.GET)
    public String showUploadPage(){
        return "upload";         //view文件夹下的上传单个文件的页面
    }

    @RequestMapping(value="doUpload", method=RequestMethod.POST)
    public String doUploadFile(@RequestParam("file") MultipartFile file,HttpServletRequest request) throws IOException {
        String path="E:\\DEMO\\新建文件夹\\d2\\src\\main\\webapp\\images\\touxiang";
//        String id=""+u.getId();






//        System.out.println(file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."),file.getOriginalFilename().length()));









        try {

            //这里将上传得到的文件保存至 d:\\temp\\file 目录
            FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path,
                    999+".jpg"));
        } catch (IOException e) {
            e.printStackTrace();
        }


        return "success";  //上传成功则跳转至此success.jsp页面
    }


}
