package com.corepower.service.impl;

import com.corepower.dao.UserDao;
import com.corepower.domain.User;
import  com.corepower.domain.PageInfo;
import com.corepower.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;
/*@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")*/
@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public User findUser(User user) {
        User a = userDao.findUser(user );
        return a;
    }
    @Override
    public List<User> getAll(){
        List<User> adminList = userDao.getAll();
        return adminList;
    }

    @Override
    public PageInfo<User> findPageInfo(String username, String relname,Integer id,Integer pageIndex, Integer pageSize) {
        PageInfo<User> pi = new PageInfo<User>();
        pi.setPageIndex(pageIndex);
        pi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = userDao.totalCount(username,relname,id);
        if (totalCount>0){
            pi.setTotalCount(totalCount);
            //每一页显示管理员信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<User> adminList =	userDao.getAdminList(username,relname,id,
                    (pi.getPageIndex()-1)*pi.getPageSize(),pi.getPageSize());
            pi.setList(adminList);
        }
        return pi;
    }
    //添加管理员信息
    @Override
    public int addUser(User user) {
        return userDao.addUser(user);
    }
    //添加userrole
    @Override
    public int saveUserRole(User user) {
        return userDao.saveUserRole(user);
    }

    //通过id删除管理员信息
    @Override
    public int deleteUser(Integer id) {
        return userDao.deleteUser(id);
    }

    //修改管理员信息
    @Override
    public int updateUser(User user) {
        return userDao.updateUser(user);
    }
    //修改id
    @Override
    public int updateInf(User user) {

        return userDao.updateInf(user);
    }
    @Override
    public User findUserById (Integer id){
        User a = userDao.findUserById(id);
        return  a;
    }
    @Override
    public void updatePassword(User user){
        userDao.updatePassword(user);
    }
}
