package com.corepower.service.impl;

import com.corepower.dao.CustomerDao;
import com.corepower.domain.Customer;
import com.corepower.domain.PageInfo;
import com.corepower.domain.User;
import com.corepower.service.CustomerService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
/*@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")*/

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerDao customerDao;
    //分页查询调用DAO层查询所有客户列表
    @Override
    public PageInfo<Customer> findPageInfo(String dname, Integer department, Integer pageIndex, Integer pageSize) {
        PageInfo<Customer> ci = new PageInfo<Customer>();
        ci.setPageIndex(pageIndex);
        ci.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = customerDao.totalCount(dname,department);
        if (totalCount>0){
            ci.setTotalCount(totalCount);
            //每一页显示客户信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Customer> customerList = customerDao.getCustomerList(dname,department,(ci.getPageIndex()-1)*ci.getPageSize(),ci.getPageSize());
            ci.setList(customerList);
        }
        return ci;
    }
    @Override
    public Customer updateCustomer(Customer customer){
        return customerDao.updateCustomer(customer);
    }
    @Override
    public Customer insertCustomer(Customer customer){
        return customerDao.insertCustomer(customer);
    }
    @Override
    public Customer deleteCustomer(Integer id){
        return  customerDao.deleteCustomer(id);
    }
}
