package org.usc.services.teacher;

import java.util.List;

import org.usc.beans.Teacher;
import org.usc.daos.base.IBaseDao;

/**
 * 老师服务类接口
 * 
 * @author <a href="http://www.blogjava.net/lishunli/" target="_blank">ShunLi</a>
 * @notes Created on 2010-1-21<br>
 *        Revision of last commit:$Revision$<br>
 *        Author of last commit:$Author$<br>
 *        Date of last commit:$Date$<br>
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