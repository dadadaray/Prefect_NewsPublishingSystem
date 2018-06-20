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
<link rel="stylesheet" href="${ctx}/layout/jiaodian.css" media="screen" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body>
	<div class="bigbg">
		<div class="blackk">
			<div class="font_bk">
				<a href="">返回</a>

			</div>
		</div>
	
			<ul class="adaptive-slider"> 
			  <!-- Slider Item -->
			  <c:forEach items="${modBigImgs}" var="mods" varStatus="status">
			  <li>
			    <figure>
			      <img src="${ctx}/preViewImgUp/${mods.modBigImgUrl}" width="980px" height="500px">
			      <figcaption>
			        <h1>${fn:substring(mods.modBigImgContent, 0,3)}</h1>
			        <p>
			          ${mods.modBigImgContent}
			        </p>
			      </figcaption>
			    </figure>
			  </li>
			  </c:forEach>
			  <li>
			    <figure style="height: 490px;color:#fff;background-color: #fff">     
			           <span style="overflow-y: scroll; margin-right: 60px;padding-left: 20px;margin-top:10px;margin-left:60px;padding:20px;text-align: justify;line-height: 140%;font-size: 120%;color: #000;display: block;height: 390px;">
			          	<h2>${title}</h2>
			              ${textarea}
			          </span>
			    </figure>
			</li>
			</ul>
			
			<div style="text-align:center;clear:both;margin-top:20px">
			</div> 
			<div class="smalltb">
				<p style="text-align: center;"><a href="${ctx}/bigcoment.jsp"><img src="${ctx}/layout/images/liuyan.png"></a>
				<a href=""><img src="${ctx}/layout/images/fenxiang.png"></a>
				<a href=""><img src="${ctx}/layout/images/xihuan.png"></a></p>
			</div>
	</div>
</body>
  <script src="${ctx}/layout/js/jquery.js"></script>
  <script src='${ctx}/layout/js/rgbaster.min.js'></script>
  <script src='${ctx}/layout/js/jquery.adaptiveslider.min.js'></script>
  <script src="${ctx}/layout/js/jiaodian.js"></script>


</html>