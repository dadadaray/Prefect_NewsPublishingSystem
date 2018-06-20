<%@ page language="java" contentType="text/html;	charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date"%>
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
<link rel="apple-touch-icon-precomposed"
	href="${ctx}/assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="${ctx}/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="${ctx}/assets/css/admin.css">
<link rel="stylesheet" href="${ctx}/assets/css/app.css">
<link rel="stylesheet" href="${ctx}/assets/css/mystyle.css">
<link rel="stylesheet" href="${ctx}/assets/css/xcConfirm.css">
<script src="${ctx}/assets/js/echarts.min.js"></script>
</head>

<body data-type="index">

	<header class="am-topbar am-topbar-inverse admin-header">
		<div class="am-topbar-brand">
			<a href="javascript:;" class="tpl-logo"> <img
				src="${ctx}/assets/img/logo.png" alt="">
			</a>
		</div>
		<div
			class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right">

		</div>

		<button
			class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
			data-am-collapse="{target: '#topbar-collapse'}">
			<span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span>
		</button>

		<div class="am-collapse am-topbar-collapse" id="topbar-collapse">

			<ul
				class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">
	
				<li class="am-hide-sm-only"><a href="javascript:;"
					id="admin-fullscreen" class="tpl-header-list-link"><span
						class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a>
				</li>

				<li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
					<a href="${ctx}/userinfo.jsp"> <span
						class="tpl-header-list-user-nick">管理员身份</span><span
						class="tpl-header-list-user-ico"> <img
							src="${ctx}/assets/img/user01.png"></span>
				</a>
				</li>
				<li><a href="${ctx1}/backstage/logOut"
					class="tpl-header-list-link"><span
						class="am-icon-sign-out tpl-header-list-ico-out-size"></span></a></li>
			</ul>
		</div>
	</header>
	<div class="tpl-page-container tpl-page-header-fixed">


		<div class="tpl-left-nav tpl-left-nav-hover">
			<div class="tpl-left-nav-list">
				<ul class="tpl-left-nav-menu">
					<li class="tpl-left-nav-item"><a
						href="${ctx1}/backstage/indexBack" class="nav-link"> <i
							class="am-icon-home"></i> <span>首页</span>
					</a></li>
					<li class="tpl-left-nav-item"><a href="javascript:;"
						class="nav-link tpl-left-nav-link-list active"> <i
							class="am-icon-file-text"></i> <span>文章管理</span> <i
							class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
					</a>
						<ul class="tpl-left-nav-sub-menu" style="display: block;">
							<li><a href="${ctx1}/backstage/news/back/checking/list"
								class="active"> <i class="am-icon-angle-right"></i> <span>待审新文章</span>
							</a> <a href="${ctx1}/backstage/news/back/publish/list"> <i
									class="am-icon-angle-right"></i> <span>已发布文章</span>
							</a> <a href="${ctx1}/backstage/news/back/unchecked/list"> <i
									class="am-icon-angle-right"></i> <span>未通过文章</span>
							</a></li>
						</ul></li>
					<li class="tpl-left-nav-item"><a href="javascript:;"
						class="nav-link tpl-left-nav-link-list"> <i
							class="am-icon-users"></i> <span>用户管理</span> <i
							class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
					</a>
						<ul class="tpl-left-nav-sub-menu">
							<li><a href="${ctx1}/backstageLoginUser/user/list?roleId=2">
									<i class="am-icon-angle-right"></i> <span>记者用户</span>
							</a> <a href="${ctx1}/backstageLoginUser/user/list?roleId=1"> <i
									class="am-icon-angle-right"></i> <span>网站用户</span>
							</a></li>
						</ul></li>
					<li class="tpl-left-nav-item"><a
						href="${ctx1}/backstage/logOut"
						class="nav-link tpl-left-nav-link-list"> <i
							class="am-icon-sign-out"></i> <span>退出登陆</span>
					</a></li>
				</ul>
			</div>
		</div>

		<div class="tpl-content-wrapper">
			<div class="tpl-portlet-components">
				<div class="portlet-title ">
					<div class="caption font-green bold ">
						<span class="am-icon-file-text-o"> </span> 文章详情
					</div>
					<div class="border_hr"></div>
					<!-- 文章内容 -->
					<div class="tpl-block">
						<div class="am-g">
							<div class="am-u-sm-9 center_text2">
								<!-- 文章开始 -->

								<div class="inner">
									<div class="general_content">
										<div class="main_content" id="con_eye">

											<div class="separator" style="height: 30px;"></div>

											<article class="block_single_news">
												<input id="newsId" value="${OneNews.newsId}" type="hidden"/>
												<p class="title">
												<h1>${OneNews.newsTitle}</h1>
												</p>

												<div class="info row">
													<div class="am-u-md-4 am-u-sm-4 date">
														<p>${OneNews.createTime}</p>
													</div>
													<div class="am-u-md-4 am-u-sm-4 author">
														<p>
															作者: <a href="#">${OneNews.userInfo.loginUser.loginName}</a>
														</p>
													</div>

													<div class="am-u-md-4 am-u-sm-4 r_part">
														<a href="#" class="views">
					                                	<c:choose>
														    <c:when test="${not empty OneNews.views and OneNews.views != 0}">
														        ${OneNews.views}
														    </c:when>
														    <c:otherwise>
														        0
														    </c:otherwise>
														</c:choose>
														</a> 
														<a href="#" class="comments">
					                                	<c:choose>
														    <c:when test="${not empty OneNews.commentNum and OneNews.commentNum != 0}">
														        ${OneNews.commentNum}
														    </c:when>
														    <c:otherwise>
														        0
														    </c:otherwise>
														</c:choose>   	
														</a>
													</div>
												</div>

												<div class="content">
												<c:if test="${not empty OneNews.modFrees}">
                               						<c:forEach items="${OneNews.modFrees}" var="modFree">													
													<p class="text_p">${modFree.modFreeContent}</p>
													</c:forEach>
												</c:if>
												</div>
											</article>

											<div class="separator" style="height: 4px;"></div>

											<div class="block_post_tags">
												<p>
													标签: <a href="#">${OneNews.newsType.typeName}</a>
												</p>
											</div>
										</div>
									</div>
								</div>
								<!-- 文章结束 -->
							</div>
						</div>
						<hr>
						<!-- 审核结果 -->
						<c:if test="${not empty tag and 0 eq tag}">
							<div class="check_end">
								<button type="button" class="am-btn am-btn-success" id="tzsucc"
									onclick="sendsuc(this)">通过并发表</button>
								<button id="failsend" type="button" class="am-btn am-btn-danger">未通过并回复</button>
							</div>
						</c:if>
						<!-- 审核结束 -->
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
</body>

<script type="text/javascript">
// 弹窗
function sendsuc(e){
     var id = $("#newsId").val();     
		$.ajax({
			type:"post",
			url:"${ctx1}/backstage/notice/check",
			data : {
				newsId : id,
			},
			success : function(data, status) {
				if (data != "0") {
					window.wxc.xcConfirm("通过并发表成功了哦！",
							{onOk:function(){
									window.location.href ="${ctx1}/backstage/news/back/checking/list";
								}});
				}else{
					window.wxc.xcConfirm("发表出错！");
				}
			},
			error :function(){
				alert("发表出错！");
			}
		});      
}

//审核不通过
$("#failsend").click(function(){ 
       var txt="";
       window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.textarea,{
         onOk:function(v){
             var id = $("#newsId").val();     
     		$.ajax({
     			type:"post",
     			url:"${ctx1}/backstage/notice/uncheck",
     			data : {
     				newsId : id,
     				noticeContent : v,
     			},
     			success : function(data, status) {
     				if (data != "0") {
     					alert("成功发送通知！");
     					window.location.href ="${ctx1}/backstage/news/back/checking/list";
     				}else{
     					window.wxc.xcConfirm("发送通知出错！");
     				}
     			},
     			error :function(){
     				alert("发送通知出错！");
     			}
     		});             	
           console.log(v);
         }
       });
     });
</script>
</html>