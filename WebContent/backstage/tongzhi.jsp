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
			<a href="javascript:;" class="tpl-logo"> <img
				src="${ctx}/assets/img/logo.png" alt="">
			</a>
		</div>
		<div class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right"></div>

		<button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only"
			data-am-collapse="{target: '#topbar-collapse'}">
			<span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span>
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
					<a href="userinfo.jsp">
                        <span class="tpl-header-list-user-nick">${bloginUser.loginName}</span><span class="tpl-header-list-user-ico"> <img src="${ctx1}/imgUp/${bloginUser.userInfo.headUrl}"></span>
                    </a>
				</li>
				<li>
					<a href="${ctx1}/backstage/logOut" class="tpl-header-list-link">
						<span class="am-icon-sign-out tpl-header-list-ico-out-size"></span>
					</a>
				</li>
			</ul>
		</div>
	</header>
	<div class="tpl-page-container tpl-page-header-fixed">
		<div class="tpl-left-nav tpl-left-nav-hover">
			<!-- 列表 -->
			<div class="tpl-left-nav-list">
				<ul class="tpl-left-nav-menu">
					<li class="tpl-left-nav-item">
						<a href="${ctx1}/backstage/indexs" class="nav-link"> 
						<i class="am-icon-home"></i> <span>首页</span>
						</a>
					</li>
					<li class="tpl-left-nav-item">
						<a href="${ctx}/add_news.jsp" class="nav-link  tpl-left-nav-link-list"> 
						<i class="am-icon-pencil-square"></i> <span>添加新文章</span>
						</a>
					</li>
					<li class="tpl-left-nav-item">
						<a href="${ctx1}/backstage/notice" class="nav-link  tpl-left-nav-link-list active"> 
						<i class="am-icon-bell"></i> <span>通知管理</span> 
						</a>
					</li>
					<li class="tpl-left-nav-item">
						<a href="${ctx1}/backstage/draft/list" class="nav-link  tpl-left-nav-link-list"> 
						<i class="am-icon-inbox"></i> <span>草稿箱</span>
						</a>
					</li>
					<li class="tpl-left-nav-item">
						<a href="javascript:;" class="nav-link tpl-left-nav-link-list"> 
							<i class="am-icon-file-text"></i> <span>文章管理</span> 
							<i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
						</a>
						<ul class="tpl-left-nav-sub-menu">
							<li>
								<a href="${ctx1}/backstage/news/publish/list"> 
								<i class="am-icon-angle-right"></i> <span>发表文章</span>
								</a> 
								<a href="${ctx1}/backstage/news/checking/list"> 
								<i class="am-icon-angle-right"></i> <span>审核中列表</span>
								</a> 
								<a href="${ctx1}/backstage/news/unchecked/list"> 
								<i class="am-icon-angle-right"></i> <span>未通过类表</span>
								</a>
							</li>
						</ul>
					</li>
					<li class="tpl-left-nav-item">
						<a href="javascript:;" class="nav-link tpl-left-nav-link-list"> 
						<i class="am-icon-user"></i> <span>个人中心</span> 
						<i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
						</a>
						<ul class="tpl-left-nav-sub-menu">
							<li>
								<a href="${ctx}/userinfo.jsp"> 
								<i class="am-icon-angle-right"></i><span>个人资料</span>
								</a> 
								<a href="${ctx}/re_userinfo.jsp"> 
								<i class="am-icon-angle-right"></i><span>完善信息</span>
								</a> 
								<a href="${ctx1}/backstage/logOut"> 
								<i class="am-icon-angle-right"></i><span>退出登录</span>
								</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<div class="tpl-content-wrapper">
			<form id="formSubmit" action="notice/listNotice" method="get">
				<div class="tpl-portlet-components">
					<div class="portlet-title">
						<div class="caption font-green bold">
							<span class="am-icon-bell-o"> 通知列表</span>
						</div>
						<div class="tpl-portlet-input tpl-fz-ml">
							<div class="portlet-input input-small input-inline">
								<div class="input-icon right">
									<i class="am-icon-search"></i> 
									<input type="text" class="form-control form-control-solid" placeholder="搜索...">
								</div>
							</div>
						</div>
					</div>
					<div class="am-g">
						<div class="am-u-sm-12 am-u-md-6">
							<div class="am-btn-toolbar">
								<div class="am-btn-group am-btn-group-xs">
									<input type="checkbox" class="tpl-table-fz-check" id="checkall"
										onclick="checkallcheckbox();" style="float: left; margin-left: -7px;">
									<button style="float: left; margin-left: 20px;" type="button"
										class="am-btn am-btn-default am-btn-danger" onclick="deleteItem()">
										<span class="am-icon-trash-o"></span> 批量删除
									</button>
								</div>
							</div>
						</div>
						<div class="am-u-sm-12 am-u-md-3">
							<div class="am-form-group">
								<select data-am-selected="{btnSize: 'sm'}"  onchange="queryByType(this.options[this.options.selectedIndex].value)">
									<option value="3">全部消息</option>
									<option value="2">文章推荐</option>
									<option value="1">审核通过</option>
									<option value="0">审核意见</option>
								</select>
								<input type="hidden" value="3" id="typeSearch" name="noticeType"/>
							</div>
						</div>
					</div>
					<c:if test="${not empty page and page.totalCount > 0}">
						<ul class="tpl-task-list tpl-task-remind" id="doc-modal-list">
							<c:forEach items="${page.list}" var="notice" varStatus="status">
							<input id="content${status.index}" value="${notice.noticeContent}" type="hidden"/>
		                    	<li>
									<div class="cosB">
										
										<span><fmt:formatDate value="${notice.noticeCreatTime}" pattern="yyyy-MM-dd HH:mm:ss" /></span>&nbsp;&nbsp; 
										<input type="hidden" data-id="${notice.noticeId}" />
										<button type="button" class="am-btn am-btn-xs am-btn-danger  am-round btn-close">
											<span class="am-icon-trash-o"> </span> 删除
										</button>
									</div>
									<div class="cosA" onclick="tanchuang1(${status.index})">
										<div class="task-checkbox">
											<input type="hidden" value="1" name="test"> 
											<input class="checkOne" type="checkbox" name="box" onclick="checkonebox()" value="${notice.noticeId}">
										</div>
										<a href="#">  
											<c:if test="${0 == notice.noticeType}"> 
												<span class="label label-sm label-success " style="display: block; float: left;">审核意见</span> 
											</c:if>
											<c:if test="${1 == notice.noticeType}"> 
												<span class="label label-sm label-danger" style="display: block; float: left;">审核通过</span>
											</c:if>
											<c:if test="${2 == notice.noticeType}"> 
												<span class="label label-sm label-warning " style="display: block; float: left;">文章推荐</span> 
											</c:if>
											
											<font color="82949a"> 
		                           				<span>&nbsp;&nbsp;你的文章：</span>
		                            			<span class="bold">《${fn:substring(notice.news.newsTitle,0,40)}<c:if test="${fn:length(notice.news.newsTitle)>40}">...</c:if>》</span>
			                           			<c:if test="${0 == notice.noticeType}"> 
			                           				<span>&nbsp;&nbsp;需要修改</span>
												</c:if>
												<c:if test="${1 == notice.noticeType}"> 
													<span>&nbsp;&nbsp;成功发布</span>
												</c:if>
												<c:if test="${2 == notice.noticeType}"> 
													<span>&nbsp;&nbsp;设为推荐</span>
												</c:if>	
											</font>
										</a>
									</div>
								</li>
							</c:forEach>
						</ul>
					</c:if>
					<c:if test="${empty page or page.totalCount <= 0}">
						<ul class="tpl-task-list tpl-task-remind" id="doc-modal-list">
							<li>
								无信息
							</li>
						</ul>
					</c:if>
					<div class="am-cf">
						<div class="am-fr">
							<ul class="am-pagination tpl-pagination">
								<li class="am-disabled">
									<a href="${ctx1}/backstage/notice?pageNum=${page.prePageNum}">«</a>
								</li>
								<c:forEach begin="1" end="${page.totalPageNum}" var="pageNum">
									<c:if test="${pageNum == page.currentPageNum}">
										<li class="am-active">
										<a href="${ctx1}/backstage/notice?pageNum=${pageNum}">${pageNum}</a></li>
									</c:if>
									<c:if test="${pageNum != page.currentPageNum}">
									<li><a href="${ctx1}/backstage/notice?pageNum=${pageNum}">${pageNum}</a></li>
									</c:if>
								</c:forEach>
								<li>
									<a href="${ctx1}/backstage/notice?pageNum=${page.nextPageNum}">»</a>
								</li>
							</ul>
						</div>
					</div>					
				</div>
			</form>
		</div>

	</div>
	<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
		<div class="am-modal-dialog">
			<div class="am-modal-bd" style="padding: 40px 10px">
				你，确定要删除这条记录吗？</div>
			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-cancel>取消</span> 
				<span class="am-modal-btn" data-am-modal-confirm>确定</span>
			</div>
		</div>
	</div>
	<script src="${ctx}/assets/js/jquery.min.js"></script>
	<script src="${ctx}/assets/js/xcConfirm.js"></script>
	<script src="${ctx}/assets/js/amazeui.min.js"></script>
	<script src="${ctx}/assets/js/iscroll.js"></script>
	<script src="${ctx}/assets/js/app.js"></script>
</body>

<script>
	// 弹窗
	function tanchuang1(status) {
		var content = $("#content"+status).val();
		window.wxc.xcConfirm(content);
	}

	//头部通知消息弹窗
	function sendsuc(e) {
		var txt = e.innerText;
		window.wxc.xcConfirm(txt);
	}

	//删除单个通知
	$('#doc-modal-list').find('.btn-close').on('click', function() {
		$('#my-confirm').modal({
			relatedTarget : this,
			onConfirm : function(options) {
				var $link = $(this.relatedTarget).prev('input');
				var id = $link.data('id');
				var msg = '你要删除的链接 ID 为 ' + $link.data('id');
				$.ajax({
					type:"post",
					url:"/News-Publishing-System/backstage/notice/deleteNotice",
					data : {
						noticeIds : id
					},
					success : function(data, status) {
						if (data != "0") {
							alert("删除成功！");
							window.location.href ="/News-Publishing-System/backstage/notice";
						}else{
							alert("删除出错！");
						}
					},
					error :function(){
						alert("删除出错！");
					}//
				});
			},
			// closeOnConfirm: false,
			onCancel : function() {
				alert('算求，不弄了');
			}
		});
	});
	
	//批量删除
	function deleteItem(){
		var count = 0;
		var ids = "";
		debugger;
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
				url:"/News-Publishing-System/backstage/notice/deleteNotice",
				data : {
					noticeIds : ids
				},
				success : function(data, status) {
					if (data != "0") {
						alert("删除成功！");
						window.location.href ="/News-Publishing-System/backstage/notice";
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
	
    function queryByType(type){     
         $("#typeSearch").attr('value',type);
         $("#formSubmit").submit();
    }
</script>

</html>