package Serviceimpl;

import DTO.CommentDTO;
import Dao.CommentDao;
import Dao.ForunDao;
import Dao.UserDao;
import Serviceapi.CommentService;
import enity.Comment;
import enity.Forun;
import enity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class CommentServiceimpl implements CommentService  {

    @Autowired
    private CommentDao commentDao;

    @Autowired
    private ForunDao forunDao;

    @Autowired
    private UserDao userDao;

    public boolean addComment(CommentDTO dto) {
        Comment comment = new Comment();
        comment.setForun_id(dto.getForun_id());
        comment.setStart(new Date()+"");
        comment.setStart_time(new Date());
        comment.setTxt(dto.getTxt());
        comment.setUser_id(dto.getUser_id());

        User u = userDao.findUserbyid(dto.getUser_id());
        comment.setUser_name(u.getUserName());
        boolean flag =  commentDao.addComment(comment);
        if(flag){
            Forun f = forunDao.findForunbyid(dto.getForun_id());

            forunDao.newComment(f);

            return true;
        }
        return false;
    }

    public List<CommentDTO> listCommnet(int id) {
        List<Comment> list = commentDao.listComment(id);
        List<CommentDTO> re = new ArrayList<CommentDTO>();

        for(int i = 0 ; i<list.size();i++){
            Comment c = list.get(i);
            CommentDTO dto = new CommentDTO();
            dto.setUser_id(c.getUser_id());
            dto.setTxt(c.getTxt());
            dto.setUser_name(c.getUser_name());
            User u = userDao.findUserbyid(c.getUser_id());
            if(u.getIstouxiang()==1){
               dto.setHead_img("images/touxiang/"+u.getId()+".jpg");
            }else{
                dto.setHead_img("images/local/init.jpg");
            }
            dto.setStart_time(c.getStart_time()+"");
            re.add(dto);
        }

        return re;
    }
}
