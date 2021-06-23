package com.corepower.dao;

import com.corepower.domain.Doctor;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DoctorDao {

    //找到所有所有数据
    @Select("SELECT * FROM doctor")
    public List<Doctor> getAll();

    //获取总条数
    public Integer totalCount(@Param("dname") String dname, @Param("department") Integer department);

    //获取用户列表
    public List<Doctor> getCustomerList(@Param("dname") String name, @Param("department") Integer id, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    //更新用户信息
    public Doctor updateCustomer(Doctor doctor);

    //插入客户信息
    public Doctor insertCustomer(Doctor doctor);

    //删除客户信息
    @Select("delete from doctor where did = #{did}")
    public Doctor deleteCustomer(Integer did);
}
