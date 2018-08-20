package Serviceimpl;

import Dao.MessageDao;
import Dao.NoreadmessageDao;
import Serviceapi.MessageService;
import enity.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class MessageServiceimpl implements MessageService {

    @Autowired
    private MessageDao messageDao;


    public List<String> getMessage(int uid, int tid) {
             List<String> re= new ArrayList<String>();
             List<Message> me = messageDao.getMessage(uid,tid);
             int start=me.size();
             if(start>100)start=100;

             for(int i=start-1;i>=0;i--){
                 Message m = me.get(i);
                 if(m.getRid()==uid){
                     re.add("R"+m.getMessage());
                 }else{
                     re.add("S"+m.getMessage());
                 }
             }
             return re;

    }

}
