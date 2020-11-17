package com.example.spring01.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.spring01.model.dao.MemberDAO;
import com.example.spring01.model.dto.MemberDTO;

@Controller
public class MemberController {
	
	@Inject
	MemberDAO memberDao;
	
	@RequestMapping("member/list.do")
	public String list(Model model) {
		List<MemberDTO> list = memberDao.list();
		model.addAttribute("items", list);
		return "member/list";
	}
	
	// 회원등록폼으로 이동
	@RequestMapping("member/write.do")
	public String write() {
		return "member/write";
	}
	
	@RequestMapping("member/insert.do")
	public String insert(@ModelAttribute MemberDTO dto) {
		memberDao.insert(dto);
		return "redirect:/member/list.do";
	}
	
	@RequestMapping("member/view.do")
	public String view(@RequestParam String userid, Model model) {
		// 회원정보를 모델에 저장
		model.addAttribute("dto", memberDao.detail(userid));
		// detail.jsp로 포워딩
		return "member/detail";
	}
	
	@RequestMapping("member/update.do")
	public String update(@ModelAttribute MemberDTO dto, Model model) {
		// 비밀번호 체크
		boolean result = memberDao.check_passwd(dto.getUserid(), dto.getPasswd());
		if (result) {
			memberDao.update(dto);
			return "redirect:/member/list.do";
		} else {
			// 가입일자가 지워지지 않도록 처리
			MemberDTO dto2 = memberDao.detail(dto.getUserid());
			dto.setJoin_date(dto2.getJoin_date());
			model.addAttribute("dto", dto);
			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
			return "member/detail";
		}
	}
	
	@RequestMapping("member/delete.do")
	public String delete(@RequestParam String userid, @RequestParam String passwd, Model model) {
		// 비밀번호 체크
		boolean result = memberDao.check_passwd(userid, passwd);
		if (result) {
			// 삭제 처리
			memberDao.delete(userid);
			// 회원 목록으로 이동
			return "redirect:/member/list.do";
		} else {
			// 비번이 틀렸을 때
			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
			model.addAttribute("dto", memberDao.detail(userid));
			// view.jsp로 포워드
			return "member/detail";
		}
	}

}
