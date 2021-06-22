package com.corepower.controller;

import com.corepower.domain.Siteinfo;
import com.corepower.service.impl.SiteinfoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SiteInfoController {
    @Autowired
    private SiteinfoServiceImpl siteinfoService;

    @RequestMapping(value = "/siteinfolist")
    public String SiteinfoList(Model model) {
        //查询数据库中的站点信息表所有数据
            Siteinfo si = siteinfoService.findSiteinfo();
            model.addAttribute("si",si);
            //System.out.println(si);
            return "siteinfo";
    }
    @RequestMapping(value = "/siteinfoedit", method = RequestMethod.POST)
    public String SiteinfoEdit(@RequestBody Siteinfo siteinfo){
        //修改站点信息
        //System.out.println(siteinfo);
        siteinfoService.updateSiteinfo(siteinfo);
        return "siteinfo";
    }
}
