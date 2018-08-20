package Dao;

import DTO.UserDTO;
import enity.Friend;
import enity.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

@Component
public class FriendDao {

    @Autowired
    private UserDao userDao;

    private SessionFactory sessionFactory;



    public SessionFactory getsessionFactory() {
        return sessionFactory;
    }
    @Resource
    public void setsessionFactory(SessionFactory sessionFactory) {
        System.out.println("MVC");
        this.sessionFactory = sessionFactory;
    }

    public void addfriend(int id1,int id2) {

        Session session = sessionFactory.openSession();
        Friend f=new Friend();
        f.setMyid(id1);
        f.setFriendid(id2);
        Friend f2=new Friend();
        f2.setMyid(id2);
        f2.setFriendid(id1);

        session.save(f);
        session.save(f2);
        session.close();
        System.out.println("SB");

    }

    public List<User> touxiangid(User user){
        Session session = sessionFactory.openSession();
        final Transaction transaction = session.beginTransaction();
        String hql = "from Friend f where f.myid="+user.getId();
        List<Friend> friends = (List<Friend>) session.createQuery(hql).list();
        List<User> users =new ArrayList<User>();
        for(int i=0;i<friends.size();i++){
            users.add(userDao.findUserbyid(friends.get(i).getFriendid()));

        }
        session.close();
        return users;

    }



    public boolean isExistFriend(int id,int fid){
        Session session = sessionFactory.openSession();
        String sql = "select 1  from friend f where f.myid = "+id +" and f.friendid = "+fid;

        List<Integer> re=  (List<Integer>) session.createSQLQuery(sql).list();
        session.close();
        if(re.size()==1)
            return true;
        else
            return  false;
    }

    public boolean deleteFriend(int id,int fid){
        Session session = sessionFactory.openSession();
        String hql1 = "delete from Friend f where f.myid = "+id+" and f.friendid = "+fid;
        String hql2 = "delete from Friend f where f.myid = "+fid+" and f.friendid = "+id;
        Query q = session.createQuery(hql1);
        q.executeUpdate();
        Query q2 = session.createQuery(hql2);
        q2.executeUpdate();
        session.close();
        return true;
    }


}
