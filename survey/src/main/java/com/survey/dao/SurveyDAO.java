package com.survey.dao;

import com.survey.model.SurveyVO;

public interface SurveyDAO {
	
	public boolean InsertSurvey(SurveyVO vo);
	public boolean UpdateSurvey(SurveyVO vo);
	public boolean DeleteSurvey(int idx);

}
