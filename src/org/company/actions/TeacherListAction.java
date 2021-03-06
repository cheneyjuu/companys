package org.company.actions;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.company.actions.base.BaseActionSupport;
import org.company.beans.Teacher;
import org.company.beans.base.PageView;
import org.company.services.teacher.ITeacherService;

import com.opensymphony.xwork2.ActionContext;

/**
 * 列出所有的学生action，访问时action名称为teacher-list.action
 *
 */

@SuppressWarnings("serial")
@Results(
{ @Result(name = "success", location = "teacher/teacherList.jsp"), @Result(name = "input", location = "/index.jsp") })
public class TeacherListAction extends BaseActionSupport
{
	@Autowired
	private ITeacherService teacherService;

	public String execute() throws Exception
	{
		/**
		 * 下面3句固定
		 */
		ActionContext ctx = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
		int maxResult = 5;
		
		PageView<Teacher> pageView = new PageView<Teacher>(maxResult, getPage());
		/**
		 * 下面修改service即可
		 */
		pageView.setQueryResult(teacherService.getScrollData(pageView.getFirstResult(), maxResult));
		/**
		 * request.setAttribute("pageView", pageView)中key尽量为pageView，不然需要修改代码
		 */
		request.setAttribute("pageView", pageView);
		return SUCCESS;
	}

}
