<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx1" value="${pageContext.request.contextPath}/backstage"></c:set>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>

<head>
<title>新闻天下 - 登录</title>

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

<!--密码md5加密 start-->
<script type="text/javascript" src="${ctx}/layout/js/md5.js"></script>
<!--密码md5加密 end-->

<!--登录表单验证 start-->
<script type="text/javascript" src="${ctx}/layout/js/jquery.validate.js"></script>
<script type="text/javascript" src="${ctx}/layout/js/jquery.i18n.properties-1.0.9.js" ></script>
<script type="text/javascript" src="${ctx}/layout/js/page_login.js?lang=zh" id="url"
    data="<%= request.getHeader("REFERER")%>"></script>
<!--登录表单验证 start-->


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
                                <li><a href="${ctx}/index.jsp">首页</a></li>
                                <li>登录</li>
                            </ul>
                        </div>
                        <div class="separator" style="height:28px;"></div>
                        
                        <p class="general_title"><span>用 户 登 录</span></p>
                        <div class="separator" style="height:39px;"></div>
                        
                        <div class="block_registration">
                            <form  class="w_validation" id="signupFormLogin">
                                <div class="col_1">
                                    <div class="label"><p>用户名/电子邮箱：<span>*</span></p></div>
                                    <div class="field"><input type="text" class="req" name="loginName" id="loginName"/></div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:14px;"></div>
                                    
                                    <div class="label"><p>验证码：<span>*</span></p></div>
                                    <div class="field"><input type="text" name="codeValue" id="codeValue"></div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:12px;"></div>


                                </div>
                                
                                <div class="col_2">
                                    <div class="label"><p>密码：<span>*</span></p></div>
                                    <div class="field"><input type="password" class="req" name="password" id="password"/></div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:14px;"></div>
                                    
                                    <div class="separator" style="height:100%;"><img src="${ctx }/MakeCodeServlet" width="150px" height="28px" style="float:left;" /></div>
                                    <div class="clearboth"></div>
                                    <div class="separator" style="height:12px;"></div>
                                </div>
                                <div class="login-error"></div>
                                <div class="clearboth"></div>
                                <div class="separator" style="height:32px;"></div>
                                <p class="info_text">
									<!--  <input type="submit" class="general_button" value="登 录" id="submitlogin" />-->
									  <a  id="submitlogin" style="background:#f54a2f;padding:5px 15px; color:#fff;font-size:14px; border-radius:5px;  text-decoration:none;cursor: pointer;">登陆</a>
									  <a  href="${ctx1}/login.jsp" style="padding:5px 15px; font-size:14px; border-radius:5px;  text-decoration:none;cursor: pointer;">记者登陆</a>
								</p>
                            </form>
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
    <!-- 分享 -->
    <div class="fenxiang">
		<div id="bdshare">
			<div class="bdsharebuttonbox"  data-tag="share_1">
				<a href="javascript:void(0)"  class="bds_more"  data-cmd="more" target="_blank;"></a>
				<a href="javascript:void(0)" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
				<a href="javascript:void(0)" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
				<a href="javascript:void(0)" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
				<a href="javascript:void(0)" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
			</div>
			<script>
			window._bd_share_config={
					"common":{
						"bdSnsKey":{},
						"bdText":"这是分享内容哦！",
						"bdDesc":"分享页哈",
						"bdUrl":"http://www.baidu.com",
						"bdMini":"2",
						"bdPic":"",
						"bdStyle":"0",
						"bdSize":"16"},
						"share":{},
						"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],
						"viewText":"分享到：","viewSize":"16"},
						"selectShare":{"bdContainerClass":null,
						"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
			</script>
		</div>
	</div> 
	

    <div class="loading">
        <div class="mask">
            <div class="loading-img">
            <img src="${ctx}/images/loading.gif" width="31" height="31">
            </div>
        </div>
    </div>
</body>
<!-- 回车登陆 -->
<script type="text/javascript">
    $(document).keyup(function(e) {
        if (e.keyCode == 13) {
            $("#submit1").click()
        }
    });
</script>

</html>
