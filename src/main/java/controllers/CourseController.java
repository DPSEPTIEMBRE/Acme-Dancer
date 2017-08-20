package controllers;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import security.LoginService;
import services.CourseService;
import domain.Academy;
import domain.Course;

@Controller
@RequestMapping("/course")
public class CourseController extends AbstractController {

	//Services

	@Autowired
	private CourseService courseService;
	
	@Autowired
	private LoginService loginService;

	// Constructors -----------------------------------------------------------
	public CourseController(){
		super();
	}

	//Actions

	@RequestMapping("/list")
	public ModelAndView list(@RequestParam Integer a) {
		ModelAndView result;

		result = new ModelAndView("course/list");

		result.addObject("a", 0);
		result.addObject("courses", courseService.findAll());


		return result;
	}


	@RequestMapping("/listByAcademy")
	public ModelAndView listByAcademy(@RequestParam Integer q) {
		ModelAndView result;

		List<Course> courses= new ArrayList<Course>();
		courses.addAll(courseService.coursesOfAcademy(q));


		result = new ModelAndView("course/list");
		result.addObject("courses", courses);
		result.addObject("a", 1);

		return result;
	}

	@RequestMapping("/listByStyle")
	public ModelAndView listByStyle(@RequestParam Integer q) {
		ModelAndView result;

		List<Course> courses= new ArrayList<Course>();
		courses.addAll(courseService.coursesOfStyle(q));


		result = new ModelAndView("course/list");
		result.addObject("courses", courses);
		result.addObject("a", 2);

		return result;
	}
	
	@RequestMapping("/listByActor")
	public ModelAndView listByActor(@RequestParam Integer q) {
		ModelAndView result;

		List<Course> courses= new ArrayList<Course>();
		Academy a = (Academy)loginService.findActorByUserName(q);
		courses.addAll(courseService.coursesOfAcademy(a.getId()));


		result = new ModelAndView("course/list");
		result.addObject("courses", courses);
		result.addObject("a", 3);

		return result;
	}
	
	@RequestMapping("/search1")
	public ModelAndView search1(@RequestParam(required = false) String searchText) {
		ModelAndView result;
		result = new ModelAndView("course/list");
		result.addObject("courses", courseService.findCourses(searchText));
		result.addObject("a", 0);
		return result;
	}
	
	@RequestMapping("/search2")
	public ModelAndView search2(@RequestParam(required = false) String searchText) {
		ModelAndView result;
		result = new ModelAndView("course/list");
		result.addObject("courses", courseService.findCourses(searchText));
		result.addObject("a", 3);
		return result;
	}
	
	@RequestMapping("/search3")
	public ModelAndView search3(@RequestParam(required = false) String searchText) {
		ModelAndView result;
		result = new ModelAndView("course/list");
		result.addObject("courses", courseService.findCourses(searchText));
		result.addObject("a", 4);
		return result;
	}

	@RequestMapping(value= "/save-edit",method = RequestMethod.POST, params = "save")
	public ModelAndView saveEdit(@Valid Course course, BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors()) {
			result = new ModelAndView("course/edit");
			result.addObject("course", course);
			result.addObject("url","course/save.do");
			result.addObject("message", null);
		} else {
			try {
				courseService.save(course);
				result = new ModelAndView("redirect:/welcome/index.do");
			} catch (Throwable oops) {
				result = new ModelAndView("course/edit");
				result.addObject("course", course);
				result.addObject("url","course/save.do");
				result.addObject("message", "course.commit.error"); } }

		return result;
	}

	@RequestMapping("/edit")
	public ModelAndView editSave(@RequestParam Integer q) {
		ModelAndView result;

		Course course= courseService.findOne(q);

		result = new ModelAndView("course/edit");
		result.addObject("course", course);
		result.addObject("message", null);  
		result.addObject("url", "course/save-edit.do");

		return result;
	}

	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam Integer q) {
		ModelAndView result;

		result = new ModelAndView("course/delete");
		result.addObject("course", q);
		result.addObject("message", null);  
		result.addObject("url", "course/delete-delete.do");

		return result;
	}

	@RequestMapping("/delete-delete")
	public ModelAndView deleteDelete(@RequestParam Integer q) {
		ModelAndView result;

		Course course= courseService.findOne(q);

		try {
			courseService.delete(course);
			result = new ModelAndView("redirect:/welcome/index.do");
		}catch(Throwable oops){
			result = new ModelAndView("course/edit");
			result.addObject("course", course);
			result.addObject("url","course/save.do");
			result.addObject("message", "course.commit.error"); }

		return result;
	}



}
