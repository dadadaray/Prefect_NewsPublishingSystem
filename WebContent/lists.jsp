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
<link rel="stylesheet" href="${ctx}/layout/jiaodian.css" type="text/css" />

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



<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

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
							<div class="text">
								<p>当前位置:</p>
							</div>

							<ul>
								<li><a href="${ctx}/index.jsp">首页</a></li>
								<li><a href="#">${newsTypeNameFront}</a></li>
							</ul>
						</div>
						<div class="separator" style="height: 30px;"></div>

						<c:if test="${not empty page and page.totalCount > 0}">
							<c:forEach items="${page.list}" var="news" varStatus="status">
								<div class="news_list">
									<a href="${ctx}/newsFront/findoneNews?newsId=${news.newsId}" style="text-decoration: none; out-line: none;">
										<h2 class="list_top_p">${fn:substring(news.newsTitle, 0,50)}<c:if test="${fn:length(news.newsTitle)>50}">...</c:if></h2> 
										<p class="list_con_p" style="font-size:15px;line-height:30px;">
										<c:if test="${not empty news.modFrees}">
											<c:forEach items="${news.modFrees}" var="modFree">
		                                			${fn:substring(modFree.modFreeContent,0,50)}<c:if test="${fn:length(modFree.modFreeContent)>50}">...</c:if>
											</c:forEach>
										</c:if> <c:if test="${not empty news.modBigImgs}">
											<c:forEach items="${news.modBigImgs}" var="modBigImg" varStatus="status">
												<c:if test="${status.index eq 0}">
													${fn:substring(news.bigImgContent,0,50)}<c:if test="${fn:length(news.bigImgContent)>50}">...</c:if>
												</c:if>
											</c:forEach>
										</c:if> <c:if test="${not empty news.modVedios}">
											<c:forEach items="${news.modVedios}" var="modVedio">
											
											     ${fn:substring(modVedio.modVedioContent,0,50)}<c:if test="${fn:length(modVedio.modVedioContent)>50}">...</c:if>
											</c:forEach>
										</c:if> <c:if test="${not empty news.modAudios}">
											<c:forEach items="${news.modAudios}" var="modAudio">
											     ${fn:substring(modAudio.modAudioContent,0,50)}<c:if test="${fn:length(modAudio.modAudioContent)>50}">...</c:if>
											</c:forEach>
										</c:if> <c:if test="${not empty news.modMixCenters}">
											<c:forEach items="${news.modMixCenters}" var="modMixCenter">
											     ${fn:substring(modMixCenter.mMixCenterContentOne,0,50)}<c:if test="${fn:length(modMixCenter.mMixCenterContentOne)>50}">...</c:if>
											</c:forEach>
										</c:if> <c:if test="${not empty news.modMixLRs}">
											<c:forEach items="${news.modMixLRs}" var="modMixLR">
											      ${fn:substring(modMixLR.mMixLRContentOne,0,50)}<c:if test="${fn:length(modMixLR.mMixLRContentOne)>50}">...</c:if>
											</c:forEach>
										</c:if> <c:if test="${not empty news.modMixSingles}">
											<c:forEach items="${news.modMixSingles}" var="modMixSingle">
											       ${fn:substring(modMixSingle.mMixSingleContentOne,0,50)}<c:if test="${fn:length(modMixSingle.mMixSingleContentOne)>50}">...</c:if>
											</c:forEach>
										</c:if>
										</p>
									</a>
									<div class="list_time">${news.publishTime}</div>
									<div class="list_share">
										<a> 评论 </a>
									</div>
									<div class="list_line"></div>
								</div>
							</c:forEach>
						</c:if>						

						<div class="line_4" style="margin: 0px 0px 18px;"></div>

						<div class="clearboth"></div>
						</article>

						<div class="line_2" style="margin: 21px 0px 21px;"></div>

						<div class="block_topic_news"></div>


						<div class="block_pager">
							<a href="${ctx}/newsFront/frontListAllNews?pageNum=${page.prePageNum}" class="prev">Previous</a> <a href="${ctx}/newsFront/frontListAllNews?pageNum=${page.nextPageNum}" class="next">Next</a>

							<div class="pages">
								<ul>
									<c:forEach begin="1" end="${page.totalPageNum}" var="pageNum">
										<c:if test="${pageNum == page.currentPageNum}">
											<li class="current"><a href="${ctx}/newsFront/frontListAllNews?pageNum=${pageNum}">${pageNum}</a></li>
										</c:if>
										<c:if test="${pageNum != page.currentPageNum}">
											<li><a href="${ctx}/newsFront/frontListAllNews?pageNum=${pageNum}">${pageNum}</a></li>
										</c:if>
									</c:forEach>
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