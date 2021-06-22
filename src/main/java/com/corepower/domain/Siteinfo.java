package com.corepower.domain;

import java.io.Serializable;

/**
 * 帐户
 */
public class Siteinfo implements Serializable {

    private int  id;
    private String name;
    private String address;
    private String contactperson;
    private String telephone;
    private String mobilephone;
    private String helpcontent;

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    private String memo;


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContactperson() {
        return contactperson;
    }

    public void setContactperson(String contactperson) {
        this.contactperson = contactperson;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getMobilephone() {
        return mobilephone;
    }

    public void setMobilephone(String mobilephone) {
        this.mobilephone = mobilephone;
    }

    public String getHelpcontent() {
        return helpcontent;
    }

    public void setHelpcontent(String helpcontent) {
        this.helpcontent = helpcontent;
    }

    @Override
    public String toString() {
        return "Siteinfo{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", contactperson='" + contactperson + '\'' +
                ", telephone='" + telephone + '\'' +
                ", mobilephone='" + mobilephone + '\'' +
                ", helpcontent='" + helpcontent + '\'' +
                ", memo='" + memo + '\'' +
                '}';
    }
}
