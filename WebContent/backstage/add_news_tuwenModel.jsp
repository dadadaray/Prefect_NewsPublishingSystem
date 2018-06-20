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
    <link rel="stylesheet" href="${ctx}/assets/css/iconfont.css">
    <link rel="stylesheet" href="${ctx}/assets/css/fileUpload.css"> 
    <link rel="stylesheet" href="${ctx}/assets/css/xcConfirm.css">
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


        <div class="tpl-left-nav tpl-left-nav-hover">
            <div class="tpl-left-nav-list">
                <ul class="tpl-left-nav-menu">
                    <li class="tpl-left-nav-item">
                        <a href="${ctx1}/backstage/indexs" class="nav-link">
                            <i class="am-icon-home"></i>
                            <span>首页</span>
                        </a>
                    </li>
                    <li class="tpl-left-nav-item">
                        <a href="${ctx}/add_news.jsp" class="nav-link  tpl-left-nav-link-list active">
                            <i class="am-icon-edit"></i>
                            <span>添加新文章</span>
                        </a>
                    </li>
                     <li class="tpl-left-nav-item">
                        <a href="${ctx1}/backstage/notice" class="nav-link  tpl-left-nav-link-list">
                            <i class="am-icon-bell-o"></i>
                            <span>通知管理</span>
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
            <div class="row">
                <div class="am-u-md-10 am-u-sm-12 row-mb" style="width:100%; margin-bottom: 5px;">
                    <div class="tpl-portlet" style="margin-bottom:10px;overflow:hidden;">
                        <div class="caption font-green bold" style="float:left;">
                            <span class="am-icon-file-text-o">&nbsp;&nbsp;选择模板</span> 
                        </div>
                        <div class="am-btn-group" style="float:left;">
                            <a href="${ctx}/add_news.jsp" class="am-btn am-btn-secondary am-radius" style="margin-left:20px;">图文自由排版</a>
                            <a href="${ctx}/add_news_img.jsp"class="am-btn am-btn-secondary am-radius" style="margin-left:10px;">大图轮播</a>
                            <a href="${ctx}/add_news_vedio.jsp" class="am-btn am-btn-secondary am-radius" style="margin-left:10px;">视频专题</a>
                            <a href="${ctx}/add_news_audio.jsp"class="am-btn am-btn-secondary am-radius" style="margin-left:10px;">音频专题</a>
                            <a  href="${ctx}/add_news_tuwenModel.jsp" class="am-btn am-btn-primary am-radius" style="margin-left:10px;">图文模板</a>
                        </div>                    
                    </div>
                    
                    <div class="tpl-portlet" style="overflow: hidden;">
                        <div class="tpl-table-images" style="overflow: hidden;">
                           <div class="am-u-sm-12 am-u-md-4 am-u-lg-4" style="float: left">
                                <div class="tpl-table-images-content" style="margin-bottom: 1px; padding: 10px;">
                                    <a href="${ctx}/add_news_tuwenModel2.jsp" class="tpl-table-images-content-i">
                                        <div class="tpl-table-images-content-i-info">
                                        </div>
                                        <img src="${ctx}/assets/img/model1.png" alt="">
                                    </a>
                                    <div class="tpl-table-images-content-block" style="height: 10px;">
                                        <hr>
                                    </div>
                                    <div class="tpl-table-images-content-block" style="height: 30px;">
                                        <!-- 名称 与预览按钮  -->
                                        <h3 style="text-align: center; float: left;">模板一</h3>
                                        <a href="${ctx1}/news_post_style1_eye.jsp" style="float: right;">预览</a>
                                    </div>
                                </div>

                           </div>
                            <div class="am-u-sm-12 am-u-md-4 am-u-lg-4" style="float: left">
                                <div class="tpl-table-images-content" style="margin-bottom: 1px; padding: 10px;">
                                    <a href="${ctx}/add_news_tuwenModel1.jsp" class="tpl-table-images-content-i">
                                        <div class="tpl-table-images-content-i-info">

                                        </div>
                                        <span class=""></span>
                                        <img src="${ctx}/assets/img/model2.png" alt="">
                                    </a>
                                    <div class="tpl-table-images-content-block" style="height: 10px;">
                                        <hr>
                                    </div>
                                    <div class="tpl-table-images-content-block" style="height: 30px;">
                                        <!-- 名称 与预览按钮  -->
                                        <h3 style="text-align: center; float: left;">模板二</h3>
                                        <a href="${ctx1}/news_post_style2_eye.jsp" style="float: right;">预览</a>   
                                    </div>
                                </div>
                            </div>
                            <div class="am-u-sm-12 am-u-md-4 am-u-lg-4" style="float: left">
                                <div class="tpl-table-images-content" style="margin-bottom: 1px; padding: 10px;">
                                    <a href="${ctx}/add_news_tuwenModel3.jsp" class="tpl-table-images-content-i">
                                        <div class="tpl-table-images-content-i-info">
                                        </div>
                                        <span class=""></span>
                                        <img src="${ctx}/assets/img/model3.png" alt="">
                                    </a>
                                    <div class="tpl-table-images-content-block" style="height: 10px;">
                                        <hr>
                                    </div>
                                    <div class="tpl-table-images-content-block" style="height: 30px;">
                                        <!-- 名称 与预览按钮  -->
                                        <h3 style="text-align: center; float: left;">模板三</h3>
                                        <a href="${ctx1}/news_post_style3_eye.jsp" style="float: right;">预览</a>
                            
                                       
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
<script type="text/javascript" src="${ctx}/assets/js/fileUpload.js"></script>
<script src="${ctx}/assets/js/echarts.min.js"></script>
<!--富文本js-->
<script language="javascript" type="text/javascript" src="${ctx}/assets/js/tinymce/tinymce.js"></script>
<script type="text/javascript">
    //弹窗
    function sendsuc(e){
        var txt=e.innerText;
        window.wxc.xcConfirm(txt);
    }
</script>
</body>

</html>










