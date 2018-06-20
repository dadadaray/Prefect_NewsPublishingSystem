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
	<%
		if (session.getAttribute("page") == null) {
			request.getRequestDispatcher("backstage/indexs").forward(request, response);
		}
	%>

    <header class="am-topbar am-topbar-inverse admin-header">
        <div class="am-topbar-brand">
            <a href="javascript:;" class="tpl-logo">
                <img src="${ctx}/assets/img/logo.png" alt="">
            </a>
        </div>
        <div class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right">

        </div>

        <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

        <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

            <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">
                <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                	 <a class="am-dropdown-toggle tpl-header-list-link" href="">
                		<c:if test="${not empty page and page.totalCount > 0}">
	                        <span class="am-icon-bell-o"></span> 提醒 <span class="am-badge tpl-badge-success am-round">${page.totalCount}</span>
	                	</c:if>
	                	<c:if test="${empty page or page.totalCount <= 0}">
	                		<span class="am-icon-bell-o"></span> 提醒
	                	</c:if>
	                 </a>
	                
                   	 <ul class="am-dropdown-content tpl-dropdown-content">
                   		<c:if test="${not empty page and page.totalCount > 0}">
                        	<li class="tpl-dropdown-content-external">
                            	<h3>你有 <span class="tpl-color-success">${page.totalCount}</span> 条消息</h3>
                            	<a href="${ctx1}/backstage/notice" class="font-green">全部</a>
                            </li>
                           	<c:forEach items="${page.list}" var="notice" varStatus="status1">
                           		<input id="content${status1.index+1}" value="${notice.noticeContent}" type="hidden"/>
	                            <li class="tpl-dropdown-list-bdbc" onclick="tanchuang1(${status1.index+1})">
	                              <a href="#" class="tpl-dropdown-list-fl">
	                              	<c:if test="${0 == notice.noticeType}"> 
	                                	<span class="am-icon-btn am-icon-bell-o tpl-dropdown-ico-btn-size tpl-badge-danger"></span> 
	                                </c:if>
	                                <c:if test="${1 == notice.noticeType}"> 
	                                	<span class="am-icon-btn am-icon-bell-o tpl-dropdown-ico-btn-size tpl-badge-success"></span>
	                                </c:if>
	                                <c:if test="${2 == notice.noticeType}"> 
	                                	<span class="am-icon-btn am-icon-bell-o tpl-dropdown-ico-btn-size tpl-badge-warning"></span> 
	                                </c:if>
	                                <span>你的文章：《${fn:substring(notice.news.newsTitle,0,10)}<c:if test="${fn:length(notice.news.newsTitle)>10}">...</c:if>》</span>
                           			<c:if test="${0 == notice.noticeType}"> 
                           				<span>需要修改</span>
									</c:if>
									<c:if test="${1 == notice.noticeType}"> 
										<span>成功发布</span>
									</c:if>
									<c:if test="${2 == notice.noticeType}"> 
										<span>设为推荐</span>
									</c:if>		                                
	                              </a>
	                                <span class="tpl-dropdown-list-fr"><fmt:formatDate value="${notice.noticeCreatTime}" pattern="yyyy/MM/dd hh:mm" /></span>
	                            </li>
                            </c:forEach>
                           </c:if>
	                       <c:if test="${empty page or page.totalCount <= 0}">
	                       	<li class="tpl-dropdown-content-external">
	                       		<h3>无消息</h3>
	                       	</li>
	                       </c:if>
                       </ul>
                   </li>
                <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen" class="tpl-header-list-link"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>

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
        <div class="tpl-left-nav tpl-left-nav-hover"><!-- 列表 -->
            <div class="tpl-left-nav-list">
                <ul class="tpl-left-nav-menu">
                    <li class="tpl-left-nav-item">
                        <a href="${ctx1}/backstage/index" class="nav-link active">
                            <i class="am-icon-home"></i>
                            <span>首页</span>
                        </a>
                    </li>
                    <li class="tpl-left-nav-item">
                        <a href="add_news.jsp" class="nav-link  tpl-left-nav-link-list">
                            <i class="am-icon-pencil-square"></i>
                            <span>添加新文章</span>
                        </a>
                    </li>
                     <li class="tpl-left-nav-item">
                        <a href="${ctx1}/backstage/notice" class="nav-link  tpl-left-nav-link-list">
                            <i class="am-icon-bell"></i>
                            <span>通知管理</span>
                            <i class="tpl-left-nav-content tpl-badge-danger">
                            <c:if test="${0 != page.totalCount}">
                            	${page.totalCount}
                            </c:if>
                           </i>
                        </a>
                    </li>
                    <li class="tpl-left-nav-item">
                        <a href="${ctx1}/backstage/draft/list" class="nav-link  tpl-left-nav-link-list">
                            <i class="am-icon-inbox"></i>
                            <span>草稿箱</span>
                        </a>
                    </li>
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
                    <li class="tpl-left-nav-item">
                        <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
                            <i class="am-icon-user"></i>
                            <span>个人中心</span>
                            <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
                        </a>
                        <ul class="tpl-left-nav-sub-menu">
                            <li>
                                <a href="userinfo.jsp">
                                   <i class="am-icon-angle-right"></i>
                                    <span>个人资料</span>
                                </a>
                                <a href="re_userinfo.jsp">
                                   <i class="am-icon-angle-right"></i>
                                    <span>完善信息</span>
                                 </a>

                                <a href="${ctx1}/backstage/logOut">
                                    <i class="am-icon-angle-right"></i>
                                    <span>退出登录</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>

        <div class="tpl-content-wrapper"><!-- 内容 -->
            <div class="row"><!-- 快捷按钮 -->
                <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">
                    <div class="dashboard-stat blue">
                        <div class="visual">
                            <i class="am-icon-comments-o"></i>
                        </div>
                        <div class="details">
                            <div class="number"> 1349 </div>
                            <div class="desc"> 已发布文章 </div>
                        </div>
                        <a class="more" href="all_news.jsp"> 详情查看
                            <i class="m-icon-swapright m-icon-white"></i>
                        </a>
                    </div>
                </div>
                <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">
                    <div class="dashboard-stat red">
                        <div class="visual">
                            <i class="am-icon-bar-chart-o"></i>
                        </div>
                        <div class="details">
                            <div class="number"> 56 </div>
                            <div class="desc"> 审核中文章 </div>
                        </div>
                        <a class="more" href="all_news_checking.jsp"> 详情查看
                            <i class="m-icon-swapright m-icon-white"></i>
                        </a>
                    </div>
                </div>
                <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">
                    <div class="dashboard-stat green">
                        <div class="visual">
                            <i class="am-icon-apple"></i>
                        </div>
                        <div class="details">
                            <div class="number"> 3 </div>
                            <div class="desc"> 草稿箱文章 </div>
                        </div>
                        <a class="more" href="draft.jsp"> 查看更多
                            <i class="m-icon-swapright m-icon-white"></i>
                        </a>
                    </div>
                </div>
                <div class="am-u-lg-3 am-u-md-6 am-u-sm-12">
                    <div class="dashboard-stat purple">
                        <div class="visual">
                            <i class="am-icon-android"></i>
                        </div>
                        <div class="details">
                            <div class="add"> + </div>
                            <div class="desc"> 添加新文章 </div>
                        </div>
                        <a class="more" href="add_news.jsp"> 查看更多
                            <i class="m-icon-swapright m-icon-white"></i>
                        </a>
                    </div>
                </div>
            </div>

            <div class="tpl-portlet-components"><!-- 快捷通知 -->
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-bell-o"> 快捷通知</span>
                    </div>
                    <div class="tpl-portlet-input tpl-fz-ml">
                        <div class="portlet-input input-small input-inline">
                            <div class="input-icon right">
                                <i class="am-icon-search"></i>
                                <input type="text" class="form-control form-control-solid" placeholder="搜索..."> </div>
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
			                         	<input type="hidden" data-id="${notice.noticeId}"/>
			                         	<button type="button" class="am-btn am-btn-xs am-btn-danger  am-round btn-close">
			                          		<span class="am-icon-trash-o"></span> 删除
			                        	</button>
		                       		</div>
		                       		<div class="cosA" onclick="tanchuang1(${status.index})">
		                          		<a href="#">
		                           			<c:if test="${0 == notice.noticeType}"> 
												<span class="label label-sm label-success">审核意见</span> 
											</c:if>
											<c:if test="${1 == notice.noticeType}"> 
												<span class="label label-sm label-danger">审核通过</span>
											</c:if>
											<c:if test="${2 == notice.noticeType}"> 
												<span class="label label-sm label-warning">文章推荐</span> 
											</c:if>
		                           			<font color="82949a">
		                           				<span>&nbsp;&nbsp;你的文章：</span>
		                            			<span class="bold">《${fn:substring(notice.news.newsTitle,0,30)}<c:if test="${fn:length(notice.news.newsTitle)>30}">...</c:if>》</span>
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
									<a href="${ctx1}/backstage/indexs?pageNum=${page.prePageNum}">«</a>
								</li>
								<c:forEach begin="1" end="${page.totalPageNum}" var="pageNum">
									<c:if test="${pageNum == page.currentPageNum}">
										<li class="am-active">
										<a href="${ctx1}/backstage/indexs?pageNum=${pageNum}">${pageNum}</a></li>
									</c:if>
									<c:if test="${pageNum != page.currentPageNum}">
									<li><a href="${ctx1}/backstage/indexs?pageNum=${pageNum}">${pageNum}</a></li>
									</c:if>
								</c:forEach>
								<li>
									<a href="${ctx1}/backstage/indexs?pageNum=${page.nextPageNum}">»</a>
								</li>
							</ul>
						</div>
					</div>	
             	</div>
             </div>
         </div>
    <div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
      <div class="am-modal-dialog">
        <div class="am-modal-bd" style="padding:40px 10px">
          	你，确定要删除这条记录吗？
        </div>
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
<script type="text/javascript">
	// 弹窗
	function tanchuang1(status) {
		var content = $("#content"+status).val();
		window.wxc.xcConfirm(content);
	}
    //删除
    $('#doc-modal-list').find('.btn-close').on('click', function() {
        $('#my-confirm').modal({
          relatedTarget: this,
          onConfirm: function(options) {
            var $link = $(this.relatedTarget).prev('input');
            var id = $link.data('id');
            var msg =  '你要删除的链接 ID 为 ' + $link.data('id');
			$.ajax({
				type:"post",
				url:"{ctx1}/backstage/notice/deleteNotice",
				data : {
					noticeIds : id,
				},
				success : function(data, status) {
					if (data != "0") {
						alert("删除成功！");
						window.location.href ="{ctx1}/backstage/indexs";
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
          onCancel: function() {
            alert('算求，不弄了');
          }
        });
    });

</script>
</body>

</html>