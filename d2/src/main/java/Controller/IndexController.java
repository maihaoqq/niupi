package Controller;

import com.alibaba.dubbo.common.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

@Controller
public class IndexController {

    @RequestMapping("showcontentjson")
    @ResponseBody
    public Object contentjson() {
        System.out.println("上");
        JSONObject json = new JSONObject();
        json.put("content", "局部刷新返回json后拼凑html");
        String detailOk = "ok";
        json.put("detailOk", detailOk);
        return json;
    }

    @RequestMapping("showcontent")
    public String content(Model model)
            throws IOException {
        System.out.println("下");
        model.addAttribute("content", "局部刷新返回整个页面");
        return "content";
    }

    @RequestMapping("/")
    public String index(Model model)
            throws IOException {

        return "index";
    }


}