package com.corepower.domain;

import java.util.Date;

public class Register {
    private  String rid;
    private  String name;
    private  String idCard;
    private  String siNumber;
    private  double registerMoney;
    private  String phone;
    private  int isPay;
    private  int sex;
    private  int age;
    private  int consultation;
    private  int department;
    private  int did;
    private  int status;
    private Date  registerDate;
    private String remark;
    private String departmentName;
    private String didName;

    public String getRid() {
        return rid;
    }

    public void setRid(String rid) {
        this.rid = rid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getSiNumber() {
        return siNumber;
    }

    public void setSiNumber(String siNumber) {
        this.siNumber = siNumber;
    }

    public double getRegisterMoney() {
        return registerMoney;
    }

    public void setRegisterMoney(double registerMoney) {
        this.registerMoney = registerMoney;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getIsPay() {
        return isPay;
    }

    public void setIsPay(int isPay) {
        this.isPay = isPay;
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

    public int getConsultation() {
        return consultation;
    }

    public void setConsultation(int consultation) {
        this.consultation = consultation;
    }

    public int getDepartment() {
        return department;
    }

    public void setDepartment(int department) {
        this.department = department;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getDidName() {
        return didName;
    }

    @Override
    public String toString() {
        return "Register{" +
                "rid='" + rid + '\'' +
                ", name='" + name + '\'' +
                ", idCard='" + idCard + '\'' +
                ", siNumber='" + siNumber + '\'' +
                ", registerMoney=" + registerMoney +
                ", phone='" + phone + '\'' +
                ", isPay=" + isPay +
                ", sex=" + sex +
                ", age=" + age +
                ", consultation=" + consultation +
                ", department=" + department +
                ", did=" + did +
                ", status=" + status +
                ", registerDate=" + registerDate +
                ", remark='" + remark + '\'' +
                ", departmentName='" + departmentName + '\'' +
                ", didName='" + didName + '\'' +
                '}';
    }

    public void setDidName(String didName) {
        this.didName = didName;
    }

}
