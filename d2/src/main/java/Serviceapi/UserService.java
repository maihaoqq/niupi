package Serviceapi;

import DTO.UserDTO;
import enity.User;
import org.springframework.stereotype.Service;

@Service
public interface UserService {
     String addUser(User u);

     User findUserbyid(int id);

     boolean isExistPhone(Long phone);

     String logIn(User user);

     User findUserbyphone(long phone);

     UserDTO userDetail(Long phone);

     boolean updateUser(UserDTO dto);
}
