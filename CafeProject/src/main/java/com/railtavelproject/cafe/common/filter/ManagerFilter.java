package com.railtavelproject.cafe.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.railtavelproject.cafe.member.model.vo.Member;


@WebFilter(filterName="ManagerFilter", urlPatterns={ "/manager/*"})
public class ManagerFilter implements Filter {

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

	public void destroy() {
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp = (HttpServletResponse)response;
		
		// 로그인 여부 확인
		HttpSession session = req.getSession();
		Member loginMember =  (Member) session.getAttribute("loginMember");
		
		System.out.println("에이비씨"+loginMember);
		
		if(loginMember.getMemberLevelNo() != 0 && loginMember.getMemberLevelNo() != 1 ) {
			resp.sendRedirect("/");
		
		} else {
			
			// 연결된 다음 필터로 이동 or 서블릿,JSP로 이동
			chain.doFilter(request, response);
			
		}
	}

}
