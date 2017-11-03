<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8" %>
<%@ page language="java" import="java.sql.*"%> 
<%
String strURL = "";
String strUser = "";
String strPassword = "";
String strLog, strError;
String sql1, sql2, sql3;
Connection conn = null;
PreparedStatement  pstmt;
ResultSet  rs;
boolean bRet ;
int surveyIdx = 0;
int questionIdx = 0;
int mediaIdx = 0;
int exampleIdx=0;
try{
/* 		System.out.println("연결");
	 conn =JNDIConnector.getConn(); */
	Class.forName("oracle.jdbc.driver.OracleDriver");
   strURL = "jdbc:oracle:thin:@1.234.19.244:1521:ORCL2";
   strUser  = "MEM_SJC";
   strPassword = "MEM_SHCFlash1234";
   conn = DriverManager.getConnection(strURL, strUser, strPassword);
   strLog = strURL+"에 연결되었습니다."; 
   System.out.println(strLog);
}
catch(Exception e){
 strError = strURL+"에  연결할 수 없습니다." + e.getMessage();
 System.out.println(strError);
} 
sql1 = "INSERT INTO TS_SEQ(TABLE_NAME,IDX) VALUES(?,?);";

try {
	pstmt = conn.prepareStatement(sql1);
	pstmt.setString(1, "TS_QUESTION");
	pstmt.setString(2, "0");
	rs = pstmt.executeQuery();
	
} catch (SQLException e) {
	System.out.println("TS_SEQ SQL error : " + e.getMessage());
} catch (Exception e) {
	System.out.println("TS_SEQ error : " + e.getMessage());
}

if(conn !=null){
    try{
       conn.close();
       pstmt = null;
       sql1 = null;
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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>