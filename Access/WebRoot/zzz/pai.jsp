<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0112)file:///C:/Users/Amireux/AppData/Local/Temp/HZ$D.059.3742/HZ$D.059.3744/Html/www.mengdi.net.cn/user/useinfo.html -->
<html lang="zh-cn" class=" no-touchevents"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
	<meta name="theme-color" content="#ff9800">
	<title>获奖信息</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/bootstrap1.min.css"> 
    <link rel="stylesheet" href="css/bootstrap-table.min.css">


	<!-- css -->
	 
	<link href="css/project.min_1.css" rel="stylesheet">
	<link href="css/4b2aee0df8eb4132b76494c3afe100be.css" rel="stylesheet">
	<link href="https://fonts.loli.net/css?family=Material+Icons">
	<link href="css/base.min_1.css" rel="stylesheet">

	<link href="css/base1.css" rel="stylesheet">
	
    
	
	<!-- <link href="D:\vscode\css\info\reset.css" rel="stylesheet"> -->
    <!-- <link href="./Upload_files/css/icono.min.css" rel='stylesheet prefetch'> -->
	<style type="text/css">
		#table table {
			width: 100%;
			font-size: 14px;
			border: 1px solid #eee
		}
		
		#table {
			padding: 0 10px;
		}
		
		 /* table thead th {
			background: #f5f5f5;
			padding: 10px; 
			text-align: left;			
		}  */
		
		table tbody td {
			padding: 10px;
			text-align: left;
			border-bottom: 1px solid #eee;
			border-right: 1px solid #eee;
		}
		
		table tbody td span {
			margin: 0 10px;
			cursor: pointer;
		}
		
		.delete {
			color: red;
		}
		
		.edit {
			color: #008cd5;
		}
		
		.add {
			border: 1px solid #eee;
			margin: 10px 0;
			padding: 15px;
		}
		
		input {
			border: 1px solid #ccc;
			padding: 5px;
			border-radius: 3px;
			margin-right: 15px;
		}
		
		button {
			background: #008cd5;
			border: 0;
			padding: 4px 15px;
			border-radius: 3px;
			color: #fff;
		}
		
		#mask {
			background: rgba(0, 0, 0, .5);
			width: 100%;
			height: 100%;
			position: fixed;
			z-index: 4;
			top: 0;
			left: 0;
		}
		
		.mask {
			width: 300px;
			height: 250px;
			background: rgba(255, 255, 255, 1);
			position: absolute;
			left: 0;
			top: 0;
			right: 0;
			bottom: 0;
			margin: auto;
			z-index: 47;
			border-radius: 5px;
		}
		
		.title {
			padding: 10px;
			border-bottom: 1px solid #eee;
		}
		
		.title span {
			float: right;
			cursor: pointer;
		}
		
		.content {
			padding: 10px;
		}
		
		.content input {
			width: 270px;
			margin-bottom: 15px;
		}
	</style>

 <style>
    body {
        background: #eee;
    }

    @keyframes mysnow {
        0% {
            bottom: 100%;
            opacity: 0;
        }
        50% {
            opacity: 1;
            transform: rotate(1080deg);
        }
        100% {
            transform: rotate(0deg);
            opacity: 0;
            bottom: 0;
        }
    }

    @-webkit-keyframes mysnow {
        0% {
            bottom: 100%;
            opacity: 0;
        }
        50% {
            opacity: 1;
            -webkit-transform: rotate(1080deg);
        }
        100% {
            -webkit-transform: rotate(0deg);
            opacity: 0;
            bottom: 0;
        }
    }

    @-moz-keyframes mysnow {
        0% {
            bottom: 100%;
            opacity: 0;
        }
        50% {
            opacity: 1;
            -moz-transform: rotate(1080deg);
        }
        100% {
            -moz-transform: rotate(0deg);
            opacity: 0;
            bottom: 0;
        }
    }

    @-ms-keyframes mysnow {
        0% {
            bottom: 100%;
            opacity: 0;
        }
        50% {
            opacity: 1;
            -ms-transform: rotate(1080deg);
        }
        100% {
            -ms-transform: rotate(0deg);
            opacity: 0;
            bottom: 0;
        }
    }

    @-o-keyframes mysnow {
        0% {
            bottom: 100%;
            opacity: 0;
        }
        50% {
            opacity: 1;
            -o-transform: rotate(1080deg);
        }
        100% {
            -o-transform: rotate(0deg);
            opacity: 0;
            bottom: 0;
        }
    }

    .roll {
        position: absolute;
        opacity: 0;
        animation: mysnow 5s;
        -webkit-animation: mysnow 5s;
        -moz-animation: mysnow 5s;
        -ms-animation: mysnow 5s;
        -o-animation: mysnow 5s;
        height: 80px;
    }

    .div {
        position: fixed;
    }
    </style>



	<!-- favicon -->
	<!-- ... -->
	<style>
		.pagination {
			display:inline-block;
			padding-left:0;
			margin:20px 0;
			border-radius:4px
		}
		.pagination>li {
			display:inline
		}
		.pagination>li>a,.pagination>li>span {
			position:relative;
			float:left;
			padding:6px 12px;
			margin-left:-1px;
			line-height:1.42857143;
			color:#337ab7;
			text-decoration:none;
			background-color:#fff;
			border:1px solid #ddd
		}
		.pagination>li:first-child>a,.pagination>li:first-child>span {
			margin-left:0;
			border-top-left-radius:4px;
			border-bottom-left-radius:4px
		}
		.pagination>li:last-child>a,.pagination>li:last-child>span {
			border-top-right-radius:4px;
			border-bottom-right-radius:4px
		}
		.pagination>li>a:focus,.pagination>li>a:hover,.pagination>li>span:focus,.pagination>li>span:hover {
			color:#23527c;
			background-color:#eee;
			border-color:#ddd
		}
		.pagination>.active>a,.pagination>.active>a:focus,.pagination>.active>a:hover,.pagination>.active>span,.pagination>.active>span:focus,.pagination>.active>span:hover {
			z-index:2;
			color:#fff;
			cursor:default;
			background-color:#337ab7;
			border-color:#337ab7
		}
		.pagination>.disabled>a,.pagination>.disabled>a:focus,.pagination>.disabled>a:hover,.pagination>.disabled>span,.pagination>.disabled>span:focus,.pagination>.disabled>span:hover {
			color:#777;
			cursor:not-allowed;
			background-color:#fff;
			border-color:#ddd
		}
		.pagination-lg>li>a,.pagination-lg>li>span {
			padding:10px 16px;
			font-size:18px
		}
		.pagination-lg>li:first-child>a,.pagination-lg>li:first-child>span {
			border-top-left-radius:6px;
			border-bottom-left-radius:6px
		}
		.pagination-lg>li:last-child>a,.pagination-lg>li:last-child>span {
			border-top-right-radius:6px;
			border-bottom-right-radius:6px
		}
		.pagination-sm>li>a,.pagination-sm>li>span {
			padding:5px 10px;
			font-size:12px
		}
		.pagination-sm>li:first-child>a,.pagination-sm>li:first-child>span {
			border-top-left-radius:3px;
			border-bottom-left-radius:3px
		}
		.pagination-sm>li:last-child>a,.pagination-sm>li:last-child>span {
			border-top-right-radius:3px;
			border-bottom-right-radius:3px
		}
		.pager {
			padding-left:0;
			margin:20px 0;
			text-align:center;
			list-style:none
		}
		.pager li {
			display:inline
		}
		.pager li>a,.pager li>span {
			display:inline-block;
			padding:5px 14px;
			background-color:#fff;
			border:1px solid #ddd;
			border-radius:15px
		}
		.pager li>a:focus,.pager li>a:hover {
			text-decoration:none;
			background-color:#eee
		}
		.pager .next>a,.pager .next>span {
			float:right
		}
		.pager .previous>a,.pager .previous>span {
			float:left
		}
		.pager .disabled>a,.pager .disabled>a:focus,.pager .disabled>a:hover,.pager .disabled>span {
			color:#777;
			cursor:not-allowed;
			background-color:#fff
		}





		.pagination>li>a,
		.pagination>li>span {
		  border: 1px solid white;
		}
		.pagination>li.active>a {
		  background: #f50057;
		  color: #fff;
		}

		.pagination>li>a {
		  background: white;
		  color: #000;
		}


		.pagination > .active > a, .pagination > .active > a:focus, .pagination > .active > a:hover, .pagination > .active > span, .pagination > .active > span:focus, .pagination > .active > span:hover {
			color: #fff;
			background-color: #000;
			border-color: #000;
		}

		.pagination>.active>span {
		  background-color: #f50057;
		  color: #fff;
		  border-color: #fff;
		}



		.pagination > .disabled > span {
		  border-color: #fff;
		}


		pre {
			white-space: pre-wrap;
			word-wrap: break-word;
		}

		.progress-green .progress-bar {
			background-color: #f0231b;
		}

		.progress-green {
			background-color: #000;
		}

		.progress-green .progress-bar {
			background-color: #ff0a00;
		}

		.page-orange .ui-content-header {
			background-image: url(../images/amber.jpg);
		}

		.content-heading {
			font-weight: 300;
			color: #fff;
		}


	</style>




</head>

<body class="page-orange">
	<header class="header header-orange header-transparent header-waterfall ui-header affix-top">
		<ul class="nav nav-list pull-left">
			<div>
				<!-- <a data-toggle="menu" href="file:///C:/Users/Amireux/AppData/Local/Temp/HZ$D.059.3742/HZ$D.059.3744/Html/www.mengdi.net.cn/user/useinfo.html#ui_menu">
					<span class="icon icon-lg text-white">format_align_justify</span>
				</a> -->
			</div>
		</ul>

		<ul class="nav nav-list pull-right">
			<div class="dropdown margin-right">
				<a class="dropdown-toggle padding-left-no padding-right-no" data-toggle="dropdown" aria-expanded="false">
									<!-- <span class="access-hide">MrBrutalchiefs</span>
              	    <span class="icon icon-cd margin-right">account_circle</span> -->
					</a>
					<ul class="dropdown-menu dropdown-menu-right">
						<!-- <li>
							<a class="padding-right-lg waves-attach waves-effect" href="#"><span><i class="icono-list"></i></span>用户中心</a>
						</li>

						<li>
							<a class="padding-right-cd waves-attach waves-effect" href="#"><span class="icon icon-lg margin-right">exit_to_app</span>退出</a>
						</li> -->
					</ul>
				
			</div>
		</ul>
	</header>
	
	<main class="content" style="padding: 0;">

		<div class="content-header ui-content-header" style="height:250px">
			<div class="container">
				<h1 class="content-heading" style="margin-top:110px">获奖情况</h1>
			</div>
		</div>
			</div>
		
				<div class="ui-card-wrap" >

					

							<div class="card" style="width:75%; margin-left: auto; margin-right: auto ">
								<div class="card-main" >
									<div class="card-inner margin-bottom-no">
                                    <!-- <p class="card-heading"> <i class="icon icon-md">notifications_active</i>创建项目</p>									  -->
			
										<div> 
											<div class="container" style="width:75%">
												<div style="margin-top: 50px">
													<label>Cells: </label><input id="cells" type="text" placeholder="Cells" value="5">
													<label>Rows: </label><input id="rows" type="text" placeholder="Rows" value="100">
													<button id="build" class="btn btn-default">Build</button>
												</div>
												<table id="table"
													   data-toggle="table"
													   data-url="C:\Users\Amireux\Desktop\zzz\data\data1.json"
													   data-show-columns="true"
													   data-search="true"
													   data-show-refresh="true"
													   data-show-toggle="true"
													   data-pagination="true"
													   data-height="500">
													<thead >
													<tr >
														<th style="height:50px" data-field="id" data-formatter="idFormatter">序号</th>
														<th style="height:50px" data-field="name">获奖人</th>
														<th style="height:50px" data-field="price">获奖等级</th>
													</tr>
													</thead>
												</table>
											</div>									
											
										</div>
						            </div>
								</div>
							</div>
				</div>
		

				

					
	</main><span style="position: absolute; left: 0px; top: -20000px; padding: 0px; margin: 0px; border: none; white-space: pre; line-height: normal; font-family: Garamond; font-size: 20px; font-weight: normal; display: none;">Mpgyi</span>









	<!-- js -->
	
	<script src="js/canvasjs.min.js"></script>

	<script src="js/base.min.js"></script>

	
	<script type="text/javascript" color="217,113,24" opacity="0.8" count="99" src="js/canvas-nest.min.js"></script><canvas id="c_n9" width="982" height="710" style="position: fixed; top: 0px; left: 0px; z-index: -1; opacity: 0.8;"></canvas>
  

<script src="js/shake.js"></script>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- <script src="assets/bootstrap2.3/js/bootstrap.min.js"></script> -->
<script src="js/tableExport.js"></script>
<script src="js/jquery.base64.js"></script>
<script src="js/bootstrap-table.js"></script>
<script src="js/bootstrap-table-export.js"></script>
<script>
    $(function () {
        $('#build').click(build);//.trigger('click');
        $('#cells, #rows').keyup(function (e) {
            if (e.keyCode === 13) {
                build();
            }
        });
    });

    function build() {
        var cells = $('#cells').val(),
            rows = $('#rows').val(),
            i, j, row,
            columns = [],
            data = [];

        for (i = 0; i < cells; i++) {
            columns.push({
                field: 'field' + i,
                title: 'Cell' + i
            });
        }
        for (i = 0; i < rows; i++) {
            row = {};
            for (j = 0; j < cells; j++) {
                row['field' + j] = 'Row-' + i + '-' + j;
            }
            data.push(row);
        }
        $('#table').bootstrapTable('destroy').bootstrapTable({
            columns: columns,
            data: data
        });
    }

    function idFormatter(value) {
        return value + 100;
    }
</script>



</body></html>