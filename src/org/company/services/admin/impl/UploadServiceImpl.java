package org.company.services.admin.impl;

import org.company.beans.CompanyIntro;
import org.company.daos.base.BaseDaoSupport;
import org.company.services.admin.UploadService;
import org.springframework.stereotype.Service;

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
}
