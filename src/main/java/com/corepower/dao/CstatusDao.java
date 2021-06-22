package com.corepower.dao;

import com.corepower.domain.Cstatus;
import com.corepower.domain.Customer;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CstatusDao {
    //查询所有客户身体状态列表
    @Select("SELECT t_customer.id,relname,nickname,temperature,isfever,isheadache,isweakness,issorethroat,isabdominalpain from t_cstatus,t_customer where t_customer.id = t_cstatus.customerid")
    public Cstatus findCstatus();
    //获取总条数
    public Integer totalCount(@Param("nickname") String username, @Param("relname") String relname, @Param("customerid") Integer id);
    //获取用户列表
    public List<Cstatus> getCstatusList(@Param("nickname") String username, @Param("relname") String relname, @Param("customerid") Integer id, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);
    //更新用户信息
    @Select("UPDATE t_cstatus SET temperature = #{temperature}, isfever = #{isfever},isheadache = #{isheadache}, isweakness = #{isweakness}, issorethroat = #{issorethroat}, isabdominalpain = #{isabdominalpain}, memo = #{memo} WHERE id = #{id}")
    public Cstatus updateCstatus(Cstatus cstatus);
    //插入客户状态信息
    @Select("INSERT INTO t_cstatus (customerid, temperature, isfever, isweakness, isheadache, issorethroat, isabdominalpain, memo) VALUES (#{customerid}, #{temperature}, #{isfever}, #{isweakness}, #{isheadache}, #{issorethroat}, #{isabdominalpain}, #{memo})")
    public Cstatus insertCstatus(Cstatus cstatus);
    //删除客户状态信息
    @Select("DELETE FROM t_cstatus WHERE id = #{id}")
    public Cstatus deleteCstatus(Integer id);
}
