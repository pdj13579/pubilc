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

});
function commitCondition(){
	if($("#file").val() == ""){
		 alert('파일을 선택해주세요.');
		return false;
	}
	 var result = confirm('저장하시면 기존의 문항 정보는 초기화 됩니다.'); 
	if(result) {
		
		var form = document.RegForm;
		$("#uploadCsv",opener.document).val($("#file").val());
		form.submit();
		/* $("#RegForm").submit(); */
	 } else {
			return false;
	} 

}

function closeCondition(){
	window.close();	
}
function insertImgValue(){
	/*---------------------------------------------------------*/
	/* input file 의 경로를 text 로 */
	/*---------------------------------------------------------*/
	
	var v_fileName = null;
    var v_tempName = null;
 
    v_fileName = $("#file").val();
 	
    if(v_fileName == "" || v_fileName == null)
    {
        alert('파일을 선택해주세요.');
    }
    else
    {
        v_tempName = v_fileName.indexOf("\\");
        while (v_tempName > 0)
        {
            v_fileName = v_fileName.substr(0, v_tempName) + "\/" + v_fileName.substr(v_tempName + 1, v_fileName.length - 1);
            v_tempName = v_fileName.indexOf("\\");
        }
        v_tempName = v_fileName.indexOf(":");
        if (v_tempName > 0)
        {
            v_fileName = "file:\/\/"  + v_fileName.substr(0, v_tempName) + "|" + v_fileName.substr(v_tempName + 1, v_fileName.length - 1);
        } 
        v_fileName = v_fileName.toLowerCase();
        if( v_fileName.indexOf(".csv") == -1 )
        {
            alert("확장자가 'csv'인 파일을 선택해주세요.");
            return false;
        }
        
    }
	
}


</script>
</head>
<body>

    
  <div id="POP_Frame" class="pop_scroll">
	
	<div id="ContentsArea">
		<form id="RegForm" name="RegForm" method="post" action="/uploadFile.jsp" enctype="multipart/form-data">
			<input type="hidden" id="SALE_TYPE" name="SALE_TYPE" value="000001" />
			<input type="hidden" id="CURR_DATE" name="CURR_DATE" value="20170203144816" />
		
		<div class="con-area22">
			<fieldset id="questionFile">
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
										<th scope="row" class="bor_top_style1">첨부파일</th>
										<td class="bor_top_style1">
											<label for="OBJECT_AIII" class="blind">이미지</label>&nbsp;&nbsp;
											<!-- <input type="text" id="uploadImage" name="OBJECT133" class="w70 input_txt">&nbsp; -->
											
												<input type="file" id="file" name="file" onchange="insertImgValue()" value="저장">
											
											
											<!-- <a href="#"	class="btn-wine-bold2" onclick="uploadFile(); return false;">파일선택</a>&nbsp; 
											<input type="file" id="file" name="file" class="file" onchange="insertImgValue()">-->
										</td>
									</tr>
								</table>



							</div>
						</fieldset>
			
		</div>
		
		<div class="txt-center">
					
					<a href="#" class="btn-gray-bold" onclick="commitCondition();return false;" style="width:75px; line-height:26px; font-size:14px;">저장</a>&nbsp;&nbsp;
					<a href="#" class="btn-gray-bold" onclick="closeCondition(); return false;" style="width:75px; background:#a9a9a9; border:1px solid #a9a9a9; line-height:26px; font-size:14px;">취소</a>
					</div>

		
		</form>
	</div>
</div>



</body>
</html>
















