<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>

<head>
<title>新闻天下 - 注册</title>

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

<!-- PrettyPhoto
 start -->
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



<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body>
	<div class="wrapper sticky_footer">
		<!-- head -->
		<%@ include file="head.jsp"%>
        
        <!-- CONTENT BEGIN -->
        <div id="content" class="">
        	<div class="inner">
                <div class="general_content">
                    <div class="main_content">
                        <div class="block_breadcrumbs">
                            <div class="text"><p>当前位置：</p></div>
                            
                            <ul>
                                <li><a href="index.jsp">首页</a></li>
                                <li>注册</li>
                            </ul>
                        </div>
                        <div class="separator" style="height:28px;"></div>
                        
                        <p class="general_title"><span>用 户 注 册</span></p>
                        <div class="separator" style="height:39px;"></div>
                        
                        <div class="block_registration">
                        <!-- action="${ctx}/../loginUser/register" method="post" -->
                            <form  class="w_validation" id="signupForm" action="${ctx}/loginUser/register" method="post">
                              <div class="login-error"></div>
                                <div class="col_1">
                                    <div class="label"><p>用户名：<span>*</span></p></div>
                                    <div class="field"><input type="text" class="req" name="name" id="name"/></div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:14px;"></div>
                                    
                                    <div class="label"><p>邮箱：<span>*</span></p></div>
                                    <div class="field"><input type="text" class="req" name="email" id="email"/></div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:12px;"></div>


                                </div>
                                
                                <div class="col_2">
                                    <div class="label"><p>密码：<span>*</span></p></div>
                                    <div class="field"><input type="password" class="req" name="password" id="password"/></div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:14px;"></div>
                                    
                                    <div class="label"><p>确认密码：<span>*</span></p></div>
                                    <div class="field"><input type="password" class="req" name="passwordAgain" id="passwordAgain"/></div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:12px;"></div>
                                </div>
                                
                                <div class="clearboth"></div>
                                <div class="separator" style="height:32px;"></div>
                                <p class="info_text">
                                 <!-- <a  id="submitLogin" style="background:#f54a2f;padding:5px 15px; color:#fff;font-size:16px; border-radius:5px;  text-decoration:none;cursor: pointer;" >注册</a> -->
                                <input id="submit" type="submit" value="注册" onclick="validate()" style="cursor: pointer;"/>
                            </form>
                            <p class="info_text"> 已有帐号,请<a href="#login" class="open_popup" style="color:red;" >登录</a></p>
                            
                        </div>
                        
                        <div class="line_3" style="margin:42px 0px 0px;"></div>
                        
                    </div>
                    <div class="clearboth"></div>
                </div>
            </div>
        </div>
        <!-- CONTENT END -->
        
		<!-- footer -->
		<%@ include file="footer.jsp"%>   
		
    </div>
<!-- 加载图片显示 -->
<div class="loading">
    <div class="mask">
        <div class="loading-img">
        <img src="${ctx }/layout/images/loading.gif" width="31" height="31">
        </div>
    </div>
</div>
</body>
<!-- 回车登陆 -->
<script type="text/javascript">
    $(document).keyup(function(e) {
        if (e.keyCode == 13) {
            $("#submit").click();
            $('.loading').hide();
        }
    });
    
	function validate() {
		var md5 = new MD5();
		var f = '......' == $(
				'#password')
				.val() ? ''
				: md5
						.MD5($(
								'#password')
								.val());
		$('#password').val(
				f);
		var f1 = '......' == $(
		'#passwordAgain')
		.val() ? ''
		: md5
				.MD5($(
						'#passwordAgain')
						.val());
$('#passwordAgain').val(
		f1);
		$('#signupForm')
				.submit();
	$('.loading').show();
	}
</script>

</html>