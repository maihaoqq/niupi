package Dao;

import enity.Message;
import enity.Noreadmessage;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Component
public class MessageDao {

    private SessionFactory sessionFactory;

    public SessionFactory getsessionFactory() {
        return sessionFactory;
    }
    @Resource
    public void setsessionFactory(SessionFactory sessionFactory) {
        System.out.println("shuishe");
        this.sessionFactory = sessionFactory;
    }

    public List<Message> getMessage(int uid, int sid){
        Session session = sessionFactory.openSession();
        String hql = "from Noreadmessage n where n.rid="+uid+" and n.sid= "+sid;
        String hql1 = "from Noreadmessage n where n.sid="+uid+" and n.rid= "+sid;
        String hql2 = "from Message m where (m.sid="+uid+" and m.rid= "+sid +") or (m.sid="+sid+" and m.rid="+uid+" ) order by m.time DESC ";
        String hql3 = "Delete FROM Noreadmessage n Where n.rid="+uid+" and n.sid= "+sid ;


        List<Noreadmessage> noreadmessages = (List<Noreadmessage>) session.createQuery(hql).list();
        List<Noreadmessage> mymessages = (List<Noreadmessage>) session.createQuery(hql1).list();
        List<Message> messages = (List<Message>) session.createQuery(hql2).setMaxResults(100).list();




        for(int i=0;i<noreadmessages.size();i++){
                 Message m = new Message();
                 Noreadmessage nm = noreadmessages.get(i);
                 m.setMessage(nm.getMessage());
                 m.setRid(nm.getRid());
                 m.setSid(nm.getSid());
                 m.setTime(nm.getTime());
                 session.save(m);
                 messages.add(m);
        }

        for(int i=0;i<mymessages.size();i++){
            Message m = new Message();
            Noreadmessage nm = mymessages.get(i);
            m.setMessage(nm.getMessage());
            m.setRid(nm.getRid());
            m.setSid(nm.getSid());
            m.setTime(nm.getTime());
            messages.add(m);
        }


        Collections.sort(messages,new Comparator<Message>(){
            public int compare(Message m1, Message m2) {
                return m2.getTime().compareTo(m1.getTime());
            }
        });

        Query q = session.createQuery(hql3);
        q.executeUpdate();

        session.close();

        return messages;
    }



}
