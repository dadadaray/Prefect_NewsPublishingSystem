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
				
				<li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen" class="tpl-header-list-link"> <span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span>
				</a></li>

				<li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle><a href="userinfo.jsp">
                        <span class="tpl-header-list-user-nick">${bloginUser.loginName}</span><span class="tpl-header-list-user-ico"> <img src="${ctx1}/imgUp/${bloginUser.userInfo.headUrl}"></span>
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
					<li class="tpl-left-nav-item"><a href="javascript:;" class="nav-link tpl-left-nav-link-list active"> <i class="am-icon-file-text"></i> <span>文章管理</span> <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
					</a>
						<ul class="tpl-left-nav-sub-menu" style="display: block;">
							<li><a href="${ctx1}/backstage/news/publish/list"> <i class="am-icon-angle-right"></i> <span>已发表文章</span>
							</a> <a href="${ctx1}/backstage/news/checking/list" class="active"> <i class="am-icon-angle-right"></i> <span>审核中列表</span>
							</a> <a href="${ctx1}/backstage/news/unchecked/list"> <i class="am-icon-angle-right"></i> <span>未通过列表</span>
							</a></li>
						</ul></li>
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
			<div class="tpl-portlet-components">
				<div class="portlet-title">
					<div class="caption font-green bold">
						<span class="am-icon-file-text-o"> </span> 审核列表
					</div>
					<div class="tpl-portlet-input tpl-fz-ml">
						<div class="portlet-input input-small input-inline">
							<div class="input-icon right">
								<i class="am-icon-search"></i> <input type="text" class="form-control form-control-solid" placeholder="请输入标题关键字">
							</div>
						</div>
					</div>


				</div>
				<div class="tpl-block">
					<div class="am-g">
						<div class="am-u-sm-12 am-u-md-9">
							<div class="am-btn-toolbar">
								<div class="am-btn-group am-btn-group-xs">
									<a href="${ctx}/add_news.jsp" class="am-btn am-btn-default am-btn-secondary"> <span class="am-icon-plus"></span> 新增文章
									</a>
								</div>
							</div>
						</div>
						<div class="am-u-sm-12 am-u-md-3">
							<div class="am-form-group">
								<select data-am-selected="{btnSize: 'sm'}">
									<option value="option1">所有类别</option>
									<option value="a">财经</option>
									<option value="b">科技</option>
									<option value="c">教育</option>
									<option value="d">体育</option>
									<option value="e">娱乐</option>
									<option value="f">军事</option>
									<option value="g">旅游</option>
									<option value="h">政务</option>
								</select>
							</div>
						</div>
					</div>
					<div class="am-g">
						<div class="am-u-sm-12">
							<form class="am-form">
								<table class="am-table am-table-striped am-table-hover table-main">
									<thead>
										<tr>
											<th class="table-id">ID</th>
											<th class="table-title">文章名称</th>
											<th class="table-type">类别</th>
											<th class="table-date am-hide-sm-only">发送日期</th>
											<th class="table-set">操作</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${not empty page and page.totalCount > 0}">
											<c:forEach items="${page.list}" var="news" varStatus="status">
												<tr>
													<td>${status.index+1}</td>
													<td><a href="#">《${news.newsTitle}》</a></td>
													<td>${news.newsType.typeName}</td>
													<td class="am-hide-sm-only"><fmt:formatDate value="${news.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
													<td>
														<div class="am-btn-toolbar">
															<div class="am-btn-group am-btn-group-xs">
																<button onclick="return preview(${news.newsId})" class="am-btn am-btn-default am-btn-xs am-text-secondary">
																	<span class="am-icon-eye"> </span> 查看
																</button>
															</div>
														</div>
													</td>
												</tr>
											</c:forEach>
										</c:if>

										<c:if test="${empty page or page.totalCount <= 0}">
											<tr>
												<td colspan="5">无信息</td>
											</tr>
										</c:if>
									</tbody>
								</table>
								<div class="am-cf">
									<div class="am-fr">
										<ul class="am-pagination tpl-pagination">
											<li class="am-disabled"><a href="${ctx1}/backstage/news/checking/list?pageNum=${page.prePageNum}">«</a></li>
											<c:forEach begin="1" end="${page.totalPageNum}" var="pageNum">
												<c:if test="${pageNum == page.currentPageNum}">
													<li class="am-active"><a href="${ctx1}/backstage/news/checking/list?pageNum=${pageNum}">${pageNum}</a></li>
												</c:if>
												<c:if test="${pageNum != page.currentPageNum}">
													<li><a href="${ctx1}/backstage/news/checking/list?pageNum=${pageNum}">${pageNum}</a></li>
												</c:if>
											</c:forEach>
											<li><a href="${ctx1}/backstage/news/checking/list?pageNum=${page.nextPageNum}">»</a></li>
										</ul>
									</div>
								</div>
								<hr>

							</form>
						</div>

					</div>
				</div>
				<div class="tpl-alert"></div>
			</div>

		</div>

	</div>

	<script src="${ctx}/assets/js/jquery.min.js"></script>
	<script src="${ctx}/assets/js/xcConfirm.js"></script>
	<script src="${ctx}/assets/js/amazeui.min.js"></script>
	<script src="${ctx}/assets/js/iscroll.js"></script>
	<script src="${ctx}/assets/js/app.js"></script>
	<script type="text/javascript">
	//查看
	function preview(newsId) {
		window.location.href="${ctx1}/backstage/notice/findoneNews?tag=1&newsId="+newsId;
		return false;
	}

		//弹窗
		function sendsuc(e) {
			var txt = e.innerText;
			window.wxc.xcConfirm(txt);
		}
	</script>
</body>

</html>