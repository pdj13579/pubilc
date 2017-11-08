package com.survey.mapper;

import java.util.List;

import com.survey.model.SurveyVO;

public interface SurveyMapper {
	
	//���� �Է�
	public void insertSurvey(SurveyVO vo);
	//���� ���
	public List<SurveyVO> SurveyList(int page);
	//���� ����
	public SurveyVO viewSurvey(int surveyIdx);
	//���� ����
	public void deleteSurvey(int surveyIdx);
	//���� ����
	public void updateSurvey(SurveyVO vo);
	
	
}
