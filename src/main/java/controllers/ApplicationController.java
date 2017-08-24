package controllers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import security.LoginService;
import services.ApplicationService;
import services.CourseService;
import domain.Application;
import domain.Course;
import domain.Dancer;

@Controller
@RequestMapping("/application")
public class ApplicationController extends AbstractController{

	//Services
	@Autowired
	private ApplicationService applicationService;

	@Autowired
	private CourseService courseService;

	@Autowired
	private LoginService loginService;


	// Constructors -----------------------------------------------------------
	public ApplicationController(){
		super();
	}

	//Actions

	@RequestMapping(value = "/dancer/listByDancer", method = RequestMethod.GET)
	public ModelAndView listByDancer() {
		ModelAndView result;
		int q = LoginService.getPrincipal().getId();
		Dancer d = (Dancer) loginService.findActorByUsername(q);

		result = new ModelAndView("application/list");
		result.addObject("applications", d.getApplications());
		result.addObject("a", 1);

		return result;
	}


	@RequestMapping(value = "/academy/listByCourse", method = RequestMethod.GET)
	public ModelAndView listByCourse(@RequestParam Course q) {
		ModelAndView result;

		result = new ModelAndView("application/list");
		result.addObject("applications", Arrays.asList(q.getAcademy()));
		result.addObject("a", 2);

		return result;
	}


	@RequestMapping("/academy/accept")
	public ModelAndView accept(@RequestParam Application q) {
		ModelAndView result;

		applicationService.accept(q);

		int id = q.getId();
		result = new ModelAndView("redirect:/application/academy/listByCourse.do?q=" + id);

		return result;
	}

	@RequestMapping("/academy/denied")
	public ModelAndView denied(@RequestParam Application q) {
		ModelAndView result;
		applicationService.denied(q);

		int id = q.getId();
		result = new ModelAndView("redirect:/application/academy/listByCourse.do?q=" + id);

		return result;
	}


	@RequestMapping("/dancer/apply")
	public ModelAndView apply(@RequestParam Application q) {

		ModelAndView result = new ModelAndView("redirect:/course/list.do?a=0");

		Dancer dancer = (Dancer) loginService.findActorByUsername(LoginService.getPrincipal().getId());
		List<Application> apps = dancer.getApplications();
		List<Course> courses = new ArrayList<Course>();
		for(Application app: apps){
			courses.add(app.getCourse());
		}
		if(!courses.contains(q.getCourse())){
			applicationService.apply(q.getCourse());
			result = new ModelAndView("redirect:/course/list.do?a=0");
			result.addObject("courses", courseService.findAll());
		}

		return result;
	}



}
