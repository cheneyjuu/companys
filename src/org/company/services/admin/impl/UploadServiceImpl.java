package org.company.services.admin.impl;

import org.company.beans.CompanyIntro;
import org.company.daos.base.BaseDaoSupport;
import org.company.services.admin.UploadService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * User: Administrator
 * Date: 12-3-19
 * Time: 下午6:13
 */
@Service
public class UploadServiceImpl extends BaseDaoSupport<CompanyIntro> implements UploadService {
    @Override
    public void saveInfo(CompanyIntro companyIntro) {
        super.save(companyIntro);
    }

    @Override
    public CompanyIntro findIntro(String introType) {
        List<CompanyIntro> companyIntroList = super.getSession().createSQLQuery("select * from companyIntro " +
                "where introType='"+introType+"' order by id desc").addEntity(CompanyIntro.class).list();
        return companyIntroList.size()>0?companyIntroList.get(0):null;
    }
}
