package com.corepower.service.impl;

import com.corepower.dao.RegisterDao;
import com.corepower.domain.Doctor;
import com.corepower.domain.PageInfo;
import com.corepower.domain.Register;
import com.corepower.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegisterServiceImpl implements RegisterService {
    @Autowired
    private RegisterDao registerDao;

    @Override
    public PageInfo<Register> findRegisterList(String name, Integer department, Integer pageIndex, Integer pageSize, String  didName) {
        PageInfo<Register> ci = new PageInfo<Register>();
        ci.setPageIndex(pageIndex);
        ci.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = registerDao.totalCount(name,department,didName);
        if (totalCount>0){
            ci.setTotalCount(totalCount);
            //每一页显示客户信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Register> doctorList = registerDao.findRegisterList(name,department,(ci.getPageIndex()-1)*ci.getPageSize(),ci.getPageSize(),didName);
            ci.setList(doctorList);
        }
        return ci;
    }

    @Override
    public int delete(String rid) {
        return registerDao.delete(rid);
    }

    @Override
    public int updateRegister(Register register) {
        return registerDao.updateRegister(register);
    }

    @Override
    public int add(Register register) {
        return registerDao.add(register);
    }
}
