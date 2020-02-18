<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<!-- saved from url=(0048)file:///C:/Users/Amireux/Desktop/p/z/Upload.html -->
<html lang="zh-cn" class=" no-touchevents no-touchevents no-touchevents"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<meta content="IE=edge" http-equiv="X-UA-Compatible">
	<meta content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no, width=device-width" name="viewport">
	<meta name="theme-color" content="#ff9800">

	<title>用户列表</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    
	<!-- css -->
	 
	<link href="./ppp_files/css/project.min_1.css" rel="stylesheet">
	<link href="./ppp_files/css/4b2aee0df8eb4132b76494c3afe100be.css" rel="stylesheet">
	<link href="https://fonts.loli.net/css?family=Material+Icons">
	<link href="./ppp_files/css/base.min_1.css" rel="stylesheet">
	<link href="./ppp_files/css/main.css" rel="stylesheet">
	<link href="./ppp_files/css/base1.css" rel="stylesheet">
	<link href="./ppp_files/css/bootstrap.min.css" rel="stylesheet">
	<!-- <link href="D:\vscode\css\info\reset.css" rel="stylesheet"> -->
	<link href="./ppp_files/css/page.css" rel="stylesheet">
	<link href="./ppp_files/css/icono.min.css" rel="stylesheet">
	
	

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
<style type="text/css">
	#table table {
		width: 100%;
		font-size: 14px;
		border: 1px solid #eee
	}
	
	#table {
		padding: 0 0px;
	}
	
	table thead th {
		background: #f5f5f5;
		padding: 10px;
		text-align: center;
	
	}
	
	table tbody td {
		padding: 10px;
		text-align: left;
		border-bottom: 1px solid #eee;
		border-right: 1px solid #eee;
		text-align: center;
	}
	
	table tbody td span {
		margin: 0 2px;
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
		margin: 5px 0;
		padding: 10px;
	}
	
	input {
		border: 1px solid #ccc;
		padding: 5px;
		border-radius: 3px;
		margin-left: 20px;
		margin-top: 5px;
	}
	
	button {
		background: #008cd5;
		border: 0;
		padding: 5px 16px;
		border-radius: 3px;
		color: #fff;
		margin-left: 30px;
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
		padding: 0px;
	}
	
	.content input {
		width: 270px;
		margin-bottom: 0px;
	}
</style>




</head>

<body class="page-orange">
	<header class="header header-orange header-transparent header-waterfall ui-header affix-top">
		<ul class="nav nav-list pull-left">
			<div>
				<!-- <a data-toggle="menu" href="#">
					<span><i class="icono-user"></i></span>

				</a> -->
			</div>
		</ul>

		<ul class="nav nav-list pull-right">
			<div class="dropdown margin-right">
				<a class="dropdown-toggle padding-left-no padding-right-no" data-toggle="dropdown" aria-expanded="false">
									<span class="access-hide">MrBrutalchiefs</span>
									<span><i class="icono-delicious"></i></span>


					</a>
					<ul class="dropdown-menu dropdown-menu-right">
						<li>
							<a class="padding-right-lg waves-attach waves-effect" href="file:///C:/Users/Amireux/Desktop/p/z/Upload.html#">  <span><i class="icono-list"></i></span>用户中心</a>
						</li>

						<li>
							<a class="padding-right-cd waves-attach waves-effect" href="file:///C:/Users/Amireux/Desktop/p/z/Upload.html#"><span><i class="icono-power"></i></span>退出</a>
						</li>
					</ul>
				
			</div>
		</ul>
	</header>
	
	<main class="content">

		<div class="content-header ui-content-header">
			<div class="container">
				<h1 class="content-heading">用户列表</h1>
			</div>
		</div>
			
		<div class="container">
			<section class="content-inner margin-top-no">
				<div class="ui-card-wrap">

					<div class="card" style="width:100%">
						<div class="card-main">
							<div class="card-inner margin-bottom-no">
							<p class="card-heading"> <span><i class="icono-user"></i></span></p>									 
	
								<div> 
									<div class="container" style="width:100%">
										
										<div id="table">
											<div class="add">
												<input type="text" style="width:20%" v-model="addDetail.number" name="number" value="" placeholder="学号" />
												<input type="text" style="width:20%" v-model="addDetail.user" name="user" value="" placeholder="姓名" />
												<input type="text" style="width:20%" v-model="addDetail.sex" name="sex" value="" placeholder="性别" />
												<input type="text" style="width:20%" v-model="addDetail.uclass" name="uclass" value="" placeholder="班级" />
												<input type="text" style="width:20%" v-model="addDetail.profess" name="profess" value="" placeholder="专业" />
												<input type="text" style="width:20%" v-model="addDetail.phone" name="phone" value="" placeholder="电话" />
												<input type="text" style="width:20%" v-model="addDetail.QQ" name="QQ" value="" placeholder="QQ" />
												<input type="text" style="width:20%" v-model="addDetail.email" name="email" value="" placeholder="邮箱" />
												
												<!-- <input type="date" v-model="addDetail.dates" name="date" value="" placeholder="发布时间" /> -->
												<button @click="adddetail">新增</button>
											</div>
											<table >
												<thead>
													<tr>
														<th>序号</th>
														<th>学号</th>
														<th>姓名</th>
														<th>性别</th>
														<th>班级</th>
														<th>专业</th>
														<th>电话</th>
														<th>QQ</th>
														<th>邮箱</th>
														<th>操作</th>
													</tr>
												</thead>
												<tbody>
													<tr v-for="(item,index) in newsList">
														<td width="5%">{{index+1}}</td>
														<td width="10%">{{item.number}}</td>
														<td width="10%">{{item.user}}</td>
														<td width="5%">{{item.sex}}</td>
														<td width="8%">{{item.uclass}}</td>
														<td width="12%">{{item.profess}}</td>
														<td width="13%">{{item.phone}}</td>
														<td width="10%">{{item.QQ}}</td>
														<td width="17%">{{item.email}}</td>
														<td width="10%"><span @click="deletelist(item.id,index)" class="delete">删除</span><span class="edit" @click="edit(item)">编辑</span></td>
													</tr>
												</tbody>
											</table>
											<div id="mask" v-if="editlist">
												<div class="mask">
													<div class="title">
														编辑
														<span @click="editlist=false">
															X
														</span>
													</div>
													<div class="content">
														<input style="width:48%; margin:7px 2px 3px" type="text" v-model="editDetail.number" name="number" value="" placeholder="学号" />
														<input style="width:48%; margin:7px 2px 3px" type="text" v-model="editDetail.user" name="user" value="" placeholder="姓名" />
														<input style="width:48%; margin:3px 2px" type="text" v-model="editDetail.sex" name="sex" value="" placeholder="性别" />
														<input style="width:48%; margin:3px 2px" type="text" v-model="editDetail.uclass" name="uclass" value="" placeholder="班级" />
														<input style="width:48%; margin:3px 2px" type="text" v-model="editDetail.profess" name="profess" value="" placeholder="专业" />
														<input style="width:48%; margin:3px 2px" type="text" v-model="editDetail.phone" name="phone" value="" placeholder="电话" />
														<input style="width:48%; margin:3px 2px" type="text" v-model="editDetail.QQ" name="QQ" value="" placeholder="QQ" />
														<input style="width:48%; margin:3px 2px" type="text" v-model="editDetail.email" name="email" value="" placeholder="邮箱" />
														<button @click="update"style="margin-left:73px; margin-top:10px">更新</button>
														<button @click="editlist=false">取消</button>
													</div>
												</div>
											</div>
										</div>
										  <div style="margin-top:50px;"> 
												<div><ul  style="margin-left: 280px" class="page" maxshowpageitem="5" pagelistcount="10"  id="page"></ul></div>
  
										  </div>

									</div>									
									
								</div>

				
			
		
	</main><span style="position: absolute; left: 0px; top: -20000px; padding: 0px; margin: 0px; border: none; white-space: pre; line-height: normal; font-family: Garamond; font-size: 20px; font-weight: normal; display: none;">Mpgyi</span>









	<!-- js -->
	<script src="./ppp_files/js/jquery.min.js"></script>
	 <script src="./ppp_files/js/jquery.validate.min.js"></script>
	<script src="./ppp_files/js/gt.js"></script>
    <script src="./ppp_files/js/canvas-nest.min.js"></script>

	<script src="./ppp_files/js/base.min.js"></script>
	<script src="./ppp_files/js/project.min.js"></script>
	<script src="./ppp_files/js/clipboard.min.js"></script>
	<script type="text/javascript" color="217,113,24" opacity="0.8" count="99" src="./ppp_files/js/canvas-nest.min.js"></script><canvas id="c_n7" width="1536" height="710" style="position: fixed; top: 0px; left: 0px; z-index: -1; opacity: 0.8;"></canvas><canvas id="c_n9" width="982" height="710" style="position: fixed; top: 0px; left: 0px; z-index: -1; opacity: 0.8;"></canvas>
     <script src="./ppp_files/js/bootstrap-datetimepicker.js"></script>
    <script src="./ppp_files/js/mains.js"></script>
    <!-- <script src="./ppp_files/js/jQuery-1.11.1.min.js"></script> -->
 <script src="./ppp_files/js/shake.js"></script>
   
      <script src="./ppp_files/js/vue.min.js"></script>
	  <script src="./ppp_files/js/page.js"></script>

<script>
	
    var app = new Vue({
				el: '#table',
				data: {
					addDetail: {},
					editlist: false,
					editDetail: {},
					newsList: [{
						number: '13443458',
						user: '周某',
						sex: '男',
						uclass: "4521",
						profess:"软件工程",
						phone:"12333333333",
						QQ:"2233211112",
						email:"123321231@qq.com",
						id: "45211546"
					}, {
						number: '134445658',
						user: '杨某',
						sex: '男',
						uclass: "4671",
						profess:"生物工程",
						phone:"13589699733",
						QQ:"2865357794",
						email:"1238765031@qq.com",
						id: "61341341"
					}, {
						
						id: "62451431"
					}, {
						
						id: "62345213"
					}, {
						
						id: "23322445"
					}],
					editid:''
				},
				mounted() {

				},
				methods: {

					//新增
					adddetail() {
						//这里的思路应该是把this.addDetail传给服务端，然后加载列表this.newsList
						//this.newsList.push(this.addDetail)
						this.newsList.push({
							number: this.addDetail.number,
							user: this.addDetail.user,
							sex: this.addDetail.sex,
							uclass:this.addDetail.uclass,
							profess: this.addDetail.profess,
							phone: this.addDetail.phone,
							QQ: this.addDetail.QQ,
						    email: this.addDetail.email,
							id:Math.floor(Math.random()*1000000+1)
						})

						//axios.post('url',this.addDetail).then((res) =>{
						//若返回正确结果，清空新增输入框的数据
						//this.addDetail.number = ""
						//this.addDetail.user = ""
						//this.addDetail.sex = ""
						//})

					},
					//删除
					deletelist(id, i) {
						this.newsList.splice(i, 1);
						//这边可以传id给服务端进行删除  ID = id
						//axios.get('url',{ID:id}).then((res) =>{
						//			加载列表				
						//})
					},
					//编辑
					edit(item) {
						console.log(item)
						this.editDetail = {
							number: item.number,
							user: item.user,
							sex: item.sex,
							uclass: item.uclass,
							profess: item.profess,
							phone: item.phone,
							QQ: item.QQ,
							email: item.email, 
							id: item.id
						}
						this.editlist = true
						this.editid = item.id
						
					},
					//确认更新
					update() {
						//编辑的话，也是传id去服务端
						//axios.get('url',{ID:id}).then((res) =>{
						//			加载列表				
						//})
						let _this= this
						for(let i = 0; i < _this.newsList.length; i++) {
							if(_this.newsList[i].id ==this.editid) {
								_this.newsList[i] = {
									number: _this.editDetail.number,
									user: _this.editDetail.user,
									sex: _this.editDetail.sex,
									uclass: _this.editDetail.uclass,
									profess: _this.editDetail.profess,
									phone: _this.editDetail.phone,
									QQ: _this.editDetail.QQ,
									email: _this.editDetail.email,
									id: this.editid
								}
								this.editlist = false
							}
						}
					}
				}
			})
</script>

<script type="text/javascript">
    function tt(dd){
        //alert(dd);
    }
    var GG = {
        "kk":function(mm){
            // alert(mm);
            //console.log("hellos");
            //window.location.href="test.html?page="+mm;
        }
    }
    $("#page").initPage(100,1,GG.kk);
    /*$("#page1").initPage(100,1,GG.kk);*/
</script>
	

</body></html>