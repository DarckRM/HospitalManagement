package com.corepower.service;

import com.corepower.domain.Siteinfo;

public interface SiteinfoService {
    //查询站点信息
    public Siteinfo findSiteinfo();
    //修改站点信息
    public void updateSiteinfo(Siteinfo siteinfo);
}
