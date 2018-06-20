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
<script type="text/javascript" src="${ctx}/layout/plugins/html5.js"></script>
<![endif]-->

<link rel="stylesheet" href="${ctx}/layout/style.css" type="text/css" />
<link rel="stylesheet" href="${ctx}/backstage/assets/css/xcConfirm.css">

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
    	<!-- HEADER BEGIN -->
        <header>
            <div id="header">
            </div>
        </header>
    	<!-- HEADER END -->
        
        <!-- CONTENT BEGIN -->
        <div id="content" class="right_sidebar ">
        	<div class="inner">
            	<div class="general_content">
                    <div class="main_content" id="con_eye">
                         <article class="block_single_news">
                         <input id="newsId" value="${OneNews.newsId}" type="hidden"/>
                         	<div class="f_pic"><a href="#"><img src="${ctx}/newsImgUp/${OneNews.coverImgUrl}" alt="" width="610px" height="259px"/></a></div>
                            <p class="title">
                                <h1>${OneNews.newsTitle}</h1>
                            </p>

                            <div class="info">
                                <div class="date"><p><fmt:formatDate value="${OneNews.createTime}" pattern="yyyy-MM-dd" /></p></div>
                                <div class="author"><p>作者: <a href="#">${OneNews.userInfo.loginUser.loginName}</a></p></div>

                                <div class="r_part">
                                    <a href="#" class="views">
                                	<c:choose>
									    <c:when test="${not empty OneNews.views and OneNews.views != 0}">
									        ${OneNews.views}
									    </c:when>
									    <c:otherwise>
									        0
									    </c:otherwise>
									</c:choose>
                                    </a>
                                    <a href="#" class="comments">
                                	<c:choose>
									    <c:when test="${not empty OneNews.commentNum and OneNews.commentNum != 0}">
									        ${OneNews.commentNum}
									    </c:when>
									    <c:otherwise>
									        0
									    </c:otherwise>
									</c:choose> 
                                    </a>
                                </div>
                            </div>

                            <div class="content text_p">
                            <c:if test="${not empty OneNews.modAudios}">
                           		<c:forEach items="${OneNews.modAudios}" var="modAudio">                            
		                            <div class="block_audio">
		                              <audio id="player2" src="${ctx}/newsAudioUp/${modAudio.mAudioUrl}" type="audio/mp3" controls=""></audio>
		                            </div>
	                                <p class="text_p">${modAudio.modAudioContent}</p> 
                            	</c:forEach>
                            </c:if>
                            </div>
                        </article>
                        <div class="separator" style="height:4px;"></div>
                        <div class="block_post_tags">
                            <p>标签: <a href="#">${OneNews.newsType.typeName}</a></p>
                        </div>
                        <!-- 审核结果 -->
                        <c:if test="${not empty tag and 0 eq tag}">
	                        <div class="check_end"> 
	                        	<button type="button" class="btn_success" id="tzsucc" onclick="sendsuc(this)">通过并发表</button>
	                        	<button id="failsend" type="button" class="am_danger">未通过并回复</button>
	                        </div>
	                     </c:if>
                        <!-- 审核结束 -->                        
                    </div>
                </div>
            </div>
        </div>
    	<!-- CONTENT END -->
    </div>


</body>
<script src="${ctx}/backstage/assets/js/xcConfirm.js"></script>
<script type="text/javascript">
    <!-- 回车登陆 -->
    $(document).keyup(function(e) {
        if (e.keyCode == 13) {
            $("#submit1").click()
        }
    });
    
    // 弹窗
    function sendsuc(e){
         var id = $("#newsId").val();     
 		$.ajax({
 			type:"post",
 			url:"${ctx}/backstage/notice/check",
 			data : {
 				newsId : id,
 			},
 			success : function(data, status) {
 				if (data != "0") {
 					window.wxc.xcConfirm("通过并发表成功了哦！",
 							{onOk:function(){
 									window.location.href ="${ctx}/backstage/news/back/checking/list";
 								}});
 				}else{
 					window.wxc.xcConfirm("发表出错！");
 				}
 			},
 			error :function(){
 				alert("发表出错！");
 			}
 		});      
    }

    //审核不通过
    $("#failsend").click(function(){ 
           var txt="";
           window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.textarea,{
             onOk:function(v){
                 var id = $("#newsId").val();     
         		$.ajax({
         			type:"post",
         			url:"${ctx}/backstage/notice/uncheck",
         			data : {
         				newsId : id,
         				noticeContent : v,
         			},
         			success : function(data, status) {
         				if (data != "0") {
         					alert("成功发送通知！");
         					window.location.href ="${ctx}/backstage/news/back/checking/list";
         				}else{
         					window.wxc.xcConfirm("发送通知出错！");
         				}
         			},
         			error :function(){
         				alert("发送通知出错！");
         			}
         		});             	
               console.log(v);
             }
           });
         });    
</script>
</html>