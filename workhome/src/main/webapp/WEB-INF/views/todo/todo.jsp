<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>AdminLTE 3 | Calendar</title>
<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback" />
<!-- Font Awesome -->
<link rel="stylesheet" href="${contextPath }/resources/plugins/fontawesome-free/css/all.min.css" />
<!-- Theme style -->
<link rel="stylesheet" href="${contextPath }/resources/dist/css/adminlte.min.css" />
<!-- myFullCalendar -->
<link rel="stylesheet" href='${contextPath }/resources/FullCalendar-Example-master/vendor/css/select2.min.css' />
<link rel="stylesheet" href='${contextPath }/resources/FullCalendar-Example-master/vendor/css/bootstrap-datetimepicker.min.css' />
<link rel="stylesheet" href="${contextPath }/resources/FullCalendar-Example-master/vendor/css/bootstrap.min.css?sb" />
<link rel="stylesheet" href="${contextPath }/resources/FullCalendar-Example-master/css/main.css">
<link rel="stylesheet" href="${contextPath }/resources/FullCalendar-Example-master/vendor/css/fullcalendar.min.css" />
<!-- myFullCalendar -->


<style>
/* select2 */
.select2-container--default .select2-selection--multiple .select2-selection__rendered .select2-search.select2-search--inline .select2-search__field
	{
	margin-top: 4px;
}

.select2-container--default .select2-selection--multiple .select2-selection__choice
	{
	background-color: limegreen;
	border: none;
}

.select2-container--default .select2-selection--multiple .select2-selection__choice__remove
	{
	color: black;
}

.select2-container--default .select2-results__option--highlighted[aria-selected]
	{
	background-color: #0074f0;
	color: #fff;
}

.btn-tool {
	position: relative;
	top: 12px;
}
/* select2 */
#space {
	height: 100px;
	background-color: #f4f6f9;
}

#eventModal {
	padding-right: 0px !important;
}

.modal-header .close {
	padding: 1rem;
	margin: -1rem -1rem -1rem auto;
	opacity: .5;
}
/* ?????? ????????? */
.modal {
	text-align: center;
}

.fc-title, .fc-time {
	font-size: 11.9px;
}

#eventModal {
	padding-bottom: 80px;
	padding-right: 0px;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
}
/* ?????? ????????? */
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

		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-8">
							<h1>?????? ??????</h1>
						</div>
						<div class="col-sm-4"></div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.container-fluid -->
			<!-- 			</section> -->

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-xs-3">
							<div class="card card-primary">

								<div class="card-header">
									<h3 class="card-title">??????</h3>

									<div class="card-tools">
										<button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
											<i class="fas fa-minus"></i>
										</button>
									</div>
								</div>
								<div class="card-body">
									<label for="calendar_view">????????????</label>
									<div class="form-group">
										<!-- 									<div class="col-lg-6"> -->
										<div class="input-group">
											<select class="filter" id="type_filter" multiple="multiple">
												<option value="??????">??????</option>
												<option value="??????">??????</option>
												<option value="??????">??????</option>
												<option value="??????">??????</option>
											</select>
										</div>
									</div>
									<!-- 									</div> -->
									<div class="form-group">

										<!-- 									<div class="col-lg-6"> -->
<!-- 										<label for="calendar_view">????????? </label> -->
										<div class="input-group">
											<input style="display:none;" class='filter' type="checkbox" value="${loginUser.empNo }" checked>
											<label class="checkbox-inline">
											<input class='filter' type="checkbox" value="true" checked>????????? ?????? ??????</label> 
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-9">
							<div class="card card-primary">
								<div id="loading"></div>
								<div id="calendar" class="fc fc-unthemed fc-ltr"></div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.filter panel -->

				<div class="container">
					<!-- ?????? ????????? ???????????? -->
					<div id="contextMenu" class="dropdown clearfix">
						<ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu" style="display: block; position: static; margin-bottom: 5px;">
							<li><a tabindex="-1" href="#">??????</a></li>
							<li><a tabindex="-1" href="#">??????</a></li>
							<li><a tabindex="-1" href="#">??????</a></li>
							<li><a tabindex="-1" href="#">??????</a></li>
							<li class="divider"></li>
							<li><a tabindex="-1" href="#" data-role="close">Close</a></li>
						</ul>
					</div>

					<!-- 					<div id="wrapper"> -->
					<!-- 						<div id="loading"></div> -->
					<!-- 					</div> -->


					<!-- ?????? ?????? MODAL -->
					<div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title"></h4>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">

									<div class="row">
										<div class="col-xs-12">
											<label class="col-xs-4" for="edit-allDay">????????????</label>
											<input class='allDayNewEvent' id="edit-allDay" type="checkbox">
											</label>
										</div>
									</div>
									
									<div class="row">
										<div class="col-xs-12">
											<label class="col-xs-4" for="edit-allDay">?????? ??????</label>
											<input class='allDayNewEvent' id="edit-share" type="checkbox">
											</label>
										</div>
									</div>

									<div class="row">
										<div class="col-xs-12">
											<label class="col-xs-4" for="edit-title">?????????</label>
											<input class="inputModal" type="text" name="edit-title" id="edit-title" required="required" />
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12">
											<label class="col-xs-4" for="edit-start">??????</label>
											<input class="inputModal" type="text" name="edit-start" id="edit-start" />
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12">
											<label class="col-xs-4" for="edit-end">???</label>
											<input class="inputModal" type="text" name="edit-end" id="edit-end" />
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12">
											<label class="col-xs-4" for="edit-type">??????</label> <select class="inputModal" type="text" name="edit-type" id="edit-type">
												<option value="??????">??????</option>
												<option value="??????">??????</option>
												<option value="??????">??????</option>
												<option value="??????">??????</option>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12">
											<label class="col-xs-4" for="edit-color">??????</label> <select class="inputModal" name="color" id="edit-color">
												<option value="#D25565" style="color: #D25565;">?????????</option>
												<option value="#9775fa" style="color: #9775fa;">?????????</option>
												<option value="#ffa94d" style="color: #ffa94d;">?????????</option>
												<option value="#74c0fc" style="color: #74c0fc;">?????????</option>
												<option value="#f06595" style="color: #f06595;">?????????</option>
												<option value="#63e6be" style="color: #63e6be;">?????????</option>
												<option value="#a9e34b" style="color: #a9e34b;">?????????</option>
												<option value="#4d638c" style="color: #4d638c;">??????</option>
												<option value="#495057" style="color: #495057;">?????????</option>
											</select>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12">
											<label class="col-xs-4" for="edit-desc">??????</label>
											<textarea rows="4" cols="50" class="inputModal" name="edit-desc" id="edit-desc"></textarea>
										</div>
									</div>
								</div>
								<div class="modal-footer modalBtnContainer-addEvent">
									<button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
									<button type="button" class="btn btn-primary" id="save-event">??????</button>
								</div>
								<div class="modal-footer modalBtnContainer-modifyEvent">
									<button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
									<button type="button" class="btn btn-danger" id="deleteEvent">??????</button>
									<button type="button" class="btn btn-primary" id="updateEvent">??????</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->


				</div>
			</section>
			<!-- /.content -->
		</div>
		<div id="space"></div>

		<!--       </footer> -->
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</div>

	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="${contextPath }/resources/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${contextPath }/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- jQuery UI -->
	<script src="${contextPath }/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${contextPath }/resources/dist/js/adminlte.min.js"></script>
	<!-- fullCalendar 2.2.5 -->
	<%-- 		<script src="${contextPath }/resources/plugins/moment/moment.min.js"></script> --%>
	<%-- 		<script src="${contextPath }/resources/plugins/fullcalendar/main.js"></script> --%>
	<!-- AdminLTE for demo purposes -->
	<script src="${contextPath }/resources/dist/js/demo.js"></script>
	<!-- Page specific script -->
	<script src="${contextPath }/resources/FullCalendar-Example-master/vendor/js/jquery.min.js"></script>
	<!--  -->
	<script src="${contextPath }/resources/FullCalendar-Example-master/vendor/js/moment.min.js"></script>
	<script src="${contextPath }/resources/FullCalendar-Example-master/vendor/js/fullcalendar.min.js"></script>
	<script src="${contextPath }/resources/FullCalendar-Example-master/vendor/js/ko.js"></script>
	<script src="${contextPath }/resources/FullCalendar-Example-master/vendor/js/select2.min.js"></script>
	<script src="${contextPath }/resources/FullCalendar-Example-master/vendor/js/bootstrap-datetimepicker.min.js"></script>
	<script src="${contextPath }/resources/FullCalendar-Example-master/js/main.js"></script>
	<script src="${contextPath }/resources/FullCalendar-Example-master/js/addEvent.js"></script>
	<script src="${contextPath }/resources/FullCalendar-Example-master/js/editEvent.js"></script>
	<script src="${contextPath }/resources/FullCalendar-Example-master/js/etcSetting.js"></script>
	<script src="${contextPath}/resources/FullCalendar-Example-master/vendor/js/bootstrap.min.js"></script>
</body>
</html>
