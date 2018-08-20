package DTO;

import java.util.Date;
import java.util.List;

public class CommentDTO {
    private int id;

    private String txt;

    private String start_time;

    @Override
    public String toString() {
        return "CommentDTO{" +
                "id=" + id +
                ", txt='" + txt + '\'' +
                ", start_time=" + start_time +
                ", start='" + start + '\'' +
                ", user_id=" + user_id +
                ", forun_id=" + forun_id +
                ", head_img='" + head_img + '\'' +
                ", user_name='" + user_name + '\'' +
                '}';
    }

    private Date start;

    private int user_id;

    private int forun_id;

    private String head_img;

    private String user_name;



    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTxt() {
        return txt;
    }

    public void setTxt(String txt) {
        this.txt = txt;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getForun_id() {
        return forun_id;
    }

    public void setForun_id(int forun_id) {
        this.forun_id = forun_id;
    }

    public String getHead_img() {
        return head_img;
    }

    public void setHead_img(String head_img) {
        this.head_img = head_img;
    }
}
