package com.corepower.service.impl;

import com.corepower.dao.ParameterDao;
import com.corepower.domain.Parameter;
import com.corepower.service.ParameterService;
import org.junit.runners.Parameterized;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ParameterServiceImpl implements ParameterService {
    @Autowired
    //从容器中取出DAO层对象用于执行和数据库相关的操作
    private ParameterDao parameterDao;
    //调用DAO层查询字典参数信息 返回Parameter对象
    @Override
    public Parameter findParameter(){
        return parameterDao.findParameter();
    }
    //将Parameter对象传到DAO层执行update命令 不需要返回值
    @Override
    public void updateParameter(Parameter parameter){
        System.out.println(parameter+"服务层");
        parameterDao.updateParameter(parameter);
        System.out.println(parameter+"DAO层");
    }
}
