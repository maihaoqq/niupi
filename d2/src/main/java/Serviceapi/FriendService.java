package Serviceapi;

import enity.Friend;
import enity.User;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public interface FriendService {
    public boolean addFriend(User u, int firendid);

    public List<User> touxiangid(User user);

    boolean deleteFriend(int id,int fid);

}
