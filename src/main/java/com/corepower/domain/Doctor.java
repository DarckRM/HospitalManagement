package com.corepower.domain;

import java.util.Date;

public class Doctor {
    private int did;
    private String dname;
    private String cardno;
    private String phone;
    private int sex;
    private int age;
    private Date birthday;
    private String email;
    private int department;
    private int education;
    private String educated;
    private String departmentname;
    private String remark;

    public String getEducated() {
        return educated;
    }

    public void setEducated(String educated) {
        this.educated = educated;
    }

    public String getDepartmentname() {
        return departmentname;
    }

    public void setDepartmentname(String departmentname) {
        this.departmentname = departmentname;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getCardno() {
        return cardno;
    }

    public void setCardno(String cardno) {
        this.cardno = cardno;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getDepartment() {
        return department;
    }

    public void setDepartment(int department) {
        this.department = department;
    }

    public int getEducation() {
        return education;
    }

    public void setEducation(int education) {
        this.education = education;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "did=" + did +
                ", dname='" + dname + '\'' +
                ", cardno='" + cardno + '\'' +
                ", phone='" + phone + '\'' +
                ", sex=" + sex +
                ", age=" + age +
                ", birthday=" + birthday +
                ", email='" + email + '\'' +
                ", department=" + department +
                ", education=" + education +
                ", departmentname=" + departmentname +
                ", educated=" + educated +
                ", remark='" + remark + '\'' +
                '}';
    }
}
