package Serviceapi;


import DTO.ThingDTO;
import Dao.ThingDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ThingService {

    int addThing(ThingDTO dto);


    List<ThingDTO> listThing();

    ThingDTO thingDetail(int id);

}
