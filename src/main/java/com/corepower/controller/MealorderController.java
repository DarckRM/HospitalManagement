package com.corepower.controller;

import com.corepower.domain.Cstatus;
import com.corepower.domain.Mealorder;
import com.corepower.domain.PageInfo;
import com.corepower.service.CstatusService;
import com.corepower.service.MealorderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MealorderController {
    @Autowired
    private MealorderService mealorderService;
    /**
     * 查询所有订餐记录列表
     */
    @RequestMapping(value = "/mealorderlist")
    public String mealorderList(String nickname, String relname,Integer pageIndex, Integer customerid ,Integer pageSize, Model model){
        PageInfo<Mealorder> mo = mealorderService.findPageInfo(nickname,relname,customerid,pageIndex,pageSize);
        model.addAttribute("mo",mo);
        return "mealorder";
    };
    /**
     * 添加一条新的订餐记录
     */
    @RequestMapping(value = "/addmealorder",method = RequestMethod.POST)
    public String addMealorder(@RequestBody Mealorder mealorder){
        System.out.print(mealorder);
        mealorderService.insertMealorder(mealorder);
        return "mealorder";
    }
}
