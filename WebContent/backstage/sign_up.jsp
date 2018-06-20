<%@ page language="java" contentType="text/html;	charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx1" value="${pageContext.request.contextPath}"></c:set>
<c:set var="ctx" value="${pageContext.request.contextPath}/backstage"></c:set>
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
<!--密码md5加密 start-->
<script type="text/javascript" src="${ctx1}/layout/js/md5.js"></script>
<!--密码md5加密 end-->
</head>

<body data-type="login">

	<div class="am-g myapp-login">
		<div class="myapp-login-logo-block  tpl-login-max">
			<div class="myapp-login-logo-text">
				<div class="myapp-login-logo-text">
					新闻天下<span> 发布系统</span> <img src="${ctx}/assets/img/logo_sx.png" width="20%">
				</div>
			</div>

			<div class="login-font">
				<a href="${ctx}/login.jsp"><span> 登 陆</span></a> or <i>注 册 </i>
			</div>
			<div class="am-u-sm-10 login-am-center">
				<form class="am-form" action="${ctx1}/backstageLoginUser/register" id="form11" target="" method="post">
					<fieldset>

						<div class="am-form-group">
							<input type="text" class="" id="doc-ipt-name-1" name="username" placeholder="输入用户名" required>
						</div>
						<div class="am-form-group">
							<input type="email" style="border-radius: 0px;" id="doc-vld-email-1" name="emint" placeholder="输入电子邮件" required>
						</div>
						<div class="am-form-group">
							<input type="password" class="repassone" id="doc-ipt-pwd-2" name="passone" placeholder="输入密码" required>
						</div>
						<div class="am-form-group">
							<input type="password" class="sign_passtwo" id="doc-ipt-pwd-1" name="passtwo" placeholder="重复输入密码" required>
						</div>
						<div class="warninfo">
							<div class="am-alert am-alert-danger warnred" data-am-alert>
								<button type="button" class="am-close">&times;</button>
								<p>两次输入的密码不一致。</p>
							</div>
						</div>
						<div class="reexit">
							<div class="am-alert am-alert-danger warnred" data-am-alert>
								<button type="button" class="am-close">&times;</button>
								<p>账号已存在，请重新输入！</p>
							</div>
						</div>
						<iframe name='frameFile' style='display: none;'></iframe>
						<p>
							<button onclick="recili()" id="backstageRegist" type="submit" class="am-btn am-btn-default tijiao"  style="background:#53d192;color:#fff;font-size:16px;border-radius:5px;">确定</button>
						</p>
					</fieldset>
				</form>
			</div>
		</div>
	</div>

	<script src="${ctx}/assets/js/jquery.min.js"></script>
	<script src="${ctx}/assets/js/amazeui.min.js"></script>
	<script src="${ctx}/assets/js/app.js"></script>
</body>
<!-- 回车登陆 -->
<script type="text/javascript">
	$(document).keyup(function(e) {
		if (e.keyCode == 13) {
			$("#backstageRegist").click();
		}
	});
function recili(){
	var md5 = new MD5();
	var f = '......' == $('.repassone').val() ? '' : md5
			.MD5($('.repassone').val());
	$('.repassone').val(f);
	var fr = '......' == $('.sign_passtwo').val() ? ''
			: md5.MD5($('.sign_passtwo').val());
	$('.sign_passtwo').val(fr);

  }
	
    
    
	
</script>

</html>