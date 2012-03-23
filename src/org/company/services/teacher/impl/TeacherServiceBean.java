package org.company.services.teacher.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.company.beans.Teacher;
import org.company.daos.base.BaseDaoSupport;
import org.company.services.teacher.ITeacherService;

/**
 * 老师服务实现类
 * 
 * @author <a href="http://www.blogjava.net/lishunli/" target="_blank">ShunLi</a>
 * @notes Created on 2010-1-17<br>
 *        Revision of last commit:$Revision: 633 $<br>
 *        Author of last commit:$Author: nhjsjmz@gmail.com $<br>
 *        Date of last commit:$Date: 2010-01-25 16:47:53 +0800 (周一, 25 一月 2010) $<br>
 *        <p>
 */
@Service
// 声明此类为业务逻辑层的类
public class TeacherServiceBean extends BaseDaoSupport<Teacher> implements ITeacherService
{

	/*
	 * @see org.company.services.student.IStudentService#findByName(java.lang.String)
	 */
	public List<Teacher> findByPositional(String value)
	{
		return super.findByProperty("positional", value);
	}

}
