package org.company.services.teacher;

import java.util.List;

import org.company.beans.Teacher;
import org.company.daos.base.IBaseDao;

/**
 * 老师服务类接口
 * 
 * @author <a href="http://www.blogjava.net/lishunli/" target="_blank">ShunLi</a>
 * @notes Created on 2010-1-21<br>
 *        Revision of last commit:$Revision: 633 $<br>
 *        Author of last commit:$Author: nhjsjmz@gmail.com $<br>
 *        Date of last commit:$Date: 2010-01-25 16:47:53 +0800 (周一, 25 一月 2010) $<br>
 *        <p>
 */
public interface ITeacherService extends IBaseDao<Teacher>
{
	/**
	 * 根据职称查找老师
	 * 
	 * @param value
	 *            职称
	 * @return 该职称的学生集
	 */
	public abstract List<Teacher> findByPositional(String value);
}