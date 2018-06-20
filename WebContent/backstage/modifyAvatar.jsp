<%@ page language="java" contentType="text/html;	charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx1" value="${pageContext.request.contextPath}"></c:set>
<c:set var="ctx" value="${pageContext.request.contextPath}/backstage"></c:set>
<%
	request.setCharacterEncoding("utf-8");
%>
<html lang="en-gb" dir="ltr" class="uk-notouch">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 网站缩略图 -->
<link rel="icon" type="image/png" href="${ctx}/assets/i/favicon.png">
<!-- 头像上传  -->
<link href="${ctx}/assets/css/main.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/assets/css/jquery.Jcrop.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
<c:if test="${empty bloginUser}">
		window.close();
</c:if>
	<div>
		<div class="demo">
			<div class="bheader">
				<h2>上传头像</h2>
			</div>
			<div class="bbody">
				<!-- upload form -->
				<form id="upload_form" enctype="multipart/form-data" method="post" action="${ctx1}/userimg/upload" target="_parent" onsubmit="return checkForm()">
					<!-- hidden crop params -->
					<input type="hidden" id="x1" name="x1" /> <input type="hidden" id="y1" name="y1" /> <input type="hidden" id="x2" name="x2" /> <input type="hidden" id="y2" name="y2" />
					<h3>请选择要上传的头像</h3>
					<div>
						<input type="file" name="image_file" id="image_file" onchange="fileSelectHandler()" />
					</div>

					<div class="error"></div>

					<div class="step2">
						<h2>编辑您的头像</h2>
						<img id="preview" />

						<div class="info">

							<label>类型</label> <input type="text" id="filetype" name="filetype" /> <label>长</label> <input type="text" id="w" name="w" /> <label>高</label> <input type="text" id="h" name="h" />
						</div>

						<input id="headSubmit" type="submit" value="上传" />
					</div>
				</form>
			</div>
		</div>
		<div style="text-align: center; clear: both">
			<br> <br>
		</div>
	</div>
</body>

<script src="${ctx}/assets/js/jquery-1.8.3.min.js"></script>
<script src="${ctx}/assets/js/jquery.Jcrop.min.js"></script>
<script src="${ctx}/assets/js/script.js"></script>
<script type="text/javascript">
	$("#headSubmit").click(function(){
		//window.close();
	});
</script>
</html>