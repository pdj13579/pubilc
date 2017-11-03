<%@page import="java.util.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8" %>
<%@ page language="java" import="java.sql.*"%>    
<%
String strURL = "";
String strUser = "";
String strPassword = "";
String strLog, strError;
String sql1, sql2, sql3;
StringBuffer stringbf = new StringBuffer();
StringBuffer stringbf2 = new StringBuffer();
Connection conn = null;
PreparedStatement  pstmt;
ResultSet  rs;
boolean bRet ;
int surveyIdx = 0;
int questionIdx = 0;
int mediaIdx = 0;
int exampleIdx=0;

String language = request.getParameter("Language");


String gender = request.getParameter("gender");
String city = request.getParameter("city");
String age = request.getParameter("age");
String foreigner = request.getParameter("foreigner");
String agreement = request.getParameter("agreement");


String surveyTitleForeign;
String surveyInfoForeign;
String surveyEndPopForeign;

/* if(!language.equals("KR")){
	
}
 */
String surveyTitle = request.getParameter("surveyTitle");
String responsMember = request.getParameter("responsMember");
String surveyStart = request.getParameter("surveyStart");
String surveyEnd = request.getParameter("surveyEnd");
String surveyInfo = request.getParameter("surveyInfo");
String surveyEndPop = request.getParameter("surveyEndPop");
String giftName = request.getParameter("giftName");
String giftAdress = request.getParameter("giftAdress");
String giftPH = request.getParameter("giftPH");
String[] surveyChart = request.getParameterValues("surveyChart");
String surveyDivision = request.getParameter("surveyDivision");
String divisionNum = request.getParameter("divisionNum");
String surveyTopImg = request.getParameter("surveyTopImg");
String surveyTopURL = request.getParameter("surveyTopURL");

String[] question = request.getParameterValues("questionIdx");
String[] questionSubject = request.getParameterValues("subject");
 
Calendar cal = Calendar.getInstance();
SimpleDateFormat day = new SimpleDateFormat("yyyyMMddhhmmss");
String insertTime =day.format(cal.getTime());
String questionType = "";
String questionOverlap = "";
String questionExampleImg = "";
String questionExamplevidio = "";
String[] questionExample = null;

String[] questionExampleSub  = null;
String[] conditionStart  = null;
String[] conditionEnd  = null;
String questionExampleCondtion  = "";
String criticalChk  = "";
String questionDetail  = "";

Object[] questionInfo  = null;
ArrayList<Object[]> questionList = new ArrayList<Object[]>();
ArrayList<String[]> ExampleList = new ArrayList<String[]>();
ArrayList<String[]> ExampleSubList = new ArrayList<String[]>();
ArrayList<String[]> ExampleConditionStart = new ArrayList<String[]>();
ArrayList<String[]> ExampleConditionEnd = new ArrayList<String[]>();
int i = 0;
if(question != null){
	for(String temp: question){
		
		
		questionExampleImg = request.getParameter("itemImg_"+temp);
		questionExamplevidio = request.getParameter("vidioURL_"+temp);
		questionType = request.getParameter("questionType_"+temp);
		questionOverlap = request.getParameter("overlap_"+temp);
		if(questionType.equals("0")){
			if(questionOverlap.equals("AO")){
				questionExample = request.getParameterValues("chkRadioItemValue_"+temp);
				questionExampleSub = request.getParameterValues("chkRadioSubItem_"+temp);
				conditionStart = request.getParameterValues("conditionStart_"+temp);
				conditionEnd = request.getParameterValues("conditionEnd_"+temp);
				ExampleList.add(questionExample);
				ExampleConditionStart.add(conditionStart);
				ExampleConditionEnd.add(conditionEnd);
				ExampleSubList.add(questionExampleSub);
			}else if(questionOverlap.equals("AP")){
				
				questionExample = request.getParameterValues("chkboxItem_"+temp);
				ExampleList.add(questionExample);
			}
		}else if(questionType.equals("1")){
		}else if(questionType.equals("2")){
			questionExample = request.getParameterValues("matrix_"+temp);
			ExampleList.add(questionExample);
		}
		
		
		
		conditionStart = request.getParameterValues("conditionStart_"+temp);
		conditionEnd = request.getParameterValues("conditionEnd_"+temp);
		criticalChk = request.getParameter("criticalChk_"+temp);
		questionDetail = request.getParameter("questionDetail_"+temp);
		
		questionInfo = new Object[]{questionSubject[i],questionExampleImg,questionExamplevidio,questionType,questionOverlap,criticalChk,questionDetail}; 
		questionList.add(questionInfo);
		
		
		
		i++;
	}
}


 try{
/* 		System.out.println("연결");
	 conn =JNDIConnector.getConn(); */
	Class.forName("oracle.jdbc.driver.OracleDriver");
    strURL = "jdbc:oracle:thin:@1.234.19.244:1521:ORCL";
    strUser  = "MEM_SJC";
    strPassword = "mem_sjcFlash1234";
    conn = DriverManager.getConnection(strURL, strUser, strPassword);
    strLog = strURL+"에 연결되었습니다."; 
    System.out.println(strLog);
 }
 catch(Exception e){
  strError = strURL+"에  연결할 수 없습니다." + e.getMessage();
  System.out.println(strError);
 } 
 
 
sql1 = "SELECT idx FROM TS_SEQ WHERE TABLE_NAME=?";
sql2 = "UPDATE TS_SEQ SET IDX = ? WHERE TABLE_NAME = ?";
stringbf.append("INSERT INTO TS_SURVEY(SURVEY_IDX, START_DATE, END_DATE, STATE, RESULT_CONDITION, PERSON_LIMIT, DUPLICATION, SURVEY_TYPE, DIVIDE_PAGE, QUESTION_NO, PASSWORD, MANAGER_USER, INSERT_DATE    )");
stringbf.append("VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");

 
	try {
		pstmt = conn.prepareStatement(sql1);
		pstmt.setString(1, "TS_SURVEY");
		rs = pstmt.executeQuery();
		while(rs.next()){
			surveyIdx = rs.getInt("idx")+1;
		}
		pstmt = conn.prepareStatement(sql2);
		pstmt.setInt(1, surveyIdx);
		pstmt.setString(2, "TS_SURVEY");
		pstmt.executeUpdate();
	} catch (SQLException e) {
		System.out.println("TS_SEQ SQL error : " + e.getMessage());
	} catch (Exception e) {
		System.out.println("TS_SEQ error : " + e.getMessage());
	}

	try {
		pstmt = conn.prepareStatement(stringbf.toString());
		pstmt.setInt(1, surveyIdx);
		pstmt.setString(2, surveyStart);
		pstmt.setString(3, surveyEnd);
		pstmt.setInt(4, 1);
		pstmt.setInt(5, 0);
		pstmt.setInt(6, 0);
		pstmt.setInt(7, 0);
		if(surveyDivision.equals("AB")){
			pstmt.setInt(8, 0);	
			pstmt.setInt(9, 0);
		}else{
			pstmt.setInt(8, 1);
			pstmt.setInt(9, Integer.parseInt(divisionNum));
		}

		pstmt.setString(10, "");
		pstmt.setString(11, "");
		pstmt.setString(12, responsMember);
		pstmt.setString(13, insertTime);
		pstmt.executeQuery();

	} catch (SQLException e) {
		out.println("TS_SURVEY SQL error : " + e.getMessage());
	} catch (Exception e) {
		out.println("TS_SURVEY error : " + e.getMessage());
	}
	stringbf = null;
	stringbf = new StringBuffer();
	stringbf.append("INSERT INTO TS_SURVEY_CONTENT(SURVEY_IDX, LANGUAGE, SUBJECT, STARTUP, CONCLUSION , PRIZE_GUIDE, COMPLETE_MESSAGE, EXPIRED_MESSAGE, DUPLICATED_MESSAGE, ERROR_MESSAGE,  CONTENT, INSERT_USER, INSERT_DATE)");
	stringbf.append(" VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)");
	
	try {
		pstmt = conn.prepareStatement(stringbf.toString());
		pstmt.setInt(1, surveyIdx);
		pstmt.setString(2, "KR");
		pstmt.setString(3, surveyInfo);
		pstmt.setString(4, surveyEndPop);
		pstmt.setString(5, "");
		pstmt.setString(6, "");
		pstmt.setString(7, "");
		pstmt.setString(8, "");	
		pstmt.setString(9, "");
		pstmt.setString(10, "");
		pstmt.setString(11, "");
		pstmt.setString(12, responsMember);
		pstmt.setString(13, insertTime);
		pstmt.executeQuery();

	} catch (SQLException e) {
		out.println("TS_SURVEY_CONTENT SQL error : " + e.getMessage());
	} catch (Exception e) {
		out.println("TS_SURVEY_CONTENT error : " + e.getMessage());
	}
	
	if(language !="KR"){
		
	}
	
	
	

 	stringbf = null;
	stringbf = new StringBuffer();
	stringbf.append("INSERT INTO TS_QUESTION(SURVEY_IDX, QUESTION_IDX, LANGUAGE, RESPONDENT_CD, EXTERNAL_NO, INTERNAL_NO, QUESTION_TYPE, ROW_SIZE, COL_SIZE, PARENT_IDX, INPUT_LIMIT, IMAGE, VIDEO_URL, CONTENT,  ");
	stringbf.append(" NECESSITY, IS_SELECT_BOX, WEIGHT_TYPE, DESCRIPTION, INSERT_USER, INSERT_DATE ) ");
	stringbf.append(" VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	
	
	
	for(int j =0;j< questionList.size();j++){
		Object[] temp = questionList.get(j);
		String tmp = Arrays.deepToString(temp);
		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, "TS_QUESTION");
			rs = pstmt.executeQuery();
			while(rs.next()){
				questionIdx = rs.getInt("idx")+1;
			}
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, questionIdx);
			pstmt.setString(2, "TS_QUESTION");
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("TS_SEQ SQL error : " + e.getMessage());
		} catch (Exception e) {
			System.out.println("TS_SEQ error : " + e.getMessage());
		}
		
		try {

			pstmt = conn.prepareStatement(stringbf.toString());
			pstmt.setInt(1, surveyIdx);
			pstmt.setInt(2, questionIdx);
			pstmt.setString(3, language);
			pstmt.setString(4, "");
			pstmt.setInt(5, 0);
			pstmt.setInt(6, 0);
			if(temp[3].toString().equals("0")){
				if(temp[4].equals("AO")){
					pstmt.setInt(7, 0);
				}else{
					pstmt.setInt(7, 1);
				}
			}else if(temp[3].toString().equals("1")){
				pstmt.setInt(7, 2);
			}else if(temp[3].toString().equals("2")){
				pstmt.setInt(7, 3);
			}
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			pstmt.setInt(11, 0);
			pstmt.setString(12, temp[1].toString());
			pstmt.setString(13, temp[2].toString());
			pstmt.setString(14, temp[0].toString());
			if(temp[5].toString().equals("Y")){
				pstmt.setInt(15, 1);
			}else{
				pstmt.setInt(15, 0);
			}
			pstmt.setInt(16, 0);
			pstmt.setInt(17, 0);
			pstmt.setString(18, temp[6].toString());
			pstmt.setString(19, responsMember);
			pstmt.setString(20, insertTime);
			pstmt.executeQuery();

		} catch (SQLException e) {
			out.println("TS_QUESTION SQL error : " + e.getMessage());
		} catch (Exception e) {
			out.println("TS_QUESTION error : " + e.getMessage());
		}
		
		
		String[] temp1 = null ;
		String[] temp2 = null ;
		String[] temp3 = null ;
		String[] temp4 = null ;
		
		/* Object[]{questionSubject[i],questionExampleImg,questionExamplevidio,questionType,questionOverlap,criticalChk,questionDetail}; */
		stringbf2 = new StringBuffer();
		if(temp[3].toString().equals("0") || temp[3].toString().equals("2")){
			if(temp[4].toString().equals("AO") && temp[3].toString().equals("0")){
				stringbf2.append("INSERT INTO TS_EXAMPLE(EXAMPLE_IDX, CONTENT, QUESTION_IDX, EXAMPLE_ORDER,  BRANCH, BRANCH_TO, BRANCH_COMMENT )"); 
				stringbf2.append("VALUES(?,?,?,?,?,?,?)");
				temp1 =ExampleList.get(j);           
				temp2 =ExampleSubList.get(j);        
				temp3 =ExampleConditionStart.get(j); 
				temp4 =ExampleConditionEnd.get(j);   
				
			}else{
				stringbf2.append("INSERT INTO TS_EXAMPLE(EXAMPLE_IDX, CONTENT, QUESTION_IDX, EXAMPLE_ORDER )"); 
				stringbf2.append("VALUES(?,?,?)");
				temp1 = ExampleList.get(j);
			}
		}

		
		if(temp[3].toString().equals("0") || temp[3].toString().equals("2")){
			for(int k=0;k< temp1.length;k++ ){
	
				 try {
						pstmt = conn.prepareStatement(sql1);
						pstmt.setString(1, "TS_EXAMPLE");
						rs = pstmt.executeQuery();
						while(rs.next()){
							exampleIdx = rs.getInt("idx")+1;
						}
						pstmt = conn.prepareStatement(sql2);
						pstmt.setInt(1, exampleIdx);
						pstmt.setString(2, "TS_EXAMPLE");
						pstmt.executeUpdate();
					} catch (SQLException e) {
						System.out.println("exampleIdx TS_SEQ SQL error : " + e.getMessage());
					} catch (Exception e) {
						System.out.println("exampleIdx TS_SEQ error : " + e.getMessage());
					}
					try {
						pstmt = conn.prepareStatement(stringbf2.toString());
						pstmt.setInt(1, exampleIdx);
						pstmt.setString(2, temp1[k]);
						pstmt.setInt(3, questionIdx);
						pstmt.setInt(4, k);
						if(temp[4].equals("AO") && temp[3].toString().equals("0")){
							pstmt.setInt(5, Integer.parseInt(temp3[k]));
							pstmt.setInt(6, Integer.parseInt(temp4[k]));
							pstmt.setString(7, temp2[k]);
						}
						pstmt.executeQuery();
	
					} catch (SQLException e) {
						out.println("TS_EXAMPLE SQL error : " + e.getMessage());
					} catch (Exception e) {
						out.println("TS_EXAMPLE error : " + e.getMessage());
					} 
				
			}
		}
		
		
		
		
		
		
		
	}
	
	

	
	
  if(conn !=null){
    try{
       conn.close();
       pstmt = null;
       stringbf2 = null;
       stringbf = null;
    }
    catch(SQLException e){
       strError = "정상적으로 종료할 수 없습니다." + e.getMessage();
       System.out.println(strError);
    }       
 }
 











%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<script>
//location.href = "surveyList.jsp";
</script> 

</body>
</html>