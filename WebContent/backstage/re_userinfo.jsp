<%@ page language="java" contentType="text/html;	charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx1" value="${pageContext.request.contextPath}"></c:set>
<c:set var="ctx" value="${pageContext.request.contextPath}/backstage"></c:set>
<!doctype html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>新闻天下发布系统</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png" href="${ctx}/assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed" href="${ctx}/assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="${ctx}/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="${ctx}/assets/css/admin.css">
<link rel="stylesheet" href="${ctx}/assets/css/app.css">
<link rel="stylesheet" href="${ctx}/assets/css/jquery.Jcrop.min.css">
<link rel="stylesheet" href="${ctx}/assets/css/mystyle.css">
<link rel="stylesheet" href="${ctx}/assets/css/xcConfirm.css">
<script src="${ctx}/assets/js/echarts.min.js"></script>
</head>

<body data-type="index">


	<header class="am-topbar am-topbar-inverse admin-header">
		<div class="am-topbar-brand">
			<a href="javascript:;" class="tpl-logo"> <img src="${ctx}/assets/img/logo.png" alt="">
			</a>
		</div>
		<div class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right"></div>

		<button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}">
			<span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span>
		</button>

		<div class="am-collapse am-topbar-collapse" id="topbar-collapse">

			<ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">
		
				<li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen" class="tpl-header-list-link"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>

				<li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle><a href="userinfo.jsp"> <span class="tpl-header-list-user-nick">${bloginUser.loginName}</span><span class="tpl-header-list-user-ico"> <img src="${ctx1}/imgUp/${bloginUser.userInfo.headUrl}"></span>
				</a></li>
				<li><a href="${ctx1}/backstage/logOut" class="tpl-header-list-link"> <span class="am-icon-sign-out tpl-header-list-ico-out-size"></span>
				</a></li>
			</ul>
		</div>
	</header>
	<div class="tpl-page-container tpl-page-header-fixed">
		<div class="tpl-left-nav tpl-left-nav-hover">
			<!-- 列表 -->
			<div class="tpl-left-nav-list">
				<ul class="tpl-left-nav-menu">
					<li class="tpl-left-nav-item"><a href="${ctx1}/backstage/indexs" class="nav-link"> <i class="am-icon-home"></i> <span>首页</span>
					</a></li>
					<li class="tpl-left-nav-item"><a href="${ctx}/add_news.jsp" class="nav-link  tpl-left-nav-link-list"> <i class="am-icon-pencil-square"></i> <span>添加新文章</span>
					</a></li>
					<li class="tpl-left-nav-item"><a href="${ctx1}/backstage/notice" class="nav-link  tpl-left-nav-link-list"> <i class="am-icon-bell"></i> <span>通知管理</span> 
					</a></li>
					<li class="tpl-left-nav-item"><a href="${ctx1}/backstage/draft/list" class="nav-link  tpl-left-nav-link-list"> <i class="am-icon-inbox"></i> <span>草稿箱</span>
					</a></li>
					<li class="tpl-left-nav-item"><a href="javascript:;" class="nav-link tpl-left-nav-link-list"> <i class="am-icon-file-text"></i> <span>文章管理</span> <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
					</a>
						<ul class="tpl-left-nav-sub-menu">
							<li><a href="${ctx1}/backstage/news/publish/list"> <i class="am-icon-angle-right"></i> <span>发表文章</span>
							</a> <a href="${ctx1}/backstage/news/checking/list"> <i class="am-icon-angle-right"></i> <span>审核中列表</span>
							</a> <a href="${ctx1}/backstage/news/unchecked/list"> <i class="am-icon-angle-right"></i> <span>未通过类表</span>
							</a></li>
						</ul></li>
					<li class="tpl-left-nav-item"><a href="javascript:;" class="nav-link tpl-left-nav-link-list active"> <i class="am-icon-user"></i> <span>个人中心</span> <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
					</a>
						<ul class="tpl-left-nav-sub-menu" style="display: block;">
							<li><a href="${ctx}/userinfo.jsp"> <i class="am-icon-angle-right"></i> <span>个人资料</span>
							</a> <a href="${ctx}/re_userinfo.jsp" class="active"> <i class="am-icon-angle-right"></i> <span>完善信息</span>
							</a> <a href="${ctx1}/backstage/logOut"> <i class="am-icon-angle-right"></i> <span>退出登录</span>
							</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<div class="tpl-content-wrapper">
			<div class="tpl-portlet-components">
				<div class="portlet-title">
					<div class="caption font-green bold">
						<span class="am-icon-pencil"></span> 完善信息
					</div>
					<div class="tpl-portlet-input tpl-fz-ml">
						<div class="portlet-input input-small input-inline">
							<div class="input-icon right">
								<i class="am-icon-search"></i> <input type="text" class="form-control form-control-solid" placeholder="搜索...">
							</div>
						</div>
					</div>


				</div>
				<div class="tpl-block ">

					<div class="am-g tpl-amazeui-form">

						<form id="updateUserInfo" class="am-form am-form-horizontal" action="" method="post">
							<div class="am-u-sm-12 am-u-md-9">

								<div class="am-form-group">
									<label for="user-name" class="am-u-sm-3 am-form-label">头像 / image</label>
									<div class="am-u-sm-9">
										<div class="am-form-group am-form-file">
											<div class="tpl-form-file-img " id="tpl-form-file-img-tou">
												<img src="${ctx1}/imgUp/${bloginUser.userInfo.headUrl}" width="200" height="200">
											</div>
											<button onclick="show(this)" type="button" class="am-btn am-btn-danger am-btn-sm">
												<i class="am-icon-cloud-upload"></i> 上传头像
											</button>
										</div>
									</div>
								</div>



								<div class="am-form-group">
									<label for="user-name" class="am-u-sm-3 am-form-label">用户名 / Name</label>
									<div class="am-u-sm-9">
										<input type="text" name="bUserName" id="user-name" value="${bloginUser.loginName }" placeholder="用户名 / Name"> <small>输入你的用户名，让我们记住你。</small>
									</div>
								</div>


								<div class="am-form-group">
									<label for="user-phone" class="am-u-sm-3 am-form-label" >电话 / Telephone</label>
									<div class="am-u-sm-9">
										<input type="tel" name="bphone" id="user-phone" value="${bloginUser.userInfo.phone}"  placeholder="输入你的电话号码 / Telephone">
									</div>
								</div>
								<div class="am-form-group">
									<label for="user-intro" class="am-u-sm-3 am-form-label">职业信条 / creed</label>
									<div class="am-u-sm-9">
										<textarea class="" rows="5" name="creed" id="user-intro" placeholder="输入职业信条(少于250个字)" maxlength="250" required>${bloginUser.userInfo.creed}</textarea>
									</div>
								</div>
								<div class="am-form-group">
									<label for="user-intro" class="am-u-sm-3 am-form-label">简介 / Intro</label>
									<div class="am-u-sm-9">
										<textarea class="" name="intro" rows="5" id="user-intro"  placeholder="输入个人简介(少于250个字)" maxlength="250" required>${bloginUser.userInfo.info }</textarea>

									</div>
								</div>



								<div class="am-u-sm-9 am-u-sm-push-3">
									<button id="saveEditer"  type="button" class="am-btn am-btn-primary">保存修改</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>

	</div>

	</div>
	</div>
	<script src="${ctx}/assets/js/jquery.min.js"></script>
	<script src="${ctx}/assets/js/xcConfirm.js"></script>
	<script src="${ctx}/assets/js/amazeui.min.js"></script>
	<script src="${ctx}/assets/js/iscroll.js"></script>
	<script src="${ctx}/assets/js/app.js"></script>
	<script src="${ctx}/assets/js/jquery.Jcrop.min.js"></script>
	<script type="text/javascript">
		//弹窗
		function sendsuc(e) {
			var txt = e.innerText;
			window.wxc.xcConfirm(txt);
		}

		//弹出图片上传框
		function show(obj) {
			//alert("谢谢！");
			// document.getElementById("d").innerHTML = "显示需要组装的信息";
			// window.open ("page.html", "newwindow", "height=100, width=400, toolbar= no, menubar=no, scrollbars=no, resizable=no, location=no, status=no") 
			//window.open('index2.jsp?p1=2','_blank');
			var x = window.screen.height;
			var y = window.screen.width;
			var h = 700;
			var w = 800;
			var model = "title=word,resizable=yes,scrollbars=yes,height=" + h
					+ ",width=" + w
					+ ",status=yes,toolbar=no,menubar=no,location=no,top="
					+ (x - h) / 2 + ",left=" + (y - w) / 2;
			var url = "";

			url = "${ctx}/modifyAvatar.jsp";//弹出窗口的页面内容
			var oOpen = window.open(url, "adviceDetail", model);
			oOpen.focus();
		}

		$("#saveEditer").click(function(){
			//alert("点击了");
			var url = "${ctx1}/backstage/userInfo/saveEditor";
			$("#updateUserInfo").attr("action", url);
			$("#updateUserInfo").submit();
		})
	</script>
</body>

</html>