package com.corepower.service;

import com.corepower.domain.Customer;
import com.corepower.domain.PageInfo;
import org.springframework.stereotype.Service;

public interface CustomerService {
    //分页查询所有客户列表
    public PageInfo<Customer> findPageInfo(String name, Integer department, Integer pageIndex, Integer pageSize);
    //更新客户信息
    public Customer updateCustomer(Customer customer);
    //插入客户信息
    public Customer insertCustomer(Customer customer);
    //删除客户信息
    public Customer deleteCustomer(Integer id);
}
