package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegFormService implements MemberService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {
		String viewName = "/WEB-INF/view/memberRegForm.jsp";
		return viewName;
	}
	
}
