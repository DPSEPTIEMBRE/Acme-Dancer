package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.DancerService;

@Controller
@RequestMapping("/application")
public class ApplicationController extends AbstractController{

	//Services
	
	private DancerService dancerService;

	// Constructors -----------------------------------------------------------
	public ApplicationController(){
		super();
	}

	//Actions
	
	@RequestMapping("/listByDancer")
	public ModelAndView listByDancer(@RequestParam Integer a) {
		ModelAndView result;

		result = new ModelAndView("application/list");
		result.addObject("applications", dancerService.applicationsOfDancer(a));
		result.addObject("a", 1);

		return result;
	}

}
