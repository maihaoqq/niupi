package Dao;

import DTO.ThingDTO;
import enity.Forun;
import enity.Thing;
import enity.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;

@Component
public class ThingDao {

    private SessionFactory sessionFactory;



    public SessionFactory getsessionFactory() {
        return sessionFactory;
    }
    @Resource
    public void setsessionFactory(SessionFactory sessionFactory) {
        System.out.println("MVC");
        this.sessionFactory = sessionFactory;
    }

    public boolean addThing(Thing t){
        Session session = sessionFactory.openSession();

        session.save(t);

        session.close();

        return true;

    }


    public Thing findForunbynew(Long phone){
        Session session = sessionFactory.openSession();
        List<Thing> forun = (List<Thing>) session.createQuery("from Thing t where t.phone = "+phone+" order by t.things_start desc").setFirstResult(0).setMaxResults(1).list();

        session.close();
        return forun.get(0);
    }

    public boolean addThing2(Thing t){
        Session session = sessionFactory.openSession();
//        String sql = "UPDATE  from forun f SET f.a_href = "+url+" where f.id="+id;

        String hql = "update  Thing t SET t.a_href =:t_href ,t.things_img =:img  where t.id=:id";

        Query q = session.createQuery(hql);

        q.setParameter("t_href",t.getA_href());

        q.setParameter("id",t.getId());

        q.setParameter("img",t.getThings_img());
        q.executeUpdate();






        session.close();
        return  true;
    }

    public List<Thing> listThing(){
        Session session = sessionFactory.openSession();

        List<Thing> re = (List<Thing>)session.createQuery("from Thing").list();
        session.close();
        return re;


    }

    public Thing findthingbyid(int id){
        Session session = sessionFactory.openSession();
        Thing thing = (Thing) session.createQuery("from Thing t where t.id ="+id).uniqueResult();
        session.close();
        return thing;
    }


}
