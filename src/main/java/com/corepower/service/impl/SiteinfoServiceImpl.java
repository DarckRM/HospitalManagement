package com.corepower.service.impl;

import com.corepower.dao.SiteinfoDao;
import com.corepower.domain.Siteinfo;
import com.corepower.service.SiteinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("siteinfoService")
@Transactional
public class SiteinfoServiceImpl implements SiteinfoService {
    @Autowired
    private SiteinfoDao siteinfoDao;
    @Override
    public Siteinfo findSiteinfo() {
        Siteinfo si = siteinfoDao.findSiteinfo();
        return si;
    }
    @Override
    public void updateSiteinfo(Siteinfo siteinfo){
        siteinfoDao.updateSiteinfo(siteinfo);
    }
}
