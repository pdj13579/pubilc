<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8" %>
<!doctype html>
<%
int questionNumber = Integer.parseInt(request.getParameter("questionNumber"));




%>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>팝업1_객관식(단일선택)</title>
<link href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/import.css">
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/sub.css">

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
<script type="text/javascript" src="js/default.js"></script>
<script type="text/javascript">
var lang = $("#language",opener.document).val();
var language =  $("#language option:selected",opener.document).text();
	$(document).ready(function() {
		
	 	var questionNumber = <%=questionNumber%>;

		var addQuestion="";
 		var questionItemCount;
 		var overlap = $("input:radio[name=overlap_"+questionNumber+"]:checked",opener.document).val();
 		$("#overlap").val(overlap);
 		var rowCount=0;
 		if(overlap=="AO"){
 			var addQuestionItem = "";
 			var i=0;
 			$("Label[name=chkRadioItem_"+questionNumber+"]",opener.document).each(function(){
 				rowCount++;
 				addQuestion+="<tr id=\"item_"+i+"\">";
 				addQuestion+="<td class=\"bor_top_style1\" >";
 				addQuestion+="<input type=\"radio\" name=\"ANSWER\" value=\"\">";
 				addQuestion+="<input type=\"text\" name=\"text1\" class=\"w70 input_txt\" value=\""+$(this).text()+"\">&nbsp;<a href=\"#\" class=\"ion-plus\" onclick=\"addItem("+i+");return false;\"></a>";
 				if(i!=0){
 					addQuestion+="<a href=\"#\" onclick=\"removeItem("+i+")\" class=\"ion-minus\"></a>";
 				}
 				addQuestion+="</td>";
 				
 				addQuestion+="</tr>";
 				
 				if(lang!="KR"){
 					rowCount++;
 					addQuestion+="<tr id=\"item_lang_"+i+"\">";
 					addQuestion+="<td>";
 					addQuestion+="<label>"+language+"</label>&nbsp;&nbsp;<input type=\"text\" name=\"text1_lang\" class=\"w70 input_txt\" >";
 					addQuestion+="</td>";
 					addQuestion+="</tr>";
 				}
 				i++;
 			});
 		}else if(overlap=="AP"){
 			var addQuestionItem = "";
 			var i=0;
 			$("Label[name=chkboxLabel_"+questionNumber+"]",opener.document).each(function(){
 				rowCount++;
 				addQuestion+="<tr id=\"item_"+i+"\">";
 				addQuestion+="<td class=\"bor_top_style1\" >";
 				addQuestion+="<input type=\"checkbox\" name=\"ANSWER\" value=\"\">";
 				addQuestion+="<input type=\"text\" name=\"text1\" class=\"w70 input_txt\" value=\""+$(this).text()+"\">&nbsp;<a href=\"#\" class=\"ion-plus\" onclick=\"addItem("+i+");return false;\"></a>";
 				if(i!=0){
 					addQuestion+="<a href=\"#\" onclick=\"removeItem("+i+")\" class=\"ion-minus\"></a>";
 				}
 				addQuestion+="</td>";
 				addQuestion+="</tr>";
 				if(lang!="KR"){
 					rowCount++;
 					addQuestion+="<tr id=\"item_lang_"+i+"\">";
 					addQuestion+="<td>";
 					addQuestion+="<label>"+language+"</label>&nbsp;&nbsp;<input type=\"text\" name=\"text1_lang\" class=\"w70 input_txt\" >";
 					addQuestion+="</td>";
 					addQuestion+="</tr>";
 				}
 				i++;
 			});
 			
 		}
 		$("#AL_th").attr("rowspan",rowCount+1);
 		$("#AL_body").append(addQuestion);
	 		
	 	
	});
	function updateQuestion(){
		var temp="";
		var i = 0;
		var questionIdx=<%=questionNumber%>;
		var overlap = $("input:radio[name=overlap_"+questionIdx+"]:checked",opener.document).val();
		
		if(overlap=="AO"){
			$("#AL_body input:text[name=text1]").each(function(){
				temp += "<input type=\"radio\" id=\"chkRadio_"+questionIdx+"_RA_"+i+"\" name=\"chkRadio_"+questionIdx+"\" value=\""+i+"\">&nbsp;";
				temp += "<label name=\"chkRadioItem_"+questionIdx+"\" for=\"chkRadio_"+questionIdx+"_RA_"+i+"\">"+$(this).val()+"</label>";
				temp += "<input type=\"hidden\" id=\"radioItemValue_"+questionIdx+"_"+i+"\" name=\"chkRadioItemValue_"+questionIdx+"\" value=\""+$(this).val()+"\">";
		    	
				if($("#conditionStart_"+questionIdx+"_"+i,opener.document).val() == null){
					temp += "<input type=\"hidden\" id=\"radioSubItemValue_"+questionIdx+"_"+i+"\" name=\"chkRadioSubItem_"+questionIdx+"\" value=\"\"><br>";
					temp += "<input type=\"hidden\" id=\"conditionStart_"+questionIdx+"_"+i+"\" name=\"conditionStart_"+questionIdx+"_"+i+"\" value=\"0\">";
					temp += "<input type=\"hidden\" id=\"conditionEnd_"+questionIdx+"_"+i+"\"  name=\"conditionEnd_"+questionIdx+"_"+i+"\" value=\"0\">";
					
				}else{
					temp += "<label id=\"itemSub_"+questionIdx+"_"+i+"\">"+$("#itemSub_"+questionIdx+"_"+i).text()+"</label><br>";
					temp += "<input type=\"hidden\" id=\"radioSubItemValue_"+questionIdx+"_"+i+"\" name=\"chkRadioSubItem_"+questionIdx+"\" value=\""+$("#itemSub_"+questionIdx+"_"+i).text()+"\">";
					temp += "<input type=\"hidden\" id=\"conditionStart_"+questionIdx+"_"+i+"\"  name=\"conditionStart_"+questionIdx+"\" value=\""+$("#conditionStart_"+questionIdx+"_"+i,opener.document).val()+"\">";
					temp += "<input type=\"hidden\" id=\"conditionEnd_"+questionIdx+"_"+i+"\" name=\"conditionEnd_"+questionIdx+"\" value=\""+$("#conditionEnd_"+questionIdx+"_"+i,opener.document).val()+"\">";
				}
				i++;
			});
			$("#questionAO_"+questionIdx,opener.document).html(temp);
		}else{
			$("#AL_body input:text[name=text1]").each(function(){
				temp += "<input type=\"checkbox\" id=\"chkbox_"+questionIdx+"_CHK_"+i+"\" name=\"chkbox_"+questionIdx+"\" value=\""+i+"\">&nbsp;";
				temp += "<label  name=\"chkbox_"+questionIdx+"\" for=\"chkbox_"+questionIdx+"_CHK_"+i+"\">"+$(this).val()+"</label><br>";
				temp += "<input type=\"hidden\" id=\"chkItemValue_"+questionIdx+"_0\"name=\"chkboxItem_"+questionIdx+"\" value=\""+$(this).val()+"\">";
				
				
				i++;
			});
			$("#questionAP_"+questionIdx,opener.document).html(temp);
		}
		
		window.close();
	}
	function addItem(itemNum){
		var newItem = "";
		var newItemNum = $("input[name=ANSWER]").length+1;
		newItem+="<tr id=\"item_"+newItemNum+"\">";
		newItem+="<td class=\"bor_top_style1\" >";
		if($("#overlap").val()=="AO"){
			newItem+="<input type=\"radio\" name=\"ANSWER\" value=\"\">";
		}else{
			newItem+="<input type=\"checkbox\" name=\"ANSWER\" value=\"\">";	
		}
		newItem+="<input type=\"text\" name=\"text1\" class=\"w70 input_txt\" value=\"\">&nbsp;<a href=\"#\" class=\"ion-plus\" onclick=\"addItem("+newItemNum+");return false;\"></a><a href=\"#\" onclick=\"removeItem("+newItemNum+")\" class=\"ion-minus\"></a>";
		newItem+="</td>";
		newItem+="</tr>";
		if(lang!="KR"){
				newItem+="<tr id=\"item_lang_"+newItemNum+"\">";
				newItem+="<td>";
				newItem+="<label>"+language+"</label>&nbsp;&nbsp;<input type=\"text\" name=\"text1_lang\" class=\"w70 input_txt\" >";
				newItem+="</td>";
				newItem+="</tr>";
			}
		$("#item_lang_"+itemNum).after(newItem);
		$("#AL_th").attr("rowspan",$("#AL_th").attr("rowspan")+2);
		
	}
	function removeItem(itemNum){
		$("#item_"+itemNum).remove();
		$("#item_lang_"+itemNum).remove();
		$("#AL_th").attr("rowspan",$("#AL_th").attr("rowspan")-2);
	}
	
	
</script>
</head>
<body id ="pop_body">

    
  <div id="POP_Frame" class="pop_scroll">
	
	<div id="ContentsArea">
		<form id="RegForm" name="RegForm" method="post" enctype="multipart/form-data">
			<input type="hidden" id="SALE_TYPE" name="SALE_TYPE" value="000001" />
			<input type="hidden" id="CURR_DATE" name="CURR_DATE" value="20170203144816" />
		
		<div class="con-area con-area22">

			<fieldset id="AL">
				<legend>항목을 등록하는 팝업 화면1</legend>
				<div class="com_table_input">
				<input type="hidden" id="overlap">
					<table summary="항목 등록 팝업 화면1">
						<colgroup>
							<col width="15%" />
							<col width="85%" />
						</colgroup>
						
						<tbody id="AL_body">
							<tr>
								<th id="AL_th" scope="col"  rowspan="10" class="bor_top_style1"><span class="point_color">*</span>&nbsp;답변</th>
								<!-- <td class="bor_top_style1" >
                                    <input type="radio" id="ANSWER_A" name="ANSWER1" value=""><label for="ANSWER_A" class="blind">추가</label>&nbsp;
                                    <input type="text" id="answer_text1" name="text1" class="w70 input_txt">&nbsp;<a href="#" class="ion-plus"></a>
								</td> -->
							</tr>
						</tbody>
					</table>
				</div>
			</fieldset>
			
		</div>
		
		<div class="txt-center">
					<a href="#" class="btn-gray-bold" onclick="updateQuestion(); return false;" style="width:75px; line-height:26px; font-size:14px;">확인</a>&nbsp;&nbsp;
					<a href="#" class="btn-gray-bold" onclick="javascript:window.close(); return false;" style="width:75px; background:#a9a9a9; border:1px solid #a9a9a9; line-height:26px; font-size:14px;">취소</a>
					</div>

		
		</form>
	</div>
</div>



</body>
</html>
















