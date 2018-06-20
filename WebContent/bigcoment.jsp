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
        <div id="content">
        	<div class="inner">
            	<div class="general_content">
                	<div class="main_content" style="width: 960px;">
                        <div class="block_breadcrumbs">
                            <div class="text"><p>You are here:</p></div>
                            
                            <ul>
                                <li><a href="${ctx}/index.jsp">Home</a></li>
                                <li><a href="${ctx}/business.jsp">Business News</a></li>
                                <li>News Name</li>
                            </ul>
                        </div>
                                               
                        <div class="line_2" style="margin:5px 0px 30px;"></div>
                        
                        <div class="block_comments_type_2">
                            <h3>3 Comments</h3>
                            <a href="#" class="add_new">Add new comment</a>
                            
                            <div class="comment">
                                <div class="userpic"><a href="#"><img src="${ctx}/images/ava_default_1.jpg" alt="" /></a></div>
                                
                                <div class="comment_wrap">
                                    <div class="name"><p><a href="#">John Doe</a></p></div>
                                    <div class="date"><p>Febr 16, 2012 at 4:43 pm</p></div>
                                    <div class="content">
                                        <p>Established fact that a reader will be distracted by the readable content of a page.</p>
                                    </div>
                                </div>
                                <div class="clearboth"></div>
                                <div class="line_3"></div>
                            </div>
                            
                            <div class="comment">
                                <div class="userpic"><a href="#"><img src="${ctx}/images/ava_default_1.jpg" alt="" /></a></div>
                                
                                <div class="comment_wrap">
                                    <div class="name"><p><a href="#">Sara Jonson</a></p></div>
                                    <div class="date"><p>Febr 16, 2012 at 4:43 pm</p></div>
                                    <div class="content">
                                        <p>Established fact that a reader will be distracted by the readable content of a page. When looking at its layout. The point of using is that it has a more-or-less normal distribution of letters.</p>
                                    </div>
                                </div>
                                <div class="clearboth"></div>
                                <div class="line_3"></div>
                            </div>
                            
                            <div class="comment">
                                <div class="userpic"><a href="#"><img src="${ctx}/images/ava_default_1.jpg" alt="" /></a></div>
                                
                                <div class="comment_wrap">
                                    <div class="name"><p><a href="#">Mark Defo</a></p></div>
                                    <div class="date"><p>Febr 16, 2012 at 4:43 pm</p></div>
                                    <div class="content">
                                        <p>Page when looking at its layout. The point of usinghas a more-or-less normal distribution.</p>
                                    </div>
                                </div>
                                <div class="clearboth"></div>
                                <div class="line_3"></div>
                            </div>
                            
                        </div>
                        
                        <div class="separator" style="height:30px;"></div>
                        
                        <div class="block_leave_reply">
                            <h3>Leave a Reply</h3>
                            <p class="text">Your email address will not be published. Required fields are marked <span>*</span></p>
                            
                            <form class="w_validation" action="#" />
                                <p>Name<span>*</span></p>
                                <div class="field"><input type="text" class="req" /></div>
                                
                                <p>E-mail<span>*</span></p>
                                <div class="field"><input type="text" class="req" /></div>
                                
                                <p>Comment</p>
                                <div class="textarea"><textarea cols="1" rows="1"></textarea></div>
                                
                                <input type="submit" class="general_button" value="Post comment" />
                            </form>
                        </div>
                        
                    </div>
                    
                    
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