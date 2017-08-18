package controllers;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.AcademyService;
import domain.Academy;

@Controller
@RequestMapping("/academy")
public class AcademyController extends AbstractController{


	//Services

	@Autowired
	private AcademyService academyService;

	// Constructors -----------------------------------------------------------
	public AcademyController(){
		super();
	}

	//Actions

	@RequestMapping("/list")
	public ModelAndView list(@RequestParam Integer a) {
		ModelAndView result;

		result = new ModelAndView("academy/list");
		
		result.addObject("a", a);
		result.addObject("academies", academyService.findAll());


		return result;
	}


	@RequestMapping("/listByCourse")
	public ModelAndView listByCourse(@RequestParam Integer q) {
		ModelAndView result;
		
		List<Academy> academies = new ArrayList<Academy>();
		academies.add(academyService.academyOfCourse(q));


		result = new ModelAndView("academy/list");
		result.addObject("academies", academies);
		result.addObject("a", 1);

		return result;
	}

}
