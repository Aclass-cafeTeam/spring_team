package com.railtavelproject.cafe.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.railtavelproject.cafe.member.model.service.MemberInfoService;
import com.railtavelproject.cafe.member.model.vo.Member;

@RequestMapping("/member")
@Controller
public class MemberInfoController {
	
	@Autowired
	private MemberInfoService service;
	
	// 회원 정보 페이지 특정 회원이 작성한 글 목록
	@GetMapping("/{memberNo}")
	public String selectMemberBoard(
			@PathVariable("memberNo") int memberNo,
			Model model,
			HttpServletRequest req,
			@RequestParam(value="cp", required=false, defaultValue = "1") int cp) {
		
		String referer = req.getHeader("referer");
		
		Map<String, Object> map = service.selectMemberBoard(memberNo, cp);
		
		model.addAttribute("map", map);
		model.addAttribute("referer", referer);
		
		return "member/memberInfo";
	}
	
}
