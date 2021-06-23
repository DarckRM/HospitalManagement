package com.corepower.service.impl;

import com.corepower.dao.DoctorDao;
import com.corepower.dao.MedicineDao;
import com.corepower.domain.Doctor;
import com.corepower.domain.Medicine;
import com.corepower.domain.PageInfo;
import com.corepower.service.MedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MedicineServiceImpl implements MedicineService {
    @Autowired
    private MedicineDao medicineDao;
    //分页查询调用DAO层查询所有客户列表
    @Override
    public PageInfo<Medicine> findPageInfo(String mname, Integer type, Integer pageIndex, Integer pageSize) {
        PageInfo<Medicine> mi = new PageInfo<Medicine>();
        mi.setPageIndex(pageIndex);
        mi.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = medicineDao.totalCount(mname,type);
        if (totalCount>0){
            mi.setTotalCount(totalCount);
            //每一页显示客户信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Medicine> medicineList = medicineDao.getCustomerList(mname,type,(mi.getPageIndex()-1)*mi.getPageSize(),mi.getPageSize());
            mi.setList(medicineList);
        }
        return mi;
    }
    @Override
    public Medicine updateCustomer(Medicine medicine){
        return medicineDao.updateCustomer(medicine);
    }
    @Override
    public Medicine insertCustomer(Medicine medicine){
        return medicineDao.insertCustomer(medicine);
    }
    @Override
    public Medicine deleteCustomer(String id){
        return medicineDao.deleteCustomer(id);
    }
}
