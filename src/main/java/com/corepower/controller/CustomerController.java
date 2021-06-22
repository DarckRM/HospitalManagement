package com.corepower.controller;

import com.corepower.domain.Customer;
import com.corepower.domain.PageInfo;
import com.corepower.domain.User;
import com.corepower.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CustomerController {
    //注入Serivice层对象
    @Autowired
    private CustomerService customerService;
    /**
     * 查询所有客户信息列表
     */
    @RequestMapping(value = "/customerlist")
    public String CustomerList(String dname, Integer pageIndex, Integer department ,Integer pageSize, Model model){
        PageInfo<Customer> ci = customerService.findPageInfo(dname,department,pageIndex,pageSize);
        model.addAttribute("ci",ci);
        /*customerService.findCustomer();*/
        return "customer_list";
    }
    /**
     * 更新单条客户信息
     */
    @RequestMapping(value = "/customerupdate",method = RequestMethod.POST)
    public String CustomerUpdate(@RequestBody Customer customer){
        customerService.updateCustomer(customer);
        return "customer_list";
    }
    /**
     * 插入单条客户信息
     */
    @RequestMapping(value = "/addcustomer",method = RequestMethod.POST)
    public String addCustomer(@RequestBody Customer customer){
        customerService.insertCustomer(customer);
        return "customer_list";
    }
    /**
     * 删除单条客户信息
     */
    @RequestMapping(value = "/deletecustomer")
    @ResponseBody
    public String deleteCustomer(Integer id){
        customerService.deleteCustomer(id);
        return "customer_list";
    }
}
