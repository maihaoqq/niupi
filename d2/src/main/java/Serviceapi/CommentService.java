package Serviceapi;

import DTO.CommentDTO;
import enity.Comment;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CommentService {

    boolean addComment(CommentDTO dto);

    List<CommentDTO> listCommnet(int id);
}
