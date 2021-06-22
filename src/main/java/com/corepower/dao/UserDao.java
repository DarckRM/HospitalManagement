package com.corepower.dao;

import com.corepower.domain.User;
import com.corepower.domain.PageInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Repository
public interface UserDao {
    //通过账号和密码查找管理员
   @Select("select * from users where username = #{username} and password=#{password} ")
    public User findUser(User user);
    //找到所有所有数据
    //获取总条数
   //@Select(" select * from t_user")
    //@Select("select count(id) from t_user ")
    public Integer totalCount(@Param("username") String username, @Param("relname") String relname, @Param("id") Integer id);
    //获取用户列表
   // @Select(" select * from t_user")
    public List<User> getAdminList(@Param("username") String username, @Param("relname") String relname,@Param("id") Integer id, @Param("currentPage") Integer currentPage, @Param("pageSize") Integer pageSize);

    public int addUser(User user);    //添加管理员信息
    public int saveUserRole(User user);
    @Delete(" delete from t_user where  id = #{id} ")
    public int deleteUser(Integer id);   //删除管理员信息
    public int updateUser(User user); //修改管理员信息
    //@Update("update t_userrole set roleid=#{roleid} where userid=#{id}")
    public int updateInf(User user);
    public User findUserById(Integer id);
    public List<User> getAll();
    @Update("update t_user set password = #{password} where id = #{id}")
    public void updatePassword(User user);
}
