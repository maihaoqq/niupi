package Serviceapi;

import enity.Noreadmessage;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public interface NoreadmessageService {

    public void addNoMessage(Noreadmessage noreadmessage);

    public List<Integer> loadNoMessagebyid(int id);

    public boolean hasNoMessagebyid(int id);
}
