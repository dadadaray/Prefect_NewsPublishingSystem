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
                            <div class="text"><p>You are here:</p></div>
                            
                            <ul>
                                <li><a href="index.jsp">Home</a></li>
                                <li>Author Page</li>
                            </ul>
                        </div>
                        <div class="separator" style="height:30px;"></div>
                        
                        <h2>About Roman Polyarush</h2>
                        
                        <p class="general_subtitle_2">Web Designer, manager</p>
                        
                        <div class="line_3" style="margin:-6px 0px 17px;"></div>
                        
                        <div class="block_author">
                            <div class="photo"><a href="#"><img src="${ctx}/images/ava_default_2.jpg" alt="" /></a></div>
                            <div class="bio">
                                <p>There are many variations of passages of available, but the majority have suffered alteration in some form, by injected humour, or <b>randomised words which</b> don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.</p>
                                
                                <p class="www"><a href="#">www.websitename.com</a></p>
                                <p class="email"><a href="mailto:#" target="_blank">webvisionss@gmail.com</a></p>
                                
                                <div class="line_3" style="margin:10px 0px 17px;"></div>
                                
                                <div class="social">
                                    <ul>
                                        <li><a href="#" class="fb">Facebook</a></li>
                                        <li><a href="#" class="tw">Twitter</a></li>
                                        <li><a href="#" class="s_fr">Fr</a></li>
                                        <li><a href="#" class="vimeo">Vimeo</a></li>
                                        <li><a href="#" class="rss">RSS</a></li>
                                    </ul>
                                </div>
                            </div>
                            
                            <div class="clearboth"></div>
                        </div>
                        
                        <div class="line_2" style="margin:17px 0px 27px;"></div>
                        
                        <div class="block_author_posts">
                            <h2>Author Posts</h2>
                            
                            <div class="posts">
                                <article class="block_author_post">
                                    <div class="f_pic">
                                        <a href="${ctx}/news_post.jsp" class="general_pic_hover scale"><img src="${ctx}/images/pic_author_1.jpg" alt="" /></a>
                                        <span class="date">09:52  11 July 2012</span>
                                    </div>
                                    
                                    <div class="info">
                                        <div class="category"><p>category: <a href="#">BUSINESS</a></p></div>
                                        
                                        <div class="r_part">
                                            <a href="#" class="views">33</a>
                                            <a href="#" class="comments">22</a>
                                        </div>
                                    </div>
                                    
                                    <p class="title"><a href="${ctx}/news_post.jsp">Publishing packages and web page editors now use.</a></p>
                                </article>
                                
                                <article class="block_author_post">
                                    <div class="f_pic">
                                        <a href="${ctx}/news_post.jsp" class="general_pic_hover scale"><img src="${ctx}/images/pic_author_2.jpg" alt="" /></a>
                                        <span class="date">09:52  11 July 2012</span>
                                    </div>
                                    
                                    <div class="info">
                                        <div class="category"><p>category: <a href="#">BUSINESS</a></p></div>
                                        
                                        <div class="r_part">
                                            <a href="#" class="views">33</a>
                                            <a href="#" class="comments">22</a>
                                        </div>
                                    </div>
                                    
                                    <p class="title"><a href="${ctx}/news_post.jsp">Publishing packages and web page editors now use.</a></p>
                                </article>
                                
                                <article class="block_author_post">
                                    <div class="f_pic">
                                        <a href="${ctx}/news_post.jsp" class="general_pic_hover scale"><img src="${ctx}/images/pic_author_3.jpg" alt="" /></a>
                                        <span class="date">09:52  11 July 2012</span>
                                    </div>
                                    
                                    <div class="info">
                                        <div class="category"><p>category: <a href="#">BUSINESS</a></p></div>
                                        
                                        <div class="r_part">
                                            <a href="#" class="views">33</a>
                                            <a href="#" class="comments">22</a>
                                        </div>
                                    </div>
                                    
                                    <p class="title"><a href="${ctx}/news_post.jsp">Publishing packages and web page editors now use.</a></p>
                                </article>
                            </div>
                        </div>
                        
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