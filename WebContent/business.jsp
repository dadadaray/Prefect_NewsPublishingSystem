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
<script type="text/javascript" src="${ctx}/layout/plugins/html5.js"></script>
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
                                <li>商业</li>
                            </ul>
                        </div>
                        <div class="separator" style="height:30px;"></div>
                        
                        <h2>Business</h2>
                        
                        <p class="general_subtitle">Eestablished fact that a reader will be distracted by the readable content of a page when looking at its layout are many variations of passages have suffered alteration.</p>
                        
                        <div class="line_4" style="margin:0px 0px 18px;"></div>
                        
                        <article class="block_topic_post_feature">
                            <div class="f_pic"><a href="${ctx}/news_post.jsp" class="general_pic_hover scale"><img src="${ctx}/images/pic_business_big.jpg" alt="" /></a></div>
                            
                            <div class="content">
                                <p class="title"><a href="${ctx}/news_post.jsp">Publishing packages and web page editors now use.</a></p>
                                
                                <div class="info">
                                    <div class="date"><p>11 July, 2012</p></div>
                                    
                                    <div class="r_part">
                                        <div class="category"><p><a href="#">Business</a></p></div>
                                        <a href="#" class="views">220</a>
                                    </div>
                                </div>
                                    
                                <p class="text">Many variations of passages of available, but the majority have suffered alteration in some form. Humour, or randomised words which don't look even slightly believable. If you are going to use a passage of you need to be sure.</p>
                            </div>
                            
                            <div class="clearboth"></div>
                        </article>
                        
                        <div class="line_2" style="margin:21px 0px 21px;"></div>
                        
                        <div class="block_topic_news">
                            <article class="block_topic_post">
                                <p class="title"><a href="${ctx}/news_post.jsp">Many desktop publishing packages and web page editors now use.</a></p>
                                <div class="f_pic"><a href="${ctx}/news_post.jsp" class="general_pic_hover scale"><img src="${ctx}/images/pic_business_1.jpg" alt="" /></a></div>
                                <p class="text">There are many variations of passages of available, but the majority have alteration.</p>
                                <div class="info">
                                    <div class="date"><p>11 July, 2012</p></div>
                                    
                                    <div class="r_part">
                                        <div class="category"><p><a href="#">Business</a></p></div>
                                        <a href="#" class="views">183</a>
                                    </div>
                                </div>
                            </article>
                            
                            <article class="block_topic_post">
                                <p class="title"><a href="${ctx}/news_post.jsp">Many desktop publishing packages and web page editors now use.</a></p>
                                <div class="f_pic"><a href="${ctx}/news_post.jsp" class="general_pic_hover scale"><img src="${ctx}/images/pic_business_2.jpg" alt="" /></a></div>
                                <p class="text">There are many variations of passages of available, but the majority have alteration.</p>
                                <div class="info">
                                    <div class="date"><p>11 July, 2012</p></div>
                                    
                                    <div class="r_part">
                                        <div class="category"><p><a href="#">Business</a></p></div>
                                        <a href="#" class="views">183</a>
                                    </div>
                                </div>
                            </article>
                            
                            <article class="block_topic_post">
                                <p class="title"><a href="${ctx}/news_post.jsp">Many desktop publishing packages and web page editors now use.</a></p>
                                <div class="f_pic"><a href="${ctx}/news_post.jsp" class="general_pic_hover scale"><img src="${ctx}/images/pic_business_3.jpg" alt="" /></a></div>
                                <p class="text">There are many variations of passages of available, but the majority have alteration.</p>
                                <div class="info">
                                    <div class="date"><p>11 July, 2012</p></div>
                                    
                                    <div class="r_part">
                                        <div class="category"><p><a href="#">Business</a></p></div>
                                        <a href="#" class="views">183</a>
                                    </div>
                                </div>
                            </article>
                            
                            <article class="block_topic_post">
                                <p class="title"><a href="${ctx}/news_post.jsp">Many desktop publishing packages and web page editors now use.</a></p>
                                <div class="f_pic"><a href="${ctx}/news_post.jsp" class="general_pic_hover scale"><img src="${ctx}/images/pic_business_4.jpg" alt="" /></a></div>
                                <p class="text">There are many variations of passages of available, but the majority have alteration.</p>
                                <div class="info">
                                    <div class="date"><p>11 July, 2012</p></div>
                                    
                                    <div class="r_part">
                                        <div class="category"><p><a href="#">Business</a></p></div>
                                        <a href="#" class="views">183</a>
                                    </div>
                                </div>
                            </article>
                            
                            <article class="block_topic_post">
                                <p class="title"><a href="${ctx}/news_post.jsp">Many desktop publishing packages and web page editors now use.</a></p>
                                <div class="f_pic"><a href="${ctx}/news_post.jsp" class="general_pic_hover scale"><img src="${ctx}/images/pic_business_5.jpg" alt="" /></a></div>
                                <p class="text">There are many variations of passages of available, but the majority have alteration.</p>
                                <div class="info">
                                    <div class="date"><p>11 July, 2012</p></div>
                                    
                                    <div class="r_part">
                                        <div class="category"><p><a href="#">Business</a></p></div>
                                        <a href="#" class="views">183</a>
                                    </div>
                                </div>
                            </article>
                            
                            <article class="block_topic_post">
                                <p class="title"><a href="${ctx}/news_post.jsp">Many desktop publishing packages and web page editors now use.</a></p>
                                <div class="f_pic"><a href="${ctx}/news_post.jsp" class="general_pic_hover scale"><img src="${ctx}/images/pic_business_6.jpg" alt="" /></a></div>
                                <p class="text">There are many variations of passages of available, but the majority have alteration.</p>
                                <div class="info">
                                    <div class="date"><p>11 July, 2012</p></div>
                                    
                                    <div class="r_part">
                                        <div class="category"><p><a href="#">Business</a></p></div>
                                        <a href="#" class="views">183</a>
                                    </div>
                                </div>
                            </article>
                            
                            <article class="block_topic_post">
                                <p class="title"><a href="${ctx}/news_post.jsp">Many desktop publishing packages and web page editors now use.</a></p>
                                <div class="f_pic"><a href="${ctx}/news_post.jsp" class="general_pic_hover scale"><img src="${ctx}/images/pic_business_7.jpg" alt="" /></a></div>
                                <p class="text">There are many variations of passages of available, but the majority have alteration.</p>
                                <div class="info">
                                    <div class="date"><p>11 July, 2012</p></div>
                                    
                                    <div class="r_part">
                                        <div class="category"><p><a href="#">Business</a></p></div>
                                        <a href="#" class="views">183</a>
                                    </div>
                                </div>
                            </article>
                            
                            <article class="block_topic_post">
                                <p class="title"><a href="${ctx}/news_post.jsp">Many desktop publishing packages and web page editors now use.</a></p>
                                <div class="f_pic"><a href="${ctx}/news_post.jsp" class="general_pic_hover scale"><img src="${ctx}/images/pic_business_8.jpg" alt="" /></a></div>
                                <p class="text">There are many variations of passages of available, but the majority have alteration.</p>
                                <div class="info">
                                    <div class="date"><p>11 July, 2012</p></div>
                                    
                                    <div class="r_part">
                                        <div class="category"><p><a href="#">Business</a></p></div>
                                        <a href="#" class="views">183</a>
                                    </div>
                                </div>
                            </article>
                        </div>
                        
                        <div class="line_2" style="margin:25px 0px 25px;"></div>
                        
                        <div class="block_pager">
                            <a href="#" class="prev">Previous</a>
                            <a href="#" class="next">Next</a>
                            
                            <div class="pages">
                                <ul>
                                    <li class="current"><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">6</a></li>
                                </ul>
                            </div>
                            
                            <div class="clearboth"></div>
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