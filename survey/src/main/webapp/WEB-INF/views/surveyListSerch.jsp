<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>CRM_설문 관리_설문 이력 조회</title>
<link href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet">
<link href="css/sub.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/import.css">
<link rel="stylesheet" type="text/css" href="css/member.css">

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
<div id="wrap">
    
    <div class="skip_navigation"><a href="#contents_sub">본문 바로가기</a></div>
 
    
    <header>
        <div class="inner">

            <h1><a href="#"><img src="images/logo.png" alt="국립아시아문화전당_통합고객관리시스템"></a></h1>
            <h2 class="blind">주요메뉴</h2>
            <nav>
                <ul class="gnb">
                    <li class="main m1">
                    <a href="#"><img src="images/gnb1_off.png" alt="회원" ></a>
                        <div class="lnbbg  sub1-1">
                            <ul class="lnb">
                                <li><a href="#">회원현황</a></li>
                                <li><a href="#">그룹회원관리</a></li>
                                <li><a href="#">협력회원관리</a></li>
                                <li><a href="#">정책관리</a></li>
                                <li><a href="#">VOC관리</a></li>
                            </ul>
                        </div>
                    </li>
                    
                    <li class="main m2">
                    <a href="#"><img src="images/gnb2_now.png" alt="CRM" ></a>
                       <div class="lnbbg  sub2-1">
                            <ul class="lnb sub2-1_lnb">
                                <li><a href="#">타겟관리</a></li>
                                <li><a href="#">혜택관리</a></li>
                                <li><a href="#">캠페인관리</a></li>
                                <li><a href="#">설문관리</a></li>
                                <li><a href="#">서식관리</a></li>
                            </ul>
                        </div>
                    </li>
                    
                    <li class="main m3">
                    <a href="#"><img src="images/gnb3_off.png" alt="통계"></a>
                        <div class="lnbbg  sub3-1">
                            <ul class="lnb">
                                <li><a href="#">통합매출</a></li>
                                <li><a href="#">점유율</a></li>
                                <li><a href="#">회원통계분석</a></li>
                                <li><a href="#">회원매출통계분석</a></li>
                                <li><a href="#">웹로그분석</a></li>
                            </ul>
                        </div>
                    </li>
                    
                    <li class="main m4">
                    <a href="#"><img src="images/gnb4_off.png" alt="강좌"></a>
                        <div class="lnbbg  sub4-1">
                            <ul class="lnb">
                                <li><a href="#">강좌일정</a></li>
                                <li><a href="#">수강신청관리</a></li>
                                <li><a href="#">출석부/ 증빙자료</a></li>
                                <li><a href="#">강좌업무</a></li>
                                <li><a href="#">강사관리</a></li>
                                <li><a href="#">수강생 그룹관리</a></li>
                                <li><a href="#">기본정보 관리</a></li>
                            </ul>
                        </div>
                    </li>
                    
                    <li class="main m5">
                    <a href="#"><img src="images/gnb5_off.png" alt="대관"></a>
                        <div class="lnbbg  sub5-1">
                            <ul class="lnb sub5-1_lnb">
                                <li><a href="#">일일업무</a></li>
                                <li><a href="#">대관현황</a></li>
                                <li><a href="#">대관관리</a></li>
                                <li><a href="#">변경/  취소신청</a></li>
                                <li><a href="#">부대설비</a></li>
                                <li><a href="#">판매위탁 계약신청</a></li>
                                <li><a href="#">홈페이지 계약신청</a></li>
                                <li><a href="#">입장권 검인신청</a></li>
                                <li><a href="#">스텝회의</a></li>
                                <li><a href="#">출입증신청</a></li>
                            </ul>
                                
                                
                            <ul class="lnb sub5-1_lnb">    
                                <li><a href="#">현수막신청</a></li>
                                <li><a href="#">홈페이지 배너신청</a></li>
                                <li><a href="#">공연진행서</a></li>
                                <li><a href="#">보고서</a></li>
                                <li><a href="#">위탁판매</a></li>
                                <li><a href="#">티켓업무요청</a></li>
                                <li><a href="#">대관FAQ</a></li>
                                <li><a href="#">대관Q&amp;A</a></li>
                                <li><a href="#">기획사관리</a></li>
                                <li><a href="#">공연 티켓수표 집게</a></li>
                              </ul>  
                                
                            <ul class="lnb sub5-1_lnb">
                                <li><a href="#">공연장 근무일지</a></li>
                                <li><a href="#">관리메뉴</a></li>
                                <li><a href="#">티켓발권의뢰</a></li>
                            </ul>
                        </div>
                    </li>
                    
                    <li class="main m6"><a href="#"><img src="images/gnb6_off.png" alt="시스템관리" ></a>
                        <div class="lnbbg  sub6-1">
                            <ul class="lnb">
                                <li><a href="#">회사정보</a></li>
                                <li><a href="#">담당자관리</a></li>
                                <li><a href="#">시스템코드관리</a></li>
                                <li><a href="#">기본코드관리</a></li>
                                <li><a href="#">메뉴관리</a></li>
                                <li><a href="#">메뉴권한관리</a></li>
                                <li><a href="#">양식관리</a></li>
                                <li><a href="#">결제정보관리</a></li>
                                <li><a href="#">접속세션관리</a></li>
                                <li><a href="#">시스템 공지관리</a></li>
                                <li><a href="#">CMS환불 관리</a></li>
                            </ul>
                        </div>
                    
                    </li>
                </ul>
            </nav>
            
            <div class="topbox">
              <p><a href="#"  class="color_w"><strong>홍길동</strong>님<br>환영합니다.</a></p>
                <ul class="topgnb">
                    <li><a href="#" title="로그아웃"><img src="images/top_gnb1.png" alt="로그아웃"></a></li>
                    <li><a href="#" title="설정"><img src="images/top_gnb2.png" alt="설정"></a></li>
                </ul>
            </div>
        </div>
    </header>
    

    <div id="container">
       
            <div id="sidebar">
           <h2 id="crm">CRM</h2>
            <ul class="depth2">
               
                <li class="d2_title depth2_on">
                <a href="#">타겟관리</a>
                  <span class="ion-arrow-right-b"></span>    
                </li>
                
                <li class="d2_title">
                <a href="#">혜택관리</a>
                   <span class="ion-arrow-right-b"></span>

                </li>
                
                <li class="d2_title">
                <a href="#">캠페인관리</a>
                   <span class="ion-arrow-right-b"></span>

                </li>
                
                <li class="d2_title">
                <a href="#">설문관리</a>
                   <span class="ion-arrow-right-b"></span>

                </li>
                
                <li class="d2_title">
                <a href="#">서식관리</a>
                   <span class="ion-arrow-right-b"></span>
                    <ul class="depth3">
                        <li><a href="#">서식요청</a></li>
                        <li><a href="#">서식등록</a></li>
                    </ul>
                </li>
                
            </ul>
        </div>
        

        <div id="contents">
			
				
			<div class="title-area">
				<h3>설문 관리</h3>
			</div>

			<div class="mem_con" style="width:100%; border:0;">
            
                <table>
                    
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
                    
                    <tr>
        
                        <th scope="row">대상</th>
                        <td colspan="3" >
                        
                          <select class="mem_con input_select" style="width:20%;">
                          <option>전체</option>
                          <option>회원</option>
                          <option>비회원</option>
                          </select>
                        </td>
                    </tr>
                    
                    <tr>
                        <th scope="row">진행상태</th>
                        
                        <td>
                        
                        <select class="mem_con input_select" >
                          <option>설문전</option>
                          <option>설문중</option>
                          <option>설문완료</option>
                          <option>일시중지</option>
                          <option>취소</option>
                          </select>
                          
                          
                        </td>
                        
                        
                        <th scope="row">승인상태</th>
                        
                        <td>
                        
                        <select class="mem_con input_select" >
                          <option>승인대기</option>
                          <option>승인완료</option>
                          <option>반려</option>
                          <option>취소</option>
                          </select>
                          
                          
                        </td>
                        
                        
                        
                    </tr>
                    
                    
                    <tr>
                        
                        <th scope="row">기간</th>
                        <td colspan="3">
                            

						<span>
							
							<input type="text" id="TRAN_START_DATE_INPUT" name="TRAN_START_DATE_INPUT" value="2016-08-21" class="mem_con2" style="width:17%;" readonly />
							<a href="#" onclick="PopCalendar('TRAN_START_DATE_INPUT'); return false;"><img src="images/icon-calendar.png" /></a>
							
							~
							
							
							<input type="text" id="TRAN_END_DATE_INPUT" name="TRAN_END_DATE_INPUT" value="2016-08-21" class="mem_con2" style="width:17%;" readonly />
							<a href="#" onclick="PopCalendar('TRAN_END_DATE_INPUT'); return false;"><img src="images//icon-calendar.png" /></a>
						</span>
						
						</td>
                            
                        
                    </tr>
                    
                    <tr>
                        <th scope="row">검색</th>
                        
                        <td colspan="3">
                          <select class="mem_con input_select" style=" width:20%; margin-right:10px; " >
                          <option>제목</option>
                          <option>제목2</option>
                          <option>제목3</option>
                          </select>
                          
                          <input type="text" id="num" class="mem_con3 " placeholder="" >
                          
                        </td>
                        
                    </tr>
                    
                    
                </table>
                
                
            
                
            
              
                
                <div class="m1">
					<a href="#" class="btn-gray-bold wh" onclick="Search(); return false;">검색</a>
					</div>
					
			</div>
			
			
			<div class="com_table_board" style="padding-top:50px;">
				<div class="com_table_board-tit">
					<p class="com_table_board-txt">Total 418, Page 1 / 42</p>
					<div class="com_table_board-list">
						<select id="PAGE_SIZE_KIND" name="PAGE_SIZE_KIND" class="input_select" style="width:120px;" onchange="SetPageSize()">
							<option value="10" selected>10</option>
							<option value="20" >20</option>
							<option value="30" >30</option>
							<option value="40" >50</option>
							<option value="50" >100</option>
						</select>

						<a href="#" class="btn-gray-bold" onclick="Excel('Y'); return false;" style="background:#2377ce; border:1px solid #2377ce;">Excel</a>
						

					</div>

				<div class="com_table_board-table" style="overflow:visible; margin-top: 10px;">
					<table style="table-layout:fixed;" cellspacing="1" cellpadding="1" summary="결과 테이블" >
						<caption>결과 게시판</caption>
						<colgroup>
							<col width="5%"/>
							<col width="5%"/>
							<col width="5%"/>
							<col width="20%"/>
							<col width="10%" />
							<col width="15%"/>
							<col  width="5%"/>
							<col width="10%"/>
							<col  width="10%"/>
							
						</colgroup>
						<thead>
							<tr>
								
								<th><input type="checkbox" id="CHECK_FLAG" name="CHECK_FLAG" class="input_check" onclick="CheckAll(this)" /></th>
								<th>번호</th>
								<th>대상</th>
								<th>설문 제목</th>
								<th>설문 기간</th>
								<th>등록일</th>
								<th>진행상태</th>
								<th>승인상태</th>
								<th>결과보기</th>

							</tr>
						</thead>
						
						
						<tbody>

							<tr>
								<td>

									<!--<input type="hidden" id="MEMBER_NO_0" name="MEMBER_NO_0" value="80060917031000021147" />-->
									<input type="checkbox" id="survey0" name="SURVEY_0" value="Y" class="input_check" />

								</td>
								
								<td onclick="" >
								10
								</td>
								
								<td onclick="">전체</td>
								
								<td class="txtleft">
                                    <!--<span class="ion-arrow-down-b"></span>&nbsp;-->
								    <span class="line_execu">설문 제목이 출력됩니다.</span>
								    <!--&nbsp;<span class="new_box">New</span>-->
								</td>


								<td onclick="">2016-07-14 ~ 2016-07-30</td>
								
								<td onclick="">2016-07-14</td>
								
								
								<td onclick="">설문중</td>
                                
                                <td onclick="">승인완료</td>
                                <td onclick=""><a href="#" class="btn-pop" onclick=" ">설문통계</a></td>
								
							</tr>
							
							<tr>
								<td>

									<!--<input type="hidden" id="MEMBER_NO_0" name="MEMBER_NO_0" value="80060917031000021147" />-->
									<input type="checkbox" id="survey1" name="SURVEY_1" value="Y" class="input_check" />

								</td>
								
								<td onclick="" >
								9
								</td>
								
								<td onclick="">회원</td>
								
								<td class="txtleft">
                                    <!--<span class="ion-arrow-down-b"></span>&nbsp;-->
								    <span class="line_execu">설문 제목이 출력됩니다.</span>
								    &nbsp;<span class="new_box">New</span>
								</td>


								<td onclick="">2016-07-14 ~ 2016-07-30</td>
								
								<td onclick="">2016-07-14</td>
								
								
								<td onclick="">일시중지</td>
                                
                                <td onclick="">승인완료</td>
                                <td onclick=""><a href="#" class="btn-pop" onclick=" ">링크복사</a></td>
							</tr>
							
							<tr>
								<td>

									<!--<input type="hidden" id="MEMBER_NO_0" name="MEMBER_NO_0" value="80060917031000021147" />-->
									<input type="checkbox" id="survey2" name="SURVEY_2" value="Y" class="input_check" />

								</td>
								
								<td onclick="" >
								8
								</td>
								
								<td onclick="">전체</td>
								
								<td class="txtleft">
                                    <span class="ion-arrow-up-b"></span>&nbsp;
								    <span class="line_execu">설문 제목이 출력됩니다.</span>
								    <!--&nbsp;<span class="new_box">New</span>-->
								</td>


								<td onclick="">2016-07-14 ~ 2016-07-30</td>
								
								<td onclick="">2016-07-14</td>
								
								
								<td onclick="">설문전</td>
                                
                                <td onclick="">승인완료</td>
                                <td onclick=""><a href="#" class="btn-pop" onclick=" ">링크복사</a></td>
								
							</tr>
							
							<tr>
                                <td colspan="4" class="line_no pdl_125">- 설문 제목이 출력됩니다.</td>
                                <td colspan="2" class="line_no">홍길동 / 내용수정 / YYYY-MM-DD/HH:MM:SS</td>
                                <td class="line_no">일시정지</td>
                                <td colspan="2" class="line_no">승인완료</td>
							</tr>
							
							<tr>
                                <td colspan="4" class="line_no pdl_125">- 설문 제목이 출력됩니다.</td>
                                <td colspan="2" class="line_no">홍길동 / 내용수정 / YYYY-MM-DD/HH:MM:SS</td>
                                <td class="line_no">설문전</td>
                                <td colspan="2" class="line_no">반려</td>
							</tr>
							
							<tr>
                                <td colspan="4" class="pdl_125">- 설문 제목이 출력됩니다.</td>
                                <td colspan="2">홍길동 / 내용수정 / YYYY-MM-DD/HH:MM:SS</td>
                                <td>설문전</td>
                                <td colspan="2">승인대기</td>
							</tr>
							
							<tr>
								<td>

									<!--<input type="hidden" id="MEMBER_NO_0" name="MEMBER_NO_0" value="80060917031000021147" />-->
									<input type="checkbox" id="survey3" name="SURVEY_3" value="Y" class="input_check" />

								</td>
								
								<td onclick="" >
								7
								</td>
								
								<td onclick="">전체</td>
								
								<td class="txtleft">
                                    <!--<span class="ion-arrow-down-b"></span>&nbsp;-->
								    <span class="line_execu">설문 제목이 출력됩니다.</span>
								    <!--&nbsp;<span class="new_box">New</span>-->
								</td>


								<td onclick="">2016-07-14 ~ 2016-07-30</td>
								
								<td onclick="">2016-07-14</td>
								
								
								<td onclick="">취소</td>
                                
                                <td onclick="">반려</td>
                                <td onclick=""><a href="#" class="btn-pop" onclick=" ">링크복사</a></td>
								
							</tr>
							
							<tr class="ed_bg">
								<td>

									<!--<input type="hidden" id="MEMBER_NO_0" name="MEMBER_NO_0" value="80060917031000021147" />-->
									<input type="checkbox" id="survey4" name="SURVEY_4" value="Y" class="input_check" />

								</td>
								
								<td onclick="" >
								6
								</td>
								
								<td onclick="">회원</td>
								
								<td class="txtleft">
                                    <!--<span class="ion-arrow-down-b"></span>&nbsp;-->
								    <span class="line_execu">설문 제목이 출력됩니다.</span>
								    <!--&nbsp;<span class="new_box">New</span>-->
								</td>


								<td onclick="">2016-07-14 ~ 2016-07-30</td>
								
								<td onclick="">2016-07-14</td>
								
								
								<td onclick="">설문완료</td>
                                
                                <td onclick="">승인완료</td>
                                <td onclick=""><a href="#" class="btn-pop" onclick=" ">설문통계</a></td>
								
							</tr>
							
							<tr class="ed_bg">
								<td>

									<!--<input type="hidden" id="MEMBER_NO_0" name="MEMBER_NO_0" value="80060917031000021147" />-->
									<input type="checkbox" id="survey5" name="SURVEY_5" value="Y" class="input_check" />

								</td>
								
								<td onclick="" >
								5
								</td>
								
								<td onclick="">비회원</td>
								
								<td class="txtleft">
                                    <!--<span class="ion-arrow-down-b"></span>&nbsp;-->
								    <span class="line_execu">설문 제목이 출력됩니다.</span>
								    <!--&nbsp;<span class="new_box">New</span>-->
								</td>


								<td onclick="">2016-07-14 ~ 2016-07-30</td>
								
								<td onclick="">2016-07-14</td>
								
								
								<td onclick="">설문완료</td>
                                
                                <td onclick="">승인완료</td>
                                <td onclick=""><a href="#" class="btn-pop" onclick=" ">설문통계</a></td>
							</tr>
							
							<tr class="ed_bg">
								<td>

									<!--<input type="hidden" id="MEMBER_NO_0" name="MEMBER_NO_0" value="80060917031000021147" />-->
									<input type="checkbox" id="survey6" name="SURVEY_0" value="Y" class="input_check" />

								</td>
								
								<td onclick="" >
								4
								</td>
								
								<td onclick="">전체</td>
								
								<td class="txtleft">
                                    <!--<span class="ion-arrow-down-b"></span>&nbsp;-->
								    <span class="line_execu">설문 제목이 출력됩니다.</span>
								    <!--&nbsp;<span class="new_box">New</span>-->
								</td>


								<td onclick="">2016-07-14 ~ 2016-07-30</td>
								
								<td onclick="">2016-07-14</td>
								
								
								<td onclick="">설문완료</td>
                                
                                <td onclick="">승인완료</td>
                                <td onclick=""><a href="#" class="btn-pop" onclick=" ">설문통계</a></td>
							</tr>
							
							<tr class="ed_bg">
								<td>

									<!--<input type="hidden" id="MEMBER_NO_0" name="MEMBER_NO_0" value="80060917031000021147" />-->
									<input type="checkbox" id="survey7" name="SURVEY_7" value="Y" class="input_check" />

								</td>
								
								<td onclick="" >
								3
								</td>
								
								<td onclick="">회원</td>
								
								<td class="txtleft">
                                    <!--<span class="ion-arrow-down-b"></span>&nbsp;-->
								    <span class="line_execu">설문 제목이 출력됩니다.</span>
								    <!--&nbsp;<span class="new_box">New</span>-->
								</td>


								<td onclick="">2016-07-14 ~ 2016-07-30</td>
								
								<td onclick="">2016-07-14</td>
								
								
								<td onclick="">설문완료</td>
                                
                                <td onclick="">승인완료</td>
                                <td onclick=""><a href="#" class="btn-pop" onclick=" ">설문통계</a></td>
							</tr>
							
							<tr class="ed_bg">
								<td>

									<!--<input type="hidden" id="MEMBER_NO_0" name="MEMBER_NO_0" value="80060917031000021147" />-->
									<input type="checkbox" id="survey8" name="SURVEY_8" value="Y" class="input_check" />

								</td>
								
                                <td onclick="" >
								2
								</td>
								
								<td onclick="">비회원</td>
								
								<td class="txtleft">
                                    <!--<span class="ion-arrow-down-b"></span>&nbsp;-->
								    <span class="line_execu">설문 제목이 출력됩니다.</span>
								    <!--&nbsp;<span class="new_box">New</span>-->
								</td>


								<td onclick="">2016-07-14 ~ 2016-07-30</td>
								
								<td onclick="">2016-07-14</td>
								
								
								<td onclick="">설문완료</td>
                                
                                <td onclick="">승인완료</td>
                                <td onclick=""><a href="#" class="btn-pop" onclick=" ">설문통계</a></td>
							</tr>
							
							<tr class="ed_bg">
								<td>

									<!--<input type="hidden" id="MEMBER_NO_0" name="MEMBER_NO_0" value="80060917031000021147" />-->
									<input type="checkbox" id="survey9" name="SURVEY_9" value="Y" class="input_check" />

								</td>
								
								<td onclick="" >
								1
								</td>
								
								<td onclick="">전체</td>
								
								<td class="txtleft">
                                    <!--<span class="ion-arrow-down-b"></span>&nbsp;-->
								    <span class="line_execu">설문 제목이 출력됩니다.</span>
								    <!--&nbsp;<span class="new_box">New</span>-->
								</td>


								<td onclick="">2016-07-14 ~ 2016-07-30</td>
								
								<td onclick="">2016-07-14</td>
								
								
								<td onclick="">설문완료</td>
                                
                                <td onclick="">승인완료</td>
                                <td onclick=""><a href="#" class="btn-pop" onclick=" ">설문통계</a></td>
								
							</tr>
								
							
						</tbody>
					</table>
					
			
					
					<div class="com_table_board-no">
						<ul class="list_block">
						    <li><a href="#">처음</a></li>
						    <li><a href="#">이전</a></li>
						    <li style="background:gray;"><a href="#" >1</a></li>
						    <li><a href="#">2</a></li>
						    <li><a href="#">3</a></li>
						    <li><a href="#">4</a></li>
						    <li><a href="#">5</a></li>
						    <li><a href="#">6</a></li>
						    <li><a href="#">7</a></li>
						    <li><a href="#">8</a></li>
						    <li><a href="#">9</a></li>
						    <li><a href="#">10</a></li>
						    <li><a href="#">다음</a></li>
						    <li><a href="#">마지막</a></li>
						</ul>
					</div>
					
					<div class="pack_btnn2">
                        <a href="#" class="btn-gray-bold" onclick="Search(); return false;">삭제</a>

                        <a href="#" class="btn-gray-bold" onclick="Search(); return false;">등록</a>
                    </div>
				</div>
			</div>






		</div> <!-- contents -->

	</div> <!-- contents_sub -->


        
    </div> 
    
    <div id="footer">
        <p class="copyright">
            all rights reserved
        </p>
    </div>
    
  </div>



</body>
</html>
















