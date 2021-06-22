package com.corepower.dao;

import com.corepower.domain.Siteinfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import java.util.List;
@Repository
public interface SiteinfoDao {
    //查询站点信息
    @Select("select * from t_siteinfo")
    public Siteinfo findSiteinfo();
    //修改站点信息
    @Select("update t_siteinfo set name = #{name}, address = #{address}, contactperson = #{contactperson}, telephone = #{telephone}, mobilephone = #{mobilephone}, helpcontent = #{helpcontent}, memo = #{memo}")
    public void updateSiteinfo(Siteinfo siteinfo);
}
