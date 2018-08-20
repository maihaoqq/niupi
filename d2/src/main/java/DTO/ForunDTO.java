package DTO;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class ForunDTO {

    private int id;

    private List<CommentDTO> comment_mes;

    public List<CommentDTO> getComment_mes() {
        return comment_mes;
    }

    public void setComment_mes(List<CommentDTO> comment_mes) {
        this.comment_mes = comment_mes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private String topic;

    private String tt;

    private String user_name;


    private String img;

    private Date start;

    private Date lastest;

    private String start_time;

    private String txt;

    public String getTxt() {
        return txt;
    }

    public void setTxt(String txt) {
        this.txt = txt;
    }

    @Override
    public String toString() {
        return "ForunDTO{" +
                "topic='" + topic + '\'' +
                ", tt='" + tt + '\'' +
                ", user_name='" + user_name + '\'' +
                ", img='" + img + '\'' +
                ", start=" + start +
                ", lastest=" + lastest +
                ", start_time='" + start_time + '\'' +
                ", lastest_time='" + lastest_time + '\'' +
                ", comment=" + comment +
                ", top=" + top +
                ", a_href='" + a_href + '\'' +
                ", user_id=" + user_id +
                ", sex='" + sex + '\'' +
                ", year='" + year + '\'' +
                ", school='" + school + '\'' +
                ", user_mes=" + user_mes +
                '}';
    }

    private String lastest_time;

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Date getLastest() {
        return lastest;
    }

    public void setLastest(Date lastest) {
        this.lastest = lastest;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getLastest_time() {
        return lastest_time;
    }

    public void setLastest_time(String lastest_time) {
        this.lastest_time = lastest_time;
    }

    private int comment;

    private boolean top;

    private String a_href;

    private int user_id;

    private String sex;

    private String year;

    private String school;

    private HashMap<String,String> user_mes;

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getTt() {
        return tt;
    }

    public void setTt(String tt) {
        this.tt = tt;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }


    public int getComment() {
        return comment;
    }

    public void setComment(int comment) {
        this.comment = comment;
    }

    public boolean isTop() {
        return top;
    }

    public void setTop(boolean top) {
        this.top = top;
    }

    public String getA_href() {
        return a_href;
    }

    public void setA_href(String a_href) {
        this.a_href = a_href;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public HashMap<String, String> getUser_mes() {
        return user_mes;
    }

    public void setUser_mes(HashMap<String, String> user_mes) {
        this.user_mes = user_mes;
    }


}
