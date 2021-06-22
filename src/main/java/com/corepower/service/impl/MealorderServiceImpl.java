package com.corepower.service.impl;

import com.corepower.dao.MealorderDao;
import com.corepower.domain.Cstatus;
import com.corepower.domain.Mealorder;
import com.corepower.domain.PageInfo;
import com.corepower.service.MealorderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MealorderServiceImpl implements MealorderService {
    //自动注入Dao层对象
    @Autowired
    private MealorderDao mealorderDao;
    //调用DAO层查询所有客户状态列表
    @Override
    public PageInfo<Mealorder> findPageInfo(String nickname, String relname, Integer customerid, Integer pageIndex, Integer pageSize){;
        PageInfo<Mealorder> mo = new PageInfo<>();
        mo.setPageIndex(pageIndex);
        mo.setPageSize(pageSize);
        //获取总条数
        Integer totalCount = mealorderDao.totalCount(nickname,relname,customerid);
        if (totalCount>0){
            mo.setTotalCount(totalCount);
            //每一页显示客户信息数
            //currentPage = (pageIndex-1)*pageSize  当前页码数减1*最大条数=开始行数
            List<Mealorder> mealorderList = mealorderDao.getMealorderList(nickname,relname,customerid,(mo.getPageIndex()-1)*mo.getPageSize(),mo.getPageSize());
            mo.setList(mealorderList);
        }
        return mo;
    }
    //插入单条订餐记录
    public Mealorder insertMealorder(Mealorder mealorder){
        return mealorderDao.insertMealorder(mealorder);
    }
    //更新单条订餐记录
    public Mealorder updateMealorder(Mealorder mealorder){
        return mealorderDao.updateMealorder(mealorder);
    }
    //删除单条订餐记录
    public Mealorder deleteMealorder(Integer id){
        return mealorderDao.deleteMealorder(id);
    }
}
