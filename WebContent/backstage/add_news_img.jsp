<%@ page language="java" contentType="text/html;	charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}/backstage"></c:set>
<c:set var="ctx1" value="${pageContext.request.contextPath}"></c:set>
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
<link rel="stylesheet" href="${ctx}/assets/css/mystyle.css">
<link rel="stylesheet" href="${ctx}/assets/css/iconfont.css">
<link rel="stylesheet" href="${ctx}/assets/css/fileUpload.css">
<link rel="stylesheet" href="${ctx}/assets/css/xcConfirm.css">
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
			<div class="tpl-left-nav-list">
				<ul class="tpl-left-nav-menu">
					<li class="tpl-left-nav-item"><a href="${ctx1}/backstage/indexs" class="nav-link"> <i class="am-icon-home"></i> <span>首页</span>
					</a></li>
					<li class="tpl-left-nav-item"><a href="${ctx}/add_news.jsp" class="nav-link  tpl-left-nav-link-list active"> <i class="am-icon-edit"></i> <span>添加新文章</span>
					</a></li>
					<li class="tpl-left-nav-item"><a href="${ctx1}/backstage/notice" class="nav-link  tpl-left-nav-link-list"> <i class="am-icon-bell-o"></i> <span>通知管理</span>
					</a></li>
					<li class="tpl-left-nav-item"><a href="${ctx1}/backstage/draft/list" class="nav-link  tpl-left-nav-link-list"> <i class="am-icon-inbox"></i> <span>草稿箱</span>
					</a></li>
                    <li class="tpl-left-nav-item">
                        <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-file-text"></i>
                            <span>文章管理</span>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </a>
                        <ul class="tpl-left-nav-sub-menu">
                            <li>
                                <a href="${ctx1}/backstage/news/publish/list">
                                   <i class="am-icon-angle-right"></i>
                                    <span>已发表文章</span>
                                </a>
                                <a href="${ctx1}/backstage/news/checking/list">
                                   <i class="am-icon-angle-right"></i>
                                    <span>审核中列表</span>
                                 </a>
                                <a href="${ctx1}/backstage/news/unchecked/list">
                                    <i class="am-icon-angle-right"></i>
                                    <span>未通过列表</span>
                                </a>
                            </li>
                        </ul>
                    </li>
					<li class="tpl-left-nav-item"><a href="javascript:;" class="nav-link tpl-left-nav-link-list"> <i class="am-icon-user"></i> <span>个人中心</span> <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
					</a>
						<ul class="tpl-left-nav-sub-menu">
							<li><a href="${ctx}/userinfo.jsp"> <i class="am-icon-angle-right"></i> <span>个人资料</span>
							</a> <a href="${ctx}/re_userinfo.jsp"> <i class="am-icon-angle-right"></i> <span>完善信息</span>
							</a> <a href="${ctx1}/backstage/logOut"> <i class="am-icon-angle-right"></i> <span>退出登录</span>
							</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<div class="tpl-content-wrapper">
			<div class="row">
				<div class="am-u-md-12 am-u-sm-14 row-mb ">
					<div class="tpl-portlet" style="margin-bottom: 10px; overflow: hidden;">
						<div class="caption font-green bold" style="float: left;">
							<span class="am-icon-file-text-o">&nbsp&nbsp选择模板</span>
						</div>
						<div class="am-btn-group" style="float: left;">
							<a href="${ctx}/add_news.jsp" class="am-btn am-btn-secondary am-radius" style="margin-left: 20px;">图文自由排版</a> <a href="${ctx}/add_news_img.jsp" class="am-btn am-btn-primary am-radius" style="margin-left: 10px;">大图轮播</a> <a href="${ctx}/add_news_vedio.jsp" class="am-btn am-btn-secondary am-radius" style="margin-left: 10px;">视频专题</a> <a href="${ctx}/add_news_audio.jsp" class="am-btn am-btn-secondary am-radius" style="margin-left: 10px;">音频专题</a> <a href="${ctx}/add_news_tuwenModel.jsp" class="am-btn am-btn-secondary am-radius" style="margin-left: 10px;">图文模板</a>
						</div>
					</div>
					<form id="bigImgForm" class="am-form tpl-form-line-form" action="" method="post" enctype="multipart/form-data" target="">
						<div class="tpl-portlet" id="father">
							<div>
								<div class="pagelet-figure-gallery-item">
									<div class="am-u-md-2 am-u-sm-4 gallery-img">
										<!--  图片上传显示-->
										<!--input-group start-->
										<div class="upload_box"><input type="file" name="file" class="file" onchange="imgChange(this);" style="width: 131.33px" /><div class="preview"><img class="imghead" src="${ctx}/assets/img/photo_icon.png" width="260" height="180" />
											</div>
										</div>
										<!--input-group end-->
									</div>
									<div class="am-u-md-9 am-u-sm-14 gallery-txt" style="padding-top: 24px;">
										<textarea name="textInfo" rows="3" placeholder="图片说明（不超过200个字）" maxlength="200"></textarea>
									</div>
									<div class="am-u-md-1 am-u-sm-2 gallery-action" style="padding-top: 24px;">
										<i class="am-icon-trash am-icon-fw gallery-icon" type="delete" onclick="removeImg(this)"></i>
									</div>
								</div>
							</div>
						</div>

						<div class="tpl-portlet">
							<button type="button" class="am-btn am-btn-primary tpl-btn-bg-color-success " onclick="addImg()">添加图片</button>
							<div class="portlet-title">
								<div class="tpl-block">
									<div class="am-g">
										<div class="tpl-form-body tpl-form-line">

											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-2 am-form-label">标题</label>
												<div class="am-u-sm-10">
													<input type="text" class="tpl-form-input" name="title" id="user-name" placeholder="请输入标题文字"> <small style="color: red;">请填写标题文字10-20字左右。</small>
												</div>
											</div>

											<div class="am-form-group">
												<label for="user-weibo" class="am-u-sm-2 am-form-label">添加分类</label>
												<div class="am-u-sm-10">
													<select data-am-selected="{searchBox: 1}" name="selectmod">
														<option value="1">财经</option>
														<option value="2">科技</option>
														<option value="3">教育</option>
														<option value="4">体育</option>
														<option value="5">娱乐</option>
														<option value="6">军事</option>
														<option value="7">旅游</option>
														<option value="8">政务</option>
													</select>
												</div>
											</div>
											<div class="am-form-group">
												<label for="user-name" class="am-u-sm-2 am-form-label ">内容简介</label>
												<div class="am-u-md-9 am-u-sm-14 gallery-txt" style="float: left;">
													<textarea name="textarea" rows="10" placeholder="（不超过1000个字）" maxlength="1000" style="overflow-y: scroll"></textarea>

												</div>
											</div>


											<div class="am-form-group">
												<label for="user-weibo" class="am-u-sm-2 am-form-label">封面图</label>
												<div class="am-u-sm-10">
													<!--  图片上传显示-->
													<!--input-group start-->
													<div class="upload_box"><input type="file" name="coverfile" class="file" onchange="imgChange(this)" style="width: 260px" /><div class="preview" style="margin-top: 20px;"><img class="imghead" src="${ctx}/assets/img/add.png" width="320" height="136" />
														</div>
													</div>
													<!--input-group end-->

												</div>
											</div>
											<div class="am-u-sm-8 am-u-sm-push-2 add_button">
												<a id="saveBigImgDraft" class="am-btn am-btn-primary tpl-btn-bg-color-success add_draft">存草稿</a> 
												<a id="preBigImgview" class="am-btn am-btn-primary tpl-btn-bg-color-success add_eye">预 览</a> 
												<a id="bigImgSend" class="am-btn am-btn-primary tpl-btn-bg-color-success add_fa">发 布</a>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>

	<script src="${ctx}/assets/js/jquery.min.js"></script>
	<script src="${ctx}/assets/js/xcConfirm.js"></script>
	<script src="${ctx}/assets/js/amazeui.min.js"></script>
	<script src="${ctx}/assets/js/iscroll.js"></script>
	<script src="${ctx}/assets/js/app.js"></script>
	<script type="text/javascript" src="${ctx}/assets/js/fileUpload.js"></script>
	<script src="${ctx}/assets/js/echarts.min.js"></script>
	<script type="text/javascript">
		var i = 0;
		function addImg() {
			$("#father")
					.append(
							'<div><div class="pagelet-figure-gallery-item"><div class="am-u-md-2 am-u-sm-4 gallery-img"><div class="upload_box"><input type="file" name="file"  class="file" onchange="imgChange(this);" style="width: 131.33px" /><div class="preview"><img class="imghead" src="${ctx}/assets/img/photo_icon.png" width="260" height="180"/></div></div></div><div class="am-u-md-9 am-u-sm-14 gallery-txt" style="padding-top: 24px;"><textarea name="textInfo" rows="3" placeholder="图片说明（不超过200个字）" maxlength="200"></textarea></div><div class="am-u-md-1 am-u-sm-2 gallery-action" style="padding-top: 24px;"><i class="am-icon-trash am-icon-fw gallery-icon" type="delete" onclick="removeImg(this)"></i></div></div></div>');
		}
		function removeImg(e) {
			$(e).parent().parent().remove();
		}

		//end

		// 页面上图片上传并显示start
		function imgChange(e) {
			var file = e;
			var imgUrl = window.URL.createObjectURL(file.files[0]);
			var imgPar = e.parentNode;
			//console.log(imgPar.childNodes);
			var img = imgPar.childNodes[1].childNodes[0];
			img.setAttribute('src', imgUrl);
		}
		// 页面上图片上传并显示end

		//弹窗
		function sendsuc(e) {
			var txt = e.innerText;
			window.wxc.xcConfirm(txt);
		}
		//发布按钮
		$("#bigImgSend").click(function() {
			var url = "${ctx1}/addnews/bigImg/sendBigImgNews";
			$("#bigImgForm").attr("action", url);
			$("#bigImgForm").submit();
		})
		//存草稿
		$("#saveBigImgDraft").click(function() {
			var url= "${ctx1}/addnews/bigImg/saveBigImgNewsDraft";
			$("#bigImgForm").attr("action", url);
			$("#bigImgForm").submit();
		})
		//预览页面
		$("#preBigImgview").click(function() {
			var url= "${ctx1}/addnews/bigImg/preBigImgview";
			$("#bigImgForm").attr("action", url);
			$("#bigImgForm").attr("target", "_blank");
			$("#bigImgForm").submit();
		})
	</script>
</body>

</html>










