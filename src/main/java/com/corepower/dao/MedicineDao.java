package com.corepower.dao;

import com.corepower.domain.Doctor;
import com.corepower.domain.Medicine;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MedicineDao {
    //找到所有所有数据
    @Select("SELECT * FROM medicine")
    public List<Medicine> getAll();

    //获取总条数
    public Integer totalCount(@Param("mname") String dname, @Param("type") Integer department);

    //获取用户列表
    public List<Medicine> getCustomerList(@Param("mname") String name, @Param("type") Integer id, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    //更新用户信息
    public Medicine updateCustomer(Medicine medicine);

    //插入客户信息
    public Medicine insertCustomer(Medicine medicine);

    //删除客户信息
    @Select("delete from medicine where mid = #{id}")
    public Medicine deleteCustomer(String id);
}
