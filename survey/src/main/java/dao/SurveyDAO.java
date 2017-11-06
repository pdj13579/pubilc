package dao;

import model.ServeyVO;

public interface SurveyDAO {
	
	public boolean insertSurvey(ServeyVO vo);
	public boolean updateSurvey(ServeyVO vo);
	public boolean deleteSurvey(int idx);

}
