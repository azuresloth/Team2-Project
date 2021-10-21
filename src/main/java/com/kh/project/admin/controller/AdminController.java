package com.kh.project.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.project.admin.service.AdminService;
import com.kh.project.admin.vo.CategoryVO;
import com.kh.project.common.util.FileUploadUtil;
import com.kh.project.item.vo.ImgVO;
import com.kh.project.item.vo.ItemVO;

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
		model.addAttribute("salesList", adminService.selectSales());
		return "admin/sales_manage";
	}
	
	@GetMapping("/insertItemform")
	public String goInsertItem(Model model) {
		model.addAttribute("sidePage", "insertItem");
		model.addAttribute("categoryList", adminService.selectCategoryList());
		return "admin/insert_item_form";
	}
	
	@PostMapping("/insertItem")
	public String insertItem(ItemVO itemVO) {
		adminService.insertItem(itemVO);
		String itemCode = adminService.selectNextItemCode();
		itemVO.setItemCode(itemCode);
		return "redirect:/admin/insertItemForm";
	}
	
	
}




















