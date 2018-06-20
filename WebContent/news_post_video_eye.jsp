<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<c:set var="ctx1" value="${pageContext.request.contextPath}/backstage"></c:set>

<!DOCTYPE html>
<html>

<head>
<title>新闻天下</title>

<meta name="keywords" content="" />
<meta name="description" content="" />

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width" />
<link rel="icon" type="image/png" href="${ctx}/layout/images/favicon.png">

<!--[if lt IE 9]>
<script type="text/javascript" src="layout/plugins/html5.js"></script>
<![endif]-->

<link rel="stylesheet" href="${ctx}/layout/style.css" type="text/css" />

<script type="text/javascript" src="${ctx}/layout/js/jquery.js"></script>

<!-- PrettyPhoto start -->
<link rel="stylesheet" href="${ctx}/layout/plugins/prettyphoto/css/prettyPhoto.css" type="text/css" />
<script type="text/javascript" src="${ctx}/layout/plugins/prettyphoto/jquery.prettyPhoto.js"></script>
<!-- PrettyPhoto end -->

<!-- jQuery tools start -->
<script type="text/javascript" src="${ctx}/layout/plugins/tools/jquery.tools.min.js"></script>
<!-- jQuery tools end -->

<!-- Calendar start -->
<link rel="stylesheet" href="${ctx}/layout/plugins/calendar/calendar.css" type="text/css" />
<script type="text/javascript" src="${ctx}/layout/plugins/calendar/calendar.js"></script>
<!-- Calendar end -->

<!-- ScrollTo start -->
<script type="text/javascript" src="${ctx}/layout/plugins/scrollto/jquery.scroll.to.min.js"></script>
<!-- ScrollTo end -->

<!-- MediaElements start -->
<link rel="stylesheet" href="${ctx}/layout/plugins/video-audio/mediaelementplayer.css" />
<script src="${ctx}/layout/plugins/video-audio/mediaelement-and-player.js"></script>
<!-- MediaElements end -->

<!-- FlexSlider start -->
<link rel="stylesheet" href="${ctx}/layout/plugins/flexslider/flexslider.css" type="text/css" />
<script type="text/javascript" src="${ctx}/layout/plugins/flexslider/jquery.flexslider-min.js"></script>
<!-- FlexSlider end -->

<!-- iButtons start -->
<link rel="stylesheet" href="${ctx}/layout/plugins/ibuttons/css/jquery.ibutton.css" type="text/css" />
<script type="text/javascript" src="${ctx}/layout/plugins/ibuttons/lib/jquery.ibutton.min.js"></script>
<!-- iButtons end -->

<!-- jQuery Form Plugin start -->
<script type="text/javascript" src="${ctx}/layout/plugins/ajaxform/jquery.form.js"></script>
<!-- jQuery Form Plugin end -->

<script type="text/javascript" src="${ctx}/layout/js/main.js"></script>

<!--注册表单验证 start-->
<script type="text/javascript" src="${ctx}/layout/js/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}/layout/js/page_regist.js?lang=zh"></script>
<script type="text/javascript" src="${ctx}/layout/js/jquery.i18n.properties-1.0.9.js" ></script>
<!--注册表单验证 end-->

<!--密码md5加密 start-->
<script type="text/javascript" src="${ctx}/layout/js/md5.js"></script>
<!--密码md5加密 end-->

<!--登录表单验证 start-->
<script type="text/javascript"
    src="${ctx}/layout/js/page_login.js?lang=zh" id="url"
    data="<%= request.getHeader("REFERER")%>"></script>
<!--登录表单验证 start-->


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body>
	<div class="wrapper sticky_footer">
		<!-- head -->
		<%@ include file="head.jsp"%>
        
        <!-- CONTENT BEGIN -->
        <div id="content" class="right_sidebar ">
        	<div class="inner">
            	<div class="general_content">
                    <div class="main_content" id="con_eye">
                       
                        <article class="block_single_news">
                            <p class="title">
                                <h1>${title}</h1>
                            </p>

                            <div class="info">
                                <div class="date">
	                                <p><fmt:formatDate value="${videoViewCurrentTime}" pattern="yyyy-MM-dd" /></p>
                                </div>
                                <div class="author"><p>作者: <a href="#">${bloginUser.loginName}</a></p></div>

                                <div class="r_part">
                                    <a href="#" class="views">0</a>
                                    <a href="#" class="comments">0</a>
                                </div>
                            </div>

                            <div class="content">
                            
	                            <div class="block_video">
	                              	<video width="612" height="344" poster="${ctx}/preViewVideo/${preVideoCoverF}" controls="controls">
										<source src="${ctx}/preViewVideo/${preVideoF1}" type="video/ogg">
										<source src="${ctx}/preViewVideo/${preVideoF1}" type="video/mp4">
										<source src="${ctx}/preViewVideo/${preVideoF1}" type="video/webm">
										<object data="${ctx}/preViewVideo/${preVideoF1}" width="612" height="344"> </object>
									</video>
	                            </div>
	                            <div class="tpl-i-font">
									${textarea}
								</div>
                            </div>
                        </article>
                        <div class="separator" style="height:4px;"></div>
                        <div class="block_post_tags">
                            <p>标签: <a href="#">${selectmod}</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    	<!-- CONTENT END -->
    </div>

</body>

<script type="text/javascript">

    <!-- 回车登陆 -->
    $(document).keyup(function(e) {
        if (e.keyCode == 13) {
            $("#submit1").click()
        }
    });
    
    
    /*点赞，点击变换图片*/
    function toggle(){
        debugger;
        var xihuan_change = $('#xihuan_change');
        var val = xihuan_change.attr("src").indexOf('2');
          
        if(val >= 0){
            $('#xihuan_change').attr('src', 'layout/images/xihuan1.png');  
        }else{
            $('#xihuan_change').attr('src', 'layout/images/xihuan2.png');  
        }
    }
</script>
</html>