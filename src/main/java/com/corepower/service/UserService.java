package com.corepower.service;

import com.corepower.domain.User;
import com.corepower.domain.PageInfo;

import java.util.List;

public interface UserService {
    public User findUser(User user);
    //找到所有所有数据
    public List<User> getAll();

    //分页查询
    public PageInfo<User> findPageInfo(String username, String relname,Integer id, Integer pageIndex, Integer pageSize);

    public int addUser(User user);
    public int saveUserRole(User user); //添加管理员信息
    public int deleteUser(Integer id);   //删除管理员信息
    public int updateUser(User user);//修改管理员信息
    public  int updateInf(User user);
    public User findUserById(Integer id);
    public void updatePassword(User user);//修改当前登录用户的密码
}
