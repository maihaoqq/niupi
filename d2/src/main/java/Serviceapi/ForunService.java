package Serviceapi;

import DTO.ForunDTO;
import enity.Forun;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ForunService {

    boolean addForun(ForunDTO forunDto);

    List<ForunDTO> listForunOne();

    List<ForunDTO> listForunTwo(int index);

    ForunDTO findForunbyid(int id);

    List<ForunDTO> listForunUser(int id);

    boolean deleteForun(int id);

}
