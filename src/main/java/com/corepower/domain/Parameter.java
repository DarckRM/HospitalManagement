package com.corepower.domain;
import java.io.Serializable;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class Parameter implements Serializable {
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCarnumber() {
        return carnumber;
    }

    public void setCarnumber(String carnumber) {
        this.carnumber = carnumber;
    }

    public Float getPremoney() {
        return premoney;
    }

    public void setPremoney(Float premoney) {
        this.premoney = premoney;
    }

    public String getAccess_token() {
        return access_token;
    }

    public void setAccess_token(String access_token) {
        this.access_token = access_token;
    }

    public String getAccess_youxrq() {
        return access_youxrq;
    }

    public void setAccess_youxrq(String access_youxrq) {
        this.access_youxrq = access_youxrq;
    }

    public int getShortmsgcount() {
        return shortmsgcount;
    }

    public void setShortmsgcount(int shortmsgcount) {
        this.shortmsgcount = shortmsgcount;
    }

    public String getShortmsgtemplate() {
        return shortmsgtemplate;
    }

    public void setShortmsgtemplate(String shortmsgtemplate) {
        this.shortmsgtemplate = shortmsgtemplate;
    }

    public int getSubmitendhour() {
        return submitendhour;
    }

    public void setSubmitendhour(int submitendhour) {
        this.submitendhour = submitendhour;
    }

    public int getShortmsgvalidsecond() {
        return shortmsgvalidsecond;
    }

    public void setShortmsgvalidsecond(int shortmsgvalidsecond) {
        this.shortmsgvalidsecond = shortmsgvalidsecond;
    }

    private String carnumber;
    private Float premoney;
    private String access_token;
    //@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    private String access_youxrq;
    private int shortmsgcount;
    private String shortmsgtemplate;
    private int submitendhour;
    private int shortmsgvalidsecond;
    @Override
    public String toString() {
        return "Parameter{" +
                "id=" + id +
                ", carnumber='" + carnumber + '\'' +
                ", premoney=" + premoney +
                ", access_token='" + access_token + '\'' +
                ", access_youxrq=" + access_youxrq +
                ", shortmsgcount=" + shortmsgcount +
                ", shortmsgtemplate='" + shortmsgtemplate + '\'' +
                ", submitendhour=" + submitendhour +
                ", shortmsgvalidsecond=" + shortmsgvalidsecond +
                '}';
    }
}
