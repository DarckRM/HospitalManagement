package com.corepower.domain;

import java.sql.Timestamp;

public class Cstatus {
    private int id;
    private int customerid;
    private String relname;

    public String getRelname() {
        return relname;
    }

    public void setRelname(String relname) {
        this.relname = relname;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    private String nickname;
    private float temperature;
    private String isfever;
    private String isweakness;
    private String isheadache;
    private String issorethroat;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomerid() {
        return customerid;
    }

    public void setCustomerid(int customerid) {
        this.customerid = customerid;
    }

    public float getTemperature() {
        return temperature;
    }

    public void setTemperature(float temperature) {
        this.temperature = temperature;
    }

    public String getIsfever() {
        return isfever;
    }

    public void setIsfever(String isfever) {
        this.isfever = isfever;
    }

    public String getIsweakness() {
        return isweakness;
    }

    public void setIsweakness(String isweakness) {
        this.isweakness = isweakness;
    }

    public String getIsheadache() {
        return isheadache;
    }

    public void setIsheadache(String isheadache) {
        this.isheadache = isheadache;
    }

    public String getIssorethroat() {
        return issorethroat;
    }

    public void setIssorethroat(String issorethroat) {
        this.issorethroat = issorethroat;
    }

    public String getIsabdominalpain() {
        return isabdominalpain;
    }

    public void setIsabdominalpain(String isabdominalpain) {
        this.isabdominalpain = isabdominalpain;
    }

    public String getOthers() {
        return others;
    }

    public void setOthers(String others) {
        this.others = others;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    private String isabdominalpain;
    private String others;
    private String createtime;

    @Override
    public String toString() {
        return "Cstatus{" +
                "id=" + id +
                ", customerid=" + customerid +
                ", relname='" + relname + '\'' +
                ", nickname='" + nickname + '\'' +
                ", temperature=" + temperature +
                ", isfever='" + isfever + '\'' +
                ", isweakness='" + isweakness + '\'' +
                ", isheadache='" + isheadache + '\'' +
                ", issorethroat='" + issorethroat + '\'' +
                ", isabdominalpain='" + isabdominalpain + '\'' +
                ", others='" + others + '\'' +
                ", createtime='" + createtime + '\'' +
                ", memo='" + memo + '\'' +
                '}';
    }

    private String memo;
}
