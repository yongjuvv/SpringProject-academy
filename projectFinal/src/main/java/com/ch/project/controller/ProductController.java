package com.ch.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.project.model.Product;
import com.ch.project.service.LoginService;
import com.ch.project.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService ps;
	
	@RequestMapping("/productForm")
	public String productForm(Model model) {
		
		return "order/productForm";
	}
	
	@RequestMapping("/productForm2")
	public String productForm2(String nm, Model model) {
		int p_Number = 0;
		if (nm!=null && !nm.contentEquals("")){
			p_Number = Integer.parseInt(nm);
			Product product = ps.select(p_Number);
		}
		model.addAttribute("p_Number",p_Number);
		return "order/productForm2";
	}
	
	@RequestMapping("/product")
	public String product(Product product, Model model) {
		Product pdd = ps.select(product.getP_Number());
		
		int result=0;
		if (pdd == null) {
			result = ps.insert(product);
		} else {
			result = 1;
		}
		model.addAttribute("result", result);
		return "order/product";
	}
	
	@RequestMapping("/productView")
	public String productView(Model model, int p_Number) {
		Product product = ps.select(p_Number);
		model.addAttribute("product", product);
		return "order/productView";
	}
}
