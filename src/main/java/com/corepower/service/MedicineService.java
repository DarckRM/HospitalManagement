package com.corepower.service;

import com.corepower.domain.Medicine;
import com.corepower.domain.PageInfo;

public interface MedicineService {
    //分页查询所有客户列表
    public PageInfo<Medicine> findPageInfo(String mname, Integer type, Integer pageIndex, Integer pageSize);
    //更新客户信息
    public Medicine updateCustomer(Medicine medicine);
    //插入客户信息
    public Medicine insertCustomer(Medicine medicine);
    //删除客户信息
    public Medicine deleteCustomer(String id);
}
