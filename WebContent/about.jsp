<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
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



<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body>
	<div class="wrapper sticky_footer">
		<!-- head -->
		<%@ include file="head.jsp"%>
        
        <!-- CONTENT BEGIN -->
        <div id="content" class="right_sidebar">
        	<div class="inner">
            	<div class="general_content">
                	<div class="main_content">
                        <div class="block_breadcrumbs">
                            <div class="text"><p>当前位置:</p></div>
                            
                            <ul>
                                <li><a href="${ctx}/index.jsp">首页</a></li>
                                <li>关于我们</li>
                            </ul>
                        </div>
                        <div class="separator" style="height:30px;"></div>
                        
                        <h2>新闻天下网站</h2>
                        
                        <p class="general_subtitle">
它是一个集新闻发布、新闻浏览与一体的响应式网站，记者们在后台用模板实现一键发布新闻。新闻发布的形式多样化、类型全、涉及面广。</p>
                        
                        <div class="line_4" style="margin:0px 0px 18px;"></div>                        
                        <div class="separator" style="height:11px;"></div>
                        
                        <div class="block_staff">
                            <div class="title">
                                <p><span class="left">&nbsp;</span>
                                    期刊工作人员
                                    <span class="right">&nbsp;</span></p>
                            </div>
                            
                            <div class="one_third">
                                <div class="person">
                                    <div class="photo"><a href="${ctx}/about_author.jsp"><img src="${ctx}/images/ava_default_1.jpg" alt="" /></a></div>
                                    <div class="text">
                                        <p class="position">Editor in chief:</p>
                                        <p class="name"><a href="${ctx}/about_author.jsp">罗马.斯皮尔伯格</a></p>
                                    </div>
                                    
                                    <div class="clearboth"></div>
                                </div>
                                
                                <div class="person">
                                    <div class="photo"><a href="${ctx}/about_author.jsp"><img src="${ctx}/images/ava_default_1.jpg" alt="" /></a></div>
                                    <div class="text">
                                        <p class="position">Art Director:</p>
                                        <p class="name"><a href="${ctx}/about_author.jsp">Jason Kimber</a></p>
                                    </div>
                                    
                                    <div class="clearboth"></div>
                                </div>
                            </div>
                            
                            <div class="one_third">
                                <div class="person">
                                    <div class="photo"><a href="${ctx}/about_author.jsp"><img src="${ctx}/images/ava_default_1.jpg" alt="" /></a></div>
                                    <div class="text">
                                        <p class="position">Editor:</p>
                                        <p class="name"><a href="${ctx}/about_author.jsp">Sara Patrick</a></p>
                                    </div>
                                    
                                    <div class="clearboth"></div>
                                </div>
                                
                                <div class="person">
                                    <div class="photo"><a href="${ctx}/about_author.jsp"><img src="${ctx}/images/ava_default_1.jpg" alt="" /></a></div>
                                    <div class="text">
                                        <p class="position">Editor:</p>
                                        <p class="name"><a href="${ctx}/about_author.jsp">Karl Doe</a></p>
                                    </div>
                                    
                                    <div class="clearboth"></div>
                                </div>
                            </div>
                            
                            <div class="one_third last">
                                <div class="person">
                                    <div class="photo"><a href="${ctx}/about_author.jsp"><img src="${ctx}/images/ava_default_1.jpg" alt="" /></a></div>
                                    <div class="text">
                                        <p class="position">Newsmaker:</p>
                                        <p class="name"><a href="${ctx}/about_author.jsp">Mark Hugo</a></p>
                                    </div>
                                    
                                    <div class="clearboth"></div>
                                </div>
                                
                                <div class="person">
                                    <div class="photo"><a href="${ctx}/about_author.jsp"><img src="${ctx}/images/ava_default_1.jpg" alt="" /></a></div>
                                    <div class="text">
                                        <p class="position">Designer:</p>
                                        <p class="name"><a href="${ctx}/about_author.jsp">Jessica Baja</a></p>
                                    </div>
                                    
                                    <div class="clearboth"></div>
                                </div>
                            </div>
                            
                            <div class="clearboth"></div>
                        </div>
                        
                        <div class="line_3" style="margin:24px 0px 19px;"></div>
                        
                        <p>如果你与编辑有任何合作，请与我联系-<a href="#" class="lnk_red" target="_blank">2601219524@qq.com</a>.您需要发布广告广告，请与广告部联系—<a href="#" class="lnk_red" target="_blank">2601219524@qq.com</a></p>
                        
                        <div class="line_2" style="margin:5px 0px 0px;"></div>
                        
                    </div>
                    
                    <!-- sidebar -->
		            <%@ include file="sidebar.jsp"%>
		            
                	<div class="clearboth"></div>
                </div>
            </div>
        </div>
    	<!-- CONTENT END -->
        
		<!-- footer -->
		<%@ include file="footer.jsp"%>   
    </div>

	<!-- login -->
	<%@ include file="login.jsp"%> 
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