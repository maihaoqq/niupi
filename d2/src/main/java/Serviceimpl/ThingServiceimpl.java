package Serviceimpl;

import DTO.ThingDTO;
import Dao.ThingDao;
import Dao.UserDao;
import Serviceapi.ThingService;
import enity.Thing;
import enity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ThingServiceimpl implements ThingService {

    @Autowired
    private ThingDao thingdao;

    @Autowired
    private UserDao userDao;


    public int addThing(ThingDTO dto) {
        Thing u = new Thing();
        u.setPhone(dto.getPhone());

        u.setThings_loc(dto.getThings_loc());
        u.setThings_name(dto.getThings_name());
        u.setThings_pirce(dto.getThings_pirce());
        u.setThings_start(new Date());
        u.setThings_txt(dto.getThings_txt());

        thingdao.addThing(u);

        Thing newu = thingdao.findForunbynew(dto.getPhone());

        newu.setA_href("thingpage?id="+newu.getId());
        newu.setThings_img("images/thing/"+newu.getId()+".jpg");

        thingdao.addThing2(newu);




        return newu.getId();
    }

    public List<ThingDTO> listThing() {
        List<Thing> list = thingdao.listThing();
        List<ThingDTO> re = new ArrayList<ThingDTO>();
        SimpleDateFormat format =   new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
        for(int i=0;i<list.size();i++){
            Thing t = list.get(i);
            ThingDTO dto = new ThingDTO();

            dto.setPhone(t.getPhone());

            dto.setThings_loc(t.getThings_loc());
            dto.setThings_name(t.getThings_name());
            dto.setThings_pirce(t.getThings_pirce());

            dto.setStart_time(t.getThings_start()+"");
            Long now = new Date().getTime();
            Long past = t.getThings_start().getTime();
            Long least = now-past;

            dto.setLast_time(format.format(least)+"");
            dto.setThings_txt(t.getThings_txt());
            dto.setA_href(t.getA_href());
            dto.setThings_img(t.getThings_img());

            re.add(dto);

        }
        return re;

    }

    public ThingDTO thingDetail(int id) {
        Thing t = thingdao.findthingbyid(id);
        ThingDTO dto = new ThingDTO();
        SimpleDateFormat format =   new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
        dto.setPhone(t.getPhone());


        dto.setThings_loc(t.getThings_loc());
        dto.setThings_name(t.getThings_name());
        dto.setThings_pirce(t.getThings_pirce());

        dto.setStart_time(t.getThings_start()+"");
        Long now = new Date().getTime();
        Long past = t.getThings_start().getTime();
        Long least = now-past;

        dto.setLast_time(format.format(least)+"");
        dto.setThings_txt(t.getThings_txt());
        dto.setA_href(t.getA_href());
        dto.setThings_img(t.getThings_img());
        return dto;
    }
}
