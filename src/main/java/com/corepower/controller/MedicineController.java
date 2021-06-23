package com.corepower.controller;

import com.corepower.domain.Doctor;
import com.corepower.domain.Medicine;
import com.corepower.domain.PageInfo;
import com.corepower.service.DoctorService;
import com.corepower.service.MedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MedicineController {
    //注入Serivice层对象
    @Autowired
    private MedicineService medicineService;
    /**
     * 查询所有客户信息列表
     */
    @RequestMapping(value = "/medicinelist")
    public String CustomerList(String mname, Integer pageIndex, Integer type ,Integer pageSize, Model model){
        PageInfo<Medicine> mi = medicineService.findPageInfo(mname,type,pageIndex,pageSize);
        model.addAttribute("mi",mi);
        /*customerService.findCustomer();*/
        return "medicine_list";
    }
    /**
     * 更新单条客户信息
     */
    @RequestMapping(value = "/medicineupdate",method = RequestMethod.POST)
    public String CustomerUpdate(@RequestBody Medicine medicine){
        medicineService.updateCustomer(medicine);
        return "medicine_list";
    }
    /**
     * 插入单条客户信息
     */
    @RequestMapping(value = "/medicineadd",method = RequestMethod.POST)
    public String addCustomer(@RequestBody Medicine medicine){
        medicineService.insertCustomer(medicine);
        return "medicine_list";
    }
    /**
     * 删除单条客户信息
     */
    @RequestMapping(value = "/medicinedel")
    @ResponseBody
    public String deleteCustomer(String id){
        medicineService.deleteCustomer(id);
        return "medicine_list";
    }
}
