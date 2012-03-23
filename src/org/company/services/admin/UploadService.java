package org.company.services.admin;

import org.company.beans.CompanyIntro;
import org.company.daos.base.IBaseDao;

/**
 * User: Administrator
 * Date: 12-3-19
 * Time: 下午6:06
 */
public interface UploadService extends IBaseDao<CompanyIntro>{

    void saveInfo(CompanyIntro companyIntro);
}
