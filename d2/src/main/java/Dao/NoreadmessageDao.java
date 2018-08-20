package Dao;

import enity.Friend;
import enity.Noreadmessage;
import enity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Component
public class NoreadmessageDao {

    private SessionFactory sessionFactory;

    public SessionFactory getsessionFactory() {
        return sessionFactory;
    }
    @Resource
    public void setsessionFactory(SessionFactory sessionFactory) {
        System.out.println("MVC");
        this.sessionFactory = sessionFactory;
    }


    public void addNoMessage(Noreadmessage noreadmessage) {

        Session session = sessionFactory.openSession();

        session.save(noreadmessage);
        session.close();

    }

    public List<Integer> loadNoreadmessagebyid(int id){
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        String sql = "select distinct (sid)  from Noreadmessage  where rid="+id+" GROUP by sid order BY  max(time) desc";
        List<Integer> noreadmessages = (List<Integer>) session.createSQLQuery(sql).list();
//        List<Integer> noreadmessages = (List<Integer>) session.createSQLQuery(sql).list();
//        List<Object[]> noreadmessages1 = (List<Object[]>) session.createSQLQuery(sql).list();



        session.close();
        return noreadmessages;
    }


    public boolean hasNoMessage(int id){
        Session session = sessionFactory.openSession();
        List<Noreadmessage> flag = (List<Noreadmessage>)session.createQuery("from Noreadmessage n where n.id="+id).list();
        session.close();
        return flag.size()>0?true:false;
    }

}
