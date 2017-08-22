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
import services.StyleService;
import domain.Academy;
import domain.Course;
import domain.LevelCourse;
import domain.Style;

@Controller
@RequestMapping("/course")
public class CourseController extends AbstractController {

	//Services

	@Autowired
	private CourseService courseService;

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private StyleService styleService;

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

	@RequestMapping("/search")
	public ModelAndView search(@RequestParam(required = false) String searchText) {
		ModelAndView result;
		result = new ModelAndView("course/list");
		result.addObject("courses", courseService.findCourses(searchText));
		result.addObject("a", 0);
		return result;
	}
	
	@RequestMapping(value= "/save",method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid Course course, BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors()) {
			result = new ModelAndView("course/create");
			result.addObject("course", course);
			result.addObject("url","course/save.do");
			result.addObject("message", "course.commit.error");
		} else {
			try {
				courseService.save(course);
				result = new ModelAndView("redirect:/course/list.do?a=0");
			} catch (Throwable oops) {
				result = new ModelAndView("course/create");
				result.addObject("course", course);
				result.addObject("url","course/save.do");
				result.addObject("message", "course.commit.error"); } }


		return result;
	}


	@RequestMapping(value= "/academy/save-edit",method = RequestMethod.POST, params = "save")
	public ModelAndView saveEdit(@Valid Course course, BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors()) {
			result = new ModelAndView("course/edit");
			result.addObject("course", course);
			result.addObject("url","course/academy/save.do");
			result.addObject("message", null);
		} else {
			try {
				courseService.save(course);
				result = new ModelAndView("redirect:/welcome/index.do");
			} catch (Throwable oops) {
				result = new ModelAndView("course/edit");
				result.addObject("course", course);
				result.addObject("url","course/academy/save.do");
				result.addObject("message", "course.commit.error"); } }

		return result;
	}
	
	@RequestMapping(value = "/academy/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;

		result = createNewModelAndView(courseService.create(), null);

		return result;
	}

	@RequestMapping(value= "/academy/save-create",method = RequestMethod.POST, params = "save")
	public ModelAndView saveCreate(@Valid Course course, BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors()) {
			for (Object e : binding.getAllErrors()) {
				System.out.println(e);

			}
			result = createNewModelAndView(course, null);
		} else {
			try {
				int id = LoginService.getPrincipal().getId();
				courseService.save(course);
				result = new ModelAndView("redirect:/course/listByActor.do?q=" + id);

			} catch (Throwable th) {
				result = createNewModelAndView(course, "course.commit.error");
			}
		}
		return result;
	}

	protected ModelAndView createNewModelAndView(Course course, String message) {
		ModelAndView result;
		
		List<LevelCourse> levelsCourse = new ArrayList<LevelCourse>();
		LevelCourse lc1 = new LevelCourse();
		lc1.setValue("BEGINNER");
		LevelCourse lc2 = new LevelCourse();
		lc2.setValue("INTERMEDIATE");
		LevelCourse lc3 = new LevelCourse();
		lc3.setValue("ADVANCED");
		LevelCourse lc4 = new LevelCourse();
		lc4.setValue("PROFESSIONAL");
		levelsCourse.add(lc1);
		levelsCourse.add(lc2);
		levelsCourse.add(lc3);
		levelsCourse.add(lc4);
		
		System.out.println(levelsCourse);
		
		List<String> styles = new ArrayList<String>();
		for(Style s: styleService.findAll()){
			styles.add(s.getName());
		}
		
		System.out.println(styles);
		
		result = new ModelAndView("course/create");
		result.addObject("course", course);
		result.addObject("message", message);
		result.addObject("levelsCourse", levelsCourse);
		result.addObject("styles", styleService.findAll());
		return result;
	}

	@RequestMapping("/academy/edit")
	public ModelAndView editSave(@RequestParam Integer q) {
		ModelAndView result;

		Course course= courseService.findOne(q);

		result = new ModelAndView("course/edit");
		result.addObject("course", course);
		result.addObject("message", null);  
		result.addObject("url", "course/academy/save-edit.do");

		return result;
	}

	@RequestMapping("/academy/delete")
	public ModelAndView delete(@RequestParam Integer q) {
		ModelAndView result;

		result = new ModelAndView("course/delete");
		result.addObject("course", q);
		result.addObject("message", null);  
		result.addObject("url", "course/academy/delete-delete.do");

		return result;
	}

	@RequestMapping("/academy/delete-delete")
	public ModelAndView deleteDelete(@RequestParam Integer q) {
		ModelAndView result;

		Course course= courseService.findOne(q);

		try {
			courseService.delete(course);
			result = new ModelAndView("redirect:/welcome/index.do");
		}catch(Throwable oops){
			result = new ModelAndView("course/edit");
			result.addObject("course", course);
			result.addObject("url","course/academy/save.do");
			result.addObject("message", "course.commit.error"); }

		return result;
	}



}
