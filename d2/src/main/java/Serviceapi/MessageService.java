package Serviceapi;

import enity.Message;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface MessageService {

   public List<String> getMessage(int uid,int tid);

}
