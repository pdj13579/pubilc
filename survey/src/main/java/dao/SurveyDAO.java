package dao;

import model.ServeyVO;

public interface SurveyDAO {
	
	public boolean InsertSurvey(ServeyVO vo);
	public boolean UpdateSurvey(ServeyVO vo);
	public boolean DeleteSurvey(int idx);

}
