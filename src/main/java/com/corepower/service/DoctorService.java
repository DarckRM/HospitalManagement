package com.corepower.service;

import com.corepower.domain.Doctor;
import com.corepower.domain.PageInfo;

public interface DoctorService {
    //分页查询所有客户列表
    public PageInfo<Doctor> findPageInfo(String name, Integer department, Integer pageIndex, Integer pageSize);
    //更新客户信息
    public Doctor updateCustomer(Doctor doctor);
    //插入客户信息
    public Doctor insertCustomer(Doctor doctor);
    //删除客户信息
    public Doctor deleteCustomer(Integer id);
}
