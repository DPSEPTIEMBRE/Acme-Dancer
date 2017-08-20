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
import services.TutorialService;
import domain.Academy;
import domain.Tutorial;

@Controller
@RequestMapping("/tutorial")
public class TutorialController extends AbstractController{

	//Services
	
	@Autowired
	private TutorialService tutorialService;
	
	@Autowired
	private LoginService loginService;

	// Constructors -----------------------------------------------------------
	public TutorialController(){
		super();
	}

	//Actions
	
	@RequestMapping("/list")
	public ModelAndView list(@RequestParam Integer a) {
		ModelAndView result;

		result = new ModelAndView("tutorial/list");

		result.addObject("a", a);
		result.addObject("tutorials", tutorialService.findAll());


		return result;
	}

	@RequestMapping("/listByAcademy")
	public ModelAndView listByAcademy(@RequestParam Integer q) {
		ModelAndView result;
		
		List<Tutorial> tutorials= new ArrayList<Tutorial>();
		tutorials=(List<Tutorial>) tutorialService.tutorialsOfAcademy(q);
		result = new ModelAndView("tutorial/list");
		result.addObject("tutorials", tutorials);
		result.addObject("a", 1);
		

		return result;
	}
	
	@RequestMapping("/listByMyAcademy")
	public ModelAndView listByMyAcademy(@RequestParam Integer q) {
		ModelAndView result;
		
		List<Tutorial> tutorials= new ArrayList<Tutorial>();

		Academy a = (Academy)loginService.findActorByUserName(q);
		tutorials.addAll(tutorialService.tutorialsOfAcademy(a.getId()));
		
		result = new ModelAndView("tutorial/list");
		result.addObject("tutorials", tutorials);
		result.addObject("a", 2);
		

		return result;
	}
	
	@RequestMapping(value= "/save",method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid Tutorial tutorial, BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors()) {
			result = new ModelAndView("tutorial/create");
			result.addObject("tutorial", tutorial);
			result.addObject("url","tutorial/save.do");
			result.addObject("message", "tutorial.commit.error");
		} else {
			try {
				tutorialService.save(tutorial);
				result = new ModelAndView("redirect:/tutorial/list.do?a=0");
			} catch (Throwable oops) {
				result = new ModelAndView("tutorial/create");
				result.addObject("tutorial", tutorial);
				result.addObject("url","tutorial/save.do");
				result.addObject("message", "tutorial.commit.error"); } }


		return result;
	}


	@RequestMapping(value= "/academy/save-edit",method = RequestMethod.POST, params = "save")
	public ModelAndView saveEdit(@Valid Tutorial tutorial, BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors()) {
			result = new ModelAndView("tutorial/edit");
			result.addObject("tutorial", tutorial);
			result.addObject("url","tutorial/save.do");
			result.addObject("message", null);
		} else {
			try {
				tutorialService.save(tutorial);
				result = new ModelAndView("redirect:/tutorial/list.do?a=0");
			} catch (Throwable oops) {
				result = new ModelAndView("tutorial/edit");
				result.addObject("tutorial", tutorial);
				result.addObject("url","tutorial/save.do");
				result.addObject("message", "tutorial.commit.error"); } }


		return result;
	}

	@RequestMapping("/edit")
	public ModelAndView editSave(@RequestParam Integer q) {
		ModelAndView result;

		Tutorial tutorial= tutorialService.findOne(q);

		result = new ModelAndView("tutorial/edit");
		result.addObject("tutorial", tutorial);
		result.addObject("message", null);  
		result.addObject("url", "tutorial/save-edit.do");


		return result;
	}

	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam Integer q) {
		ModelAndView result;

		result = new ModelAndView("tutorial/delete");
		result.addObject("tutorial", q);
		result.addObject("message", null);  
		result.addObject("url", "tutorial/delete-delete.do");


		return result;
	}

	@RequestMapping("/delete-delete")
	public ModelAndView deleteDelete(@RequestParam Integer q) {
		ModelAndView result;

		Tutorial tutorial= tutorialService.findOne(q);

		try {
			tutorialService.delete(tutorial);
			result = new ModelAndView("redirect:/tutorial/list.do?a=0");
		}catch(Throwable oops){
			result = new ModelAndView("tutorial/edit");
			result.addObject("tutorial", tutorial);
			result.addObject("url","tutorial/delete.do");
			result.addObject("message", "tutorial.commit.error.delete"); }



		return result;
	}
}