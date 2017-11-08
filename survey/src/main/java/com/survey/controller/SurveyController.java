package com.survey.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.survey.model.SurveyVO;
import com.survey.mapper.SurveyMapper;
/**
 * Handles requests for the application home page.
 */
@Controller
public class SurveyController {
	
	private static final Logger logger = LoggerFactory.getLogger(SurveyController.class);
	
	@Autowired
	private SurveyMapper surveyMapper;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	@RequestMapping(value = "/surveyList", method = RequestMethod.GET)
	public ModelAndView surveyList(int page) {
		ModelAndView mv = new ModelAndView("/surveyList");
		List<SurveyVO> list = surveyMapper.SurveyList(page);
		mv.addObject("surveyList", list);
		return mv;
	}
	
	@RequestMapping(value = "/surveyInsert", method = RequestMethod.GET)
	public String surveyInsert(SurveyVO vo) {
		
		surveyMapper.insertSurvey(vo);
		
		return "surveyInsert";
	}
	@RequestMapping(value = "/surveyUpdate", method = RequestMethod.GET)
	public String surveyUpdate(SurveyVO vo) {
		
		surveyMapper.updateSurvey(vo);
		
		return "surveyUpdate";
	}
	@RequestMapping(value = "/surveyDelete", method = RequestMethod.GET)
	public String surveyDelete(int surveyIdx) {
		
		surveyMapper.deleteSurvey(surveyIdx);
		
		return "surveyDelete";
	}
	
	
}
