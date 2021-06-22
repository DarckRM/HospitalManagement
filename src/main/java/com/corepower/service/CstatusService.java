package com.corepower.service;

import com.corepower.domain.Cstatus;
import com.corepower.domain.PageInfo;
import com.corepower.domain.User;

import java.util.List;

public interface CstatusService {
    //分页查询所有数据
    public PageInfo<Cstatus> findPageInfo(String nickname, String relname, Integer id, Integer pageIndex, Integer pageSize);
    //插入单条客户状态记录
    public Cstatus insertCstatus(Cstatus cstatus);
    //更新客户状态记录
    public Cstatus updateCstatus(Cstatus cstatus);
    //删除客户状态信息
    public Cstatus deleteCstatus(Integer id);
}
