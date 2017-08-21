package controllers;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import domain.Chirp;
import security.LoginService;
import services.ChirpService;

@Controller
@RequestMapping("/chirp/actor")
public class ChirpController extends AbstractController {

	// Services

	@Autowired
	private ChirpService chirpService;

	@Autowired
	private LoginService loginService;

	// Constructors -----------------------------------------------------------
	public ChirpController() {
		super();
	}

	// Actions

	@RequestMapping("/mylist")
	public ModelAndView mylist() {
		ModelAndView result;

		Integer actorId = loginService.findActorByUserName(LoginService.getPrincipal().getId()).getId();
		Collection<Chirp> chirps = chirpService.chirpsOfActor(actorId);

		result = new ModelAndView("chirp/list");
		result.addObject("chirps", chirps);

		return result;
	}
	
	@RequestMapping("/create")
	public ModelAndView create() {
		ModelAndView result;
		
		Chirp chirp = chirpService.create();

		result = new ModelAndView("chirp/create");
		result.addObject("chirp", chirp);
		result.addObject("url", "chirp/actor/save.do");

		return result;
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid Chirp chirp, BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors()) {
			result = new ModelAndView("chirp/create");
			result.addObject("chirp", chirp);
		} else {
			try {
				chirpService.save(chirp);
				result = new ModelAndView("redirect:/welcome/index.do");
			} catch (Throwable oops) {
				result = new ModelAndView("chirp/create");
				result.addObject("chirp", chirp);
				result.addObject("message", "chirp.commit.error");
			}
		}

		return result;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam int q) {
		ModelAndView result;
		Chirp chirp = chirpService.findOne(q);

		chirpService.delete(chirp);
		result = new ModelAndView("redirect:/chirp/actor/mylist.do");

		return result;
	}
}
