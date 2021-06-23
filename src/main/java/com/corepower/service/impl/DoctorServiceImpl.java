package com.corepower.service.impl;

import com.corepower.dao.DoctorDao;
import com.corepower.domain.Doctor;
import com.corepower.domain.PageInfo;
import com.corepower.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
/*@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")*/

@Service
public class DoctorServiceImpl implements DoctorService {
    @Autowired
    private DoctorDao doctorDao;
    //分页查询调用DAO层查询所有客户列表
    @Override
    public PageInfo<Doctor> findPageInfo(String dname, Integer department, Integer pageIndex, Integer pageSize) {
        PageInfo<Doctor> ci = new PageInfo<Doctor>();
        ci.setPageIndex(pageIndex);
        ci.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = doctorDao.totalCount(dname,department);
        if (totalCount>0){
            ci.setTotalCount(totalCount);
            //每一页显示客户信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Doctor> doctorList = doctorDao.getCustomerList(dname,department,(ci.getPageIndex()-1)*ci.getPageSize(),ci.getPageSize());
            ci.setList(doctorList);
        }
        return ci;
    }
    @Override
    public Doctor updateCustomer(Doctor doctor){
        return doctorDao.updateCustomer(doctor);
    }
    @Override
    public Doctor insertCustomer(Doctor doctor){
        return doctorDao.insertCustomer(doctor);
    }
    @Override
    public Doctor deleteCustomer(Integer id){
        return  doctorDao.deleteCustomer(id);
    }
}
