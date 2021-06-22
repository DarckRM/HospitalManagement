package com.corepower.service.impl;

import com.corepower.dao.CstatusDao;
import com.corepower.domain.Cstatus;
import com.corepower.domain.Customer;
import com.corepower.domain.PageInfo;
import com.corepower.service.CstatusService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")

@Service
public class CstatusServiceImpl implements CstatusService {
    //自动注入CstatusDao对象用于操作数据库
    @Autowired
    private CstatusDao cstatusDao;
    //调用DAO层查询所有客户状态列表
    @Override
    public PageInfo<Cstatus> findPageInfo(String nickname, String relname, Integer customerid, Integer pageIndex, Integer pageSize){;
        PageInfo<Cstatus> cs = new PageInfo<>();
        cs.setPageIndex(pageIndex);
        cs.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = cstatusDao.totalCount(nickname,relname,customerid);
        if (totalCount>0){
            cs.setTotalCount(totalCount);
            //每一页显示客户信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Cstatus> cstatusList = cstatusDao.getCstatusList(nickname,relname,customerid,(cs.getPageIndex()-1)*cs.getPageSize(),cs.getPageSize());
            cs.setList(cstatusList);
        }
        return cs;
    }
    //插入单条客户状态记录
    public Cstatus insertCstatus(Cstatus cstatus){
        return cstatusDao.insertCstatus(cstatus);
    }
    //更新客户状态记录
    public Cstatus updateCstatus(Cstatus cstatus){
        return cstatusDao.updateCstatus(cstatus);
    }
    //删除客户状态信息
    public Cstatus deleteCstatus(Integer id){
        return cstatusDao.deleteCstatus(id);
    }
    @Test
    public void run(){
        Cstatus cs = new Cstatus();
        cs.setCustomerid(1);
        cstatusDao.insertCstatus(cs);
    }
}
