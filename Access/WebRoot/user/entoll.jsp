<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<link rel="apple-touch-icon" sizes="76x76" href="<c:url value="/user/assets/img/apple-icon.png" />" />
	<link rel="icon" type="image/png" href="<c:url value="/user/assets/img/favicon.png" />" />
	<title>报名参赛</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

	<!-- CSS Files -->
    <link href="<c:url value="/user/assets/css/bootstrap.min.css" />" rel="stylesheet" />
	<link href="<c:url value="/user/assets/css/paper-bootstrap-wizard.css" />" rel="stylesheet" />

	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link href="<c:url value="/user/assets/css/demo.css" />" rel="stylesheet" />

	<!-- Fonts and Icons -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">
	<link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
	<link href="<c:url value="/user/assets/css/themify-icons.css" />" rel="stylesheet">
</head>

<body>
	<div class="image-container set-full-height" style="background-image: url('<c:url value="/user/assets/img/paper-2.jpeg" />')">
	    <!--   Creative Tim Branding   -->
	    <a href="<c:url value="/welcome.jsp" />">
	         <div class="logo-container">
	            <div class="logo">
	                <img src="<c:url value="/user/assets/img/new_logo.png" />">
	            </div>
	            <div class="brand">
	                欢迎报名
	            </div>
	        </div>
	    </a>

		<!--  Made With Paper Kit  -->
		<a href="#/paper-kit?ref=paper-bootstrap-wizard" class="made-with-pk">
			<div class="brand">滴滴</div>
			<div class="made-with">拿第一不过是 <strong>探囊取物</strong></div>
		</a>
		<div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="报名网站">报名网站</a></div>
	    <!--   Big container   -->
	    <div class="container">
	        <div class="row">
		        <div class="col-sm-8 col-sm-offset-2">

		            <!--      Wizard container        -->
		            <div class="wizard-container">
		                <div class="card wizard-card" data-color="green" id="wizard">
		                <form action="<c:url value='/TeamServlet'/>"  method="post">
		                <input type="hidden" name="method" value="add" />
		                <input type="hidden" name="gid" value="${gameInfo.id }" />

		                    	<div class="wizard-header">
		                        	<h3 class="wizard-title">写下你的信息</h3>
		                        	<p class="category">这些信息将帮助我们通知你比赛和存档你的信息</p>
		                    	</div>
								<div class="wizard-navigation">
									<div class="progress-with-circle">
									    <div class="progress-bar" role="progressbar" aria-valuenow="1" aria-valuemin="1" aria-valuemax="4" style="width: 15%;"></div>
									</div>
									<ul>
			                            <li>
											<a href="#location" data-toggle="tab">
												<div class="icon-circle">
													<i class="ti-map"></i>
												</div>
												基本信息
											</a>
										</li>
			                            <li>
											<a href="#type" data-toggle="tab">
												<div class="icon-circle">
													<i class="ti-direction-alt"></i>
												</div>
												项目类型
											</a>
										</li>
			                            <li>
											<a href="#facilities" data-toggle="tab">
												<div class="icon-circle">
													<i class="ti-panel"></i>
												</div>
												组员信息
											</a>
										</li>
			                            <li>
											<a href="#description" data-toggle="tab">
												<div class="icon-circle">
													<i class="ti-comments"></i>
												</div>
												提点小建议
											</a>
										</li>
			                        </ul>
								</div>
		                        <div class="tab-content">
		                            <div class="tab-pane" id="location">
		                            	<div class="row">
		                                	<div class="col-sm-12">
		                                    	<h5 class="info-text"> Let's start with the basic information</h5>
		                            		</div>
		                                	<div class="col-sm-5 col-sm-offset-1">
		                                    	<div class="form-group">
		                                        	<label>姓名</label>
		                                        	<input type="text" class="form-control" name="name" id="name" placeholder="姓名" value="${sessionUser.name }">
		                                    	</div>
		                                	</div>
		                                	<div class="col-sm-5">
		                                    	<div class="form-group">
		                                            <label>学号</label><br>
		                                            <input type="text" class="form-control" name="fid" id="id" placeholder="学号" value="${sessionUser.id }">
		                                        </div>
		                                	</div>
		                                	
		                            	</div>
		                            </div>
		                            <div class="tab-pane" id="type">
		                                <h5 class="info-text">你想参加哪种比赛？ </h5>
		                                <div class="row">
		                                	<div class="col-sm-10 col-sm-offset-1">
		                                    	<div class="form-group">
		                                        	<label>组别</label>
		                                        	<select class="form-control" name="kind">
			                                            <option disabled="" selected="">- 组别 -</option>
			                                            <option>大一组</option>
			                                            <option>大二/大三组 </option>
		                                        	</select>
		                                    	</div>
		                                	</div>
		                                </div>
		                                <div class="row">
		                                    <div class="col-sm-8 col-sm-offset-2">
		                                        <div class="col-sm-4 col-sm-offset-2">
													<div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="category" value="算法">
		                                                <div class="card card-checkboxes card-hover-effect">
		                                                    <i class="ti-home"></i>
															<p>算法</p>
		                                                </div>
		                                            </div>
		                                        </div>
		                                        <div class="col-sm-4">
													<div class="choice" data-toggle="wizard-checkbox">
		                                                <input type="checkbox" name="category" value="项目开发">
		                                                <div class="card card-checkboxes card-hover-effect">
		                                                    <i class="ti-package"></i>
															<p>项目开发</p>
		                                                </div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                            <div class="tab-pane" id="facilities">
		                                <h5 class="info-text">Tell us more about your partners </h5>
		                                <div class="row">
		                                    <div class="col-sm-5 col-sm-offset-1">
		                                    	<div class="form-group">
		                                        	<label>组员1姓名</label>
		                                        	<input type="text" name="name1" class="form-control valid" id="name1" placeholder="组员1姓名" aria-invalid="false">
		                                    	</div>
		                                    </div>
		                                    <div class="col-sm-5">
		                                    	<div class="form-group">
		                                        	<label>组员2姓名</label>
		                                        	<input type="text" name="name2" class="form-control valid" id="name2" placeholder="组员2姓名" aria-invalid="false">
		                                    	</div>
		                                    </div>
		                                    <div class="col-sm-5 col-sm-offset-1">
		                                    	<div class="form-group">
		                                        	<label>组员1学号</label>
		                                        	<input type="text" name="sid" class="form-control valid" id="id1" placeholder="组员1学号" aria-invalid="false">
		                                    	</div>
		                                    </div>
		                                    <div class="col-sm-5">
		                                    	<div class="form-group">
		                                        	<label>组员2学号</label>
		                                        	<input type="text" name="tid" class="form-control valid" id="id2" placeholder="组员2学号" aria-invalid="false">
		                                    	</div>
		                                    </div>
		                                    <div class="col-sm-5 col-sm-offset-1">
		                                    	<div class="form-group">
		                                        	<label>组员3姓名</label>
		                                        	<input type="text" name="name3" class="form-control valid" id="name3" placeholder="组员3姓名" aria-invalid="false">
		                                    	</div>
		                                    </div>
		                                    <div class="col-sm-5">
		                                    	<div class="form-group">
		                                        	<label>组员4姓名</label>
		                                        	<input type="text" name="name4" class="form-control valid" id="name4" placeholder="组员4姓名" aria-invalid="false">
		                                    	</div>
		                                    </div>
		                                    <div class="col-sm-5 col-sm-offset-1">
		                                    	<div class="form-group">
		                                        	<label>组员3学号</label>
		                                        	<input type="text" name="foid" class="form-control valid" id="id3" placeholder="组员3学号" aria-invalid="false">
		                                    	</div>
		                                    </div>
		                                    <div class="col-sm-5">
		                                    	<div class="form-group">
		                                        	<label>组员4学号</label>
		                                        	<input type="text" name="fiid" class="form-control valid" id="id4" placeholder="组员4学号" aria-invalid="false">
		                                    	</div>
		                                    </div>
		                                    <c:if test="${not empty requestScope.msg}">
		                                    	<script type="text/javascript">
		                                    		window.onload=function(){
												            alert("${msg}");
												    }
		                                    	</script>
		                                    </c:if>
		                                </div>
		                            </div>
		                            <div class="tab-pane" id="description">
		                                <div class="row">
		                                    <h5 class="info-text"> Drop us a small description. </h5>
		                                    <div class="col-sm-6 col-sm-offset-1">
		                                        <div class="form-group">
		                                            <label>写下一点建议吧~</label>
		                                            <textarea class="form-control" placeholder="" rows="9"></textarea>
		                                        </div>
		                                    </div>
		                                    <div class="col-sm-4">
		                                        <div class="form-group">
		                                            <label>例如</label>
		                                            <p class="description">"主页不够炫酷？网站速度不够快？前端小姐姐不够美？"</p>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="wizard-footer">
	                            	<div class="pull-right">
	                                    <input type='button' class='btn btn-next btn-fill btn-success btn-wd' name='next' value='Next' />
	                                    <input type='submit' class='btn btn-finish btn-fill btn-success btn-wd'/>
									</div>

	                                <div class="pull-left">
	                                    <input type='button' class='btn btn-previous btn-default btn-wd' name='previous' value='Previous' />
	                                </div>
	                                <div class="clearfix"></div>
		                        </div>
		                    </form>
		                </div>
		            </div> <!-- wizard container -->
		        </div>
	        </div> <!-- row -->
	    </div> <!--  big container -->

	    <div class="footer">
	      
	    </div>
	</div>

</body>

	<!--   Core JS Files   -->
	<script src="<c:url value="/user/assets/js/jquery-2.2.4.min.js" />" type="text/javascript"></script>
	<script src="<c:url value="/user/assets/js/bootstrap.min.js" />" type="text/javascript"></script>
	<script src="<c:url value="/user/assets/js/jquery.bootstrap.wizard.js" />" type="text/javascript"></script>

	<!--  Plugin for the Wizard -->
	<script src="<c:url value="/user/assets/js/paper-bootstrap-wizard.js" />" type="text/javascript"></script>

	<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
	<script src="<c:url value="/user/assets/js/jquery.validate.min.js" />" type="text/javascript"></script>

</html>