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
		model.addAttribute("sidePage", "categoryManage");
		model.addAttribute("categoryList", adminService.selectCategoryList());
		return "admin/reg_category";
	}
	
	@PostMapping("/regCategory")
	public String insertCategory(CategoryVO categoryVO, Model model) {
		adminService.insertCategory(categoryVO);
		return "redirect:/admin/adminMenu";
	}
	
	@PostMapping("/deleteCategory")
	public String deleteCategory(String cateCode) {
		adminService.deleteCategory(cateCode);
		return "redirect:/admin/adminMenu";
	}
	
	@GetMapping("/salesManage")
	public String gosalesManage(Model model) {
		model.addAttribute("sidePage", "salesManage");
		model.addAttribute("categoryList", adminService.selectCategoryList());
		return "admin/sales_manage";
	}
	
	
	
	
	
	
}
