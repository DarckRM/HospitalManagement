package com.corepower.controller;

import com.corepower.domain.Parameter;
import com.corepower.service.ParameterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.corepower.domain.Siteinfo;
import com.corepower.service.ParameterService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ParameterController {
    @Autowired
    //从容器中取出Service层对象用于操作
    private ParameterService parameterService;
    //调用Service层 得到的对象用于传值 返回到指定页面
    @RequestMapping(value = "/parameterlist")
    public String ParameterList(Model model){
        Parameter ps = parameterService.findParameter();
        model.addAttribute("ps",ps);
        return "parameter";
    }
    @RequestMapping(value = "/parameteredit", method = RequestMethod.POST)
    //将前端POST得到的数据传给Parameter对象并且调用Service层
    public String ParameterEdit(@RequestBody Parameter parameter){
        System.out.println(parameter);
        parameterService.updateParameter(parameter);
        return "parameter";
    }
}
