package Dao;


import enity.Comment;
import enity.Friend;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

@Component
public class CommentDao {

    private SessionFactory sessionFactory;

    public SessionFactory getsessionFactory() {
        return sessionFactory;
    }
    @Resource
    public void setsessionFactory(SessionFactory sessionFactory) {
        System.out.println("shuishe");
        this.sessionFactory = sessionFactory;
    }

    public boolean addComment(Comment comment){
        Session session = sessionFactory.openSession();
        session.save(comment);
        session.close();
        return  true;
    }

    public List<Comment> listComment (int id){
        Session session = sessionFactory.openSession();
        String hql = "from Comment c where c.forun_id="+id;
        List<Comment> list = (List<Comment>) session.createQuery(hql).list();
        session.close();
        return  list;
    }
}
