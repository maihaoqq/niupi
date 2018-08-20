package Serviceimpl;

import DTO.UserDTO;
import Dao.UserDao;
import Serviceapi.UserService;
import enity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceimpl implements UserService {
    @Autowired
    public UserDao userDao;

    public String addUser(User u) {
        if(isExistPhone(u.getPhone())){
            return "号码已经存在" ;
        }
        u.setUserName("用户"+u.getPhone());
        u.setAge("迷");
        u.setMajor("迷");
        u.setSchool("迷");
        u.setSex("迷");
        u.setLoc("地球");
        u.setPoint(100);
        u.setRank("青铜");
        userDao.addUser(u);
        return "true";
    }

    public User findUserbyid(int id) {
        return userDao.findUserbyid(id);
    }

    public boolean isExistPhone(Long phone) {
        return userDao.isExistPhone(phone)>0;
    }

    public String logIn(User user) {
        User u1 = userDao.findUserbyphone(user.getPhone());
        if(u1==null){
            return "该用户不存在";
        }
        if(!u1.getPassword().equals(user.getPassword())){
            return "密码错误";
        }

        return "true";
    }

    public User findUserbyphone(long phone) {
        User u1 = userDao.findUserbyphone(phone);
        return u1;
    }

    public UserDTO userDetail(Long phone) {
        UserDTO dto = new UserDTO();
        User u = this.findUserbyphone(phone);
        dto.setId(u.getId());
        dto.setPhone(u.getPhone());
        dto.setUserName(u.getUserName());

        if(u.getIstouxiang()==1)
            dto.setHead_img("images/touxiang/"+u.getId()+".jpg");
        else
            dto.setHead_img("images/local/init.jpg");
        dto.setAge(u.getAge());
        dto.setMajor(u.getMajor());
        dto.setSchool(u.getSchool());
        dto.setLoc(u.getLoc());
        dto.setSex(u.getSex());
        return  dto;
    }

    public boolean updateUser(UserDTO user) {
        User u = this.findUserbyphone(user.getPhone());
        if(user.getLoc()!=null)
        u.setLoc(user.getLoc());
        if(user.getMajor()!=null)
        u.setMajor(user.getMajor());
        if(user.getUserName()!=null)
        u.setUserName(user.getUserName());
        if(user.getUserName()!=null)
        u.setSex(user.getSex());
        if(user.getSchool()!=null)
        u.setSchool(user.getSchool());
        if(user.getAge()!=null)
        u.setAge(user.getAge());
        if(user.getPassword()!=null)
        u.setPassword(user.getPassword());
        userDao.updateUser(u);
        return true;
    }


    public UserDTO userDetail(int  id) {
        UserDTO dto = new UserDTO();
        User u = this.findUserbyid(id);
        dto.setId(u.getId());
        dto.setPhone(u.getPhone());
        dto.setUserName(u.getUserName());

        if(u.getIstouxiang()==1)
            dto.setHead_img("images/touxiang/"+u.getId()+".jpg");
        else
            dto.setHead_img("images/local/init.jpg");
        dto.setAge(u.getAge());
        dto.setMajor(u.getMajor());
        dto.setSchool(u.getSchool());
        dto.setLoc(u.getLoc());
        dto.setSex(u.getSex());
        return  dto;
    }

}
