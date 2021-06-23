package com.corepower.controller;

import com.corepower.domain.Doctor;
import com.corepower.domain.PageInfo;
import com.corepower.domain.Register;
import com.corepower.service.DoctorService;
import com.corepower.service.MedicineService;
import com.corepower.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RegisterController {


    //注入Serivice层对象
    @Autowired
    RegisterService registerService;


    /**
     * 查询所有客户信息列表
     */
    @RequestMapping(value = "/findRegisterPage")
    public String findRegisterPage(String name, Integer pageIndex, Integer department, String didName,Integer pageSize, Model model) {
        PageInfo<Register> mi = registerService.findRegisterList(name, department, pageIndex, pageSize,didName);
        System.out.println(mi);
        model.addAttribute("mi", mi);
        /*customerService.findCustomer();*/
        return "register";
    }
    @RequestMapping(value = "/delete")
    public String delete(String rid){
        System.out.println(rid);
        registerService.delete(rid);
        return "register";
    }
    @RequestMapping(value = "/updateRegister",method = RequestMethod.POST)
    public String updateRegister(@RequestBody Register register){
        System.out.println(register);
        registerService.updateRegister(register);
        return "register";
    }
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String add(@RequestBody Register register){
        System.out.println(register);
        registerService.add(register);
        return "register";
    }
}