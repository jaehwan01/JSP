package com.example.spring01.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.spring01.model.dao.CustomDAO;
import com.example.spring01.model.dto.CustomDTO;
import com.example.spring01.model.dto.MemberDTO;


@Controller
public class CustomController {
	
	@Inject
	CustomDAO customDao;
	
	@RequestMapping("custom/customlist.do")
	public String list(Model model) {
		return "custom/customlist";
	}
	
	@RequestMapping("custom/customlistinquiry.do")
	public String customlistinquiry(Model model, @RequestParam (value = "BUSI_NUM") String BUSI_NUM, @RequestParam (value = "CUSTOM") String CUSTOM) {
		CustomDTO dto = new CustomDTO();
		dto.setBUSI_NUM(BUSI_NUM);
		dto.setCUSTOM(CUSTOM);
		List<CustomDTO> list = customDao.list(dto);
		System.out.println(list);
		model.addAttribute("items", list);
		return "custom/customlist";
	}
	
	@RequestMapping("custom/customwrite.do")
	public String customwrite() {
		return "custom/customwrite";
	}
	
	@RequestMapping("custom/custominsert.do")
	public String insert(@ModelAttribute CustomDTO dto) {
		customDao.insert(dto);
		customDao.inserta(dto);
		return "redirect:/custom/customlist.do";
	}
	
	@RequestMapping("/countrypopup")
	public String countrypopup() {
		return "custom/countrypopup";
	}
	
	@RequestMapping("custom/view.do")
	public String view(@RequestParam String BUSI_NUM, Model model) {
		model.addAttribute("dto", customDao.detail(BUSI_NUM));
		return "custom/detail";
	}
	
	@RequestMapping("/custom/update.do")
	public String update(@ModelAttribute CustomDTO dto, Model model) {
		customDao.update(dto);
		customDao.updatea(dto);
		return "redirect:/custom/customlist.do";
	}
	
	@RequestMapping("custom/delete.do")
	public String delete(@RequestParam String BUSI_NUM, Model model) {
		customDao.delete(BUSI_NUM);
		customDao.deletea(BUSI_NUM);
		return "redirect:/custom/customlist.do";
	}

}
