<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%
String saveDirectory;
StringBuffer question = new StringBuffer();
int maxPostSize = 10 * 1024 * 1024; // 10MB
saveDirectory = config.getServletContext().getRealPath("/upload");


String fileInput = "";
String fileName = "";
String type = "";
File fileObj = null;
String originFileName = "";    
String fileExtend = "";
String fileSize = "";
int count = 0;
int questionIdx=1;

     InputStream is = new BufferedInputStream(new FileInputStream(fileObj.getPath()));
     try {
         byte[] c = new byte[1024];
        
         int readChars = 0;
         boolean empty = true;
         while ((readChars = is.read(c)) != -1) {
             empty = false;
             for (int i = 0; i < readChars; ++i) {
                 if (c[i] == '\n') {
                     ++count;
                 }
             }
         }
         
     }catch (FileNotFoundException e) {
         System.out.println(e.getMessage());
     }catch (Exception e) {
    	 System.out.println(e.getMessage());
     } finally {
         is.close();
     }
     
	     try{
    	 File csv = new File(fileObj.getPath());
    	 FileReader fr =new FileReader(csv);
    	 BufferedReader br = new BufferedReader(fr);
         String line = "";
		
         while ((line = br.readLine()) != null) {
            // -1 옵션은 마지막 "," 이후 빈 공백도 읽기 위한 옵션
         	String[] token = line.split(",", -1);
         	question.append("<div id='question_"+questionIdx+"'");
         	question.append(" class='com_table_input' name='question'>");
        	question.append("<input type='hidden' name='questionIdx' value='"+questionIdx+"'>");
        	question.append("<h4>&nbsp;</h4>");
        	question.append("<a href='#' class='btn-wine-bold2 add_btn' onclick='removeQuestion("+questionIdx+"); return false; ' >문항 삭제</a> ");
        	question.append("<a href='#' class='btn-wine-bold2 add_btn' onclick='addQuestion("+questionIdx+")'	style='margin: 0 5px 0 5px;'>문항 복사</a> ");
        	question.append("<a href='#' class='btn-wine-bold add_btn' onclick='openCondition("+questionIdx+");return false;' target='_blank'>조건분기</a>");
        	question.append("<table class='padding_space2' summary='문항 정보 테이블'>");
        	question.append("<colgroup>");
        	question.append("<col style='width:15%;'>");
        	question.append("</colgroup>");
        	question.append("<colgroup>");
        	question.append("<col style='width:85%;'>");
        	question.append("</colgroup>");
        	question.append("<tr>");
        	question.append("<th scope='row' class='bor_top_style1'><span class='point_color'>*</span>&nbsp;문항 순번</th>");
        	question.append("<td class='bor_top_style1'>");
        	question.append("<select class='input_txt w10' name='questionOrderSelect'>");
        	for(int i = 1;i<=count;i++){
    	    	question.append("<option value='"+i+"'");
    			if(i==questionIdx){
    				question.append(" selected");
    			}
    	    	question.append(">"+i+"</option>");
        	}
        	question.append("</select>");
        	question.append("<input type='hidden' id='questionOrder_"+questionIdx+"' name='questionOrder' value='"+questionIdx+"'>");
        	question.append("</td>");
        	question.append("</tr>");
        	question.append("<tr>");
        	question.append("<th scope='row' class='bor_top_style1'><span class='point_color'>*</span>&nbsp;문항 제목</th>");
        	question.append("<td>");
        	question.append("<label for='OBJECT_AI' class='blind'>문항 제목</label><input type='text' id='subject_"+questionIdx+"' name='subject' class='w80 input_txt' value='"+token[0]+"'>");
        	question.append("</td>");
        	question.append("</tr>");
        	question.append("<tr>");
        	question.append("<th scope='row' rowspan='3'>이미지&#40;동영상&#41;</th>");
        	question.append("<td class='bot_no'>");
        	question.append("<label for=''>이미지</label>&nbsp;&nbsp;<input type='text' id='uploadImage_"+questionIdx+"' name='itemImg_"+questionIdx+"' placeholder='' readonly class='w70 input_txt'>&nbsp;");
        	question.append("<a href='#' class='btn-wine-bold2' onclick='uploadFile("+questionIdx+"); return false;' >파일선택</a><input type='file' id='file_"+questionIdx+"' name='fileList' class='file' onchange='insertImgValue("+questionIdx+")'>");
        	question.append("</td>");
        	question.append("</tr>");
        	question.append("<tr>");
        	question.append("<td class='bot_no'>");
        	question.append("<label for=''>동영상</label>&nbsp;&nbsp;<input type='text' id='OBJECT_AK_"+questionIdx+"' name='vidioURL_"+questionIdx+"' placeholder='유튜브 url를 등록하여 주세요.' class='w70 input_txt'>");
        	question.append("</td>");
        	question.append("</tr>");
        	question.append("<tr>");
        	question.append("<td class='point_color pdl_60'>");
        	question.append("* 이미지 사이즈는 000px*000px 사이즈로 등록해주세요.<br>");
        	question.append("* 파이크기는 10M 이내로 등록해주세요.");
        	question.append("</td>");
        	question.append("</tr>");
        	question.append("<tr>");
        	question.append("<th scope='row' >");
        	question.append("<span class='point_color'>*</span>&nbsp;문항 유형");
        	question.append("</th>");
        	question.append("<td colspan='3' class='bor_top_style1'>");
        	question.append("<input type='radio' id='OBJECT_AL_"+questionIdx+"' name='questionType_"+questionIdx+"' onclick='changeQuestionType("+questionIdx+",0)' value='0' checked>&nbsp;<label for='OBJECT_AL_"+questionIdx+"'>객관식</label>&nbsp;&nbsp;");
        	question.append("<input type='radio' id='OBJECT_AM_"+questionIdx+"' name='questionType_"+questionIdx+"' onclick='changeQuestionType("+questionIdx+",1)' value='1'>&nbsp;<label for='OBJECT_AM_"+questionIdx+"'>주관식</label>&nbsp;&nbsp;");
        	question.append("<input type='radio' id='OBJECT_AN_"+questionIdx+"' name='questionType_"+questionIdx+"' onclick='changeQuestionType("+questionIdx+",2)' value='2'>&nbsp;<label for='OBJECT_AN_"+questionIdx+"'>매트릭스</label>&nbsp;&nbsp;");
        	question.append("<a href='#' class='btn-wine-bold2' id='itemUpdateBtn_"+questionIdx+"' onclick='updateQuestion("+questionIdx+");return false;' target='_blank'>항목 수정</a>");
        	question.append("</td>");
        	question.append("</tr>"); 
        	
        	/*---------------------------------------------------------*/
        	/* 객관식 문항 */
        	/*---------------------------------------------------------*/
        	/*---------------------------------------------------------*/
        	/* 객관식 문항 단일 선택 */
        	/*---------------------------------------------------------*/
         	question.append("<tr name='multipleQuestion'>");
        	question.append("<th scope='row' rowspan='2'>");
        	question.append("<span class='point_color'>*</span>&nbsp;답변 유형");
        	question.append("</th>");
        	question.append("<td colspan='3' class='bor_top_style1'>");
        	question.append("<input type='radio' id='overlap_"+questionIdx+"_1' name='overlap_"+questionIdx+"' value='AO' onclick='changeQuestionOverlap(AO,"+questionIdx+");' checked>&nbsp;<label for='overlap_"+questionIdx+"'>단일선택</label>&nbsp;&nbsp;");
        	question.append("<input type='radio' id='overlap_"+questionIdx+"_2' name='overlap_"+questionIdx+"' value='AP' onclick='changeQuestionOverlap(AP,"+questionIdx+");'>&nbsp;<label for='overlap_"+questionIdx+"'>다중선택</label>&nbsp;&nbsp;");
        	question.append("</td>");
        	question.append("</tr>");
        	question.append("<tr name='radioQuestion'>");
        	question.append("<td id='questionAO_"+questionIdx+"'>");
        	
        	for (int i=1;i< token.length;i++) {
        		int j = i-1;
         		question.append("<input type='radio' id='chkRadio_"+questionIdx+"_RA_"+j+"' name='chkRadio_"+questionIdx+"'>&nbsp;");
            	question.append("<label name='chkRadioItem_"+questionIdx+"' for='chkRadio_"+questionIdx+"_RA_"+i+"'>"+token[i]+"</label><label id='itemSub_"+questionIdx+"_"+j+"'></label><br>");
            	question.append("<input type='hidden' id='radioItemValue_"+questionIdx+"_"+j+"' name='chkRadioItemValue_"+questionIdx+"' value='"+token[i]+"'>");
            	question.append("<input type='hidden' id='radioSubItemValue_"+questionIdx+"_"+j+"' name='chkRadioSubItem_"+questionIdx+"' value=''>");
            	question.append("<input type='hidden' id='conditionStart_"+questionIdx+"_"+j+"' name='conditionStart_"+questionIdx+"' value='0' >");
            	question.append("<input type='hidden' id='conditionEnd_"+questionIdx+"_"+j+"' name='conditionEnd_"+questionIdx+"' value='0' >");
         	}
        	question.append("</td>");
        	question.append("</tr>"); 
        	/*---------------------------------------------------------*/
        	/* 객관식 문항  다중 선택*/
        	/*---------------------------------------------------------*/
         	question.append("<tr name='chkQuestion' class='hide'>");
        	question.append("<td id='questionAP_"+questionIdx+"'>");
        	question.append("<input type='checkbox' id='chkbox_"+questionIdx+"_CHK_0' name='chkbox_"+questionIdx+"'  value='0'>&nbsp;<label name='chkboxLabel_"+questionIdx+"' for='chkbox_"+questionIdx+"_CHK_0'>매우만족</label><br>");
        	question.append("<input type='hidden' id='chkItemValue_"+questionIdx+"_0'name='chkboxItem_"+questionIdx+"' value='매우만족'>");
        	question.append("<input type='checkbox' id='chkbox_"+questionIdx+"_CHK_1' name='chkbox_"+questionIdx+"'  value='1'>&nbsp;<label name='chkboxLabel_"+questionIdx+"' for='chkbox_"+questionIdx+"_CHK_1'>만족</label><br>");
        	question.append("<input type='hidden' id='chkItemValue_"+questionIdx+"_1'name='chkboxItem_"+questionIdx+"' value='만족'>");
        	question.append("<input type='checkbox' id='chkbox_"+questionIdx+"_CHK_2' name='chkbox_"+questionIdx+"'  value='2'>&nbsp;<label name='chkboxLabel_"+questionIdx+"' for='chkbox_"+questionIdx+"_CHK_2'>보통</label><br>");
        	question.append("<input type='hidden' id='chkItemValue_"+questionIdx+"_2'name='chkboxItem_"+questionIdx+"' value='보통'>");
        	question.append("<input type='checkbox' id='chkbox_"+questionIdx+"_CHK_3' name='chkbox_"+questionIdx+"'  value='3'>&nbsp;<label name='chkboxLabel_"+questionIdx+"' for='chkbox_"+questionIdx+"_CHK_3'>불만족</label>");
        	question.append("<input type='hidden' id='chkItemValue_"+questionIdx+"_3'name='chkboxItem_"+questionIdx+"' value='불만족'>");
        	question.append("</td>");
        	question.append("</tr>"); 
        	
        	
        	/*---------------------------------------------------------*/
        	/* 주관식 문항  */
        	/*---------------------------------------------------------*/
         	question.append("<tr name='subjectiveQuestion' class='hide'>");
        	question.append("<th scope='row' rowspan='2'>");
        	question.append("<span class='point_color'>*</span>&nbsp;답변 유형");
        	question.append("</th>");
        	question.append("</tr>");
        	question.append("<tr name='subjectiveQuestion' class='hide'>");
        	question.append("<td>");
        	question.append("<textarea id='content' Style='width:500px; height:150px;' readonly></textarea>");
        	question.append("</td>");
        	question.append("</tr>"); 

        	
        	
        	/*---------------------------------------------------------*/
        	/* 매트리스 문항  */
        	/*---------------------------------------------------------*/
         	question.append("<tr name='matrixQuestion' class='hide'>");
        	question.append("<input type='hidden' id='matrixWidth_"+questionIdx+"' value='3'>");
        	question.append("<input type='hidden' id='matrixHeight_"+questionIdx+"' value='3'>");
        	question.append("<th scope='row'><span class='point_color'>*</span>&nbsp;답변 유형</th>");
        	question.append("<td colspan='3'>");
        	question.append("<div class='con-area22' id='matrixQuestion_"+questionIdx+"'>");
        	question.append("<fieldset>");
        	question.append("<legend>설문 결과</legend>");
        	question.append("<div>");
        	question.append("<table summary='설문 결과'>");
        	question.append("<colgroup>");
        	question.append("<col width='25%' />");
        	question.append("<col width='25%' />");
        	question.append("<col width='25%' />");
        	question.append("<col width='25%' />");
        	question.append("</colgroup>");
        	question.append("<thead>");
        	question.append("<tr>");
        	question.append("<th scope='col' style='border-top: 1px solid #d5d5d5; border-bottom: 1px solid #d5d5d5;'>&nbsp;</th>");
        	question.append("<th scope='col' style='border-top: 1px solid #d5d5d5; border-bottom: 1px solid #d5d5d5;'>");
        	question.append("<input type='text' id='matrix_"+questionIdx+"_0' name='matrix_"+questionIdx+"' value='' class='input_txt w70' readonly />");
        	question.append("</th>");
        	question.append("<th scope='col' style='border-top: 1px solid #d5d5d5; border-bottom: 1px solid #d5d5d5;'>");
        	question.append("<input type='text' id='matrix_"+questionIdx+"_1' name='matrix_"+questionIdx+"' value='' class='input_txt w70' readonly />");
        	question.append("</th>");
        	question.append("<th scope='col' style='border-top: 1px solid #d5d5d5; border-bottom: 1px solid #d5d5d5;'>");
        	question.append("<input type='text' id='matrix_"+questionIdx+"_2' name='matrix_"+questionIdx+"' value='' class='input_txt w70' readonly />");
        	question.append("</th>");
        	question.append("</tr>");
        	question.append("</thead>");
        	question.append("<tbody>");
        	question.append("<tr>");
        	question.append("<th scope='row' class='bor_top_style1'><input type='text' id='matrix_"+questionIdx+"_3' name='matrix_"+questionIdx+"' value='' class='input_txt w70' readonly /></th>");
        	question.append("<td class='txt_cen'><input type='radio' id='ANSWER_M_"+questionIdx+"' name='ANSWER9' value=''>&nbsp;<label for='ANSWER_M_"+questionIdx+"'></label></td>");
        	question.append("<td class='txt_cen'><input type='radio' id='ANSWER_N_"+questionIdx+"' name='ANSWER9' value=''>&nbsp;<label for='ANSWER_N_"+questionIdx+"'></label></td>");
        	question.append("<td class='txt_cen'><input type='radio' id='ANSWER_O_"+questionIdx+"' name='ANSWER9' value=''>&nbsp;<label for='ANSWER_O_"+questionIdx+"'></label></td>");
        	question.append("</tr>");
        	question.append("<tr>");
        	question.append("<th scope='row' class='bor_top_style1'><input type='text' id='matrix_"+questionIdx+"_4' name='matrix_"+questionIdx+"' value='' class='input_txt w70' readonly /></th>");
        	question.append("<td class='txt_cen'><input type='radio' id='ANSWER_Q_"+questionIdx+"' name='ANSWER11_"+questionIdx+"' value=''>&nbsp;<label for='ANSWER_Q_"+questionIdx+"'></label></td>");
        	question.append("<td class='txt_cen'><input type='radio' id='ANSWER_R_"+questionIdx+"' name='ANSWER11_"+questionIdx+"' value=''>&nbsp;<label for='ANSWER_R_"+questionIdx+"'></label></td>");
        	question.append("<td class='txt_cen'><input type='radio' id='ANSWER_S_"+questionIdx+"' name='ANSWER11_"+questionIdx+"' value=''>&nbsp;<label for='ANSWER_S_"+questionIdx+"'></label></td>");
        	question.append("</tr>");
        	question.append("<tr>");
        	question.append("<th scope='row' class='bor_top_style1'><input type='text' id='matrix_"+questionIdx+"_5' name='matrix_"+questionIdx+"' value='' class='input_txt w70' readonly /></th>");
        	question.append("<td class='txt_cen'><input type='radio' id='ANSWER_U_"+questionIdx+"' name='ANSWER13_"+questionIdx+"' value=''>&nbsp;<label for='ANSWER_U_"+questionIdx+"'></label></td>");
        	question.append("<td class='txt_cen'><input type='radio' id='ANSWER_V_"+questionIdx+"' name='ANSWER13_"+questionIdx+"' value=''>&nbsp;<label for='ANSWER_V_"+questionIdx+"'></label></td>");
        	question.append("<td class='txt_cen'><input type='radio' id='ANSWER_W_"+questionIdx+"' name='ANSWER13_"+questionIdx+"' value=''>&nbsp;<label for='ANSWER_W_"+questionIdx+"'></label></td>");
        	question.append("</tr>");
        	question.append("</tbody>");
        	question.append("</table>");
        	question.append("</div>");
        	question.append("</fieldset>");
        	question.append("</div>");
        	question.append("</td>");
        	question.append("</tr>");
 
        	
        	/*---------------------------------------------------------*/
        	/* 하단 공통 부분 */
        	/*---------------------------------------------------------*/
        	
         	question.append("<tr>");
        	question.append("<th scope='row'>");
        	question.append("<span class='point_color'>*</span>&nbsp;필수입력 여부");
        	question.append("</th>");
        	question.append("<td>");
        	question.append("<input type='checkbox' id='OBJECT_AQQ_"+questionIdx+"' name='criticalChk_"+questionIdx+"' value='Y'  checked>&nbsp;<label for='OBJECT_AQQ_"+questionIdx+"'>해당 설문항목을 필수입력으로 지정합니다.</label>");
        	question.append("</td>");
        	question.append("</tr>");
        	question.append("<tr>");
        	question.append("<th scope='row'>문항 설명</th>");
        	question.append("<td class='bor_top_style1' colspan='3'>");
        	question.append("<input type='text' id='questionDetail_"+questionIdx+"' name='questionDetail_"+questionIdx+"' placeholder='' class='w80 input_txt'><label for='OBJECT_ARR_"+questionIdx+"' class='blind'>문항 설명</label>");
        	question.append("</td>");
        	question.append("</tr>");
        	question.append("</table>");
        	question.append("</div>");
        	
        	questionIdx++;
         }
         br.close();
		 
     }catch (FileNotFoundException e) {
         System.out.println(e.getMessage());
     } 
     catch (Exception e) {
    	 System.out.println(e.getMessage());
     } 


%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<html>
<head>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/default.js"></script>

<title>Insert title here</title>
</head>
<body>

</body>
<script type="text/javascript">

    $(window).load(function(){
	 $("#questionList",opener.document).html("<%=question.toString()%>");
	 $("#questionMaxIdx",opener.document).val(<%=questionIdx%>);
	 window.close();
   });
  
</script>
</html>