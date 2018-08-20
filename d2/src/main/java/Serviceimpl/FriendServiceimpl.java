package Serviceimpl;

import DTO.UserDTO;
import Dao.FriendDao;
import Serviceapi.FriendService;
import enity.Friend;
import enity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class FriendServiceimpl implements FriendService {
    @Autowired
    public FriendDao friendDao;

    public boolean addFriend(User u, int firendid) {
        if(friendDao.isExistFriend(u.getId(),firendid)){
            return false;
        }
        friendDao.addfriend(u.getId(),firendid);
        return true;
    }

    public List<User> touxiangid(User user) {
        return friendDao.touxiangid(user);
    }

    public boolean deleteFriend(int id, int fid) {
        return friendDao.deleteFriend(id,fid);
    }

    public List<UserDTO> touxiangidDTO(User user) {
        List<User> list = friendDao.touxiangid(user);
        List<UserDTO> re = new ArrayList<UserDTO>();
        for(int i=0;i<list.size();i++){
            User u = list.get(i);
            UserDTO dto = new UserDTO();
            dto.setUserName(u.getUserName());
            dto.setId(u.getId());
            if(u.getIstouxiang()==1)
                dto.setHead_img("images/touxiang/"+u.getId()+".jpg");
            else
                dto.setHead_img("images/local/init.jpg");
            dto.setPhone(u.getPhone());
            re.add(dto);
        }
        return  re;
    }
}
