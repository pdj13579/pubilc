<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8" %>
<%
int questionIdx =  Integer.parseInt(request.getParameter("questionNumber"));

%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>팝업3_매트릭스(단일선택)</title>
<link href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/import.css">
<link rel="stylesheet" type="text/css" href="css/contents.css">

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

$(document).ready(function() {
	var questionIdx = <%=questionIdx%>
	var matrixWidth = $("#matrixWidth_"+questionIdx,opener.document).val();
	var matrixHeight = $("#matrixHeight_"+questionIdx,opener.document).val();
	var matrixThead = "<th scope=\"col\" class=\"bor_top_style1\">&nbsp;</th>";
	var matrixTbody = "";
	$("#matrixWidth").val(matrixWidth);
	$("#matrixHeight").val(matrixHeight);
	$("input:text[name=matrix_"+questionIdx+"]",opener.document).each(function(index){
		
		if(index < matrixWidth){
			matrixThead+="<th scope=\"col\" class=\"bor_top_style1\">";
			matrixThead+="<input type=\"text\" name=\"matrix_"+questionIdx+"\" value=\""+$(this).val()+"\" class=\"input_txt w70\"  />";
			matrixThead+="</td>";
		}else{
			matrixTbody+="<tr>";
			matrixTbody+="<th scope=\"row\" class=\"bor_top_style1\">";
			matrixTbody+="<input type=\"text\"  name=\"matrix_"+questionIdx+"\" value=\""+$(this).val()+"\" class=\"input_txt w70\" />";
			matrixTbody+="</th>";
			for(var i =0;i<matrixWidth;i++){
				matrixTbody+="<td class=\"txt_cen\">";
				matrixTbody+="<input type=\"radio\" id=\"ANSWER_M\" name=\"ANSWER_matrix_"+index+"\" value=\"\" >&nbsp;<label for=\"ANSWER_M\"></label>";
				matrixTbody+="</td>";
				
			}
			matrixTbody+="</tr>";
			
		}
	});
	$("#matrixThead").html(matrixThead);
	$("#matrixTbody").html(matrixTbody);
	
});

function updateMatrix(){
	var questionIdx=<%=questionIdx%>;
	$("input:text[name=matrix_"+questionIdx+"]").each(function(index){
		  $("input:text[name=matrix_"+questionIdx+"]",opener.document).eq(index).val($(this).val());  
	});
	window.close();
	<%-- $("#matrixQuestion_"+<%=questionIdx%>).html($("#matrixQuestion").html()); --%>
	
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
			<input type="hidden" id="matrixWidth"  />
			<input type="hidden" id="matrixHeight"   />
		
		
		
		<div class="con-area22" id="matrixQuestion">
			<fieldset>
				<legend>설문 결과</legend>
				<div class="com_table_input">
					<table summary="설문 결과">
						<colgroup>
							<col width="25%" />
							<col width="25%" />
							<col width="25%" />
							<col width="25%" />
						</colgroup>
						
						<thead>
                        <tr id="matrixThead">
                           
                        </tr>

						</thead>
						
						<tbody id=matrixTbody>
							
                            
                            
								
							
						</tbody>
					</table>
				</div>
			</fieldset>
			
		</div>
		
		
		
		<div class="txt-center">
					<a href="#" class="btn-gray-bold" onclick="updateMatrix(); return false;" style="width:75px; line-height:26px; font-size:14px;">확인</a>&nbsp;&nbsp;
					<a href="#" class="btn-gray-bold" onclick="closeCondition(); return false;" style="width:75px; background:#a9a9a9; border:1px solid #a9a9a9; line-height:26px; font-size:14px;">취소</a>
					</div>

		
		</form>
	</div>
</div>



</body>
</html>
















