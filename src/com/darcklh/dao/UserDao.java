package com.darcklh.dao;

import com.darcklh.entity.User;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface UserDao {

    @Select("SELECT * FROM users")
    public List<User> findall();

}
