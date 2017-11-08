package com.survey.mapper;

import java.util.List;

import com.survey.model.SurveyVO;

public interface SurveyMapper {
	
	//설문 입력
	public void insertSurvey(SurveyVO vo);
	//설문 목록
	public List<SurveyVO> SurveyList(int page);
	//설문 보기
	public SurveyVO viewSurvey(int surveyIdx);
	//설문 삭제
	public void deleteSurvey(int surveyIdx);
	//설문 수정
	public void updateSurvey(SurveyVO vo);
	
	
}
