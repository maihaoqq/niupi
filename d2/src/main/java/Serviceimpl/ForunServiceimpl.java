package Serviceimpl;

import DTO.ForunDTO;
import Dao.ForunDao;
import Dao.UserDao;
import Serviceapi.ForunService;
import enity.Forun;
import enity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class ForunServiceimpl implements ForunService {

    @Autowired
    private ForunDao forunDao;

    @Autowired
    private UserDao userDao;


    public boolean addForun(ForunDTO forunDto) {
        User u1 = userDao.findUserbyid(forunDto.getUser_id());
        Forun f1 = new Forun();
        f1.setImg("images/touxiang/"+u1.getId()+".jpg");
//        f1.setA_href(forunDto.getA_href());
        f1.setComment(0);
        f1.setLastest_time(new Date());
        f1.setUser_name(u1.getUserName());
//        f1.setSchool(u1.getUserName());
//        f1.setSex();
        f1.setStart_time(new Date());
        f1.setTopic(forunDto.getTopic());
//        f1.setTop(forunDto.isTop());
        f1.setTt(forunDto.getTt());
        f1.setUser_id(forunDto.getUser_id());
        f1.setTxt(forunDto.getTxt());
        forunDao.addForun(f1);
        Forun f2= forunDao.findForunbynew(u1.getId());
        f2.setA_href("page?id="+f2.getId());
        forunDao.addForun2(f2);
        return false;
    }


    //模拟增加
    public boolean addForun2(ForunDTO forunDto) {
        Forun f1 = new Forun();
        f1.setImg(forunDto.getImg());
        f1.setA_href(forunDto.getA_href());
        f1.setComment(forunDto.getComment());
        f1.setLastest_time(forunDto.getLastest());
        f1.setSchool(forunDto.getSchool());
        f1.setSex(forunDto.getSex());
        f1.setStart_time(forunDto.getStart());
        f1.setTopic(forunDto.getTopic());
        f1.setTop(forunDto.isTop());
        f1.setTt(forunDto.getTt());
        f1.setYear(forunDto.getYear());
        f1.setUser_id(forunDto.getUser_id());
        f1.setUser_name(forunDto.getUser_name());
        f1.setTxt(forunDto.getTxt());
        forunDao.addForun(f1);
        return false;
    }


    public List<ForunDTO> listForunOne() {
       List<Forun> list =forunDao.listForun(1);
        List<ForunDTO> re = new ArrayList<ForunDTO>();
       for(int i=0;i<list.size();i++){
           Forun forun = list.get(i);
           ForunDTO dto = new ForunDTO();
           dto.setImg(forun.getImg());
           dto.setA_href(forun.getA_href());
           dto.setComment(forun.getComment());
           dto.setLastest_time(forun.getLastest_time()+"");
           dto.setLastest(forun.getLastest_time());
           dto.setSchool(forun.getSchool());
           dto.setSex(forun.getSex());
           dto.setStart_time(forun.getStart_time()+"");
           dto.setStart(forun.getStart_time());
           dto.setTopic(forun.getTopic());
           dto.setTop(forun.isTop());
           dto.setTt(forun.getTt());
           dto.setYear(forun.getYear());
           dto.setUser_name(forun.getUser_name());
           dto.setUser_id(forun.getUser_id());
           HashMap<String,String> map = new HashMap<String, String>();
           dto.setUser_mes(map);
            dto.getUser_mes().put("name",forun.getUser_name());
           dto.getUser_mes().put("sex",dto.getSex());
           dto.getUser_mes().put("year",dto.getYear());
           dto.getUser_mes().put("school",dto.getSchool());
           dto.getUser_mes().put("id",dto.getUser_id()+"");
           re.add(dto);
       }
        return re;
    }

    public List<ForunDTO> listForunTwo(int index) {
        List<Forun> list =forunDao.listForun(index);
        List<ForunDTO> re = new ArrayList<ForunDTO>();
        for(int i=0;i<list.size();i++){
            Forun forun = list.get(i);
            ForunDTO dto = new ForunDTO();
            dto.setImg(forun.getImg());
            dto.setA_href(forun.getA_href());
            dto.setComment(forun.getComment());
            dto.setLastest_time(forun.getLastest_time()+"");
            dto.setLastest(forun.getLastest_time());
            dto.setSchool(forun.getSchool());
            dto.setSex(forun.getSex());
            dto.setStart_time(forun.getStart_time()+"");
            dto.setStart(forun.getStart_time());
            dto.setTopic(forun.getTopic());
            dto.setTop(forun.isTop());
            dto.setTt(forun.getTt());
            dto.setYear(forun.getYear());
            dto.setUser_name(forun.getUser_name());
            dto.setUser_id(forun.getUser_id());
            HashMap<String,String> map = new HashMap<String, String>();
            dto.setUser_mes(map);
            dto.getUser_mes().put("name",forun.getUser_name());
            dto.getUser_mes().put("sex",dto.getSex());
            dto.getUser_mes().put("year",dto.getYear());
            dto.getUser_mes().put("school",dto.getSchool());
            dto.getUser_mes().put("id",dto.getUser_id()+"");
            re.add(dto);
        }
        return re;
    }

    public ForunDTO findForunbyid(int id) {
        Forun forun = forunDao.findForunbyid(id);
        ForunDTO dto = new ForunDTO();
        dto.setTxt(forun.getTxt());
        dto.setImg(forun.getImg());
        dto.setA_href(forun.getA_href());
        dto.setComment(forun.getComment());
        dto.setLastest_time(forun.getLastest_time()+"");
        dto.setLastest(forun.getLastest_time());
        dto.setSchool(forun.getSchool());
        dto.setSex(forun.getSex());
        dto.setStart_time(forun.getStart_time()+"");
        dto.setStart(forun.getStart_time());
        dto.setTopic(forun.getTopic());
        dto.setTop(forun.isTop());
        dto.setTt(forun.getTt());
        dto.setYear(forun.getYear());
        dto.setUser_name(forun.getUser_name());
        HashMap<String,String> map = new HashMap<String, String>();
        dto.setUser_mes(map);
        dto.getUser_mes().put("name",forun.getUser_name());
        dto.getUser_mes().put("sex",dto.getSex());
        dto.getUser_mes().put("year",dto.getYear());
        dto.getUser_mes().put("school",dto.getSchool());

        return dto;
    }

    public List<ForunDTO> listForunUser(int id) {
        List<Forun> foruns = forunDao.listForunUser(id);
        List<ForunDTO> re = new ArrayList<ForunDTO>();
        for(int i = 0 ; i<foruns.size(); i++){
            Forun f = foruns.get(i);
            ForunDTO dto = new ForunDTO();
            dto.setTt(f.getTt());
            dto.setId(f.getId());
            dto.setA_href(f.getA_href());
            re.add(dto);
        }
        return re;
    }

    public boolean deleteForun(int id) {

        return forunDao.deleteForun(id);
    }
}
