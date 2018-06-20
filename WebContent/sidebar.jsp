<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!-- CONTENT RIGHT BEGIN -->
<div class="sidebar">
	<!-- 分享 -->
	<div class="fenxiang">
		<div id="bdshare">
			<div class="bdsharebuttonbox" data-tag="share_1">
				<a href="javascript:void(0)" class="bds_more" data-cmd="more" target="_blank;"></a> <a href="javascript:void(0)" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a> <a href="javascript:void(0)" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a> <a href="javascript:void(0)" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a> <a href="javascript:void(0)" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a>
			</div>
			<script>
				window._bd_share_config = {
					"common" : {
						"bdSnsKey" : {},
						"bdText" : "这是分享内容哦！",
						"bdDesc" : "新闻天下首页分享",
						"bdUrl" : "http://www.baidu.com",
						"bdMini" : "2",
						"bdPic" : "",
						"bdStyle" : "0",
						"bdSize" : "16"
					},
					"share" : {},
					"image" : {
						"viewList" : [ "qzone", "tsina", "tqq", "renren",
								"weixin" ],
						"viewText" : "分享到：",
						"viewSize" : "16"
					},
					"selectShare" : {
						"bdContainerClass" : null,
						"bdSelectMiniList" : [ "qzone", "tsina", "tqq",
								"renren", "weixin" ]
					}
				};
				with (document)
					0[(getElementsByTagName('head')[0] || body)
							.appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='
							+ ~(-new Date() / 36e5)];
			</script>
		</div>
	</div>

	<div class="separator" style="height: 31px;"></div>

	<div class="block_popular_posts">
		<h4>流行元素</h4>
		<c:set var="newsHonorList" value="${sessionScope.listNewsIndex3}"></c:set>
		<c:forEach items="${newsHonorList}" var="news">
			<div class="article">
				<div class="pic">
					<a href="${ctx}/newsFront/findoneNews?newsId=${news.newsId}" class="w_hover"> <img src="${ctx}/newsImgUp/${news.coverImgUrl}" alt="" width="75px" height="50px"/> <span></span>
					</a>
				</div>

				<div class="text">
					<p class="title"> <a href="${ctx}/newsFront/findoneNews?newsId=${news.newsId}"> ${fn:substring(news.newsTitle, 0,14)} <c:if test="${fn:length(news.newsTitle)>14}">...</c:if></a>
					</p>
					<div class="date">
						<p><fmt:formatDate value="${news.publishTime}" pattern="yyyy-MM-dd" /></p>
					</div>
					<div class="icons">
						<ul>
							<li><a href="#" class="views">${news.views}</a></li>
							<li><a href="#" class="comments">${news.commentNum}</a></li>
						</ul>
					</div>
				</div>
			</div>
		

		<div class="line_3"></div>
</c:forEach>
		
	
		<div class="line_2"></div>
	</div>

	<div class="separator" style="height: 31px;"></div>

	<div class="block_popular_stuff">
		<h4>热点视频</h4>

		<div class="content">
			<a href="#" class="view_all">全部视频</a>
			<div class="media">
				<!--<a href="http://www.youtube.com/watch?v=ySIvism2af8" class="general_pic_hover play no_fx" data-rel="prettyPhoto" title="Popular Video"><img src="${ctx}/images/pic_pop_video.jpg" alt="85-" /></a>-->
				<video width="240" height="138" poster="${ctx}/images/pic_pop_video.jpg" controls="controls">
					<source src="${ctx}/vedio/news2.mp4" type="video/ogg">
					<source src="${ctx}/vedio/news2.mp4" type="video/mp4">
					<source src="${ctx}/vedio/news2.mp4" type="video/webm">
					<object data="${ctx}/vedio/news2.mp4" width="240" height="138"> </object>
				</video>

				<!--<video width="250" height="200" class="general_pic_hover play no_fx" src="vedio/vtest.mp4" poster="images/pic_pop_video.jpg" autoplay="autoplay"></video>-->


			</div>
			<p>
				<a href="${ctx}/video.jsp"> 中国工厂太魔幻：未来每2分钟下线一辆汽车</a> <img src="${ctx}/images/icon_video.gif" alt="" />
			</p>
			<p class="date">11 July, 2012</p>
		</div>

		<div class="info">
			<ul>
				<li class="comments"><a href="#">115</a></li>
				<li class="views"><a href="#">220</a></li>
			</ul>
		</div>

		<div class="clearboth"></div>

		<div class="line_2"></div>
	</div>

	<div class="separator" style="height: 31px;"></div>

	<div class="block_calendar">
		<h4>Calendar</h4>

		<div class="calendar" id="calendar_sidebar"></div>

		<script type="text/javascript">
			var today = new Date();
			var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-'
					+ today.getDate();
			$('#calendar_sidebar')
					.DatePicker(
							{
								flat : true,
								date : date,
								calendars : 1,
								starts : 1,
								locale : {
									days : [ 'Sunday', 'Monday', 'Tuesday',
											'Wednesday', 'Thursday', 'Friday',
											'Saturday', 'Sunday' ],
									daysShort : [ 'Sun', 'Mon', 'Tue', 'Wed',
											'Thu', 'Fri', 'Sat', 'Sun' ],
									daysMin : [ 'S', 'M', 'T', 'W', 'T', 'F',
											'S', 'S' ],
									months : [ 'January', 'February', 'March',
											'April', 'May', 'June', 'July',
											'August', 'September', 'October',
											'November', 'December' ],
									monthsShort : [ 'Jan', 'Feb', 'Mar', 'Apr',
											'May', 'Jun', 'Jul', 'Aug', 'Sep',
											'Oct', 'Nov', 'Dec' ],
									weekMin : 'wk'
								}
							});
		</script>

		<div class="line_2"></div>
	</div>

	<div class="separator" style="height: 31px;"></div>

	<!-- <div class="block_twitter_widget">
        	<h4>Twitter Widget</h4>
            <div class="lnk_follow"><a href="#" target="_blank">Follow on Twitter</a></div>
            
            <div class="tweet">
            	<script charset="utf-8" src="http://widgets.twimg.com/j/2/widget.js"></script>
				<script type="text/javascript" src="layout/plugins/tweet/tweet.widget.js"></script>
                <script type="text/javascript">
                    // ('YOUR USERNAME','NUMBER OF POSTS');
                    AddTweet('Web_Visions',1);
                </script>
            </div>
            
            <div class="line_2"></div>
        </div> -->

	<div class="separator" style="height: 31px;"></div>

	<div class="block_popular_stuff">
		<h4>流行图片</h4>

		<div class="content">
			<a href="#" class="view_all">全部图片</a>
			<div class="media">
				<a href="images/pic_pop_photo_big.jpg" class="general_pic_hover zoom no_fx" data-rel="prettyPhoto" title="Popular Photo"><img src="${ctx}/images/pic_pop_photo.jpg" alt="" /></a>
			</div>
			<p>
				<a href="${ctx}/blog_post_w_slider.jsp"> 中国工厂太魔幻：未来每2分钟下线一辆汽车。</a> <img src="${ctx}/images/icon_photo.gif" alt="" />
			</p>
			<p class="date">11 July, 2012</p>
		</div>

		<div class="info">
			<ul>
				<li class="comments"><a href="#">100</a></li>
				<li class="views"><a href="#">134</a></li>
			</ul>
		</div>

		<div class="clearboth"></div>

		<div class="line_2"></div>
	</div>

	<div class="separator" style="height: 31px;"></div>

	<!-- <div class="block_newsletter">
        	<h4>Newsletter</h4>
            
            <form action="#" />
            	<div class="field"><input type="text" class="w_def_text" title="Enter Your Email Addres" /></div>
                <input type="submit" class="button" value="Subscribe" />
                
                <div class="clearboth"></div>
            </form>
        </div> -->

</div>
<!-- CONTENT RIGHT END -->