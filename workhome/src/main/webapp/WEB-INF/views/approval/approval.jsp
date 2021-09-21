<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Dashboard 3</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="resources/plugins/fontawesome-free/css/all.min.css">
  <!-- IonIcons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="resources/dist/css/adminlte.min.css">
  
 <style>
  caption {
	caption-side: top;
	}
 </style>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- header -->
  <jsp:include page="../common/header.jsp"></jsp:include>
  <!-- /header -->
  
  <!-- sidebar -->
  <jsp:include page="../common/sidebar.jsp"></jsp:include>
  <!-- /sidebar -->
  
  <!-- 메인 컨텐츠 -->
  <div class="content-wrapper" align="center">
	<section class="content">
		<div class="container-fluid">
			 <!-- 타이틀 영역 -->
			 <br>
			<div class="d-sm-flex align-items-center justify-content-between mb-4 col-lg-9" style="margin-left: auto; margin-right: auto;" >
				<h1 class="h3 mb-0 text-gray-800" style="font-weight: bold;">전자결재</h1>
			</div>
			<div class="row">
				<div class="col-lg-9" style="margin-left: auto; margin-right: auto;">
					<div class="card shadow mb-4">
						<div class="card-header py-3">
				            <div class="nav-item dropdown no-arrow">
				              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="display: inline-block;">
				              	<i class="fa fa-plus-square-o text-gray-800 "></i>
				              </a>
				              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
				                <a class="dropdown-item" href="apporvalInsertView.ap">
				                  <i class="fas fa fa-file-text-o fa-sm fa-fw mr-2 text-gray-400 fa-fw"></i>기안하기
				                </a>
				                <div class="dropdown-divider"></div>
				                <a class="dropdown-item" href="apporvalInsertView.ap?tag=T">
				                  <i class="fas fa fa-user-o fa-sm fa-fw mr-2 text-gray-400 fa-fw"></i>근태신청
				                </a>
				              </div>
							<h6 class="m-0 font-weight-bold text-primary" style="display: inline-block; ">진행사항</h6>
				            </div>
						</div>
						<div class="card-body" style="clear: both;">
							<div class="row">
								<div class="col-lg-6">
									<table class="table table-bordered"  style="text-align: center;">
										<tr>
											<th colspan="2">결재 진행</th>
										</tr>
										<tr>
											<th>미결재 문서</th>
											<td class="aplist">
												<input type="hidden" class="tag" value="draft">
												<input type="hidden" class="map" value="${map['draft']}">
												${fn:length(draftList)} 건
											</td>
										</tr>
										<tr>
											<th>승인 문서</th>
											<td class="aplist">
												<input type="hidden" class="tag" value="approved">
												<input type="hidden" class="map" value="${map['approved']}">
												${fn:length(approvedList)} 건
											</td>
										</tr>
										<tr>
											<th>반려 문서</th>
											<td class="aplist">
												<input type="hidden" class="tag" value="rejected">
												<input type="hidden" class="map" value="${map['rejected']}">
												${fn:length(rejectedList)} 건
											</td>
										</tr>
										<tr>
											<th>종결 문서</th>
											<td class="aplist">
												<input type="hidden" class="tag" value="fin">
												<input type="hidden" class="map" value="${map['fin']}">
												${fn:length(finList)} 건
											</td>
										</tr>
									</table>
								</div>
								<div class="col-lg-6">
									<table class="table table-bordered"  style="text-align: center;">
										<tr>
											<th colspan="2">개인 문서함</th>
										</tr>
										<tr>
											<th>상신 문서</th>
											<td class="aplist">
												<input type="hidden" class="tag" value="myDraft">
												<input type="hidden" class="map" value="${map['myDraft']}">
												${fn:length(myDraftList)}  건
											</td>
										<tr>	
											<th>참조문서</th>
											<td class="aplist">
												<input type="hidden" class="tag" value="ref">
												<input type="hidden" class="map" value="${map['ref']}">
												${fn:length(refList)} 건
											</td>
										</tr>
										<tr>	
											<th>종결 문서</th>
											<td class="aplist">
												<input type="hidden" class="tag" value="myFinAp">
												<input type="hidden" class="map" value="${map['myFinAp']}">
												${fn:length(myFinApList)}  건
											</td>
										</tr>
										<tr>
											<th>반려 문서</th>
											<td class="aplist">
												<input type="hidden" class="tag" value="myRejectedDraft">
												<input type="hidden" class="map" value="${map['myRejectedDraft']}">
												${fn:length(myRejectedDraftList)} 건
											</td>
										</tr>
										<tr>
										</tr>
									</table>
									<script type="text/javascript">
									//목록 불러오는 script
										$(document).on('click',".aplist",function(){
											var tag = $(this).find('.tag').val();
											var map = $(this).find('.map').val();
											$.ajax({
												url:"aplist.ap",
												data:{map:map},
												dataType:"json",
												success:function(data){
													
												$area = $("#contentArea");	
												$area.html("");
												
												var $div = $("<div class='table-responsive'>");
												var $table =$('<table class="table table-bordered" style="text-align: center;">');
												var $thead=$("<thead>");
												var $tr1 = $("<tr>");
												var $th1 = $("<th>").text("품의 번호");
												var $th2 = $("<th>").text("문서 분류");
												var $th3 = $("<th>").text("제목");
												var $th4 = $("<th>").text("기안자");
												var $th5 = $("<th>").text("기안일");
												var $th6 = $("<th>").text("상태");
												var $tbody = $("<tbody>");
												var $caption = $("<caption>");
												
												if(tag=='myDraft'){
													$caption.text("● 기안문서 > 진행 문서");
												}else if(tag=='myFinAp'){
													$caption.text("● 기안문서 > 종결 문서");
												}else if(tag=='myRejectedDraft'){
													$caption.text("● 기안문서 > 반려 문서");
												}else if(tag=='draft'){
													$caption.text("● 결재문서 > 미결재 문서");
												}else if(tag=='approved'){
													$caption.text("● 결재문서 > 승인 문서");
												}else if(tag=='rejected'){
													$caption.text("● 결재문서 > 반려 문서");
												}else if(tag=='fin'){
													$caption.text("● 결재문서 > 종결 문서");
												}else if(tag=='ref'){
													$caption.text("● 결재문서 > 참조 문서");
												}
												
												
												if(data.length > 0){
													for(var i in data){
														var $tr = $("<tr>");
														var $td1 = $("<td>").text(data[i].apNo);
														var $td2 = $("<td>");
															if(data[i].a_v_first==null){
																$td2.text("일반결재");
															}else if(data[i].a_v_first!=null){
																$td2.text("근태결재");
															}
														var $td3 = $("<td class='detailView' style='cursor:pointer;'>").text(decodeURIComponent(data[i].apTitle.replace(/\+/g," ")));
														var $td4 = $("<td>").text(decodeURIComponent(data[i].empNo.replace(/\+/g," ")));
														var $td5 = $("<td>").text(data[i].apDate);
														var $td6 = $("<td>");
															if(data[i].apStatus=="Y"){
																if((data[i].hEmp)== null || (data[i].hEmp)==""){
																	if((data[i].approvalEmp).includes("-Y") ){
																		$td6.text("진행");
																	}else{
																		$td6.text("상신");
																	}
																}else{
																	if((data[i].hEmp).includes("-Y") || (data[i].approvalEmp).includes("-Y") ){
																		$td6.text("진행");
																	}else{
																		$td6.text("상신");
																	}
																}
															}else if(data[i].apStatus=="D"){
																$td6.text("종결");
															}else if(data[i].apStatus=="R"){
																$td6.text("중단-거부");
															}
														var $input1 =$("<input type='hidden' class='apNo'>").val(data[i].apNo);	
														var $input2 =$("<input type='hidden' class='tag'>").val(tag);	
														$td3.append($input1);
														$td3.append($input2);
														
														
														$tr.append($td1);
														$tr.append($td2);
														$tr.append($td3);
														$tr.append($td4);
														$tr.append($td5);
														$tr.append($td6);
														$tbody.append($tr);
													}
												}else{
													var $tr =$("<tr>");
													var $td = $("<td colspan='6'>").text("데이터가 없습니다.");
													$tr.append($td);
													$tbody.append($tr);
												}
																							
												$tr1.append($th1);
												$tr1.append($th2);
												$tr1.append($th3);
												$tr1.append($th4);
												$tr1.append($th5);
												$tr1.append($th6);
												
												$thead.append($tr1);
												$table.append($caption);
												$table.append($thead);
												$table.append($tbody);
												
												$div.append($table);
												$area.append($div);
												}
											});										
										});
									
										$(document).on('click',".detailView",function(){
											var apNo = $(this).find(".apNo").val();
											var tag = $(this).find(".tag").val();
											location.href="apDetail.ap?apNo="+apNo+"&tag="+tag;										
										});
									</script>
								</div>
							</div>
						</div>
					</div>
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">문서함</h6>
						</div>
						<div class="card-body" id="contentArea">
							<div class="table-responsive">
								<table class="table table-bordered" style="text-align: center;">
									<caption>● 결재 진행 > 미결재 문서</caption>
									<thead>
										<tr>
											<th>품의 번호</th>
											<th>문서 분류</th>
											<th>제목</th>
											<th>기안자</th>
											<th>기안일</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty draftList}">
											<tr>
												<td colspan="6">데이터가 없습니다.</td>
											</tr>
										</c:if>
										<c:if test="${!empty draftList}">
											<c:forEach var="ap" items="${draftList}">
												<tr>
													<td>${ap.apNo}</td>
													<c:if test="${empty ap.a_v_first}">
														<td>일반결재</td>
													</c:if>
													<c:if test="${!empty ap.a_v_first}">
														<td>근태결재</td>
													</c:if>
													<td>
														<c:url var="apDetail" value="apDetail.ap">
															<c:param name="apNo" value="${ap.apNo}"/>
															<c:param name="tag" value="draft"/>
														</c:url>
														<a href="${apDetail}">${ap.apTitle}</a>
													</td>
													<td>${ap.empNo}</td>
													<td>${ap.apDate}</td>
													<c:if test="${ap.apStatus eq 'Y'}">
														<c:set var="approvalEmp" value="${ap.approvalEmpStatus}"/>
														<c:set var="hEmp" value="${ap.hEmpStatus}"/>
														
														<c:if test="${fn:contains(hEmp, '-Y') or fn:contains(approvalEmp, '-Y')}">
															<td>진행</td>
														</c:if>
														<c:if test="${!fn:contains(hEmp, '-Y') and !fn:contains(approvalEmp, '-Y')}">
															<td>상신</td>
														</c:if>
													</c:if>
													<c:if test="${ap.apStatus eq 'D'}">
														<td>종결</td>
													</c:if>
													<c:if test="${ap.apStatus eq 'R'}">
														<td>거부</td>
													</c:if>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>

							<!-- 참조문서  -->
							<div class="table-responsive">
								<table class="table table-bordered" style="text-align: center;">
									<caption>● 참조문서함</caption>
									<thead>
										<tr>
											<th>품의 번호</th>
											<th>문서 분류</th>
											<th>제목</th>
											<th>기안자</th>
											<th>기안일</th>
											<th>상태</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${empty refList}">
											<tr>
												<td colspan="6">데이터가 없습니다.</td>
											</tr>
										</c:if>
										<c:if test="${!empty refList}">
											<c:forEach var="ap" items="${refList}">
												<tr>
													<td>${ap.apNo}</td>
													<c:if test="${empty ap.a_v_first}">
														<td>일반결재</td>
													</c:if>
													<c:if test="${!empty ap.a_v_first}">
														<td>근태결재</td>
													</c:if>
													<td>
														<c:url var="apDetail" value="apDetail.ap">
															<c:param name="apNo" value="${ap.apNo}"/>
															<c:param name="tag" value="ref"/>
														</c:url>
														<a href="${apDetail}">${ap.apTitle}</a>
													</td>
													<td>${ap.empNo}</td>
													<td>${ap.apDate}</td>
													<c:if test="${ap.apStatus eq 'Y'}">
														<c:set var="approvalEmp" value="${ap.approvalEmpStatus}"/>
														<c:set var="hEmp" value="${ap.hEmpStatus}"/>
														
														<c:if test="${fn:contains(hEmp, '-Y') or fn:contains(approvalEmp, '-Y')}">
															<td>진행</td>
														</c:if>
														<c:if test="${!fn:contains(hEmp, '-Y') and !fn:contains(approvalEmp, '-Y')}">
															<td>상신</td>
														</c:if>
													</c:if>
													<c:if test="${ap.apStatus eq 'D'}">
														<td>종결</td>
													</c:if>
													<c:if test="${ap.apStatus eq 'R'}">
														<td>거부</td>
													</c:if>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>	
</div>
  <!-- /메인 컨텐츠 -->
  
  <!-- footer -->
  <jsp:include page="../common/footer.jsp"></jsp:include>
  <!-- /footer -->
  
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->

<!-- jQuery -->
<script src="resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE -->
<script src="resources/dist/js/adminlte.js"></script>

<!-- OPTIONAL SCRIPTS -->
<script src="resources/plugins/chart.js/Chart.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="resources/dist/js/demo.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="resources/dist/js/pages/dashboard3.js"></script>
</body>
</html>
