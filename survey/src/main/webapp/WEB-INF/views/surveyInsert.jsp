<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>CRM_설문 관리_설문 등록1</title>
<link href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/sub.css">
<link rel="stylesheet" type="text/css" href="css/css.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<!--[if lt IE 9]>
<script type="text/javascript" src="js/prefixfree.min.js"></script>
<script type="text/javascript" src="js/modernizr.custom.js"></script>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<![endif]-->
<!--  1. prefixfree.min.js - 벤더프리픽스(브라우저 마다 보이게 하는 코드 설정)를 따로 설정하지 않아도 된다.  -->
<!--  2. modernizr.custom.js - HTML5와 CSS3가 지원되지 않는 브라우저에서 작동하게 하거나 동작 않는
CSS속성을 대체 할 수 있는 다른 형식으로 표현해 주는 기능 : IE8에서도 작동되게 해준다.  -->
<!-- 3. HTML5의 시멘틱태그를 ie8에서 작동할 수 있게 해준다.  -->
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript">


	$(document).on("change","select[name=questionOrderSelect]", function(){
		/*---------------------------------------------------------*/
		/* 문항의 순번을 변경   */
		/*---------------------------------------------------------*/
	
		changeOrder(this);
		
	});
	
	
	
	$(document).ready(function(){
		
		/*---------------------------------------------------------*/
		/* 외국어 선택 여부   */
		/*---------------------------------------------------------*/
		$("#language").change(function(){
			var lang = $(this).val();
			var language = $("#language option:selected").text();
			if(lang=="KR"){
				$("tr[name=foreign]").each(function(){
					$(this).addClass("hide");
				});
				$("th[name=foreign_th]").each(function(){
					if($(this).attr("rowspan")==7){
						$(this).attr("rowspan" , 6);
					}else{
						$(this).attr("rowspan" , 0);	
					}
				});
			}else{
				$("tr[name=foreign] label").each(function(){
					$(this).text(language);
				});
				$("tr[name=foreign]").each(function(){
					$(this).removeClass("hide");
				});
				$("th[name=foreign_th]").each(function(){
					if($(this).attr("rowspan")==6 || $(this).attr("rowspan")==7){
						$(this).attr("rowspan" , 7);
					}else{
						$(this).attr("rowspan" , 2);	
					}
					
				});
				
			}
			
		});
	});
	function uploadFile(question){
		/*---------------------------------------------------------*/
		/* 버튼 선택시 input type file 을 동작 하기 위한 함수  */
		/*---------------------------------------------------------*/
	
		$("#file_"+question).click();
		
		
	};
	function insertImgValue(question){
		/*---------------------------------------------------------*/
		/* input file 의 경로를 text 로 */
		/*---------------------------------------------------------*/
		
		$("#uploadImage_"+question).val($("#file_"+question).val());
	}
	$(document).on("change","input:radio[name=changeQuestionFile]:checked", function(){
		/*---------------------------------------------------------*/
		/* input file 의 경로를 text 로 */
		/*---------------------------------------------------------*/
		var questionFileArea = $("#questionFile");
		if($(this).val()=="AG"){
			questionFileArea.addClass("hide");
		}else{
			questionFileArea.removeClass("hide");
		}
		
		
	});


    
    function addQuestion(flag){
    	/*---------------------------------------------------------*/
    	/* 문항 추가 시 동작 문항리스트의 제일 하단에 정보가 추가됨 기본 생성 문항은  객관식 단일 선택 */
    	/* questionArea == 뭄항 리스트 영역  */
    	/* question == 추가된 문항의 html 요소 */
    	/* questionIdx == 추가될 문항의 idx */
    	/*---------------------------------------------------------*/
    	var questionArea = $("#questionList");
    	var question = "";
    	var questionIdx = parseInt($("#questionMaxIdx").val())+1;
    	var lang = $("#language").val();
    	var language = $("#language option:selected").text();
    	$("#questionMaxIdx").val(questionIdx);
    	$("select[name=questionOrderSelect]").each(function(){
    		$(this).append("<option value='"+questionIdx+"'>"+questionIdx+"</option>");
    	});
    	
    	
    	question += "<div id=question_"+questionIdx;
    	question += " class=\"com_table_input\" name=\"question\">";
    	question += "<input type=\"hidden\" name=\"questionIdx\" value=\""+questionIdx+"\">";
    	question += "<h4>&nbsp;</h4>";
    	question += "<a href=\"#\" class=\"btn-wine-bold2 add_btn\" onclick=\"removeQuestion("+questionIdx+"); return false; \">문항 삭제</a> ";
    	question += "<a href=\"#\" class=\"btn-wine-bold2 add_btn\" onclick=\"addQuestion("+questionIdx+");return false;\"	style=\"margin: 0 5px 0 5px;\">문항 복사</a> ";
    	question += "<a href=\"#\" class=\"btn-wine-bold add_btn\" onclick=\"openCondition("+questionIdx+");return false;\" target=\"_blank\">조건분기</a>";
    	question += "<table class=\"padding_space2\" summary=\"문항 정보 테이블\">";
    	question += "<colgroup>";
    	question += "<col style=\"width:15%;\">";
    	question += "</colgroup>";
    	question += "<colgroup>";
    	question += "<col style=\"width:85%;\">";
    	question += "</colgroup>";
    	question += "<tr>";
    	question += "<th scope=\"row\" class=\"bor_top_style1\"><span class=\"point_color\">*</span>&nbsp;문항 순번</th>";
    	question += "<td class=\"bor_top_style1\">";
    	question += "<select class=\"input_txt w10\" name=\"questionOrderSelect\">";
    	for(var i = 1;i<=questionIdx;i++){
	    	question += "<option value=\""+i+"\"";
			if(i==questionIdx){
				question += " selected";
			}
	    	question += ">"+i+"</option>";
    	}
    	question += "</select>";
    	question += "<input type=\"hidden\" id=\"questionOrder_"+questionIdx+"\" name=\"questionOrder\" value=\""+questionIdx+"\">";
    	question += "</td>";
    	question += "</tr>";
    	question += "<tr>";
    	question += "<th scope=\"row\" name=\"foreign_th\"";
    	if(lang !="KR"){
    		question += " rowspan=\"2\" ";
    	}
    	question += " class=\"bor_top_style1\"><span class=\"point_color\">*</span>&nbsp;문항 제목</th>";
    	question += "<td>";
    	question += "<label for=\"OBJECT_AI\" class=\"blind\">문항 제목</label><input type=\"text\" id=\"subject_"+questionIdx+"\" name=\"subject\" class=\"w80 input_txt\">";
    	question += "</td>";
    	question += "</tr>";
    	question += "<tr name=\"foreign\"";
    	if(lang =="KR"){
    		question += " class=\"hide\" ";
    	}
    	question += " >";
    	question += "<td colspan=\"3\">";
    	question += "<label class=\"lang_t\" name=\"foregin_Set\" for=\"surveyTitle_foreign\">"+language+"</label>&nbsp;&nbsp;<input type=\"text\" id=\"subject_foreign_"+questionIdx+"\" name=\"surveyTitle_foreign\" placeholder=\"\"  class=\"w80 input_txt\" >";
		question += "</td>";
		question += "</tr>";
    	question += "<tr>";
    	question += "<th scope=\"row\" rowspan=\"3\">이미지&#40;동영상&#41;</th>";
    	question += "<td class=\"bot_no\">";
    	question += "<label for=\"\">이미지</label>&nbsp;&nbsp;<input type=\"text\" id=\"uploadImage_"+questionIdx+"\" name=\"itemImg_"+questionIdx+"\" placeholder=\"\" readonly class=\"w70 input_txt\">&nbsp;";
    	question += "<a href=\"#\" class=\"btn-wine-bold2\" onclick=\"uploadFile("+questionIdx+"); return false;\" >파일선택</a><input type=\"file\" id=\"file_"+questionIdx+"\" name=\"fileList\" class=\"file\" onchange=\"insertImgValue("+questionIdx+")\">";
    	question += "</td>";
    	question += "</tr>";
    	question += "<tr>";
    	question += "<td class=\"bot_no\">";
    	question += "<label for=\"\">동영상</label>&nbsp;&nbsp;<input type=\"text\" id=\"vidioUrl_"+questionIdx+"\" name=\"vidioURL_"+questionIdx+"\" placeholder=\"유튜브 url를 등록하여 주세요.\" class=\"w70 input_txt\">";
    	question += "</td>";
    	question += "</tr>";
    	question += "<tr>";
    	question += "<td class=\"point_color pdl_60\">";
    	question += "* 이미지 사이즈는 000px*000px 사이즈로 등록해주세요.<br>";
    	question += "* 파이크기는 10M 이내로 등록해주세요.";
    	question += "</td>";
    	question += "</tr>";
    	question += "<tr>";
    	question += "<th scope=\"row\" >";
    	question += "<span class=\"point_color\">*</span>&nbsp;문항 유형";
    	question += "</th>";
    	question += "<td colspan=\"3\" class=\"bor_top_style1\">";
    	question += "<input type=\"radio\" id=\"OBJECT_AL_"+questionIdx+"\" name=\"questionType_"+questionIdx+"\" onclick=\"changeQuestionType("+questionIdx+",'0')\" value=\"0\" checked>&nbsp;<label for=\"OBJECT_AL_"+questionIdx+"\">객관식</label>&nbsp;&nbsp;";
    	question += "<input type=\"radio\" id=\"OBJECT_AM_"+questionIdx+"\" name=\"questionType_"+questionIdx+"\" onclick=\"changeQuestionType("+questionIdx+",'1')\" value=\"1\">&nbsp;<label for=\"OBJECT_AM_"+questionIdx+"\">주관식</label>&nbsp;&nbsp;";
    	question += "<input type=\"radio\" id=\"OBJECT_AN_"+questionIdx+"\" name=\"questionType_"+questionIdx+"\" onclick=\"changeQuestionType("+questionIdx+",'2')\" value=\"2\">&nbsp;<label for=\"OBJECT_AN_"+questionIdx+"\">매트릭스</label>&nbsp;&nbsp;";
    	question += "<a href=\"#\" class=\"btn-wine-bold2\" id=\"itemUpdateBtn_"+questionIdx+"\" onclick=\"updateQuestion("+questionIdx+");return false;\" target=\"_blank\">항목 수정</a>";
    	question += "</td>";
    	question += "</tr>";
    	
    	/*---------------------------------------------------------*/
    	/* 객관식 문항 */
    	/*---------------------------------------------------------*/
    	/*---------------------------------------------------------*/
    	/* 객관식 문항 단일 선택 */
    	/*---------------------------------------------------------*/
    	question += "<tr name=\"multipleQuestion\">";
    	question += "<th scope=\"row\" rowspan=\"2\">";
    	question += "<span class=\"point_color\">*</span>&nbsp;답변 유형";
    	question += "</th>";
    	question += "<td colspan=\"3\" class=\"bor_top_style1\">";
    	question += "<input type=\"radio\" id=\"overlap_"+questionIdx+"_1\" name=\"overlap_"+questionIdx+"\" value=\"AO\" onclick=\"changeQuestionOverlap('AO',"+questionIdx+");\" checked>&nbsp;<label for=\"overlap_"+questionIdx+"\">단일선택</label>&nbsp;&nbsp;";
    	question += "<input type=\"radio\" id=\"overlap_"+questionIdx+"_2\" name=\"overlap_"+questionIdx+"\" value=\"AP\" onclick=\"changeQuestionOverlap('AP',"+questionIdx+");\">&nbsp;<label for=\"overlap_"+questionIdx+"\">다중선택</label>&nbsp;&nbsp;";
    	question += "</td>";
    	question += "</tr>";
    	question += "<tr name=\"radioQuestion\">";
    	question += "<td id=\"questionAO_"+questionIdx+"\">";
    	question += "<input type=\"radio\" id=\"chkRadio_"+questionIdx+"_RA_0\" name=\"chkRadio_"+questionIdx+"\">&nbsp;";
    	question += "<label name=\"chkRadioItem_"+questionIdx+"\" for=\"chkRadio_"+questionIdx+"_RA_0\">매우만족</label><label id=\"itemSub_"+questionIdx+"_0\"></label><br>";
    	question += "<input type=\"hidden\" id=\"radioItemValue_"+questionIdx+"_0\" name=\"chkRadioItemValue_"+questionIdx+"\" value=\"매우만족\">";
    	question += "<input type=\"hidden\" id=\"radioSubItemValue_"+questionIdx+"_0\" name=\"chkRadioSubItem_"+questionIdx+"\" value=\"\">";
    	question += "<input type=\"hidden\" id=\"conditionStart_"+questionIdx+"_0\" name=\"conditionStart_"+questionIdx+"\" value=\"0\" >";
    	question += "<input type=\"hidden\" id=\"conditionEnd_"+questionIdx+"_0\" name=\"conditionEnd_"+questionIdx+"\" value=\"0\" >";
    	question += "<input type=\"radio\" id=\"chkRadio_"+questionIdx+"_RA_1\" name=\"chkRadio_"+questionIdx+"\" value=\"만족\">&nbsp;";
    	question += "<label name=\"chkRadioItem_"+questionIdx+"\" for=\"chkRadio_"+questionIdx+"_RA_1\">만족</label><label id=\"itemSub_"+questionIdx+"_1\"></label><br>";
    	question += "<input type=\"hidden\" id=\"radioItemValue_"+questionIdx+"_1\" name=\"chkRadioItemValue_"+questionIdx+"\" value=\"만족\">";
    	question += "<input type=\"hidden\" id=\"radioSubItemValue_"+questionIdx+"_1\" name=\"chkRadioSubItem_"+questionIdx+"\" value=\"\">";
    	question += "<input type=\"hidden\" id=\"conditionStart_"+questionIdx+"_1\" name=\"conditionStart_"+questionIdx+"\" value=\"0\" >";
    	question += "<input type=\"hidden\" id=\"conditionEnd_"+questionIdx+"_1\" name=\"conditionEnd_"+questionIdx+"\" value=\"0\" >";
    	question += "<input type=\"radio\" id=\"chkRadio_"+questionIdx+"_RA_2\" name=\"chkRadio_"+questionIdx+"\" value=\"보통\">&nbsp;";
    	question += "<label name=\"chkRadioItem_"+questionIdx+"\" for=\"chkRadio_"+questionIdx+"_RA_2\">보통</label><label id=\"itemSub_"+questionIdx+"_2\"></label><br>";
    	question += "<input type=\"hidden\" id=\"radioItemValue_"+questionIdx+"_2\" name=\"chkRadioItemValue_"+questionIdx+"\" value=\"보통\">";
    	question += "<input type=\"hidden\" id=\"radioSubItemValue_"+questionIdx+"_2\" name=\"chkRadioSubItem_"+questionIdx+"\" value=\"\">";
    	question += "<input type=\"hidden\" id=\"conditionStart_"+questionIdx+"_2\" name=\"conditionStart_"+questionIdx+"\" value=\"0\" >";
    	question += "<input type=\"hidden\" id=\"conditionEnd_"+questionIdx+"_2\" name=\"conditionEnd_"+questionIdx+"\" value=\"0\" >";
    	question += "<input type=\"radio\" id=\"chkRadio_"+questionIdx+"_RA_3\" name=\"chkRadio_"+questionIdx+"\" value=\"불만족\">&nbsp;";
    	question += "<label name=\"chkRadioItem_"+questionIdx+"\" for=\"chkRadio_"+questionIdx+"_RA_3\">불만족</label><label id=\"itemSub_"+questionIdx+"_3\"></label>";
    	question += "<input type=\"hidden\" id=\"radioItemValue_"+questionIdx+"_0\" name=\"chkRadioItemValue_"+questionIdx+"\" value=\"불만족\">";
    	question += "<input type=\"hidden\" id=\"radioSubItemValue_"+questionIdx+"_3\" name=\"chkRadioSubItem_"+questionIdx+"\" value=\"\">";
    	question += "<input type=\"hidden\" id=\"conditionStart_"+questionIdx+"_3\" name=\"conditionStart_"+questionIdx+"\" value=\"0\" >";
    	question += "<input type=\"hidden\" id=\"conditionEnd_"+questionIdx+"_3\" name=\"conditionEnd_"+questionIdx+"\" value=\"0\" >";
    	question += "</td>";
    	question += "</tr>";
    	/*---------------------------------------------------------*/
    	/* 객관식 문항  다중 선택*/
    	/*---------------------------------------------------------*/
    	question += "<tr name=\"chkQuestion\" class=\"hide\">";
    	question += "<td id=\"questionAP_"+questionIdx+"\">";
    	question += "<input type=\"checkbox\" id=\"chkbox_"+questionIdx+"_CHK_0\" name=\"chkbox_"+questionIdx+"\"  value=\"0\">&nbsp;<label name=\"chkboxLabel_"+questionIdx+"\" for=\"chkbox_"+questionIdx+"_CHK_0\">매우만족</label><br>";
    	question += "<input type=\"hidden\" id=\"chkItemValue_"+questionIdx+"_0\"name=\"chkboxItem_"+questionIdx+"\" value=\"매우만족\">";
    	question += "<input type=\"checkbox\" id=\"chkbox_"+questionIdx+"_CHK_1\" name=\"chkbox_"+questionIdx+"\"  value=\"1\">&nbsp;<label name=\"chkboxLabel_"+questionIdx+"\" for=\"chkbox_"+questionIdx+"_CHK_1\">만족</label><br>";
    	question += "<input type=\"hidden\" id=\"chkItemValue_"+questionIdx+"_1\"name=\"chkboxItem_"+questionIdx+"\" value=\"만족\">";
    	question += "<input type=\"checkbox\" id=\"chkbox_"+questionIdx+"_CHK_2\" name=\"chkbox_"+questionIdx+"\"  value=\"2\">&nbsp;<label name=\"chkboxLabel_"+questionIdx+"\" for=\"chkbox_"+questionIdx+"_CHK_2\">보통</label><br>";
    	question += "<input type=\"hidden\" id=\"chkItemValue_"+questionIdx+"_2\"name=\"chkboxItem_"+questionIdx+"\" value=\"보통\">";
    	question += "<input type=\"checkbox\" id=\"chkbox_"+questionIdx+"_CHK_3\" name=\"chkbox_"+questionIdx+"\"  value=\"3\">&nbsp;<label name=\"chkboxLabel_"+questionIdx+"\" for=\"chkbox_"+questionIdx+"_CHK_3\">불만족</label>";
    	question += "<input type=\"hidden\" id=\"chkItemValue_"+questionIdx+"_3\"name=\"chkboxItem_"+questionIdx+"\" value=\"불만족\">";
    	question += "</td>";
    	question += "</tr>";
    	
    	
    	/*---------------------------------------------------------*/
    	/* 주관식 문항  */
    	/*---------------------------------------------------------*/
    	question += "<tr name=\"subjectiveQuestion\" class=\"hide\">";
    	question += "<th scope=\"row\" rowspan=\"2\">";
    	question += "<span class=\"point_color\">*</span>&nbsp;답변 유형";
    	question += "</th>";
    	question += "</tr>";
    	question += "<tr name=\"subjectiveQuestion\" class=\"hide\">";
    	question += "<td>";
    	question += "<textarea id=\"content\" Style=\"width:500px; height:150px;\" readonly></textarea>";
    	question += "</td>";
    	question += "</tr>";

    	
    	
    	/*---------------------------------------------------------*/
    	/* 매트리스 문항  */
    	/*---------------------------------------------------------*/
    	question += "<tr name=\"matrixQuestion\" class=\"hide\">";
    	question += "<input type=\"hidden\" id=\"matrixWidth_"+questionIdx+"\" value=\"3\">";
    	question += "<input type=\"hidden\" id=\"matrixHeight_"+questionIdx+"\" value=\"3\">";
    	question += "<th scope=\"row\"><span class=\"point_color\">*</span>&nbsp;답변 유형</th>";
    	question += "<td colspan=\"3\">";
    	question += "<div class=\"con-area22\" id=\"matrixQuestion_"+questionIdx+"\">";
    	question += "<fieldset>";
    	question += "<legend>설문 결과</legend>";
    	question += "<div>";
    	question += "<table summary=\"설문 결과\">";
    	question += "<colgroup>";
    	question += "<col width=\"25%\" />";
    	question += "<col width=\"25%\" />";
    	question += "<col width=\"25%\" />";
    	question += "<col width=\"25%\" />";
    	question += "</colgroup>";
    	question += "<thead>";
    	question += "<tr>";
    	question += "<th scope=\"col\" style=\"border-top: 1px solid #d5d5d5; border-bottom: 1px solid #d5d5d5;\">&nbsp;</th>";
    	question += "<th scope=\"col\" style=\"border-top: 1px solid #d5d5d5; border-bottom: 1px solid #d5d5d5;\">";
    	question += "<input type=\"text\" id=\"matrix_"+questionIdx+"_0\" name=\"matrix_"+questionIdx+"\" value=\"\" class=\"input_txt w70\" readonly />";
    	question += "</th>";
    	question += "<th scope=\"col\" style=\"border-top: 1px solid #d5d5d5; border-bottom: 1px solid #d5d5d5;\">";
    	question += "<input type=\"text\" id=\"matrix_"+questionIdx+"_1\" name=\"matrix_"+questionIdx+"\" value=\"\" class=\"input_txt w70\" readonly />";
    	question += "</th>";
    	question += "<th scope=\"col\" style=\"border-top: 1px solid #d5d5d5; border-bottom: 1px solid #d5d5d5;\">";
    	question += "<input type=\"text\" id=\"matrix_"+questionIdx+"_2\" name=\"matrix_"+questionIdx+"\" value=\"\" class=\"input_txt w70\" readonly />";
    	question += "</th>";
    	question += "</tr>";
    	question += "</thead>";
    	question += "<tbody>";
    	question += "<tr>";
    	question += "<th scope=\"row\" class=\"bor_top_style1\"><input type=\"text\" id=\"matrix_"+questionIdx+"_3\" name=\"matrix_"+questionIdx+"\" value=\"\" class=\"input_txt w70\" readonly /></th>";
    	question += "<td class=\"txt_cen\"><input type=\"radio\" id=\"ANSWER_M_"+questionIdx+"\" name=\"ANSWER9\" value=\"\">&nbsp;<label for=\"ANSWER_M_"+questionIdx+"\"></label></td>";
    	question += "<td class=\"txt_cen\"><input type=\"radio\" id=\"ANSWER_N_"+questionIdx+"\" name=\"ANSWER9\" value=\"\">&nbsp;<label for=\"ANSWER_N_"+questionIdx+"\"></label></td>";
    	question += "<td class=\"txt_cen\"><input type=\"radio\" id=\"ANSWER_O_"+questionIdx+"\" name=\"ANSWER9\" value=\"\">&nbsp;<label for=\"ANSWER_O_"+questionIdx+"\"></label></td>";
    	question += "</tr>";
    	question += "<tr>";
    	question += "<th scope=\"row\" class=\"bor_top_style1\"><input type=\"text\" id=\"matrix_"+questionIdx+"_4\" name=\"matrix_"+questionIdx+"\" value=\"\" class=\"input_txt w70\" readonly /></th>";
    	question += "<td class=\"txt_cen\"><input type=\"radio\" id=\"ANSWER_Q_"+questionIdx+"\" name=\"ANSWER11_"+questionIdx+"\" value=\"\">&nbsp;<label for=\"ANSWER_Q_"+questionIdx+"\"></label></td>";
    	question += "<td class=\"txt_cen\"><input type=\"radio\" id=\"ANSWER_R_"+questionIdx+"\" name=\"ANSWER11_"+questionIdx+"\" value=\"\">&nbsp;<label for=\"ANSWER_R_"+questionIdx+"\"></label></td>";
    	question += "<td class=\"txt_cen\"><input type=\"radio\" id=\"ANSWER_S_"+questionIdx+"\" name=\"ANSWER11_"+questionIdx+"\" value=\"\">&nbsp;<label for=\"ANSWER_S_"+questionIdx+"\"></label></td>";
    	question += "</tr>";
    	question += "<tr>";
    	question += "<th scope=\"row\" class=\"bor_top_style1\"><input type=\"text\" id=\"matrix_"+questionIdx+"_5\" name=\"matrix_"+questionIdx+"\" value=\"\" class=\"input_txt w70\" readonly /></th>";
    	question += "<td class=\"txt_cen\"><input type=\"radio\" id=\"ANSWER_U_"+questionIdx+"\" name=\"ANSWER13_"+questionIdx+"\" value=\"\">&nbsp;<label for=\"ANSWER_U_"+questionIdx+"\"></label></td>";
    	question += "<td class=\"txt_cen\"><input type=\"radio\" id=\"ANSWER_V_"+questionIdx+"\" name=\"ANSWER13_"+questionIdx+"\" value=\"\">&nbsp;<label for=\"ANSWER_V_"+questionIdx+"\"></label></td>";
    	question += "<td class=\"txt_cen\"><input type=\"radio\" id=\"ANSWER_W_"+questionIdx+"\" name=\"ANSWER13_"+questionIdx+"\" value=\"\">&nbsp;<label for=\"ANSWER_W_"+questionIdx+"\"></label></td>";
    	question += "</tr>";
    	question += "</tbody>";
    	question += "</table>";
    	question += "</div>";
    	question += "</fieldset>";
    	question += "</div>";
    	question += "</td>";
    	question += "</tr>";

    	
    	/*---------------------------------------------------------*/
    	/* 하단 공통 부분 */
    	/*---------------------------------------------------------*/
    	
    	question += "<tr>";
    	question += "<th scope=\"row\">";
    	question += "<span class=\"point_color\">*</span>&nbsp;필수입력 여부";
    	question += "</th>";
    	question += "<td>";
    	question += "<input type=\"checkbox\" id=\"OBJECT_AQQ_"+questionIdx+"\" name=\"criticalChk_"+questionIdx+"\" value=\"Y\"  onclick=\"\" checked>&nbsp;<label for=\"OBJECT_AQQ_"+questionIdx+"\">해당 설문항목을 필수입력으로 지정합니다.</label>";
    	question += "</td>";
    	question += "</tr>";
    	question += "<tr>";
    	question += "<th name=\"foreign_th\" scope=\"row\"";
    	if(lang !="KR"){
    		question += " rowspan=\"2\" ";
    	}
    	question += " >문항 설명</th>";
    	question += "<td class=\"bor_top_style1\" colspan=\"3\">";
    	question += "<input type=\"text\" id=\"questionDetail_"+questionIdx+"\" name=\"questionDetail_"+questionIdx+"\" placeholder=\"\" class=\"w80 input_txt\"><label for=\"OBJECT_ARR_"+questionIdx+"\" class=\"blind\">문항 설명</label>";
    	question += "</td>";
    	question += "<tr name=\"foreign\";";
    	if(lang =="KR"){
    		question += " class=\"hide\" ";
    	}
    	question += " >";
    	question += "<td class=\"bor_top_style1\" colspan=\"3\">";
    	question += "<label for=\"OBJECT_ARR_"+questionIdx+"\" >"+language+"</label>&nbsp;&nbsp;<input type=\"text\" id=\"questionDetail_foreign_"+questionIdx+"\" name=\"questionDetail_foreign_"+questionIdx+"\" placeholder=\"\" class=\"w80 input_txt\">";
    	question += "</td>";
    	question += "</tr>";
    	question += "</table>";
    	question += "</div>";
		if(flag == "A"){
			questionArea.append(question);	
		}else{
			$("#question_"+flag).after(question);
			$("#subject_"+questionIdx).val($("#subject_"+flag).val());
			$("#uploadImage_"+questionIdx).val($("#uploadImage_"+flag).val());
			$("#vidioUrl_"+questionIdx).val($("#vidioUrl_"+flag).val());
			$("#questionDetail_"+questionIdx).val($("#questionDetail_"+flag).val());
			updateOrder();
			
		}
    	
    	
    }
    function updateOrder(){
    	/*---------------------------------------------------------*/
    	/* 문항 생성시 추가된 문항의 순번을 각 select 의 option 에 추가 한다.  */
    	/* questionIdx == 문항 번호 */
    	/* questionOrder == 문항 순번 */
    	/*---------------------------------------------------------*/
    	$("select[name=questionOrderSelect]").each(function(index){
    		index= index+1;
	    	$(this).val(index).prop("selected",true);			
    	});
    	$("input:hidden[name=questionOrder]").each(function(index){
    		index= index+1;
    		$(this).val(index);
    	});
    }
    
     
    function changeOrder(select){
    	var moveIdx = $(select).val();
   		var targetIdx = $(select).val()-1;
    	var moveId = $(select).closest("div").attr("id");
    	var questionIdx = moveId.substring(9,10);
    	
  
    	var questionTitle = $("#subject_"+questionIdx).val();
    	var questionType = $("input:radio[name=questionType_"+questionIdx+"]:checked").val();
    	var questionOverlap = $("input:radio[name=overlap_"+questionIdx+"]:checked").val();
    	var questionImage = $("#uploadImage_"+questionIdx).val();
    	var questionDetail = $("questionDetail_"+questionIdx).val();
    	
    	var moveQuestion = "<div id=\""+moveId+"\" class=\"com_table_input\" name=\"question\">";
    	moveQuestion += $(select).closest("div").html();
    	moveQuestion += "</div>";
    	
    	$(select).closest("div").remove();
    	$("input:hidden[name=questionOrder]").each(function(){
			if($(this).val() == moveIdx){
				if(targetIdx==0){
					$(this).closest("div").before(moveQuestion);	
				}else{	    			
    				$(this).closest("div").after(moveQuestion);
				}
    		};
    	});   
    	
    	updateOrder();
    	
    	$("#subject_"+questionIdx).val(questionTitle);
    	$("input:radio[name=questionType_"+questionIdx+"]:radio[value='"+questionType+"']").prop("checked", true);
    	$("input:radio[name=overlap_"+questionIdx+"]:radio[value='"+questionOverlap+"']").prop("checked", true);
    	$("#uploadImage_"+questionIdx).val(questionImage);
    	$("questionDetail_"+questionIdx).val(questionDetail);
    	
    	
    	
    	
    	
    }
    function updateQuestion(questionIdx){
    	/*---------------------------------------------------------*/
    	/* 문항 수정 팝업 페이지 호출 */
    	/* questionIdx == 문항 번호 */
    	/*---------------------------------------------------------*/
    	var questionType = $("input:radio[name=questionType_"+questionIdx+"]:checked").val();

    	var url;
    	if(questionType=="0"){
    		url = "updateMultiple.jsp?questionNumber="+questionIdx;
    	}else if(questionType=="1"){
    		alert("주관식은 항목 수정이 불가능 합니다.");
    		return ;
    	}else if(questionType=="2"){
    		url = "updateMetrix.jsp?questionNumber="+questionIdx;
    	}
    	
    	window.open(url, '문항 수정','width=600,height=500,resizable=yes, scrollbars=yes');
    }
    
     function changeQuestionType(questionIdx,questionType){

    	var matrix = $("#question_"+questionIdx+" tr[name=matrixQuestion]");
    	var multiple = $("#question_"+questionIdx+" tr[name=multipleQuestion]");
    	var overlap = $("#question_"+questionIdx+" input:radio[name=overlap_"+questionIdx+"]:checked").val();
    	var subjective =  $("#question_"+questionIdx+" tr[name=subjectiveQuestion]");
    	  if(questionType=="0"){
    		if(multiple.hasClass("hide")){
    			multiple.removeClass("hide");
    		};
    		if(overlap =="AO"){
    			var radioQuestion = $("#question_"+questionIdx+" tr[name=radioQuestion]");
    			if(radioQuestion.hasClass("hide")){
    				radioQuestion.removeClass("hide");
    			};
    			
    		}else if(overlap =="AP"){
    			var chkQuestion = $("#question_"+questionIdx+" tr[name=chkQuestion]");
    			if(chkQuestion.hasClass("hide")){
    				chkQuestion.removeClass("hide");
    			};
    		};
    		
    		
    	}else if(questionType=="1"){
			if(subjective.hasClass("hide")){
				subjective.removeClass("hide");
			}
			

			
			
			
    	}else if(questionType=="2"){
    		if(matrix.hasClass("hide")){
    			matrix.removeClass("hide");
			};
		}
    	
    	if(questionType!="1"){
    		if(!subjective.hasClass("hide")){
    			subjective.addClass("hide");
    		}
    	}
    	if(questionType != "2"){
    		if(!matrix.hasClass("hide")){
				matrix.addClass("hide");
			};
    		
    	}
    	if(questionType != "0"){
    		if(!multiple.hasClass("hide")){
      			multiple.addClass("hide");
      		};
      		if(overlap =="AO"){
      			var radioQuestion = $("#question_"+questionIdx+" tr[name=radioQuestion]");
      			
      			if(!radioQuestion.hasClass("hide")){
      				radioQuestion.addClass("hide");
      			};
      			
      		}else if(overlap =="AP"){
      			var chkQuestion = $("#question_"+questionIdx+" tr[name=chkQuestion]");
      			if(!chkQuestion.hasClass("hide")){
      				chkQuestion.addClass("hide");
      			};
      		};
    	}
    } 
    
     function changeQuestionOverlap(overlap,questionIdx){
    	 /*---------------------------------------------------------*/
    	 /* 객관식의 다중선택 단일 선택 변경  */
    	 /* overlap == 단일 다중 여부  ( AO == 단일 , AP == 다중 ) */ 
    	 /* questionIdx == 문항 번호 */
    	 /*---------------------------------------------------------*/
    	if(overlap == "AO"){
    		$("#question_"+questionIdx+" tr[name=radioQuestion]").each(function(){
    			$(this).removeClass("hide");
    		});
    		$("#question_"+questionIdx+" tr[name=chkQuestion]").each(function(){
    			$(this).addClass("hide");
    		});
    	}else{
    		$("#question_"+questionIdx+" tr[name=radioQuestion]").each(function(){
    			$(this).addClass("hide");
    		});
    		$("#question_"+questionIdx+" tr[name=chkQuestion]").each(function(){
    			$(this).removeClass("hide");
    		});
    		
    	}
    }
    
    function openCondition(questionIdx){
    	if($("input:radio[name=questionType_"+questionIdx+"]:checked").val() == "0" && $("input:radio[name=overlap_"+questionIdx+"]:checked").val() == "AO" ){
	    	var url = "questionCondition.jsp?questionIdx="+questionIdx+"&questionOrder="+$("#questionOrder_"+questionIdx).val();
	    	window.open(url, '조건 분기',"width=600,height=500,resizable, scrollbars=yes");
    	}else{
    		alert("조건 분기는 객관식 단일 선택만 가능 합니다.");
    	}
    }
    function removeQuestion(questionIdx){
    	$("#question_"+questionIdx).remove();
    	$("select[name=questionOrderSelect]").each(function(){
    		var selectId =$(this).attr("id"); 
    		alert($(selectId+" option:last").val());
    	});
    	updateOrder();
    	
    }
    
    $(function() {
  	  $( "#surveyStart, #surveyEnd" ).datepicker({
  	    dateFormat: 'yy-mm-dd',
  	    prevText: '이전 달',
  	    nextText: '다음 달',
  	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
  	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
  	    dayNames: ['일','월','화','수','목','금','토'],
  	    dayNamesShort: ['일','월','화','수','목','금','토'],
  	    dayNamesMin: ['일','월','화','수','목','금','토'],
  	    showMonthAfterYear: true,
  	    changeMonth: true,
  	    changeYear: true,
  	    yearSuffix: '년',
  	    showOn: "both",
  	    buttonImage: "images/icon-calendar.png",
  	    buttonImageOnly: true
  	  });
  	});
	$(document).on("change","#surveyEnd", function(){
  	
	  	var startArray = $("#surveyStart").val().split('-')
	  	var endArray = $("#surveyEnd").val().split('-');
	
	  	var start_date = new Date(startArray[0], startArray[1], startArray[2]);
	  	var end_date = new Date(endArray[0], endArray[1], endArray[2]);
	  	
	  	if(start_date.getTime() > end_date.getTime()) {
	  		alert("종료날짜보다 시작날짜가 빨라야합니다.");
	  		$.datepicker._clearDate(this);
	  		return false;
	  	}
	});
  
	function onlyNumber(obj) {
	    $(obj).keyup(function(){
	         $(this).val($(this).val().replace(/[^0-9]/g,""));
	    }); 
	}
  
  function insertSurvey(){
	  if($("#ManagerName").val() == ''){
		  alert("당담자 명을 입력 하세요");
		  $("#ManagerName").focus();
		  return false;
	  }
	  if($("#surveyTitle").val() == ''){
		  alert("설물 제목을 입력 하세요");
		  $("#surveyTitle").focus();
		  return false;
	  }
	  if($("#surveyStart").val() == ''){
		  alert("설문기간을 입력 하세요");
		  $("#surveyStart").focus();
		  return false;
	  }
	  if($("#surveyEnd").val() == ''){
		  alert("설문기간을 입력 하세요");
		  $("#surveyEnd").focus();
		  return false;
	  }
	  if($("#surveyInfo").val() == ''){
		  alert("설문 안내를 입력 하세요");
		  $("#surveyInfo").focus();
		  return false;
	  }
	  if($("#surveyEndPop").val() == ''){
		  alert("설문 종료를 입력 하세요");
		  $("#surveyEndPop").focus();
		  return false;
	  }
	  if($("input:radio[name=surveyDivision]:checked").val() == "AC"){
		  if($("#divisionNum").val() ==0 ||  $("#divisionNum").val() ==''){
			  alert("페이지 당 문항수를 입력 하세요");
			  $("#divisionNum").focus();
			  return false;
			  
		  }
	  }
	  
	  var flag = "true";
	  if($("#uploadImage_0").val() == ""){
		  alert("이미지를 선택 하세요");
		  $("#uploadImage_0").focus();
		  return false;
	  }
	  $("input:text[name=subject]").each(function(){
		 if($(this).val() ==''){
			 alert("문항의 제목을 입력 하세요");
			 $(this).focus();
			 flag="false";
			 return false;
		 } 
	  });
	  if(flag == "false"){
		  return false;
		  
	  }
	 
	  
	  $("#RegForm").submit();
	}
	function questionMakeFile(){
		var url = "questionMakeFile.jsp";
    	window.open(url, '문항 생성','width=600,height=500,resizable, scrollbars=yes');
	}
	
	function vidioPreview(idx){
		var url = $("#vidioPreview_"+idx).val();
		
		window.open(url, '미리 보기');
	}
	


    
   

</script>
</head>
<body>
    

	

		<form id="RegForm" name="RegForm" method="post" action="surveyInsertProcess.jsp">
			<input type="hidden" id="SALE_TYPE" name="SALE_TYPE" value="000001" />
			<input type="hidden" id="CURR_DATE" name="CURR_DATE" value="20170203144816" />
		
		<div class="con-area con-area22">
			<h4>기본 정보</h4>
			<p class="enroll txt-bold"><span class="point_color">*</span>&nbsp;는 필수입력 항목입니다.</p>
			<fieldset>
				<legend>설문 등록</legend>
				<div class="com_table_input">
					<table class="padding_space2" summary="설문 등록 테이블">
						<colgroup>
                        <col style="width:15%;">
                    </colgroup>
                    
                    <colgroup>
                        <col style="width:35%;">
                    </colgroup>
                    
                    <colgroup>
                        <col style="width:15%;">
                    </colgroup>
                    
                    <colgroup>
                        <col style="width:35%;">
                    </colgroup>
						
						<tbody>
						<tr>
								<th scope="row" class="bor_top_style1">
								    <span class="point_color">*</span>&nbsp;언어
								</th>
								<td colspan="3" class="bor_top_style1">
                                    <select id="language" name="language" class="input_select w20" >
                                          <option value="KR">한국어</option>
                                          <option value="EN">English</option>
                                          <option value="CH">汉语</option>
                                          <option value="JP">にほんご</option>
                                          <option value="RU">русский</option>
                                          <option value="AR">عرب؛ عربيّ</option>
                                      </select>

                                </td>
								
								
								</tr>

								
								
                    <tr>
                        <th scope="row"><span class="point_color">*</span>&nbsp;설문지 불러오기</th>
                        <td>
                            <select class="input_txt w70">
                          <option>신규</option>
                          <option class="ellipsis">이전 설문 제목1</option>
                          <option class="ellipsis">이전 설문 제목2</option>
                          </select>

                        </td>
                        
                        <th scope="row"><span class="point_color">*</span>&nbsp;담당자</th>
                        <td>
                        <input type="text" id="ManagerName" name="responsMember"  class="w30 input_txt" placeholder="홍길동"><label for="" class="blind">담당자이름</label>
                        <a href="#" class="btn-gray-bold-pd" onclick="Search(); return false;" >검색</a>
                        </td>
                    </tr>
                    
                    <tr>
                        <th scope="row" name="foreign_th"><span class="point_color">*</span>&nbsp;설문 제목</th>
								<td class="bor_top_style1" colspan="3">
								    <input type="text" id="surveyTitle" name="surveyTitle" placeholder="" class="w80 input_txt"><label for="OBJECT_Q" class="blind">설문제목</label>
								</td>
                    </tr>
                    <tr name="foreign" class="hide">
					    <td colspan="3">
					        <label class="lang_t" name="foregin_Set" for="surveyTitle_foreign">English</label>&nbsp;&nbsp;<input type="text" id="surveyTitle_foreign" name="surveyTitle_foreign" placeholder=""  class="w80 input_txt" >
					    </td>
					</tr>
							
							
				    <tr>
								<th scope="row"><span class="point_color">*</span>&nbsp;설문 기간</th>
								<td colspan="3">
								<input type="text" id="surveyStart" name="surveyStart" value="" class="input_txt w10" readonly />
							<a href="#" onclick="return false;"><!-- <img src="images/icon-calendar.png" /> --></a>
							
							~
							
							
							<input type="text" id="surveyEnd" name="surveyEnd" value="" class="input_txt w10" readonly />
							<a href="#" onclick="return false;"><!-- <img src="images/icon-calendar.png" /> --></a>

                   </td>
                    </tr>
                    
                    
                    <tr>
                        <th scope="row" name="foreign_th"><span class="point_color">*</span>&nbsp;설문 안내</th>
                        <td colspan="3">
                            <textarea rows="3" cols="20" id="surveyInfo" name="surveyInfo" class="input_txt txt_area"></textarea><label for="OBJECT_AQ" class="blind">등록된설문안내 노출</label>
                        </td>
                    </tr>
                    <tr name="foreign" class="hide">
                        <td colspan="3">
                            <label class="lang_t" for="surveyInfo_foreign">English</label>&nbsp;&nbsp;<textarea rows="3" cols="20" id="surveyInfo_foreign" name="surveyInfo_foreign" class="input_txt txt_area"></textarea>
                        </td>
                    </tr>
                    <tr>
								    <th scope="row" rowspan="6">응답자 분류</th>
								    <td colspan="3"><input type="text" id="OBJECT_JJ" name="OBJECT3" placeholder="다음은 통계처리를 위한 기본 사항입니다." class="w80 input_txt"><label for="OBJECT_JJ" class="blind">통계처리기본사항</label></td>
								</tr>
								
								<tr>
								    <td colspan="3">
								        <input type="checkbox" id="gender" name="gender" value="K"><label for="OBJECT_K">&nbsp;성별</label>
								        &#40;①남성&nbsp;&nbsp; ②여성&#41;
								    </td>
								</tr>
								
								<tr>
								    <td colspan="3">
								        <input type="checkbox" id="city" name="city" value="L"><label for="OBJECT_L">&nbsp;지역</label>
								        &#40;①서울&nbsp;②세종&nbsp;③제주&nbsp;④광주&nbsp;⑤대구&nbsp;⑥대전&nbsp;⑦부산&nbsp;⑧울산&nbsp;⑨인천&nbsp;⑩전남&nbsp;⑪전북&nbsp;⑫경남&nbsp;⑬경북&nbsp;⑭충남&nbsp;⑮충북&nbsp;16.강원&nbsp;17.기타&#40;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#41;&#41;
								        &nbsp;&nbsp;&nbsp;&nbsp;
								        <a href="#" class="btn-wine-bold2" onclick="">변경</a>
								    </td>
								</tr>
								
								
								<tr>
								    <td colspan="3">
								        <input type="checkbox" id="age" name="age" value="M"><label for="OBJECT_M">&nbsp;나이</label>
								        &#40;①5세미만&nbsp;②10세미만&nbsp;③15세미만&nbsp;④20세미만&nbsp;⑤25세미만&nbsp;⑥30세미만&nbsp;⑦35세미만&nbsp;⑧40세미만&nbsp;⑨40대이상&nbsp;⑩50대이상&nbsp;⑪60대이상&nbsp;⑫70대이상&nbsp;⑬80대이상&nbsp;⑭90대이상&#41;
								        &nbsp;&nbsp;&nbsp;&nbsp;
								        <a href="#" class="btn-wine-bold2" onclick="">변경</a>
								    </td>
								</tr>
								
								<tr>
								    <td colspan="3">
								        <input type="checkbox" id=" er" name="foreigner" value="N"><label for="OBJECT_N">&nbsp;외국인</label>
								        &#40;국가 &#40;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#41;&#41;
								    </td>
								</tr>
								
								<tr>
								    <td colspan="3">
								        <a href="#" class="btn_blue_ sub-right">분류 항목 추가 +</a>
								    </td>
								</tr>
                    
                    <tr>
                        <th scope="row" name="foreign_th"><span class="point_color">*</span>&nbsp;설문 종료</th>
                        <td colspan="3">
                            <textarea rows="3" cols="20" id="surveyEndPop" name="surveyEndPop" class="input_txt txt_area"></textarea><label for="OBJECT_AR" class="blind">등록된설문종료 노출</label>

                        </td>
                    </tr>
                     <tr name="foreign" class="hide">
                        <td colspan="3">
                            <label class="lang_t" name="surveyEndPop_Set" for="surveyEndPop_foreign">English</label>&nbsp;&nbsp;<textarea rows="3" cols="20" id="surveyEndPop_foreign" name="surveyEndPop_foreign" class="input_txt txt_area"></textarea>
                        </td>
                    </tr>
                    
                    <tr>
                        <th scope="row" name="foreign_th" rowspan="6">경품수령 입력정보</th>
								<td class="bor_top_style1" colspan="3">
								    <textarea rows="3" cols="20" name="giveaway"  class="input_txt txt_area"  placeholder="경품수령 안내문구를 등록하세요."></textarea>
								</td>
                    </tr>
                    <tr name="foreign" class="hide">
					    <td colspan="3">
                               <label class="lang_t" name="foregin_Set">English</label>&nbsp;&nbsp;<textarea rows="3" cols="20" name="giveaway_foreign"  class="input_txt txt_area"  ></textarea>
					    </td>
					</tr>
                    
                    <tr>
                        <td colspan="3">
                            <input type="checkbox" id="OBJECT_KK" name="giveaway_chk" value="KK" checked><label for="OBJECT_K">&nbsp;개인정보 수집에 동의합니다.</label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan="3">
                            <input type="checkbox" id="OBJECT_KE" name="giveaway_chk" value="KE"><label for="OBJECT_K">&nbsp;이름</label>
                        </td>
                    </tr>
							
				    
				    <tr>
                        <td colspan="3">
                            <input type="checkbox" id="OBJECT_KF" name="giveaway_chk" value="KF"><label for="OBJECT_K">&nbsp;주소</label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan="3">
                            <input type="checkbox" id="OBJECT_KG" name="giveaway_chk" value="KG"><label for="OBJECT_K">&nbsp;연락처(휴대폰)</label>
                        </td>
                    </tr>
                    
                    <tr>
                        <td colspan="3">
                            <input type="checkbox" id="OBJECT_KH" name="giveaway_chk" value="KH"><label for="OBJECT_K">&nbsp;이메일</label>
                        </td>
                    </tr>
								
								
								
								
								<tr>
								    <th rowspan="2">
								        <span class="point_color">*</span>
                                        페이지 설정
                                    </th>
                                    <td colspan="3">
                                        <input type="radio" id="OBJECT_AB" name="surveyDivision" value="AB" checked>&nbsp;<label for="OBJECT_AB">한 페이지에 다 보여주기</label>
                                    </td>
								</tr>
								
								<tr>
								    <td>
								        <input type="radio" id="OBJECT_AC" name="surveyDivision" value="AC">&nbsp;<label for="OBJECT_AC">페이지 나누어서 보여주기</label>
								    </td>
								    
								    <td colspan="2">
								        <label for="OBJECT_AC">페이지당 문항 수</label>&nbsp;&nbsp;<input type="text" id="divisionNum" name="divisionNum" onkeydown="onlyNumber(this)" placeholder="0" class="w30 input_txt">
								    </td>
								</tr>
								
								<tr>
								    <th >
								        <span class="point_color">*</span>
                                        멀티미디어
                                    </th>
                                    <td colspan="3">
                                        <label for="">이미지</label>&nbsp;&nbsp;<input type="text" id="uploadImage_0" name="surveyTopImg" placeholder="" class="w70 input_txt" readonly>&nbsp;
                                        <a href="#" name="btn-upload" class="btn-wine-bold2" id="btn-upload" onclick="uploadFile(0); return false;" >파일선택</a>
                                        <input type="file" id="file_0" name="fileList" class="file" onchange="insertImgValue(0)">

                                    </td>
								</tr>

								
						</tbody>
					</table>
				</div>
			</fieldset>
            
            <h4>문항 등록</h4>
			<fieldset>
				<legend>문항 등록</legend>
				<div class="com_table_input">
					<table class="padding_space2" summary="문항 등록 테이블">
					    <colgroup>
                        <col style="width:15%;">
                    </colgroup>
                    
                    <colgroup>
                        <col style="width:85%;">
                    </colgroup>
					    
					    <tr>
					        <th scope="row" class="bor_top_style1">등록 방법</th>
					        <td class="bor_top_style1">
					            <input type="radio" id="OBJECT_AG" name="changeQuestionFile" value="AG" checked>&nbsp;<label for="OBJECT_AG">직접 등록</label>&nbsp;&nbsp;
					            <input type="radio" id="OBJECT_AH" name="changeQuestionFile" value="AH">&nbsp;<label for="OBJECT_AH">파일 등록</label>
					        </td>
					    </tr>
					</table>
		        </div>
	        </fieldset>
	        <fieldset id="questionFile" class="hide">
							<legend>문항 정보</legend>
							<div class="com_table_input">
								<table class="padding_space2" summary="문항 정보 테이블">
									<colgroup>
										<col style="width: 15%;">
									</colgroup>

									<colgroup>
										<col style="width: 85%;">
									</colgroup>


									<tr>
										<th scope="row" class="bor_top_style1">csv파일</th>
										<td class="bor_top_style1"><label for="OBJECT_AIII"
											class="blind">이미지</label>&nbsp;&nbsp;<input type="text"
											id="uploadCsv" name="OBJECT133"
											class="w70 input_txt">&nbsp;<a href="#"
											class="btn-wine-bold2" onclick="questionMakeFile(); return false;">파일선택</a>&nbsp;<a
											href="#" class="btn-wine-bold2"
											style="background: #2377ce; border: 1px solid #2377ce;"
											onclick="SendTest(); return false;">양식 다운로드</a></td>
									</tr>
								</table>



							</div>
						</fieldset>
	        
	        <h4>문항 정보</h4>
	        <a href="#" class="btn-wine-bold2 add_btn" onclick="addQuestion('A');return false;">문항 추가</a>
	        <input type="hidden" id="questionMaxIdx" value="0">
	        <fieldset id="questionList">
				<legend>문항 정보</legend>
				
			</fieldset>
	        <div class="txt-center">
				<a href="#" class="btn-wine-14" style="padding:0; width:99px; line-height:40px;" onclick="Regist(); return false;">승인요청</a>
				<a href="#" class="btn-wine-14" onclick="insertSurvey(); return false;">저장</a>				
				<a href="#" class="btn-gray-bold" onclick="window.open('surveyPreview.jsp', '미리 보기',' width=1200, height=800, scrollbars=1');return false;" target="_blank" style="width:75px; line-height:26px; font-size:14px;">미리보기</a>
			</div>
	

	        </div>
		    </form>
	
		




</body>
</html>
















