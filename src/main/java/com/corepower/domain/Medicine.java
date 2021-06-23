package com.corepower.domain;

public class Medicine {
    private String mid;
    private int inprice;
    private int salprice;
    private String mname;
    private int type;
    private String typename;
    private String descs;
    private String description;
    private String producefirm;
    private String readme;
    private String remark;
    private int qualitydate;

    public int getQualitydate() {
        return qualitydate;
    }

    public void setQualitydate(int qualitydate) {
        this.qualitydate = qualitydate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public int getInprice() {
        return inprice;
    }

    public void setInprice(int inprice) {
        this.inprice = inprice;
    }

    public int getSalprice() {
        return salprice;
    }

    public void setSalprice(int salprice) {
        this.salprice = salprice;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public String getDescs() {
        return descs;
    }

    public void setDescs(String descs) {
        this.descs = descs;
    }

    public String getProducefirm() {
        return producefirm;
    }

    public void setProducefirm(String producefirm) {
        this.producefirm = producefirm;
    }

    public String getReadme() {
        return readme;
    }

    public void setReadme(String readme) {
        this.readme = readme;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "Medicine{" +
                "mid=" + mid +
                ", inprice=" + inprice +
                ", salprice=" + salprice +
                ", description=" + description +
                ", qualitydate=" + qualitydate +
                ", mname='" + mname + '\'' +
                ", type=" + type +
                ", typename='" + typename + '\'' +
                ", descs='" + descs + '\'' +
                ", producefirm='" + producefirm + '\'' +
                ", readme='" + readme + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
