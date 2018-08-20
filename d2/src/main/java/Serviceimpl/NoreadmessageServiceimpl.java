package Serviceimpl;

import Dao.NoreadmessageDao;
import Serviceapi.NoreadmessageService;
import enity.Noreadmessage;
import enity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class NoreadmessageServiceimpl implements NoreadmessageService {

    @Autowired
    private NoreadmessageDao noreadmessageDao;

    public void addNoMessage(Noreadmessage noreadmessage) {
        noreadmessage.setTime(new Date());
        noreadmessageDao.addNoMessage(noreadmessage);
    }

    public List<Integer> loadNoMessagebyid(int id) {
            List<Integer> re = noreadmessageDao.loadNoreadmessagebyid(id);

            return  re;
    }

    public boolean hasNoMessagebyid(int id) {
        return noreadmessageDao.hasNoMessage(id);
    }

    public List<String> getnoreadfriend(int id,List<User> friends){

        List<Integer> sid=loadNoMessagebyid(id);
        for(int i=sid.size()-1;i>=0;i--){
            for(int j=0;j<friends.size();j++){
                User temp = friends.get(j);
                if(temp.getId()==sid.get(i)){
                    friends.remove(j);
                    friends.add(0,temp);
                    break;
                }
            }
        }
        List<String> re = new ArrayList<String>();
        for(int i=0;i<friends.size();i++){
            re.add(friends.get(i).getUserName()+","+friends.get(i).getId());

        }
        return re;
    }




}
