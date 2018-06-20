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
<link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet" href="${ctx}/assets/css/amazeui.min.css" />
<link rel="stylesheet" href="${ctx}/assets/css/admin.css">
<link rel="stylesheet" href="${ctx}/assets/css/app.css">
<link rel="stylesheet" href="${ctx}/assets/css/mystyle.css">
<link rel="stylesheet" href="${ctx}/assets/css/xcConfirm.css">
<script src="${ctx}/assets/js/echarts.min.js"></script>
</head>

<body data-type="index">

<%
		if (session.getAttribute("page") == null) {
			request.getRequestDispatcher("backstage/news/back/publish/list").forward(request, response);
		}
	%>
	<header class="am-topbar am-topbar-inverse admin-header">
		<div class="am-topbar-brand">
			<a href="javascript:;" class="tpl-logo">
				<img src="${ctx}/assets/img/logo.png" alt="">
			</a>
		</div>
		<div class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right"></div>

		<button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}">
			<span class="am-sr-only">导航切换</span>
			<span class="am-icon-bars"></span>
		</button>

		<div class="am-collapse am-topbar-collapse" id="topbar-collapse">

			<ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">
				<li class="am-hide-sm-only">
					<a href="javascript:;" id="admin-fullscreen" class="tpl-header-list-link">
						<span class="am-icon-arrows-alt"></span>
						<span class="admin-fullText">开启全屏</span>
					</a>
				</li>

				<li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
					<a href="${ctx}/userinfo.jsp">
						<span class="tpl-header-list-user-nick">管理员身份</span>
						<span class="tpl-header-list-user-ico">
							<img src="${ctx}/assets/img/user01.png">
						</span>
					</a>
					<ul class="am-dropdown-content">
						<li>
							<a href="#">
								<span class="am-icon-bell-o"></span>
								资料
							</a>
						</li>
						<li>
							<a href="#">
								<span class="am-icon-cog"></span>
								设置
							</a>
						</li>
						<li>
							<a href="${ctx1}/backstage/logOut">
								<span class="am-icon-power-off"></span>
								退出
							</a>
						</li>
					</ul>
				</li>
				<li>
					<a href="###" class="tpl-header-list-link">
						<span class="am-icon-sign-out tpl-header-list-ico-out-size"></span>
					</a>
				</li>
			</ul>
		</div>
	</header>
	<div class="tpl-page-container tpl-page-header-fixed">


		<div class="tpl-left-nav tpl-left-nav-hover">
			<div class="tpl-left-nav-list">
				<ul class="tpl-left-nav-menu">
					<li class="tpl-left-nav-item">
						<a href="${ctx1}/backstage/indexBack" class="nav-link">
							<i class="am-icon-home"></i>
							<span>首页</span>
						</a>
					</li>
					<li class="tpl-left-nav-item">
						<a href="javascript:;" class="nav-link tpl-left-nav-link-list active">
							<i class="am-icon-file-text"></i>
							<span>文章管理</span>
							<i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
						</a>
						<ul class="tpl-left-nav-sub-menu" style="display: block;">
							<li>
								<a href="${ctx1}/backstage/news/back/checking/list">
									<i class="am-icon-angle-right"></i>
									<span>待审新文章</span>
								</a>
								<a href="${ctx1}/backstage/news/back/publish/list" class="active">
									<i class="am-icon-angle-right"></i>
									<span>已发布文章</span>
								</a>
								<a href="${ctx1}/backstage/news/back/unchecked/list">
									<i class="am-icon-angle-right"></i>
									<span>未通过文章</span>
								</a>
							</li>
						</ul>
					</li>
					<li class="tpl-left-nav-item">
						<a href="javascript:;" class="nav-link tpl-left-nav-link-list">
							<i class="am-icon-users"></i>
							<span>用户管理</span>
							<i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
						</a>
						<ul class="tpl-left-nav-sub-menu">
							<li>
								<a href="${ctx1}/backstageLoginUser/user/list?roleId=2">
									<i class="am-icon-angle-right"></i>
									<span>记者用户</span>
								</a>
								<a href="${ctx1}/backstageLoginUser/user/list?roleId=1">
									<i class="am-icon-angle-right"></i>
									<span>网站用户</span>
								</a>
							</li>
						</ul>
					</li>
					<li class="tpl-left-nav-item">
						<a href="${ctx1}/backstage/logOut" class="nav-link tpl-left-nav-link-list">
							<i class="am-icon-sign-out"></i>
							<span>退出登陆</span>
						</a>
					</li>
				</ul>
			</div>
		</div>

		<div class="tpl-content-wrapper">
			<div class="tpl-portlet-components">
				<div class="portlet-title">
					<div class="caption font-green bold">
						<span class="am-icon-file-text-o"> </span>
						全部文章
					</div>
					<div class="tpl-portlet-input tpl-fz-ml">
						<div class="portlet-input input-small input-inline">
							<div class="input-icon right">
								<i class="am-icon-search"></i>
								<input type="text" class="form-control form-control-solid" placeholder="请输入标题关键字">
							</div>
						</div>
					</div>


				</div>
				<div class="tpl-block">
					<div class="am-g">
						<div class="am-u-sm-12 am-u-md-9">
							<div class="am-btn-toolbar">
								<div class="am-btn-group am-btn-group-xs">
									<button type="button" class="am-btn am-btn-default am-btn-danger" onclick="deleteItem()">
										<span class="am-icon-trash-o"></span>
										批量删除
									</button>
									<button type="button" class="am-btn am-btn-default am-btn-secondary" onclick="newsSort(1)">
										<span class="am-icon-share-alt"></span>
										分享排行
									</button>
									<button type="button" class="am-btn am-btn-default am-btn-warning" onclick="newsSort(2)">
										<span class="am-icon-eye"></span>
										浏览排行
									</button>
									<button type="button" class="am-btn am-btn-default am-btn-success" onclick="newsSort(3)">
										<span class="am-icon-comment"></span>
										留言排行
									</button>
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
											<th class="table-check">
												<input type="checkbox" class="tpl-table-fz-check" id="checkall" onclick="checkallcheckbox();">
											</th>
											<th class="table-id">ID</th>
											<th class="table-title">文章名称</th>
											<th class="table-author ">作者</th>
											<th class="table-type am-hide-sm-only">类别</th>
											<th class="table-type am-hide-sm-only">浏览量</th>
											<th class="table-type am-hide-sm-only">转发量</th>
											<th class="table-type am-hide-sm-only">留言量</th>
											<th class="table-date am-hide-sm-only">发文日期</th>
											<th class="table-set">操作</th>
										</tr>
									</thead>
									<tbody id="doc-modal-list">
										<c:if test="${not empty page and page.totalCount > 0}">
											<c:forEach items="${page.list}" var="news" varStatus="status">
												<tr>
													<td>
														<input class="checkOne" type="checkbox" name="box" onclick="checkonebox()" value="${news.newsId}">
													</td>
													<td>${status.index+1}</td>
													<td>
														<a href="#">《${fn:substring(news.newsTitle, 0,2)}<c:if test="${fn:length(news.newsTitle)>2}">...</c:if>》</a>
													</td>
		
													<td>
														<img src="${ctx1}/imgUp/${news.userInfo.headUrl}" alt="" class="author_pics">
														<a class="user-name" href="###">${news.userInfo.loginUser.loginName}</a>
													</td>
													<td>${news.newsType.typeName}</td>
													<td class="am-hide-sm-only">${news.views}</td>
													<td class="am-hide-sm-only">${news.share}</td>
													<td class="am-hide-sm-only font-blue bold">
														<a href="#">${news.commentNum}</a>
													</td>
													<td class="am-hide-sm-only"><fmt:formatDate value="${news.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
													<td>
														<div class="am-btn-toolbar">
															<div class="am-btn-group am-btn-group-xs">
																<button onclick="return preview(${news.newsId})" class="am-btn am-btn-default am-btn-xs am-text-secondary">
																	<span class="am-icon-eye"> </span>
																	查看
																</button>
																<button type="button" class="am-btn am-btn-default am-btn-xs am-text-warning am-hide-sm-only" onclick="topNews(${news.newsId})">
																	<span class="am-icon-level-up"> </span>
																	推荐
																</button>
																<input type="hidden" data-id="${news.newsId}" />
																<button type="button" class="btn-close am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">
																	<span class="am-icon-trash-o"></span>
																	删除
																</button>
															</div>
														</div>
													</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty page or page.totalCount <= 0}">
											<tr>
												<td colspan="10">无信息</td>
											</tr>
										</c:if>										
									</tbody>
								</table>
								<div class="am-cf">

									<div class="am-fr">
										<ul class="am-pagination tpl-pagination">
											<li class="am-disabled">
												<a href="${ctx1}/backstage/news/back/publish/list?pageNum=${page.prePageNum}">«</a>
											</li>
											<c:forEach begin="1" end="${page.totalPageNum}" var="pageNum">
	                                        	<c:if test="${pageNum == page.currentPageNum}">
	                                        		<li class="am-active"><a href="${ctx1}/backstage/news/back/publish/list?pageNum=${pageNum}">${pageNum}</a></li>
	                                        	</c:if>
	                                        	<c:if test="${pageNum != page.currentPageNum}">
	                                        		<li><a href="${ctx1}/backstage/news/back/publish/list?pageNum=${pageNum}">${pageNum}</a></li>
	                                        	</c:if>
											</c:forEach>											
											<li>
												<a href="${ctx1}/backstage/news/back/publish/list?pageNum=${page.nextPageNum}">»</a>
											</li>
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

	<!--删除弹框 start-->
	<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
		<div class="am-modal-dialog">
			<div class="am-modal-bd" style="padding: 40px 10px">你，确定要删除这条记录吗？</div>
			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-cancel>取消</span>
				<span class="am-modal-btn" data-am-modal-confirm>确定</span>
			</div>
		</div>
	</div>
	<!--删除弹框 end-->


	<script src="${ctx}/assets/js/jquery.min.js"></script>
	<script src="${ctx}/assets/js/xcConfirm.js"></script>
	<script src="${ctx}/assets/js/amazeui.min.js"></script>
	<script src="${ctx}/assets/js/iscroll.js"></script>
	<script src="${ctx}/assets/js/app.js"></script>
	<script type="text/javascript">
		//删除
		$('#doc-modal-list').find('.btn-close').on('click', function() {
			$('#my-confirm').modal({
				relatedTarget : this,
				onConfirm : function(options) {
					var $link = $(this.relatedTarget).prev('input');
					var id = $link.data('id');
					$.ajax({
						type:"post",
						url:"/News-Publishing-System/backstage/news/delete",
						data : {
							newsIds : id,
						},
						success : function(data, status) {
							if (data != "0") {
								alert("删除成功！");
								window.location.href ="/News-Publishing-System/backstage/news/back/publish/list";
							}else{
								alert("删除出错！");
							}
						},
						error :function(){
							alert("删除出错！");
						}
					}); 					
					
				},
				// closeOnConfirm: false,
				onCancel : function() {
					//alert('算求，不弄了');
				}
			});
		});
		
	    //新闻批量删除
		function deleteItem(){
			var count = 0;
			var ids = "";
			$(".checkOne:checked").each(function(){
				ids = ids + $(this).val()+",";
				count++;
			});
			if(count==0){
				alert("请至少选择一条记录进行删除！");
				return false;
			}else{
				$.ajax({
					type:"post",
					url:"/News-Publishing-System/backstage/news/delete",
					data : {
						newsIds : ids
					},
					success : function(data, status) {
						if (data != "0") {
							alert("删除成功！");
							window.location.href ="/News-Publishing-System/backstage/news/back/publish/list";
						}else{
							alert("删除出错！");
						}
					},
					error :function(){
						alert("删除出错！");
					}
				});
			}
		}		
		
		//新闻排序方式
		function newsSort(orderBy){
			window.location.href ="/News-Publishing-System/backstage/news/back/publish/list?orderBy=" + orderBy;
		}
		
		//推荐弹框
		function topNews(newsId) {
			window.location.href ="/News-Publishing-System/backstage/news/topSelect?newsId=" + newsId;
			window.wxc.xcConfirm("已成功推荐该文章！");
		}

		//全选/全不选功能
		function checkallcheckbox() {
			var ischecked = document.getElementById("checkall").checked;
			if (ischecked) {
				checkallbox();
			} else {
				discheckallbox();
			}
		}
		//选中全部复选框
		function checkallbox() {
			var boxarray = document.getElementsByName("box");
			for (var i = 0; i < boxarray.length; i++) {
				if (boxarray[i].disabled != true)
					boxarray[i].checked = true;
			}
		}

		//取消选中全部复选框
		function discheckallbox() {
			var boxarray = document.getElementsByName("box");
			for (var i = 0; i < boxarray.length; i++) {
				boxarray[i].checked = false;
			}
		}

		//点击每个checkbox时判断是否所有的checkbox全部选中  
		function checkonebox() {
			if (isallchecked()) {
				document.getElementById("checkall").checked = true;
			}
			if (isalldischecked()) {
				document.getElementById("checkall").checked = false;
			}
		}

		//是否全部选中
		function isallchecked() {
			var boxarray = document.getElementsByName("box");
			for (var i = 0; i < boxarray.length; i++) {
				if (!boxarray[i].checked) {
					return false;
				}
			}
			return true;
		}

		//是否没有全部选中
		function isalldischecked() {
			var boxarray = document.getElementsByName("box");
			for (var i = 0; i < boxarray.length; i++) {
				if (!boxarray[i].checked) {
					return true;
				}
			}
			return false;
		}

		//查看
		function preview(newsId) {
			window.location.href="${ctx1}/backstage/notice/findoneNews?tag=1&newsId="+newsId;
			return false;
		}
	</script>
</body>

</html>