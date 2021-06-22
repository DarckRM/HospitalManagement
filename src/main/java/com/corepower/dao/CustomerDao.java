package com.corepower.dao;

import com.corepower.domain.Customer;
import com.corepower.domain.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CustomerDao {

    //找到所有所有数据
    @Select("SELECT * FROM doctor")
    public List<Customer> getAll();

    //获取总条数
    public Integer totalCount(@Param("dname") String dname, @Param("department") Integer department);

    //获取用户列表
    public List<Customer> getCustomerList(@Param("dname") String name, @Param("department") Integer id, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    //更新用户信息
    @Select("update doctor set nickname = #{nickname}, sex = #{sex}, avatar = #{avatar}, phone = #{phone} where id = #{id}")
    public Customer updateCustomer(Customer customer);

    //插入客户信息
    @Select("INSERT INTO t_customer (openid,nickname,relname,sex,no,email,mobilephone,avatar,height,weight,shoesize,head,chest,waist,buttock) VALUES (#{openid},#{nickname},#{relname}," +
            "#{sex},#{no},#{email},#{mobilephone},#{avatar},#{height},#{weight},#{shoesize},#{head},#{chest},#{waist},#{buttock})")
    public Customer insertCustomer(Customer customer);

    //删除客户信息
    @Select("delete from t_customer where id = #{id}")
    public Customer deleteCustomer(Integer id);
}
