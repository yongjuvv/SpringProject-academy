package com.ch.project.controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.project.model.Member;
import com.ch.project.model.Order;
import com.ch.project.service.MypageService;
import com.ch.project.service.OrderService;
import com.ch.project.service.PagingBean;
import com.ch.project.service.ProductBoardService;

@Controller
public class OrderController {
   @Autowired
   private OrderService os;
   @Autowired
   private MypageService ms;
   
   @RequestMapping("/orderFormRed")
   public String orderFormRed(Model model, HttpSession session) {
      String cId = (String) session.getAttribute("cId");
      Member member = ms.select(cId);
      model.addAttribute("member", member);
      return "orderFormRed";
   }
   
   @RequestMapping("order")
   public String order(Order order, Model model, HttpSession session) {
      Order or = os.select(order.getOrNumber());
      int result = 0;
      if(or == null) {
         result = os.insert(order);
      } else {
         result = -1;
      }
      model.addAttribute("result", result);
      return "order/order";
   }
   
   @RequestMapping("orderCheck")
   public String orderCheck(Order order, Model model, HttpSession session) {
      String cId = (String) session.getAttribute("cId");
      String id = (String) session.getAttribute("cId");
      Member member = ms.select(cId);
      order = os.select(id);
      model.addAttribute("member", member);
      model.addAttribute("order", order);
      return "orderCheck";
   }
   
}