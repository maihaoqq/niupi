package Dao;

import enity.Forun;
import enity.Noreadmessage;
import enity.User;
import org.hibernate.*;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Component
public class ForunDao {
    private SessionFactory sessionFactory;

    public SessionFactory getsessionFactory() {
        return sessionFactory;
    }
    @Resource
    public void setsessionFactory(SessionFactory sessionFactory) {
        System.out.println("shuishe");
        this.sessionFactory = sessionFactory;
    }

    public boolean addForun(Forun forun){
        Session session = sessionFactory.openSession();
        session.save(forun);
        session.close();
        return  true;
    }

    public List<Forun> list8Forun(){
        Session session = sessionFactory.openSession();
        List<Forun> re = (List<Forun>)session.createQuery("from Forun").list();
        session.close();
        return re;
    }

    public List<Forun> list8Forun(int index){
        Session session = sessionFactory.openSession();
        List<Forun> re = (List<Forun>)session.createQuery("from Forun").list();
        session.close();
        return re;
    }

    public List<Forun> listForun(int index){
        Session session = sessionFactory.openSession();
        List<Forun> re = (List<Forun>)session.createQuery("from Forun order by lastest_time desc").setFirstResult((index-1)*8).setMaxResults(8).list();
        session.close();
        return re;
    }

    public Forun findForunbyid(int id){
        Session session = sessionFactory.openSession();
        Forun forun = (Forun) session.createQuery("from Forun u where u.id ="+id).uniqueResult();

        session.close();
        return forun;
    }

    public Forun findForunbynew(int id){
        Session session = sessionFactory.openSession();
        List<Forun> forun = (List<Forun>) session.createQuery("from Forun f where f.user_id = "+id+" order by start_time desc").setFirstResult(0).setMaxResults(1).list();

        session.close();
        return forun.get(0);
    }

    public boolean addForun2(Forun f){
        Session session = sessionFactory.openSession();
//        String sql = "UPDATE  from forun f SET f.a_href = "+url+" where f.id="+id;

         String hql = "update  Forun f SET f.a_href =:a_href where f.id=:id";

        Query q = session.createQuery(hql);

        q.setParameter("a_href",f.getA_href());

        q.setParameter("id",f.getId());
        q.executeUpdate();



        session.close();
        return  true;
    }

    public void newComment(Forun f){
        Session session = sessionFactory.openSession();
        String hql = "update  Forun f SET f.lastest_time =:lastest where f.id=:id";
        Query q = session.createQuery(hql);

        q.setParameter("lastest",new Date());

        q.setParameter("id",f.getId());
        q.executeUpdate();

        String hql2 = "update  Forun f SET f.comment =:comment where f.id=:id";
        Query q2 = session.createQuery(hql2);

        q2.setParameter("comment",f.getComment()+1);

        q2.setParameter("id",f.getId());
        q2.executeUpdate();

        session.close();
    }

    public List<Forun> listForunUser(int id){
        Session session = sessionFactory.openSession();
        List<Forun> forun = (List<Forun>) session.createQuery("from Forun f where f.user_id = "+id+" order by start_time desc").list();
        session.close();
        return forun;
    }

    public boolean deleteForun(int id){
        Session session = sessionFactory.openSession();
        String hql = "delete from Forun f where f.id = "+id;
        Query q = session.createQuery(hql);
        q.executeUpdate();
        session.close();
        return true;
    }

}
