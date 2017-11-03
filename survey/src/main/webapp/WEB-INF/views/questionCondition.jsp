<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8" %>
<%
String questionIdx = request.getParameter("questionIdx");
String questionOrder = request.getParameter("questionOrder");


%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>조건분기 팝업</title>
<link href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/sub.css">
<link rel="stylesheet" type="text/css" href="css/import.css">
<link rel="stylesheet" type="text/css" href="css/common.css">

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
var questionIdx = <%=questionIdx%>;;
$(document).ready(function() {

	var questionOrder = <%=questionOrder%>;
	
	$("#subject").text($("#subject_"+questionIdx,opener.document).val());
	$("label[name=chkRadioItem_"+questionIdx+"]",opener.document).each(function(index){
		var start = $("#conditionStart_"+questionIdx+"_"+index,opener.document).val();
		var end = $("#conditionEnd_"+questionIdx+"_"+index,opener.document).val();
		var itemSub = $("#itemSub_"+questionIdx+"_"+index,opener.document).text();
		itemSub = itemSub.substring(1, itemSub.length-1);
		var item = "";
		item += "<tr id=\"item_"+index+"\" name=\"itemList\">";
		item += "<th scope=\"row\" rowspan=\"2\">"+index+"</th>";
		item += "<td rowspan=\"2\">"+$(this).text()+"</td>";
		item += "<td >";
		item += "<input type=\"radio\" id=\"itemCheck_"+index+"\" name=\"conditionChk_"+index+"\" onclick=\"checkCondition(this,"+index+")\"";
		if(start != 0){
			item += " checked ";	
		}
		item += "value=\"chk\">&nbsp;&nbsp;<label for=\"itemCheck_"+index+"\">범위선택</label>&nbsp;&nbsp;&nbsp;&nbsp;";
		item += "<input type=\"radio\" id=\"itemNone_"+index+"\" name=\"conditionChk_"+index+"\" onclick=\"checkCondition(this,"+index+")\"";
		if(start == 0){
			item += " checked ";	
		}
		item += " value=\"none\">&nbsp;&nbsp;<label for=\"itemNone_"+index+"\">종료</label>";
		item += "</td>";
		item += "<td rowspan=\"2\">";
		item += "<input type=\"text\" id=\"itemSub_"+index+"\" name=\"itemSub\"  class=\"w70 input_txt\" value=\""+itemSub+"\" ";
		if(start == 0){
			item += " readonly ";	
		}
		item += "><label for=\"itemSub_"+index+"\" class=\"blind\">코멘트 내용</label>";
		item += "</td>";
		item += "</tr>";
		item += "<tr>";
		item += "<td class=\"";
		if(start ==0){
			item += "hide";
		}
		item +="\">";
		item += "<select id=\"start_"+index+"\" name=\"itemScope_"+index+"\" onchange=\"selectCondition("+index+", 'S')\" class=\"input_txt w40\">";
		item += "<option value=\"\">선택</option>";
		$("input:text[name=subject]",opener.document).each(function(index){
			index=index+1;
			if(questionOrder<index){
				item +="<option value=\""+index+"\" ";
				if(index == start){
					item += "selected ";
				}
				item +=">"+index+"."+ $(this).val()+"</option>";
			}
		});
		item += "</select>&nbsp;&nbsp;부터";
		item += "<div style=\"margin-top:10px;\">";
		item += "<select id=\"end_"+index+"\" name=\"itemScope_"+index+"\" onchange=\"selectCondition("+index+", 'E')\" class=\"input_txt w40\">";
		item += "<option value=\"\">선택</option>";
		$("input:text[name=subject]",opener.document).each(function(index){
			index=index+1;
			if(questionOrder <index){
				item +="<option value=\""+index+"\"";
				if(index == end){
					item += "selected ";
				}
				item += ">"+index+"."+ $(this).val()+"</option>";
			}
		});
		item += " </select>&nbsp;&nbsp;까지";
		item += "</div>";
		item += "</td>";
		item += "</tr>";
		
		$("#itemList").append(item);
	});
	
	
});
	





function checkCondition(checkVal,itemIdx){

	if($(checkVal).val() == "chk"){
		$("select[name=itemScope_"+itemIdx+"]").parents("td").removeClass("hide");
		$("#itemSub_"+itemIdx).attr("readonly",false);
		
	}else{
		$("select[name=itemScope_"+itemIdx+"]").parents("td").addClass("hide");
		$("#start_"+itemIdx).val("").prop("selected",true);
		$("#end_"+itemIdx).val("").prop("selected",true);
		$("#itemSub_"+itemIdx).attr("readonly",true);
		$("#itemSub_"+itemIdx).val("");
		
		
	}
}



function selectCondition(itemIdx, flag){
	
	var start = $("#start_"+itemIdx).val();
	var end = $("#end_"+itemIdx).val();
	if(flag =="E"){
		
		if(start != "" && start > end ){
			alert("종료 문항이 시작 문항보다 작을순 없습니다.");
			$("#end_"+itemIdx).val("");
		}
	}else{
		if(end != "" && start > end ){
			alert("시작 문항이 종료 문항보다 클순 없습니다.");
			$("#start_"+itemIdx).val("");
		}
	}
}
function commitCondition(){
	
	for(var i =0; i<$("tr[name=itemList]").length;i++){
		var start = $("#start_"+i).val();
		var end = $("#end_"+i).val();
		if($("#itemCheck_"+i).is(":checked")){
			
			if(start == ""){
				alert("범위 선택이 완료 되지 않았습니다.");
				$("#start_"+i).focus();
				return;
			}else if(end == ""){
				alert("범위 선택이 완료 되지 않았습니다.");
				$("#end_"+i).focus();
				return;
			}
			
		}
		

		
	}
	
	
	for(var i =0; i<$("tr[name=itemList]").length;i++){
		
		var start = $("#start_"+i).val();
		var end = $("#end_"+i).val();
		var itemSub = $("#itemSub_"+i).val();
		if(start !="" &&end !=""){
			$("#conditionStart_"+questionIdx+"_"+i,opener.document).val(start);
			$("#conditionEnd_"+questionIdx+"_"+i,opener.document).val(end);
			if(itemSub != ""){
				$("#itemSub_"+questionIdx+"_"+i,opener.document).text("("+itemSub+")");
				$("#radioSubItemValue_"+questionIdx+"_"+i,opener.document).val("("+itemSub+")");
			}else{
				$("#itemSub_"+questionIdx+"_"+i,opener.document).text("");
			}
		}else{
			$("#conditionStart_"+questionIdx+"_"+i,opener.document).val("0");
			$("#conditionEnd_"+questionIdx+"_"+i,opener.document).val("0");
			$("#itemSub_"+questionIdx+"_"+i,opener.document).text("");
			
		}
	}
	closeCondition();
	
	
	
	
}

function closeCondition(){
	window.close();	
}


</script>
</head>
<body>

    
  <div id="POP_Frame" class="pop_scroll">
	
	<div id="ContentsArea">
		<form id="RegForm" name="RegForm" method="post" enctype="multipart/form-data">
			<input type="hidden" id="SALE_TYPE" name="SALE_TYPE" value="000001" />
			<input type="hidden" id="CURR_DATE" name="CURR_DATE" value="20170203144816" />
		
		<div class="con-area22">
            <h4 id="subject"></h4>
			<fieldset>
				<legend>설문 결과</legend>
				<div class="com_table_input">
					<table summary="설문 결과1" class="txtcenter">
						<colgroup>
							<col width="10%" >
							<col width="20%" >
							<col width="35%" >
							<col width="35%" >
						</colgroup>
						
						<thead>
						    <tr>
						        <th scope="col" class="bor_top_style1">번호</th>
						        <th scope="col" class="bor_top_style1">보기 내용</th>
						        <th scope="col" class="bor_top_style1">선택</th>
						        <th scope="col" class="bor_top_style1">코멘트</th>
						    </tr>
						</thead>
						
						<tbody id="itemList">
						
						</tbody>
						
					</table>
				</div>
			</fieldset>
			
		</div>
		
		<div class="txt-center">
					<a href="#" class="btn-gray-bold" onclick="Search(); return false;" style="width:75px; line-height:26px; font-size:14px;">초기화</a>&nbsp;&nbsp;
					<a href="#" class="btn-gray-bold" onclick="commitCondition(); return false;" style="width:75px; line-height:26px; font-size:14px;">저장</a>&nbsp;&nbsp;
					<a href="#" class="btn-gray-bold" onclick="closeCondition(); return false;" style="width:75px; background:#a9a9a9; border:1px solid #a9a9a9; line-height:26px; font-size:14px;">취소</a>
					</div>

		
		</form>
	</div>
</div>



</body>
</html>
















