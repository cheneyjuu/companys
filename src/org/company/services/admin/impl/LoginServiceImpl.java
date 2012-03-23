package org.company.services.admin.impl;

import org.company.beans.AdminUser;
import org.company.daos.base.BaseDaoSupport;
import org.company.services.admin.LoginService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * User: Administrator
 * Date: 12-3-18
 * Time: 下午2:54
 */
@Service
public class LoginServiceImpl extends BaseDaoSupport<AdminUser> implements LoginService {
    @Override
    public AdminUser findByUser(AdminUser adminUser) {
//        List<AdminUser> adminUsers = super.findByEntity(adminUser.getClass());
     return   (AdminUser)super.getSession().createSQLQuery("select * from adminuser where userName='"+adminUser.getUserName()+"' and userPassword='"+adminUser.getUserPassword()+"'").addEntity(AdminUser.class).uniqueResult();
//        return adminUsers.size() > 0 ? adminUsers.get(0) : null;
    }
}
