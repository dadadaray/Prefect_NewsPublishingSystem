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
<link rel="stylesheet" href="${ctx}/backstage/assets/css/xcConfirm.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body>
	<div class="bigbg">
			<input id="newsId" value="${OneNews.newsId}" type="hidden"/>
			<ul class="adaptive-slider"> 
			  <!-- Slider Item -->
			  <c:forEach items="${OneNews.modBigImgs}" var="mods" varStatus="status">
			  <li>
			    <figure>
			      <img src="${ctx}/newsImgUp/${mods.modBigImgUrl}" width="980px" height="500px">
			      <figcaption>
			        <h1>${fn:substring(mods.modBigImgContent, 0,3)}</h1>
			        <p>
			         ${mods.modBigImgContent}
			        </p>
			      </figcaption>
			    </figure>
			  </li>
			  </c:forEach>
			  <!-- End Slider Item -->

			  <!-- Slider Item -->
			  <!--  <li>
			    <figure>
			      <img src="${ctx}/images/2.jpg">
			      <figcaption>
			        <h1>Dolor Sit Amet</h1>
			        <p>
			          Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
			        </p>
			      </figcaption>
			    </figure>
			  </li>-->
			  <!-- End Slider Item -->

			  <!-- Slider Item -->
			  <!--  <li>
			    <figure>
			      <img src="${ctx}/images/3.jpg">
			      <figcaption>
			        <h1>This is an example image</h1>
			        <p>
			          Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
			        </p>
			      </figcaption>
			    </figure>
			  </li>-->
			  <!-- End Slider Item -->

			  <!-- Slider Item -->
			  <!--  <li>
			    <figure>
			      <img src="${ctx}/images/4.jpg">
			      <figcaption>
			        <h1>This one has no description</h1>

			      </figcaption>
			    </figure>
			  </li>-->
			  <!-- End Slider Item -->

			  <!-- Slider Item -->
			  <!--  <li>
			    <figure>
			      <img src="${ctx}/images/5.jpg">
			      <figcaption>
			        <h1>This is awesome!</h1>
			        <p>
			          Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
			        </p>
			      </figcaption>
			    </figure>
			  </li>-->
			  <!-- End Slider Item -->

			  <!-- Slider Item -->
			  <!--  <li>
			    <figure>
			      <img src="${ctx}/images/6.jpg">
			      <figcaption>
			        <h1>This is awesome!</h1>
			        <p>
			          Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
			        </p>
			      </figcaption>
			    </figure>
			  </li>-->
			  <!-- End Slider Item -->
			  <li>
			    <figure style="height: 490px;color:#fff;background-color: #fff">     
			          <span style="overflow-y: scroll; margin-right: 60px;padding-left: 20px;margin-top:10px;margin-left:60px;padding:20px;text-align: justify;line-height: 140%;font-size: 120%;color: #000;display: block;height: 390px;width:820px;">
			          	<h2>${OneNews.newsTitle }</h2>
			             ${OneNews.bigImgContent }
			          </span>
			    </figure>
			</li>
			</ul>
			<div style="text-align:center;clear:both;margin-top:20px">
			</div> 
			<div class="smalltb">
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
</body>
  <script src="${ctx}/layout/js/jquery.js"></script>
  <script src='${ctx}/layout/js/rgbaster.min.js'></script>
  <script src='${ctx}/layout/js/jquery.adaptiveslider.min.js'></script>
  <script src="${ctx}/layout/js/jiaodian.js"></script>
  <script src="${ctx}/backstage/assets/js/xcConfirm.js"></script>
  <script type="text/javascript">
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