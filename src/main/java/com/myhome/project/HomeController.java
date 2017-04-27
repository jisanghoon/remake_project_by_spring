package com.myhome.project;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myhome.domain.Project;
import com.myhome.service.ProjectService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Inject
	ProjectService service;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String listPage(Model model) throws Exception {
		logger.info("Main Page Loading.........");
		model.addAttribute("listItem", service.list());
		return "main";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGET() throws Exception {
		logger.info("register get ............");
		return "insertForm";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(Project project,String sdate1, String edate1, Model model) throws Exception {
		logger.info("register get ............");
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		if (sdate1 != "") project.setSdate(format.parse(sdate1));
		if (edate1 != "") project.setEdate(format.parse(edate1));

		service.create(project);
		
		return "redirect:/";
	}

	@RequestMapping(value = "read", method = RequestMethod.GET)
	public String read(@RequestParam("pno") int pno, Model model) throws Exception {
		logger.info("read GET...");
		model.addAttribute("project", service.read(pno));
		return "detail";
	}

	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("pno") int pno, Model model) throws Exception {
		logger.info("modify GET...");
		System.out.println("------------------>>>" + service.read(pno));
		model.addAttribute("project", service.read(pno));
		return "insertForm";
	}

	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modifyPOST(Project project, String sdate1, String edate1, RedirectAttributes rttr) throws Exception {
		logger.info("modify POST...");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		if (sdate1 != "") project.setSdate(format.parse(sdate1));
		if (edate1 != "") project.setEdate(format.parse(edate1));

		service.modify(project);
		rttr.addFlashAttribute("pno", project.getPno());
		return "redirect:/";

	}

	@RequestMapping(value = "remove", method = RequestMethod.GET)
	public String remove(@RequestParam("pno") int pno) throws Exception {
		logger.info("remove GET...");
		service.remove(pno);
		return "redirect:/";
	}

}
