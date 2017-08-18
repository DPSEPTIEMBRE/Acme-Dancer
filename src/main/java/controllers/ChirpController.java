package controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ChirpService;
import domain.Chirp;

@Controller
@RequestMapping("/chirp")
public class ChirpController extends AbstractController{

	//Services

	private ChirpService chirpService;

	// Constructors -----------------------------------------------------------
	public ChirpController(){
		super();
	}

	//Actions

	@RequestMapping("/listByActor")
	public ModelAndView list(@RequestParam Integer a) {
		ModelAndView result;

		result = new ModelAndView("chirp/list");

		result.addObject("a", a);
		result.addObject("chirps", chirpService.allChirpsOrderByMommentDesc());

		return result;
	}
	
	@RequestMapping(value= "/save",method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid Chirp chirp, BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors()) {
			result = new ModelAndView("chirp/create");
			result.addObject("chirp", chirp);
			result.addObject("url","chirp/save.do");
			result.addObject("message", "chirp.commit.error");
		} else {
			try {
				chirpService.save(chirp);
				result = new ModelAndView("redirect:/welcome/index.do");
			} catch (Throwable oops) {
				result = new ModelAndView("chirp/create");
				result.addObject("chirp", chirp);
				result.addObject("url","chirp/save.do");
				result.addObject("message", "chirp.commit.error"); } }


		return result;
	}


	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam Integer q) {
		ModelAndView result;

		result = new ModelAndView("chirp/delete");
		result.addObject("chirp", q);
		result.addObject("message", null);  
		result.addObject("url", "chirp/delete-delete.do");


		return result;
	}

	@RequestMapping("/delete-delete")
	public ModelAndView deleteDelete(@RequestParam Integer q) {
		ModelAndView result;

		Chirp chirp= chirpService.findOne(q);

		try {
			chirpService.delete(chirp);
			result = new ModelAndView("redirect:/welcome/index.do");
		}catch(Throwable oops){
			result = new ModelAndView("chirp/edit");
			result.addObject("chirp", chirp);
			result.addObject("url","chirp/save.do");
			result.addObject("message", "chirp.commit.error"); }

		return result;
	}
}	
