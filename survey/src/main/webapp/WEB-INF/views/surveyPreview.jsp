<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>설문조회 시 미리보기 팝업</title>
<link href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="css/import.css">

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
</head>
<body>

    
  
    
   


    <div id="POP_Frame">
	<h1 class="txtcenter">2016 ACC 공연 관람객 설문조사</h1>
	<div id="ContentsArea">
		<form id="RegForm" name="RegForm" method="post">
			<input type="hidden" id="CURR_PAGE" name="CURR_PAGE" value="1" />
			<input type="hidden" id="MEMBER_NO" name="MEMBER_NO" value="80060917031000021147" />
		
		
		
		<div class="con-area con-area22">
			<h4>설문 정보</h4>
			<div class="location_edit">
			<a href="#" class="btn-wine-14" onclick="" style="padding:0; width:99px; line-height:35px; text-align:center; vertical-align:top;"><span class="ion-printer"></span> 인쇄</a>
		    </div>
		
		
			<fieldset>
				<legend>설문 결과</legend>
				<div class="com_table_input">
					<table summary="설문 결과">
						<colgroup>
							<col width="15%" />
						</colgroup>
						
						<colgroup>
							<col width="85%" />
						</colgroup>
						
						<tbody>
							<tr>
								<th scope="row" class="bor_top_style1">설문 기간</th>
								<td class="bor_top_style1 txt-bold" >
									2017-04-01 ~ 2017-04-30
								</td>
								</tr>
								
								<tr>
                                    <th scope="row" class="bor_top_style1">설문 안내</th>
                                    <td class="bor_top_style1">
                                        <p class="line_edit">국립아시아ACC 공연을 찾아주셔서 대단히 감사합니다.<br>
                                        본 설문조사는 공연 관람객을 대상으로 공연 만족도를 평가하고, 관람객의 다양한 의견을 수렴하여 향후 공연 서비스 개선방안을 모색하는데 그 목적을 두고 있습니다.<br>
                                        응답해 주신 소중한 답변은 통계분석 이외의 목적으로 활용되거나 공개되지 않습니다.<br>
                                        공연 관람 후 작성하시고 출구에서 제출해 주십시오. 감사합니다.<br>
                                        <br>
                                        주최 : 아시아문화원 공연사업팀(062-601-4616)<br>   
                                        조사 : 아시아 문화전당 문화창조과</p>

                                    </td>
								</tr>
								<tr>
                                    <th scope="row" rowspan="6">개인정보</th>
                                    <td colspan="3">
								        다음은 통계처리를 위한 기본 사항입니다.
								    </td>
								</tr>
								
								<tr>
								    <td colspan="3">
								        <input type="checkbox" id="OBJECT_K" name="OBJECT4" value="K"><label for="OBJECT_K">&nbsp;성별</label>
								        &#40;①남성&nbsp;&nbsp; ②여성&#41;
								    </td>
								</tr>
								
								<tr>
								    <td colspan="3">
								        <input type="checkbox" id="OBJECT_L" name="OBJECT4" value="L"><label for="OBJECT_L">&nbsp;지역</label>
								        &#40;①광주&nbsp;②전남북&nbsp;③서울수도권&nbsp;④충청강원권&nbsp;⑤경상권&nbsp;⑥제주/ 기타&#40;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#41;&#41;
								    </td>
								</tr>
								
								
								<tr>
								    <td colspan="3">
								        <input type="checkbox" id="OBJECT_M" name="OBJECT4" value="M"><label for="OBJECT_M">&nbsp;나이</label>
								        &#40;①10대&nbsp;②20대&nbsp;③30대&nbsp;④40대&nbsp;⑤50대&nbsp;⑥60대 이상&#41;
								    </td>
								</tr>
								
								<tr>
								    <td colspan="3">
								        <input type="checkbox" id="OBJECT_N" name="OBJECT4" value="N"><label for="OBJECT_N">&nbsp;외국인</label>
								        &#40;국가 &#40;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#41;&#41;
								    </td>
								</tr>
								
								<tr>
								    <td colspan="3">
								        <input type="checkbox" id="OBJECT_O" name="OBJECT4" value="O"><label for="OBJECT_O">&nbsp;개인정보 제공에 동의합니다.</label>
								    </td>
								</tr>
							
						</tbody>
					</table>
				</div>
			</fieldset>
			
			<div class="img_box">
			    <img src="images/coupon.jpg" alt="이미지">
			</div>
		
		<h4 style="padding-top:30px;">문항 정보</h4>
		
		<fieldset>
				<legend>문항 정보</legend>
				<div class="com_table_input">
					<table summary="문항 정보 테이블">
					    
					    <colgroup>
					        <col width="15%">
					    </colgroup>
					    
					    <colgroup>
					        <col width="85%">
					    </colgroup>
					    
					    <tr>
					        <th scope="row" class="bor_top_style1">제목</th>
					        <td class="bor_top_style1">
					            공연은 만족스러웠습니까?
					        </td>
					    </tr>
					    
					    <tr>
					        <th scope="row">답변</th>
					        <td class="line_edit">
					             <input type="radio" id="OBJECT_AQQ" name="OBJECT21" value="AQ" >&nbsp;<label for="OBJECT_AQQ">매우만족</label><br>
								        <input type="radio" id="OBJECT_ARR" name="OBJECT21" value="AR" >&nbsp;<label for="OBJECT_ARR">만족</label><br>
								        <input type="radio" id="OBJECT_AS" name="OBJECT21" value="AS" >&nbsp;<label for="OBJECT_AS">보통</label><br>
								        <input type="radio" id="OBJECT_AT" name="OBJECT21" value="AT" >&nbsp;<label for="OBJECT_AT">불만족</label>
					        </td>
					    </tr>
					    
					    
					</table>
                </div>
        </fieldset>
        
        <h4>설문 종료</h4>
		
		<fieldset>
				<legend>설문 종료</legend>
				<div class="com_table_input">
					<table summary="설문 종료 테이블">
					    
					    <colgroup>
					        <col width="15%">
					    </colgroup>
					    
					    <colgroup>
					        <col width="85%">
					    </colgroup>
                   
                   <tr>
                       <th scope="row" class="bor_top_style1">설문 종료</th>
                       <td class="bor_top_style1">
                           설문 종료글이 노출됩니다. 블라블라~
                       </td>
                   </tr>
                   
                   <tr>
                       <th scope="row">경품 수령</th>
                       <td>
                           이름&#40;&emsp;&emsp;&emsp;&emsp;&emsp;&#41;&nbsp;/&nbsp;주소&#40;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&#41;&nbsp;/&nbsp;연락처&#40;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&#41;
                       </td>
                   </tr>
                   
                    </table>
                    </div>
        </fieldset>
        
        
		</div>
		
		<div class="txt-center pdt_25">
			<a href="#" class="btn-darkgray-14" onclick="window.close(); return false;">닫기</a>
		</div>
		
		</form>
	</div>
</div>



        
 
    



</body>
</html>
















