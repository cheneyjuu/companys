package org.company.services.student;

import java.util.List;

import org.company.beans.Student;
import org.company.daos.base.IBaseDao;

/**
 * 学生服务类接口
 * 
 * @author <a href="http://www.blogjava.net/lishunli/" target="_blank">ShunLi</a>
 * @notes Created on 2010-1-21<br>
 *        Revision of last commit:$Revision: 633 $<br>
 *        Author of last commit:$Author: nhjsjmz@gmail.com $<br>
 *        Date of last commit:$Date: 2010-01-25 16:47:53 +0800 (周一, 25 一月 2010) $<br>
 *        <p>
 */
public interface IStudentService extends IBaseDao<Student>
{
	/**
	 * 根据姓名查找学生
	 * 
	 * @param value
	 *            姓名
	 * @return 该姓名的学生集
	 */
	public abstract List<Student> findByName(String value);
}