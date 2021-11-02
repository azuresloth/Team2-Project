package com.kh.project.sample.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.project.sample.service.SampleService;

//샘플입니다. 프로젝트 진행 시 해당 클래스는 삭제하시면 됩니다.
@Controller
@RequestMapping("/sample")
public class SampleController {
	@Resource(name = "sampleService")
	private SampleService sampleSerivce;
	
	@GetMapping("/sampleJsp")
	public String goSampleJsp() {
		return  "sample/sample";
	}
	
	@GetMapping("/asdf")
	public String asdf(Model model) {
		model.addAttribute("test", "asdf");
		return  "sample/asdf";
	}
}









