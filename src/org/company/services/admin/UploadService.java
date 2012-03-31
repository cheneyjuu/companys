package org.company.services.admin;

import org.company.beans.CompanyIntro;
import org.company.daos.base.IBaseDao;

import java.util.List;

/**
 * User: Administrator
 * Date: 12-3-19
 * Time: 下午6:06
 */
public interface UploadService extends IBaseDao<CompanyIntro>{

    void saveInfo(CompanyIntro companyIntro);

    CompanyIntro findIntro(String introType);


}
