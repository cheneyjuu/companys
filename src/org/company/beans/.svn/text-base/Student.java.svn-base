package org.usc.beans;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Student entity. @author MyEclipse Persistence Tools
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "student", catalog = "test")
public class Student implements java.io.Serializable
{

	// Fields

	private Integer no;
	private String name;
	private String sex;
	private Integer age;
	private Double score;
	private Date eduTime;

	// Constructors

	/** default constructor */
	public Student()
	{
	}

	/** minimal constructor */
	public Student(String name, String sex)
	{
		this.name = name;
		this.sex = sex;
	}

	/** full constructor */
	public Student(String name, String sex, Integer age, Double score, Date eduTime)
	{
		this.name = name;
		this.sex = sex;
		this.age = age;
		this.score = score;
		this.eduTime = eduTime;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "no", unique = true, nullable = false)
	public Integer getNo()
	{
		return this.no;
	}

	public void setNo(Integer no)
	{
		this.no = no;
	}

	@Column(name = "name", nullable = false, length = 20)
	public String getName()
	{
		return this.name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	@Column(name = "sex", nullable = false, length = 1)
	public String getSex()
	{
		return this.sex;
	}

	public void setSex(String sex)
	{
		this.sex = sex;
	}

	@Column(name = "age")
	public Integer getAge()
	{
		return this.age;
	}

	public void setAge(Integer age)
	{
		this.age = age;
	}

	@Column(name = "score", precision = 22, scale = 0)
	public Double getScore()
	{
		return this.score;
	}

	public void setScore(Double score)
	{
		this.score = score;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "eduTime", length = 10)
	public Date getEduTime()
	{
		return this.eduTime;
	}

	public void setEduTime(Date eduTime)
	{
		this.eduTime = eduTime;
	}

	@Override
	public String toString()
	{
		return "Student [no=" + no + ", name=" + name + ", age=" + age + ", eduTime=" + eduTime + ", score=" + score + ", sex=" + sex + "]";
	}

}