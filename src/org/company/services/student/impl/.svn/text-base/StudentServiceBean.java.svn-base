package org.usc.services.student.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.usc.beans.Student;
import org.usc.daos.base.BaseDaoSupport;
import org.usc.services.student.IStudentService;

/**
 * 学生服务实现类
 * 
 * @author <a href="http://www.blogjava.net/lishunli/" target="_blank">ShunLi</a>
 * @notes Created on 2010-1-17<br>
 *        Revision of last commit:$Revision$<br>
 *        Author of last commit:$Author$<br>
 *        Date of last commit:$Date$<br>
 *        <p>
 */
@Service
// 声明此类为业务逻辑层的类
public class StudentServiceBean extends BaseDaoSupport<Student> implements IStudentService
{

	/*
	 * @see org.usc.services.student.IStudentService#findByName(java.lang.String)
	 */
	public List<Student> findByName(String value)
	{
		return super.findByProperty("name", value);
	}

}
