package com.corepower.service;

import com.corepower.domain.Cstatus;
import com.corepower.domain.Mealorder;
import com.corepower.domain.PageInfo;

public interface MealorderService {
    //分页查询所有数据
    public PageInfo<Mealorder> findPageInfo(String nickname, String relname, Integer id, Integer pageIndex, Integer pageSize);
    //插入单条订餐记录
    public Mealorder insertMealorder(Mealorder mealorder);
    //更新订餐记录信息
    public Mealorder updateMealorder(Mealorder mealorder);
    //删除订餐记录信息
    public Mealorder deleteMealorder(Integer id);
}
