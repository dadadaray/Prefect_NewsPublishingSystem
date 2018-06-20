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
            <a href="javascript:;" class="tpl-logo">
                <img src="${ctx}/assets/img/logo.png" alt="">
            </a>
        </div>
        <div class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right">

        </div>

        <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

        <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

            <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">
              
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
                        <a href="${ctx1}/backstage/indexs" class="nav-link">
                            <i class="am-icon-home"></i>
                            <span>首页</span>
                        </a>
                    </li>
                    <li class="tpl-left-nav-item">
                        <a href="${ctx}/add_news.jsp" class="nav-link  tpl-left-nav-link-list">
                            <i class="am-icon-pencil-square"></i>
                            <span>添加新文章</span>
                        </a>
                    </li>
                     <li class="tpl-left-nav-item">
                        <a href="${ctx1}/backstage/notice" class="nav-link  tpl-left-nav-link-list">
                            <i class="am-icon-bell"></i>
                            <span>通知管理</span>
                        </a>
                    </li>
                    <li class="tpl-left-nav-item">
                        <a href="${ctx1}/backstage/draft/list" class="nav-link  tpl-left-nav-link-list active">
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
                                    <span>发表文章</span>
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
                                <a href="${ctx}/userinfo.jsp">
                                   <i class="am-icon-angle-right"></i>
                                    <span>个人资料</span>
                                </a>
                                <a href="${ctx}/re_userinfo.jsp">
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
<div class="tpl-content-wrapper">
    <div class="tpl-portlet-components">
        <div class="portlet-title">
            <div class="caption font-green bold">
               	 草稿箱列表
            </div>
            <div class="tpl-portlet-input tpl-fz-ml">
                <div class="portlet-input input-small input-inline">
                    <div class="input-icon right">
                        <i class="am-icon-search"></i>
                        <input type="text" class="form-control form-control-solid" placeholder="搜索..."> </div>
                    </div>
                </div>
            </div>
            <div class="am-g" id="doc-modal-list">
                <div class="tpl-table-images">
					<c:if test="${not empty page and page.totalCount > 0}">
						<c:forEach items="${page.list}" var="news" varStatus="status">                
		                    <div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
		                        <div class="tpl-table-images-content">
		                            <div class="tpl-table-images-content-i-time">创建时间：<span><fmt:formatDate value="${news.createTime}" pattern="yyyy-MM-dd HH:mm:ss" /></span></div>
		                            <div class="tpl-i-title">
		                            
		                                                                                               《${fn:substring(news.newsTitle, 0,10)} <c:if test="${fn:length(news.newsTitle)>10}">...</c:if>》
		                            </div>
		                            <a href="javascript:;" class="tpl-table-images-content-i">
		                                <div class="tpl-table-images-content-i-info">
		                                    <span class="ico">
		                                        <img src="${ctx1}/imgUp/${news.userInfo.headUrl}" alt="">${news.userInfo.loginUser.loginName}
		                                    </span>
		                                </div>
		                                <span class="tpl-table-images-content-i-shadow"></span>
		                                <img src="${ctx1}/newsImgUp/${news.coverImgUrl}" alt="" width="235px" height="137px">
		                            </a>
		                            <div class="tpl-table-images-content-block">
		                                <div class="tpl-i-font" style="height:25px;">
		                                	<c:if test="${not empty news.modFrees}">
		                                		<c:forEach items="${news.modFrees}" var="modFree">
		                                				${modFree.modFreeContent}
		                                		</c:forEach>
		                                	</c:if>
		                                	<c:if test="${not empty news.modBigImgs}">
		                                		<c:forEach items="${news.modBigImgs}" var="modBigImg" varStatus="status">
		                                			<c:if test="${status.index eq 0}">
		                                				${news.bigImgContent}
		                                			</c:if>
		                                		</c:forEach>
		                                	</c:if>
		                                	<c:if test="${not empty news.modVedios}">
		                                		<c:forEach items="${news.modVedios}" var="modVedio">
		                                				${modVedio.modVedioContent}
		                                		</c:forEach>
		                                	</c:if>
		                                	<c:if test="${not empty news.modAudios}">
		                                		<c:forEach items="${news.modAudios}" var="modAudio">
		                                				${modAudio.modAudioContent}
		                                		</c:forEach>
		                                	</c:if>
		                                	<c:if test="${not empty news.modMixCenters}">
		                                		<c:forEach items="${news.modMixCenters}" var="modMixCenter">
		                                				${modMixCenter.mMixCenterContentOne}
		                                		</c:forEach>
		                                	</c:if>
		                                	<c:if test="${not empty news.modMixLRs}">
		                                		<c:forEach items="${news.modMixLRs}" var="modMixLR">
		                                				${modMixLR.mMixLRContentOne}
		                                		</c:forEach>
		                                	</c:if>
		                                	<c:if test="${not empty news.modMixSingles}">
		                                		<c:forEach items="${news.modMixSingles}" var="modMixSingle">
		                                				${modMixSingle.mMixSingleContentOne}
		                                		</c:forEach>
		                                	</c:if>
		                                </div>
		                                <div class="tpl-i-more">
		                                    <ul>
		                                    </ul>
		                                </div>
		                                <div class="row">
		                                    <button onclick="edit(${news.newsId})" class="am-u-xs-6 am-u-md-6 am-u-sm-6 am-btn am-btn-default am-btn-xs am-btn-secondary"><span class="am-icon-edit"></span> 编辑</button>
		                                    <input type="hidden" data-id="${news.newsId}"/>
		                                    <button type="button" class="am-u-lg-6 am-u-md-6 am-u-sm-6 am-btn am-btn-default am-btn-danger am-btn-xs btn-close"><span class="am-icon-trash-o"></span> 删除</button>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
						</c:forEach>
					</c:if>
            		<c:if test="${empty page or page.totalCount <= 0}">
						<div class="am-u-sm-12 am-u-md-6 am-u-lg-4">
								无信息
						</div>
					</c:if>					
                    <div class="am-u-lg-12">
                        <div class="am-cf">

                            <div class="am-fr">
                                <ul class="am-pagination tpl-pagination">
                                    <li class="am-disabled"><a href="${ctx1}/backstage/draft/list?pageNum=${page.prePageNum}">«</a></li>
                                    <c:forEach begin="1" end="${page.totalPageNum}" var="pageNum">
										<c:if test="${pageNum == page.currentPageNum}">
											<li class="am-active">
											<a href="${ctx1}/backstage/draft/list?pageNum=${pageNum}">${pageNum}</a></li>
										</c:if>
										<c:if test="${pageNum != page.currentPageNum}">
										<li><a href="${ctx1}/backstage/draft/list?pageNum=${pageNum}">${pageNum}</a></li>
										</c:if>
									</c:forEach>
                                    <li><a href="${ctx1}/backstage/draft/list?pageNum=${page.nextPageNum}">»</a></li>
                                </ul>
                            </div>
                        </div>
                        <hr>
                    </div>

                </div>

            </div>
        </div>
        <div class="tpl-alert"></div>
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
				url:"/News-Publishing-System/backstage/news/delete",
				data : {
					newsIds : id,
				},
				success : function(data, status) {
					if (data != "0") {
						alert("删除成功！");
						window.location.href ="/News-Publishing-System/backstage/draft/list";
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

    //弹窗
    function sendsuc(e){
        var txt=e.innerText;
        window.wxc.xcConfirm(txt);
    }
    
    //查看
    function edit(newsId){
        window.open("${ctx1}/backstage/news/openEdit?newsId=" + newsId);
    }
</script>
</body>

</html>