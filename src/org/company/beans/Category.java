package org.company.beans;

import javax.persistence.*;

/**
 * User: Administrator
 * Date: 12-3-21
 * Time: 下午8:55
 */
@Entity
@Table(name = "category")
public class Category implements java.io.Serializable {
    private Integer id;
    private String categoryName;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
