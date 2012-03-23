package org.company.services.admin;

import org.company.beans.AdminUser;
import org.company.daos.base.IBaseDao;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-3-18
 * Time: 下午2:51
 * To change this template use File | Settings | File Templates.
 */
public interface LoginService extends IBaseDao<AdminUser>{

    AdminUser findByUser(AdminUser adminUser);

}
