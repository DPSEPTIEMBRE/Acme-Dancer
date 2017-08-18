package controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
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

	private StyleService styleService;

	// Constructors -----------------------------------------------------------
	public StyleController(){
		super();
	}

	//Actions

	@RequestMapping("/list")
	public ModelAndView list(@RequestParam Integer a) {
		ModelAndView result;

		result = new ModelAndView("style/list");
		
		result.addObject("styles", styleService.findAll());
		result.addObject("a", a);

		return result;
	}
	
	/*@RequestMapping(value= "/save",method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid Style style, BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors()) {
			result = new ModelAndView("style/create");
			result.addObject("style", style);
			result.addObject("url","style/save.do");
			result.addObject("message", "style.commit.error");
		} else {
			try {
				styleService.save(style);
				result = new ModelAndView("redirect:/welcome/index.do");
			} catch (Throwable oops) {
				result = new ModelAndView("style/create");
				result.addObject("style", style);
				result.addObject("url","style/save.do");
				result.addObject("message", "style.commit.error"); } }


		return result;
	}


	@RequestMapping(value= "/save-edit",method = RequestMethod.POST, params = "save")
	public ModelAndView saveEdit(@Valid Style style, BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors()) {
			result = new ModelAndView("style/edit");
			result.addObject("style", style);
			result.addObject("url","style/save.do");
			result.addObject("message", null);
		} else {
			try {
				styleService.save(style);
				result = new ModelAndView("redirect:/welcome/index.do");
			} catch (Throwable oops) {
				result = new ModelAndView("style/edit");
				result.addObject("style", style);
				result.addObject("url","style/save.do");
				result.addObject("message", "style.commit.error"); } }


		return result;
	}

	@RequestMapping("/edit")
	public ModelAndView editSave(@RequestParam Integer q) {
		ModelAndView result;

		Style style= styleService.findOne(q);

		result = new ModelAndView("style/edit");
		result.addObject("style", style);
		result.addObject("message", null);  
		result.addObject("url", "style/save-edit.do");


		return result;
	}

	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam Integer q) {
		ModelAndView result;

		result = new ModelAndView("style/delete");
		result.addObject("style", q);
		result.addObject("message", null);  
		result.addObject("url", "style/delete-delete.do");


		return result;
	}

	@RequestMapping("/delete-delete")
	public ModelAndView deleteDelete(@RequestParam Integer q) {
		ModelAndView result;

		Style style= styleService.findOne(q);

		try {
			styleService.delete(style);
			result = new ModelAndView("redirect:/welcome/index.do");
		}catch(Throwable oops){
			result = new ModelAndView("style/edit");
			result.addObject("style", style);
			result.addObject("url","style/save.do");
			result.addObject("message", "style.commit.error"); }



		return result;
	}*/


}
