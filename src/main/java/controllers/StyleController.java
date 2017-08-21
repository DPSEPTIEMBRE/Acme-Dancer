package controllers;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.StyleService;
import domain.Style;

@Controller
@RequestMapping("/style")
public class StyleController extends AbstractController{

	//Services
	
	@Autowired
	private StyleService styleService;

	// Constructors -----------------------------------------------------------
	public StyleController(){
		super();
	}

	//Actions

	@RequestMapping("/list")
	public ModelAndView list() {
		ModelAndView result;

		result = new ModelAndView("style/list");
		
		result.addObject("styles", styleService.findAll());
		result.addObject("a", 0);

		return result;
	}
	
	@RequestMapping("/listByCourse")
	public ModelAndView listByCourse(@RequestParam Integer q) {
		ModelAndView result;

		result = new ModelAndView("style/list");
		
		Style style = styleService.findByCourse(q);
		
		result.addObject("styles", style);

		return result;
	}
	
	@RequestMapping("/listAdministratorStyle")
	public ModelAndView listAdministrator() {
		ModelAndView result;

		result = new ModelAndView("style/list");

		result.addObject("styles", styleService.findAll());
		result.addObject("a", 2);

		return result;
	}
	
	@RequestMapping(value = "/administrator/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;

		result = createNewModelAndView(styleService.create(), null);

		return result;
	}

	@RequestMapping(value = "/administrator/edit", method = RequestMethod.GET)
	public ModelAndView edit(Integer q) {
		ModelAndView result;

		result = createEditModelAndView(styleService.findOne(q), null);

		return result;
	}

	@RequestMapping(value = "/administrator/save", method = RequestMethod.POST, params = "save")
	public ModelAndView saveCreate(@Valid Style style, BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors()) {
			result = createNewModelAndView(style, null);
		} else {
			try {
				styleService.save(style);
				result = new ModelAndView("redirect:/style/listAdministratorStyle.do");
			} catch (Throwable th) {
				result = createNewModelAndView(style, "style.commit.error");
			}
		}
		return result;
	}

	@RequestMapping(value = "/administrator/save-edit", method = RequestMethod.POST, params = "save")
	public ModelAndView saveEdit(@Valid Style style, BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors()) {
			result = createEditModelAndView(style, null);
		} else {
			try {
				styleService.save(style);
				result = new ModelAndView("redirect:/style/listAdministratorStyle.do");
			} catch (Throwable th) {
				result = createEditModelAndView(style, "style.commit.error");
			}
		}
		return result;
	}

	@RequestMapping(value = "/administrator/save-edit", method = RequestMethod.POST, params = "delete")
	public ModelAndView delete(@Valid Style style, BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors()) {
			for (ObjectError e : binding.getAllErrors()) {
				System.out.println(e);
			}
			result = createEditModelAndView(style, null);
		} else {
			try {
				styleService.delete(style);
				result = new ModelAndView("redirect:/style/listAdministratorStyle.do");
			} catch (Throwable th) {
				result = createEditModelAndView(style, "style.commit.error");
			}
		}
		return result;
	}

	protected ModelAndView createNewModelAndView(Style style, String message) {
		ModelAndView result;
		result = new ModelAndView("style/create");
		result.addObject("style", style);
		result.addObject("message", message);
		return result;
	}

	protected ModelAndView createEditModelAndView(Style style, String message) {
		ModelAndView result = new ModelAndView("style/edit");

		result.addObject("style", style);
		result.addObject("message", message);
		return result;
	}

}