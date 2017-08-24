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

		Academy a = (Academy)loginService.findActorByUsername(q);
		tutorials.addAll(tutorialService.tutorialsOfAcademy(a.getId()));
		
		result = new ModelAndView("tutorial/list");
		result.addObject("tutorials", tutorials);
		result.addObject("a", 2);
		

		return result;
	}
	
	@RequestMapping("/view")
	public ModelAndView view(@RequestParam Integer q) {
		ModelAndView result;
		result = new ModelAndView("tutorial/view");
		Tutorial tutorial = tutorialService.findOne(q);
		tutorial.setNumShows(tutorial.getNumShows() + 1);
		tutorialService.save(tutorial);
		result.addObject("tutorial", tutorial);
		return result;
	}

	@RequestMapping(value = "/academy/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;

		result = createNewModelAndView(tutorialService.create(), null);

		return result;
	}

	@RequestMapping(value = "/academy/save-create", method = RequestMethod.POST, params = "save")
	public ModelAndView saveCreate(@Valid Tutorial tutorial, BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors()) {
			for (Object e : binding.getAllErrors()) {
				System.out.println(e);

			}
			result = createNewModelAndView(tutorial, null);
		} else {
			try {
				int id = LoginService.getPrincipal().getId();
				tutorialService.save(tutorial);
				result = new ModelAndView("redirect:/tutorial/listByMyAcademy.do?q=" + id);

			} catch (Throwable th) {
				result = createNewModelAndView(tutorial, "tutorial.commit.error");
			}
		}
		return result;
	}

	protected ModelAndView createNewModelAndView(Tutorial tutorial, String message) {
		ModelAndView result;
		result = new ModelAndView("tutorial/create");
		result.addObject("tutorial", tutorial);
		result.addObject("message", message);
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
				int id = LoginService.getPrincipal().getId();
				result = new ModelAndView("redirect:/tutorial/listByMyAcademy.do?q=" + id);
			} catch (Throwable oops) {
				result = new ModelAndView("tutorial/edit");
				result.addObject("tutorial", tutorial);
				result.addObject("url","tutorial/save.do");
				result.addObject("message", "tutorial.commit.error"); } }


		return result;
	}


	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam Integer q) {
		ModelAndView result;

		Tutorial a = tutorialService.findOne(q);
		
		try {
			tutorialService.delete(a);
			int id = LoginService.getPrincipal().getId();
			result = new ModelAndView("redirect:/tutorial/listByMyAcademy.do?q=" + id);
		}catch (Throwable e) {
			int id = LoginService.getPrincipal().getId();
			result = new ModelAndView("redirect:/tutorial/listByMyAcademy.do?q=" + id);
		}

		return result;

	}

	


}