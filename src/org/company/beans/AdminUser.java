package org.company.beans;

import javax.persistence.*;

/**
 * Created by IntelliJ IDEA.
 * User: Administrator
 * Date: 12-3-18
 * Time: 下午2:45
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "adminUser")
public class AdminUser {
    
    private Integer id;
    private String userName;
    private String userPassword;

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
