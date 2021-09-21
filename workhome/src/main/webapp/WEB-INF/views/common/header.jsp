<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WorkHome</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
	.mail_Area, .A_area{
		font-size:14px;
	}
	.deleteOneA{
		/* display:none */;
		position: absolute;
		right: 10px;
		font-size:1rem;
		cursor:pointer;
		color:rgb(150,150,150);
		vertical-align: middle;
		z-index: 999;
	}
	.goDetail{
		cursor: pointer;
	}
</style>
</head>

<body class="hold-transition sidebar-mini">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
    </ul>
    
    <button type="button" class="btn btn-primary " onclick="location.href='logout.emp'">로그아웃</button>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
      <li class="nav-item">
        <a class="nav-link" data-widget="navbar-search" href="#" role="button">
          <i class="fas fa-search"></i>
        </a>
        <div class="navbar-search-block">
          <form class="form-inline">
            <div class="input-group input-group-sm">
              <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
              <div class="input-group-append">
                <button class="btn btn-navbar" type="submit">
                  <i class="fas fa-search"></i>
                </button>
                <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                  <i class="fas fa-times"></i>
                </button>
              </div>
            </div>
          </form>
        </div>
      </li>

	 <!-- Alerts -->
     <!-- 전체 알림 -->
      <li class="nav-item dropdown no-arrow mx-1">
         <a class="nav-link" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="far fa-bell"></i>
            <span class="badge badge-warning navbar-badge" id="aCount"></span>
         </a>
         <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right" >
            <h6 class="dropdown-header">
                  	새로운 알림
              <span id="NotmailAllDelete" style="float: right; cursor: pointer;"><i class="fas fa-trash-alt"></i></span>
            </h6>
            <div class="A_area">
                
            </div>
         </div>
        </li>
            	
        <!-- 메일 알림  -->
      <li class="nav-item dropdown no-arrow mx-1">
         <a class="nav-link" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	         <i class="fas fa-envelope fa-fw"></i>
	         <span class="badge badge-warning navbar-badge" id="mCount"></span>
         </a>
         <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
            <h6 class="dropdown-header">
           	새로운 메일
            <span id="mailAllDelete" style="float: right; cursor: pointer;"><i class="fas fa-trash-alt"></i></span>
            </h6>
            <div class="mailA_area">
               
           </div>
         </div>
      </li> 
     <!-- ./Alerts -->
     
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
    </ul>
  </nav>
  <!-- /.navbar -->

<script>
/******************** 알림 *******************/
	$(function() {
		alertList();
	
		setInterval(function() {
			alertList();
		}, 10000);
	});
	
	function alertList() {
		
		$.ajax({
			url : "selectAlertList.emp",
			dataType:"json",
			success : function(data) {
				
				$(".A_area").html("");
				$(".mailA_area").html("");
				var aCount = 0;
				var mCount = 0;

				for(var i in data){
				var $area;
				var $a = $('<a class="dropdown-item d-flex align-items-center oneAlert" style="clear: both;">');
				var $input = $('<input type="hidden" class="link">');
				var $input1 = $('<input type="hidden" class="alertNo">');
				var $deleteSpan = $('<span class="deleteOneA">').text("x");
				var $div1 = $('<div>');
				var $div1_1 = $('<div>');
				var $i;
				var $div2 = $("<div>");
				var $div2_1 = $('<div class="small text-gray-500">');
				var $span = $('<span class="goDetail" style="font-weight:bold; font-size:12px">');
					$input1.val(data[i].ALERTNO);
					if(data[i].ATYPE == "mail"){
						$area = $(".mailA_area");
						$input.val("readmail.mail?mId="+data[i].DOCNO);
						$i = '<i class="fas fa-envelope"></i>';
						mCount++;
					}else if(data[i].ATYPE != "mail"){
						$area = $(".A_area");
						
						if(data[i].ATYPE == 'ap'){
							$input.val("apDetail.ap?apNo="+data[i].DOCNO);
							$i = '<i class="fas fa-flag"></i>'
							
						} else if(data[i].ATYPE == 'meeting') {
							$input.val("rList.meet");
							$i = '<i class="fas fa-handshake"></i>'
							
						} else if(data[i].ATYPE == 'no'){
							$input.val("ndetail.no");
							$i = '<i class="fas fa-flag"></i>'
						}
						aCount++;
					}
					
					$div1_1.append($i + '&nbsp; &nbsp; '); 
					$div1.append($div1_1);
					$div2_1.html(data[i].CREATEDATE);
					$div2.append($div2_1);
					$span.html(decodeURIComponent(data[i].ACONTENTS.replaceAll('+', ' '))+'&nbsp; &nbsp; &nbsp;');
					$div2.append($span);
					
					$a.append($input1);
					$a.append($input);
					$a.append($div1);
					$a.append($div2);	
					$a.append($deleteSpan);
					$area.append($a);
				}
				$("#aCount").text(aCount);
				$("#mCount").text(mCount);
				
				if(mCount==0){
					$("#mCount").hide();
					$("#mailAllDelete").hide();
					$(".mailA_area").text("확인된 알림이 없습니다.").css({'text-align':'center', 'padding':'1rem'});
				}else{
					$("#mCount").show();
					$("#mailAllDelete").show();
					$(".mailA_area").css({'text-align':'left', 'padding':'0'});
				}
				if(aCount==0){
					$("#aCount").hide();
					$("#NotmailAllDelete").hide();
					$(".A_area").text("확인된 알림이 없습니다.").css({'text-align':'center', 'padding':'1rem'});
				}else{
					$("#aCount").show();
					$("#NotmailAllDelete").show();
					$(".A_area").css({'text-align':'left', 'padding':'0'});
				}
			},
			error : function(){
				console.log("error");
				}
		});
	}
	
	$(document).on('click','.goDetail',function(){
		var link = $(this).closest('a').find('.link').val();
		var alertNo = $(this).closest('a').find('.alertNo').val();
		
		deleteAlert(alertNo);
		location.href=link;
	});
	
	$(document).on('click','.deleteOneA', function(){
		var alertNo = $(this).closest('a').find('.alertNo').val();
		deleteAlert(alertNo);
	});
	
	function deleteAlert(alertNo){
		$.ajax({
			url:"deleteAlert.emp",
			type:"post",
			data:{alertNo:alertNo},
			success:function(data){
				if(data=="success"){
					alertList();
				} else {
					alert("상태 업데이트에 실패하였습니다.\n잠시 후 다시 시도해 주세요!");
				}
			}
		});
	}

	// 전체 알림 삭제 (메일 외)
	$(document).on('click','#NotmailAllDelete',function(){
		var aType = "notMail";
		deletAllAlerts(aType);
	});
	
	//전체 알림 삭제 (메일만)
	$(document).on('click','#mailAllDelete',function(){
		var aType = "mail";
		deletAllAlerts(aType);
	});
	
	function deletAllAlerts(aType){
		$.ajax({
			url:"deletAllAlerts.emp",
			type:"post",
			data:{empNo : '${loginUser.empNo}', aType : aType},
			success:function(data){
				if(data=="success"){
					alertList();
				}else{
					alert("알림 전체 삭제에 실패하였습니다.\n잠시후에 다시 시도해주세요!");
				}
			}
		});
	}
</script>

</body>
</html>
