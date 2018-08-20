package enity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.util.Date;

@Entity
public class Thing {

    @Id
    @GeneratedValue
    private int id;

    private long phone;

    private String things_name;

    private String things_loc;

    private String things_new;

    private int things_price;

    private String things_txt;

    private String things_img;

    private Date things_start;

    private String a_href;

    private Date things_end;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public String getThings_name() {
        return things_name;
    }

    public void setThings_name(String things_name) {
        this.things_name = things_name;
    }

    public String getThings_loc() {
        return things_loc;
    }

    public void setThings_loc(String things_loc) {
        this.things_loc = things_loc;
    }

    public String getThings_new() {
        return things_new;
    }

    public void setThings_new(String things_new) {
        this.things_new = things_new;
    }

    public int getThings_pirce() {
        return things_price;
    }

    public void setThings_pirce(int things_pirce) {
        this.things_price = things_pirce;
    }

    public String getThings_txt() {
        return things_txt;
    }

    public void setThings_txt(String things_txt) {
        this.things_txt = things_txt;
    }

    public String getThings_img() {
        return things_img;
    }

    public void setThings_img(String things_img) {
        this.things_img = things_img;
    }

    public Date getThings_start() {
        return things_start;
    }

    public void setThings_start(Date things_start) {
        this.things_start = things_start;
    }

    public String getA_href() {
        return a_href;
    }

    public void setA_href(String a_href) {
        this.a_href = a_href;
    }

    public Date getThings_end() {
        return things_end;
    }

    public void setThings_end(Date things_end) {
        this.things_end = things_end;
    }
}
