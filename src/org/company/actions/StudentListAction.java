package org.company.actions;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.company.actions.base.BaseActionSupport;
import org.company.beans.Student;
import org.company.beans.base.PageView;
import org.company.services.student.IStudentService;

import com.opensymphony.xwork2.ActionContext;

/**
 * 列出所有的学生action，访问时action名称为student-list.action
 * 
 * @author <a href="http://www.blogjava.net/lishunli/" target="_blank">ShunLi</a>
 * @notes Created on 2010-1-17<br>
 *        Revision of last commit:$Revision: 632 $<br>
 *        Author of last commit:$Author: nhjsjmz@gmail.com $<br>
 *        Date of last commit:$Date: 2010-01-25 16:47:12 +0800 (周一, 25 一月 2010) $<br>
 *        <p>
 */

@SuppressWarnings("serial")
@Results(
{ @Result(name = "success", location = "student/studentList.jsp"), @Result(name = "input", location = "/index.jsp") })
public class StudentListAction extends BaseActionSupport
{
	@Autowired
	private IStudentService studentService;

	public String execute() throws Exception
	{
		/**
		 * 下面3句固定
		 */
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
		int maxResult = 5;
		/**
		 * 修改Bean和service即可
		 */
		PageView<Student> pageView = new PageView<Student>(maxResult, getPage());
		pageView.setQueryResult(studentService.getScrollData(pageView.getFirstResult(), maxResult));
		
		/**
		 * request.setAttribute("pageView", pageView)中key尽量为pageView，不然需要修改代码
		 */
		request.setAttribute("pageView", pageView);
		return SUCCESS;
	}

}
