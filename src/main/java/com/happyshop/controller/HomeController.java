package com.happyshop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.happyshop.dao.ProductDAO;
import com.happyshop.entity.Product;
import com.happyshop.entity.User;



@Controller
public class HomeController {
	@Autowired
	ProductDAO pdao;
	@Autowired HttpSession session;
	
	@RequestMapping(value = {"", "/home"})
	public String index(Model model,HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		User user=(User) session.getAttribute("user");
		if(user != null && user.getAdmin()) {
			session.setAttribute("back-url", request.getRequestURI());
			response.sendRedirect("/account/login");
		}
		List<Product> list2 = pdao.findBySpecial(4);
		model.addAttribute("list", list2);
		List<Product> list3 = pdao.findBySpecial(0);
		model.addAttribute("list1", list3);
		return "home/index";
	}
	@RequestMapping("/about")
	public String about() {
		return "home/about";
	}
	@RequestMapping("/contact")
	public String contact() {
		return "home/contact";
	}
	@RequestMapping("/feedback")
	public String feedback() {
		return "home/feedback";
	}
	@RequestMapping("/faq")
	public String faq() {
		return "home/faq";
	}
	
	@ResponseBody
	@RequestMapping("/home/language")
	public void language() {

	}
}
