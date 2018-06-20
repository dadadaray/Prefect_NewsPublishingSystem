<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<title>新闻天下</title>

<meta name="keywords" content="" />
<meta name="description" content=""/>

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


<!--密码md5加密 start-->
<script type="text/javascript" src="${ctx}/layout/js/md5.js"></script>
<!--密码md5加密 end-->

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>
	<%
		if (session.getAttribute("listNewsIndex1") == null || session.getAttribute("listNewsIndex2") == null
				|| request.getAttribute("YesterdayPage") == null
				|| session.getAttribute("listNewsIndex3") == null
				||session.getAttribute("findNewsBigTop") == null
				||session.getAttribute("hotpoint") == null
				||session.getAttribute("findNewsBigTop") == null
				) {
			request.getRequestDispatcher("index").forward(request, response);
		}
	%>
	<div class="wrapper sticky_footer">
		<!-- head -->
		<%@ include file="head.jsp"%>

		<!-- CONTENT BEGIN -->
		<div id="content" class="right_sidebar">
			<div class="inner">
				<div class="general_content">
					<div class="main_content">
						<div class="block_special_topic">
							<div class="type">
								<p>最新热点新闻</p>
							</div>
							<div class="title">
							<c:forEach items="${hotpoint}" var="news">
								<p>
									<a href="${ctx}/newsFront/findoneNews?newsId=${news.newsId}">${news.newsTitle }</a>
								</p>
							</c:forEach>
							</div>
						</div>
						<div class="separator" style="height: 17px;"></div>

						<div class="block_home_slider">
							<div id="home_slider" class="flexslider">
								<ul class="slides">
								<c:set var="newsHonorList" value="${sessionScope.listNewsIndex1}"></c:set>
							      <c:forEach items="${findNewsBigTop}" var="news">
									<li>
										<div class="slide">
											<a href="${ctx}/newsFront/findoneNews?newsId=${news.newsId}"><img src="${ctx}/newsImgUp/${news.coverImgUrl}" alt="" width="610px" height="292px"/></a>
											<div class="caption">
												<p class="title">${fn:substring(news.newsTitle, 0,25)} <c:if test="${fn:length(news.newsTitle)>25}">...</c:if></p>
											
											</div>
										</div>
									</li>
								</c:forEach>

									
									

								
								</ul>
							</div>

							<script type="text/javascript">
								$(function() {
									$('#home_slider').flexslider({
										animation : 'slide',
										controlNav : true,
										directionNav : true,
										animationLoop : true,
										slideshow : false,
										useCSS : false
									});

								});
							</script>
						</div>

						<div class="line_2" style="margin: 34px 0px 28px;"></div>

						<div class="block_home_col_1">
							<c:set var="newsHonorList" value="${sessionScope.listNewsIndex1}"></c:set>
							<c:forEach items="${newsHonorList}" var="news">
								<div class="block_home_post">
									<div class="pic">
										<a href="${ctx}/newsFront/findoneNews?newsId=${news.newsId}" class="w_hover"> <img src="${ctx}/newsImgUp/${news.coverImgUrl}" alt="" width="65px" height="43px" /> <span></span>
										</a>
									</div>

									<div class="text">
										<p class="title">
											<a href="${ctx}/newsFront/findoneNews?newsId=${news.newsId}">${fn:substring(news.newsTitle, 0,25)} <c:if test="${fn:length(news.newsTitle)>25}">...</c:if></a>
										</p>
										<div class="date">
											<p>
												<fmt:formatDate value="${news.publishTime}" pattern="yyyy-MM-dd" />
											</p>
										</div>
										<div class="icons">
											<ul>
												<li><a href="#" class="views">${news.views}</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="line_3" style="margin: 14px 0px 17px;"></div>
							</c:forEach>
						</div>

						<div class="block_home_col_2">
							<div class="line_3 first" style="margin: 14px 0px 17px;"></div>
							<c:set var="newsHonorList" value="${sessionScope.listNewsIndex2}"></c:set>
							<c:forEach items="${newsHonorList}" var="news">
								<div class="block_home_post">
									<div class="pic">
										<a href="${ctx}/newsFront/findoneNews?newsId=${news.newsId}" class="w_hover"> <img src="${ctx}/newsImgUp/${news.coverImgUrl}" alt="" width="65px" height="43px" /> <span></span>
										</a>
									</div>

									<div class="text">
										<p class="title">
											<a href="${ctx}/newsFront/findoneNews?newsId=${news.newsId}">${fn:substring(news.newsTitle, 0,25)} <c:if test="${fn:length(news.newsTitle)>25}">...</c:if></a>
										</p>
										<div class="date">
											<p>
												<fmt:formatDate value="${news.publishTime}" pattern="yyyy-MM-dd" />
											</p>
										</div>
										<div class="icons">
											<ul>
												<li><a href="#" class="views">${news.views}</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="line_3" style="margin: 14px 0px 17px;"></div>
							</c:forEach>
						</div>
						<div class="clearboth"></div>

						<div class="line_3" style="margin: 14px 0px 13px;"></div>
						<a href="${ctx}/newsFront/frontListAllNews" class="lnk_all_news fl">全部新闻</a>
						<div class="clearboth"></div>
						<div class="line_3" style="margin: 13px 0px 35px;"></div>

						<h3 style="font-size: 16px;">昨日新闻</h3>
						<div class="line_4" style="margin: -4px 0px 18px;"></div>

						<div class="block_topic_news">
							<c:if test="${not empty YesterdayPage and YesterdayPage.totalCount > 0}">
								<c:forEach items="${YesterdayPage.list}" var="news" varStatus="status">
									<article class="block_topic_post">
										<p class="title">
											<a href="${ctx}/newsFront/findoneNews?newsId=${news.newsId}">${fn:substring(news.newsTitle, 0,15)}<c:if test="${fn:length(news.newsTitle)>15}">...</c:if></a>
										</p>
										<div class="f_pic">
											<a href="${ctx}/newsFront/findoneNews?newsId=${news.newsId}" class="general_pic_hover scale"><img src="${ctx}/newsImgUp/${news.coverImgUrl}" alt="" width="255px" height="160px" /></a>
										</div>
										<p class="text">
											<c:if test="${not empty news.modFrees}">
												<c:forEach items="${news.modFrees}" var="modFree">
		                                			${fn:substring(modFree.modFreeContent,0,40)}<c:if test="${fn:length(modFree.modFreeContent)>40}">...</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${not empty news.modBigImgs}">
												<c:forEach items="${news.modBigImgs}" var="modBigImg" varStatus="status">
													<c:if test="${status.index eq 0}">
													${fn:substring(news.bigImgContent,0,40)}<c:if test="${fn:length(news.bigImgContent)>40}">...</c:if>
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${not empty news.modVedios}">
												<c:forEach items="${news.modVedios}" var="modVedio">
											
											     ${fn:substring(modVedio.modVedioContent,0,40)}<c:if test="${fn:length(modVedio.modVedioContent)>40}">...</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${not empty news.modAudios}">
												<c:forEach items="${news.modAudios}" var="modAudio">
											     ${fn:substring(modAudio.modAudioContent,0,40)}<c:if test="${fn:length(modAudio.modAudioContent)>40}">...</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${not empty news.modMixCenters}">
												<c:forEach items="${news.modMixCenters}" var="modMixCenter">
											     ${fn:substring(modMixCenter.mMixCenterContentOne,0,40)}<c:if test="${fn:length(modMixCenter.mMixCenterContentOne)>40}">...</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${not empty news.modMixLRs}">
												<c:forEach items="${news.modMixLRs}" var="modMixLR">
											      ${fn:substring(modMixLR.mMixLRContentOne,0,40)}<c:if test="${fn:length(modMixLR.mMixLRContentOne)>40}">...</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${not empty news.modMixSingles}">
												<c:forEach items="${news.modMixSingles}" var="modMixSingle">
											       ${fn:substring(modMixSingle.mMixSingleContentOne,0,40)}<c:if test="${fn:length(modMixSingle.mMixSingleContentOne)>40}">...</c:if>
												</c:forEach>
											</c:if>
										</p>
										<div class="info">
											<div class="date">
												<p>
													<fmt:formatDate value="${news.publishTime}" pattern="yyyy-MM-dd" />
												</p>
											</div>

											<div class="r_part">
												<div class="category">
													<p>
														<a href="#">${news.newsType.typeName }</a>
													</p>
												</div>
												<a href="#" class="views">${news.views }</a>
											</div>
										</div>
									</article>
								</c:forEach>
							</c:if>






						</div>

						<div class="line_3" style="margin: 20px 0px 24px;"></div>

						<div class="block_pager">
							<div class="clearboth"></div>
						</div>

						<div class="line_2" style="margin: 24px 0px 35px;"></div>

						<h3 style="font-size: 16px;">温馨提示</h3>
						<div class="line_4" style="margin: -4px 0px 18px;"></div>

						<div class="block_best_materials">
							<div class="slider">
								<div id="best_materials_slider" class="flexslider">
									<ul class="slides">
									<c:set var="newsHonorList" value="${sessionScope.listNewsIndex4}"></c:set>
							<c:forEach items="${newsHonorList}" var="news">
										<li>
											<div class="block_best_material_post">
												<div class="f_pic">
													<a href="${ctx}/newsFront/findoneNews?newsId=${news.newsId}" class="w_hover"><img src="${ctx}/newsImgUp/${news.coverImgUrl}" alt="" width="184px" height="105px" /><span></span></a>
												</div>
												<p class="title">
													<a href="${s}/newsFront/findoneNews?newsId=${news.newsId}">${fn:substring(news.newsTitle, 0,25)} <c:if test="${fn:length(news.newsTitle)>25}">...</c:if></a>
												</p>
												<div class="info">
													<div class="date">
														<p><fmt:formatDate value="${news.publishTime}" pattern="yyyy-MM-dd" /></p>
													</div>
													<div class="category">
														<p>
															<a href="#">${news.newsType.typeName}</a>
														</p>
													</div>
												</div>
											</div>
										</li>
										</c:forEach>
										

									
									</ul>
								</div>
							</div>

							<script type="text/javascript">
								$(function() {
									$('#best_materials_slider').flexslider({
										animation : 'slide',
										controlNav : false,
										directionNav : true,
										animationLoop : false,
										slideshow : false,
										itemWidth : 213,
										itemMargin : 0,
										minItems : 1,
										maxItems : 3,
										move : 1,
										useCSS : false
									});
								});
							</script>
						</div>

						<div class="line_2" style="margin: 20px 0px 0px;"></div>

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