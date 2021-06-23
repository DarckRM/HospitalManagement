package com.corepower.controller;

import com.corepower.domain.Doctor;
import com.corepower.domain.PageInfo;
import com.corepower.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DoctorController {
    //注入Serivice层对象
    @Autowired
    private DoctorService doctorService;
    /**
     * 查询所有客户信息列表
     */
    @RequestMapping(value = "/customerlist")
    public String CustomerList(String dname, Integer pageIndex, Integer department ,Integer pageSize, Model model){
        PageInfo<Doctor> ci = doctorService.findPageInfo(dname,department,pageIndex,pageSize);
        model.addAttribute("ci",ci);
        /*customerService.findCustomer();*/
        return "customer_list";
    }
    /**
     * 更新单条客户信息
     */
    @RequestMapping(value = "/customerupdate",method = RequestMethod.POST)
    public String CustomerUpdate(@RequestBody Doctor doctor){
        doctorService.updateCustomer(doctor);
        return "customer_list";
    }
    /**
     * 插入单条客户信息
     */
    @RequestMapping(value = "/addcustomer",method = RequestMethod.POST)
    public String addCustomer(@RequestBody Doctor doctor){
        doctorService.insertCustomer(doctor);
        return "customer_list";
    }
    /**
     * 删除单条客户信息
     */
    @RequestMapping(value = "/deletecustomer")
    @ResponseBody
    public String deleteCustomer(Integer id){
        doctorService.deleteCustomer(id);
        return "customer_list";
    }
}
