package model;

public class AnswerVO {
	private int surveyIdx;
	private int questionIdx;
	private String language;
	private String userKey;
	private int selectInput;
	private int digitInput;
	private String textInput;
	private String onlineFlag;
	public int getSurveyIdx() {
		return surveyIdx;
	}
	public void setSurveyIdx(int surveyIdx) {
		this.surveyIdx = surveyIdx;
	}
	public int getQuestionIdx() {
		return questionIdx;
	}
	public void setQuestionIdx(int questionIdx) {
		this.questionIdx = questionIdx;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getUserKey() {
		return userKey;
	}
	public void setUserKey(String userKey) {
		this.userKey = userKey;
	}
	public int getSelectInput() {
		return selectInput;
	}
	public void setSelectInput(int selectInput) {
		this.selectInput = selectInput;
	}
	public int getDigitInput() {
		return digitInput;
	}
	public void setDigitInput(int digitInput) {
		this.digitInput = digitInput;
	}
	public String getTextInput() {
		return textInput;
	}
	public void setTextInput(String textInput) {
		this.textInput = textInput;
	}
	public String getOnlineFlag() {
		return onlineFlag;
	}
	public void setOnlineFlag(String onlineFlag) {
		this.onlineFlag = onlineFlag;
	}
	
	
	
	
}
