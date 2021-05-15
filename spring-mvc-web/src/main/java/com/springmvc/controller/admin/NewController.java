package com.springmvc.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.model.NewModel;
import com.springmvc.service.INewService;

@Controller(value = "newControllerOfAdmin")
public class NewController {
	
	@Autowired
	private INewService newService;
	
	@RequestMapping(value = "/admin/news", method = RequestMethod.GET)
	public ModelAndView showList(@ModelAttribute("model") NewModel model) {
		ModelAndView mav = new ModelAndView("admin/news/list");
		model.setListResult(newService.findAll());
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/admin/news/edit", method = RequestMethod.GET)
	public ModelAndView editNew() {
		ModelAndView mav = new ModelAndView("admin/news/edit");
		return mav;
	}
}
