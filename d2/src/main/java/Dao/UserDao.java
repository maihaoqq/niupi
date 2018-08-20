package Dao;

import enity.Friend;
import enity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

@Component
public class UserDao {

    private SessionFactory sessionFactory;



    public SessionFactory getsessionFactory() {
        return sessionFactory;
    }
    @Resource
    public void setsessionFactory(SessionFactory sessionFactory) {
        System.out.println("MVC");
        this.sessionFactory = sessionFactory;
    }

    public void addUser(User user) {

        Session session = sessionFactory.openSession();

        session.save(user);
        session.close();

    }

    public User findUserbyid(int id){
        Session session = sessionFactory.openSession();

        User user = (User) session.createQuery("from User u where u.id ="+id).uniqueResult();


        session.close();
        return user;
    }

    public int isExistPhone(Long phone){
        Session session = sessionFactory.openSession();

        String sql = "SELECT 1 FROM `user` where phone="+phone;
        List<Integer> Phone =(List<Integer>) session.createSQLQuery(sql).list();
        int re = Phone.size();
        session.close();
        System.out.println(phone);
        return re;
    }

    public User findUserbyphone(long phone){
        Session session = sessionFactory.openSession();

        User user = (User) session.createQuery("from User u where u.phone ="+phone).uniqueResult();


        session.close();
        return user;
    }


    public boolean updateUser(User user){

        Session session = sessionFactory.openSession();
        Transaction tx=session.beginTransaction();
        session.update(user);
        tx.commit();
        session.close();
        return true;
    }

}
