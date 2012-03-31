package org.usc.actions.base;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 基础Action，所有的Action都可以继承，省去写page和控制层统一处理，继承后，只需要些Results和execute方法
 * 
 * @author <a href="http://www.blogjava.net/lishunli/" target="_blank">ShunLi</a>
 * @notes Created on 2010-1-25<br>
 *        Revision of last commit:$Revision$<br>
 *        Author of last commit:$Author$<br>
 *        Date of last commit:$Date$<br>
 *        <p>
 */
@SuppressWarnings("serial")
@Controller
@Scope("prototype")
public class BaseActionSupport extends ActionSupport
{
	/** jsp页面传过来的当前页 **/
	private int page;

	public int getPage()
	{
		return page;
	}

	public void setPage(int page)
	{
		this.page = page;
	}

}
