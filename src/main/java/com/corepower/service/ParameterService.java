package com.corepower.service;

import com.corepower.domain.Parameter;
import com.corepower.domain.Siteinfo;

public interface ParameterService {
    //查询字典参数信息
    public Parameter findParameter();
    //修改字典参数信息
    public void updateParameter(Parameter parameter);
}
