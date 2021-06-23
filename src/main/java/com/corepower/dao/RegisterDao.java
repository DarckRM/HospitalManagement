package com.corepower.dao;

import com.corepower.domain.Doctor;
import com.corepower.domain.Register;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RegisterDao {
     @Select("select * from register")
    public List<Register> findAll();

    //获取总条数
    public Integer totalCount(@Param("name") String name, @Param("department") Integer department, @Param("didName") String  didName);

    //获取用户列表
    public List<Register> findRegisterList(@Param("name") String name, @Param("department") Integer department, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize, @Param("didName") String  didName);

    //更新用户信息

    public int updateRegister(Register register);

    //插入客户信息
    public int add(Register register);

    //删除客户信息
    @Delete("delete from register where rid = #{rid}")
    public int delete(String did);
}
