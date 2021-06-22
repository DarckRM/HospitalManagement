package com.corepower.controller;

import com.corepower.domain.Cstatus;
import com.corepower.domain.PageInfo;
import com.corepower.domain.User;
import com.corepower.service.CstatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CstatusController {
    @Autowired
    private CstatusService cstatusService;
    /**
     * 查询所有客户状态列表
     */
    @RequestMapping(value = "/cstatuslist")
    public String cstatusList(String nickname, String relname,Integer pageIndex, Integer customerid ,Integer pageSize, Model model){
        PageInfo<Cstatus> cs = cstatusService.findPageInfo(nickname,relname,customerid,pageIndex,pageSize);
        model.addAttribute("cs",cs);
        return "cstatus";
    };
    /**
     * 添加一条新的客户状态记录
     */
    @RequestMapping(value = "/addcstatus",method = RequestMethod.POST)
    public String addCstatus(@RequestBody Cstatus cstatus){
        System.out.print(cstatus);
        cstatusService.insertCstatus(cstatus);
        return "cstatus";
    }
    /**
     * 更新单条客户状态信息
     */
    @RequestMapping(value = "/cstatusupdate",method = RequestMethod.POST)
        public String cstatusUpdate(@RequestBody Cstatus cstatus){
            cstatusService.updateCstatus(cstatus);
            return "cstatus";
        }
    /**
     * 删除单条客户状态信息
     */
    @RequestMapping(value = "/deletecstatus")
    @ResponseBody
    public String deleteCustomer(Integer id){
        cstatusService.deleteCstatus(id);
        return "cstatus";
    }
}
