package controllers;

import java.util.ArrayList;
import java.util.Date;
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
import services.DancerService;
import domain.Academy;
import domain.Application;
import domain.Course;
import domain.Dancer;
import domain.StatusApplication;

@Controller
@RequestMapping("/application")
public class ApplicationController extends AbstractController{

	//Services
	@Autowired
	private ApplicationService applicationService;
	
	@Autowired
	private DancerService dancerService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private LoginService loginService;


	// Constructors -----------------------------------------------------------
	public ApplicationController(){
		super();
	}

	//Actions
	
	@RequestMapping("/listByDancer")
	public ModelAndView listByDancer() {
		ModelAndView result;
		
		int q = LoginService.getPrincipal().getId();
		Dancer d = (Dancer)loginService.findActorByUserName(q);
		
		List<Application> applications = new ArrayList<Application>();
		
		applications.addAll(dancerService.applicationsOfDancer(d.getId()));
		
		result = new ModelAndView("application/list");
		result.addObject("applications", applications );
		result.addObject("a", 1);

		return result;
	}
	
	@RequestMapping(value = "/listByCourse", method = RequestMethod.GET)
	public ModelAndView listByCourse(@RequestParam Integer q) {
		ModelAndView result;
		List<Application> applications = new ArrayList<Application>();
		applications.addAll(applicationService.applicationsOfCourse(q));

		result = new ModelAndView("application/list");
		result.addObject("applications", applications);
		result.addObject("a", 2);

		return result;
	}
	
	@RequestMapping("/listByAcademy")
	public ModelAndView listByAcademy(@RequestParam Integer q) {
		ModelAndView result;
		List<Application> applications = new ArrayList<Application>();
		Academy a = (Academy)loginService.findActorByUserName(q);
		applications.addAll(applicationService.applicationsAcceptedOrRejectedOfAcademy(a.getId()));

		result = new ModelAndView("application/list");
		result.addObject("applications", applications);
		result.addObject("a", 3);

		return result;
	}
	
	@RequestMapping("/listByAcademyPending")
	public ModelAndView listByAcademyPending(@RequestParam Integer q) {
		ModelAndView result;
		List<Application> applications = new ArrayList<Application>();
		Academy a = (Academy)loginService.findActorByUserName(q);
		applications.addAll(applicationService.applicationsPendingOfAcademy(a.getId()));

		result = new ModelAndView("application/list");
		result.addObject("applications", applications);
		result.addObject("a", 4);

		return result;
	}
	
	@RequestMapping("/listByCoursePending")
	public ModelAndView listByCoursePending(@RequestParam Integer q) {
		ModelAndView result;
		List<Application> applications = new ArrayList<Application>();
		applications.addAll(applicationService.applicationsPendingOfCourse(q));

		result = new ModelAndView("application/list");
		result.addObject("applications", applications);
		result.addObject("a", 5);

		return result;
	}
	
	@RequestMapping("/academy/accept")
	public ModelAndView accept(@RequestParam Integer q) {
		ModelAndView result;
		Application a = applicationService.findOne(q);
		applicationService.accept(a);

		result = new ModelAndView("redirect:/welcome/index.do");

		return result;
	}

	@RequestMapping("/academy/denied")
	public ModelAndView denied(@RequestParam Integer q) {
		ModelAndView result;
		Application a = applicationService.findOne(q);
		applicationService.denied(a);

		result = new ModelAndView("redirect:/welcome/index.do");

		return result;
	}

	
	@RequestMapping("/dancer/apply")
	public ModelAndView apply(@RequestParam Integer q) {
		ModelAndView result;
		Course course = courseService.findOne(q);
		Application a = applicationService.create();
		a.setCourse(course);
		a.setCreateMoment(new Date());
		StatusApplication sa = new StatusApplication();
		sa.setValue("PENDING");
		a.setStatusApplication(sa);
		a = applicationService.save(a);
		course.getApplications().add(a);
		courseService.save(course);
		Dancer d = (Dancer) loginService.findActorByUserName(LoginService.getPrincipal().getId());
		List<Application> applications = d.getApplications();
		applications.add(a);
		d.setApplications(applications);
		dancerService.save(d);

		result = new ModelAndView("redirect:/welcome/index.do");
		result.addObject("courses", courseService.findAll());

		return result;
	}



}
