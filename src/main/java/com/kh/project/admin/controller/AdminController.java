package com.kh.project.admin.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.admin.service.AdminService;
import com.kh.project.admin.vo.CategoryVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Resource(name = "adminService")
	private AdminService adminService;
	
	@GetMapping("/adminMenu")
	public String goAdminMenu(Model model) {
		model.addAttribute("side", "admin_side");
		return "admin/reg_category";
	}
	@PostMapping("/regCategory")
	public String insertCategory(CategoryVO categoryVO) {
		adminService.insertCategory(categoryVO);
		return "redirect:/admin/adminMenu";
	}
}
