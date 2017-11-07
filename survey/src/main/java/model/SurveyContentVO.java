package model;

public class SurveyContentVO {
	private int surveyIdx;
	private int language;
	private String subject;
	private String conclustion;
	private String prizeGuide;
	private String completeMessage;
	private String expiredMessage;
	private String duplicatedMessage;
	private String errorMessage;
	private int skinIdx;
	private String content;
	public int getSurveyIdx() {
		return surveyIdx;
	}
	public void setSurveyIdx(int surveyIdx) {
		this.surveyIdx = surveyIdx;
	}
	public int getLanguage() {
		return language;
	}
	public void setLanguage(int language) {
		this.language = language;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getConclustion() {
		return conclustion;
	}
	public void setConclustion(String conclustion) {
		this.conclustion = conclustion;
	}
	public String getPrizeGuide() {
		return prizeGuide;
	}
	public void setPrizeGuide(String prizeGuide) {
		this.prizeGuide = prizeGuide;
	}
	public String getCompleteMessage() {
		return completeMessage;
	}
	public void setCompleteMessage(String completeMessage) {
		this.completeMessage = completeMessage;
	}
	public String getExpiredMessage() {
		return expiredMessage;
	}
	public void setExpiredMessage(String expiredMessage) {
		this.expiredMessage = expiredMessage;
	}
	public String getDuplicatedMessage() {
		return duplicatedMessage;
	}
	public void setDuplicatedMessage(String duplicatedMessage) {
		this.duplicatedMessage = duplicatedMessage;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	public int getSkinIdx() {
		return skinIdx;
	}
	public void setSkinIdx(int skinIdx) {
		this.skinIdx = skinIdx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
