package org.company.beans;

import javax.persistence.*;

/**
 * User: Administrator
 * Date: 12-3-19
 * Time: 下午6:08
 */
@Entity
@Table(name = "companyintro")
public class CompanyIntro implements java.io.Serializable{
    private Integer id;
    private Integer adminId;
    private String intro;
    private String imageUrl;
    private String imageTitle;
    private String createTime;
    private String introType;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "adminId")
    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getImageTitle() {
        return imageTitle;
    }

    public void setImageTitle(String imageTitle) {
        this.imageTitle = imageTitle;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    @Column(name = "introType")
    public String getIntroType() {
        return introType;
    }

    public void setIntroType(String introType) {
        this.introType = introType;
    }
}
