<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | Compose Message</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${contextPath}/resources/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${contextPath}/resources/dist/css/adminlte.min.css">
<!-- summernote -->
<link rel="stylesheet"
	href="${contextPath}/resources/plugins/summernote/summernote-bs4.min.css">

<style>

.thispage, .thispage b, .thispage i {
	color: #007bff;
}


.mailsubtitle-flex-container {
	display: flex;
	justify-content: space-between;
}

.mailsubtitle-right {
	width: 87%;
}

.mailsubtitle-left {
	height: calc(2.25rem + 2px);
	align-self: center;
}

#chart {
	height: 30px;
	margin-top: 4px;
	align-self: center;
	background-color: rgba(128, 128, 128, 0.11);
	border-color: rgba(0, 0, 0, 0.125);
}

.mail-icon {
	width: 20px;
}

.table-sm {
	/* 	border: 1px; solid; rgb(128, 128, 128); */
	width: 420.875px;
	border-radius: 4px;
	border: 1px solid rgb(222, 226, 230);
}

.table-sm th {
	background-color: rgb(248, 249, 250);
}

.table-sm td {
	align-items: center;
}
.mailSR-info {
	font-size: 14px;
	color: gray;
/* 	vertical-align: middle; */
}

#favorites-icon {
	font-size: 14px;
}

.mail-icon {
	width: 20px;
}

.thispage, .thispage b {
	color: #007bff;
}

.table td, .table th {
	padding: .25rem;
	vertical-align: middle;
}

.table-striped tbody tr:nth-of-type(odd) {
	background-color: rgba(0, 0, 0, 0);
}

.table-hover tbody tr:hover {
	background-color: rgba(0, 0, 0, .075)
}

.table td:nth-child(1) {
	width: 4%;
}

.table td:nth-child(2) {
	width: 8%;
}

.table td:nth-child(3) {
	width: 18%;
}

.table td:nth-child(4) {
	width: 50%;
}

.table td:nth-child(5) {
	text-align: right;
}

.table td:nth-child(6) {
	width: 12%;
	text-align: right;
}

.fa-star {
	margin-right: 8px;
}

.fa-paperclip {
	margin-left: 10px;
}

.mailbox-name a {
	margin-left: 20px;
	text-decoration: none;
}

td {
	height: 35px;
}

.pagination {
	margin-top: 10px;
	margin-bottom: 10px;
}

.mailNo-hidden {
	display: none;
	width: 0px;
}

.ui-autocomplete {
	max-height: 350px;
	overflow-y: auto;
	/* prevent horizontal scrollbar */
	overflow-x: hidden; -->
	border: 10px solid black;
}

.ui-autocomplete {
	position: absolute;
	top: 100%;
	left: 0;
	z-index: 1000;
	float: left;
	display: none;
	padding: 0;
	margin: 0;
	list-style: none;
	background-color: #ffffff;
	border-color: #ccc;
	border-color: rgba(0, 0, 0, 0.2);
	border-style: solid;
	border-width: 10px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
	-moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
	-webkit-background-clip: padding-box;
	-moz-background-clip: padding;
	background-clip: padding-box;
	*border-right-width: 2px;
	*border-bottom-width: 2px;
}

.ui-menu-item > a.ui-corner-all {
    display: block;
    clear: both;
    font-weight: normal;
    line-height: 18px;
    color: #555555;
    white-space: nowrap;
    text-decoration: none;
}


.ui-state-hover, .ui-state-active {
    color: #ffffff;
    text-decoration: none;
    border-radius: 0px;
    -webkit-border-radius: 0px;
    -moz-border-radius: 0px;
    background-image: none;
}

.ui-widget.ui-widget-content {
    border: 2px solid #c5c5c5;
    border-radius: 4px;
    width: 433px; !important;
}

.ui-menu-item .ui-menu-item-wrapper.ui-state-active {
	border: 2px solid #007BFF !important; 
    background: #007BFF !important;
    font-weight: bold !important;
    color: #ffffff !important;
} 


</style>

</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<jsp:include page="../common/header.jsp"></jsp:include>

		<!-- Main Sidebar Container -->
		<jsp:include page="../common/sidebar.jsp"></jsp:include>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>?????? ?????????</h1>
						</div>
						<div class="col-sm-6">
<!-- 							<ol class="breadcrumb float-sm-right"> -->
<!-- 								<li class="breadcrumb-item"><a href="#">Home</a></li> -->
<!-- 								<li class="breadcrumb-item active">Compose</li> -->
<!-- 							</ol> -->
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<jsp:include page="mailsidemenu.jsp"></jsp:include>
						
						<!-- /.col -->
						<div class="col-md-9">
							<div class="card card-primary card-outline">
								<div class="card-header">
									<h3 class="card-title">??? ?????? ??????</h3>
								</div>
								<!-- /.card-header -->
								<form method="post" id="form-mailsend"
									enctype="Multipart/form-data">
									<div class="card-body">
										<input type="hidden" value="${loginUser.empNo}"
											name="senderMailId" /> <input type="hidden"
											value="${loginUser.empName}" name=senderName /> <input
											type="hidden" value="${mail.mailNo}" name=mailNo />

										<div class="mailsubtitle-flex-container">
											<div class="mailsubtitle-left">
												<b>?????? ??????</b>
											</div>
											<div>
												<button type="button" class="btn btn-sm btn-primary"
													style="background-color: #007BFF" id="chart">?????????</button>
											</div>
											<div class="form-group mailsubtitle-right">
												<input type="email" id="email"
												  	class="form-control mail-subtitle" placeholder="?????? ???"
													name="receiveEmp" value="${mail.receiveEmp }">
											</div>
										</div>
										<div class="mailsubtitle-flex-container">
											<div class="mailsubtitle-left">
												<b>??????</b>
											</div>
											<div class="form-group mailsubtitle-right">
												<input class="form-control" placeholder="??????" name="etitle" id="title"
													value="${mail.etitle }">
											</div>
										</div>
										<div class="form-group">
											<textarea id="compose-textarea"
												class="form-control mail-subtitle" name="econtent">${mail.econtent }
					                 	   </textarea>
										</div>
										<div class="form-group">
											<div class="btn btn-default btn-file" id="btn-upload">
												<i class="fas fa-paperclip"> ?????? ?????? <input
													multiple="multiple" id="uploadfileinput" type="file"
													name="uploadFile"></i>
											</div>
										</div>
										<table class="table table-hover table-sm">
											<tr>
												<th colspan=2>????????? ??????</th>
											</tr>
											<c:forEach var="mF" items="${mail.mailFileList }">
												<c:if test="${!empty mF.mChangeName}">
													<tr>
														<td>${mF.mOriginalName }</td>
														<td><button type="button" id="${mF.mFileNo }"
																class="close">
																<span aria-hidden="true">??</span><span class="sr-only">Close</span>
															</button></td>
													</tr>
												</c:if>
												<c:if test="${empty mF.mChangeName}">
													<tr>
														<td>????????? ????????? ????????????.</td>
													</tr>
												</c:if>
											</c:forEach>
										</table>
									</div>
									<!-- /.card-body -->
									<div class="card-footer">
										<div class="float-right">
											<button type="submit" id="tmpInsert-btn"
												class="btn btn-default">
												<i class="fas fa-pencil-alt"></i> ?????? ??????
											</button>
											<button type="button" id="sendMail-btn"
												class="btn btn-primary">
												<i class="far fa-envelope"></i> ?????????
											</button>
										</div>
									<button onclick="location.href='javascript:history.back();'" type="reset" class="btn btn-default">
										<i class="fas fa-times"></i> ??????
									</button>
									</div>
								</form>
								<!-- /.card-footer -->
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<div class="float-right d-none d-sm-block">
				<b>Version</b> 3.1.0
			</div>
			<strong>Copyright &copy; 2014-2021 <a
				href="https://adminlte.io">AdminLTE.io</a>.
			</strong> All rights reserved.
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${contextPath}/resources/dist/js/adminlte.min.js"></script>
	<!-- Summernote -->
	<script
		src="${contextPath}/resources/plugins/summernote/summernote-bs4.min.js"></script>
	<script
		src="${contextPath}/resources/plugins/summernote/lang/summernote-ko-KR.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="${contextPath}/resources/dist/js/demo.js"></script>
	<!-- Page specific script -->
	<script>
		$(function() {
			//Add text editor
			$('#compose-textarea').summernote({
				lang : "ko-KR",
				height : 400,
			});

			$('.close').click(function() {
				if (!window.confirm("?????? ?????????????????????????")) {
					return;
				}
				var $tagId = $(this).attr('id');
				var $container = $(this).closest('tr');

				$.ajax({ // ?????? ??????
					url : 'fileDeleteAjax.mail',
					data : {
						mFileNo : $tagId
					},
					success : function(data) {
						console.log(data);

						if (data == 'success') {
							$container.hide();
						}
					}
				});
			});
			
			var empEmail;
			// ????????????
            $("#email").autocomplete({
                source : function( request, response ) {
                     $.ajax({
                            url: 'searchemp.mail',
                            dataType: "json",
                            data: {keyword: $('#email').val()},
                            success: function(data) {
                                //???????????? json ????????? response ??? ????????? ??????
                                console.log(data)
                                response(
                                    $.map(data, function(item) {    //json[i] ?????? ??? ????????? item .
                                        return {
                                            value: item.empName +" (" + item.empPosition +")",    //UI ?????? ???????????? ??????, ?????? ???????????? ?????? ??????
											test: item.empNo + "@workhome.com"
                                        }
                                    })
                                );
                            }
                       });
                    },    // source ??? ?????? ?????? ??????
                select : function(event, ui) {    //????????? ?????????
					console.log(ui.item.test);
                	console.log($('#email').val());
                	empEmail = ui.item.test;
                    
                },
                focus : function(event, ui) {    
                    return false;//?????? ?????? ??????????????? ?????????
                },
                minLength: 1,// ?????? ?????????
                autoFocus: true, //????????? ?????? ?????? ????????? ????????? false
                classes: {    
                    "ui-autocomplete": "highlight"
                },
                close : function(event){    //??????????????? ???????????? ??????
                	$('#email').val(empEmail);

                    console.log(event);
                }
            }).autocomplete( "instance" )._renderItem = function( ul, item ) {    // UI??? ???????????? ???????????? ??????
                  return $( "<li>" )    //?????? tag??? li??? ?????? ?????? 
                  .append("<div>" + item.value + "</div>")    //??????????????? ????????? ????????? HTML??? ????????? UI??? ????????? ???????????? ??????.
                  .appendTo( ul );
           }
		});
		
		
		$('#tmpInsert-btn').on("click", function() {
			$('#form-mailsend').attr("action", "tmpUpdate.mail").submit();
		});

		$('#sendMail-btn').on("click", function() {
			if (validate() != false) {
				$('#form-mailsend').attr("action", "mailInsert.mail").submit();
			}
		});

		function validate() {
			var email = document.getElementById('email').value;
			var title = document.getElementById('title').value;
			var content = document.getElementById('compose-textarea').value;

			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

			if (email == '' || email.length == 0) {
				alert('???????????? ??????????????????.');
				document.getElementById('email').focus();
				return false;
			} else if (title == '' || title.length == 0) {
				alert('????????? ??????????????????.');
				document.getElementById('title').focus();
				return false;
			} else if (content == '' || content.length == 0) {
				alert('????????? ??????????????????.')
				document.getElementById('compose-textarea').focus();
				return false;
			} else if (!regExp.test(email)) {
				alert('????????? ????????? ????????? ??????????????????.')
				document.getElementById('email').focus();
				return false;
			}
		}
	</script>
</body>
</html>
