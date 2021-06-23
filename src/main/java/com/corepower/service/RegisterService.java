package com.corepower.service;

import com.corepower.domain.PageInfo;
import com.corepower.domain.Register;

import java.util.List;

public interface RegisterService {
    public PageInfo<Register> findRegisterList(String name, Integer department, Integer  pageIndex, Integer pageSize, String  didName);
    public int delete(String rid);
    public int updateRegister(Register register);
    public int add(Register register);
}
