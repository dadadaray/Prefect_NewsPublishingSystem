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
                      
                        <div class="separator" style="height:30px;">
                            <a href="../后台/add_news.jsp"><span style="float:right;font-size: 16px;">返&nbsp&nbsp回</span></a>
                        </div>
                        
                        <article class="block_single_news">
                            <div class="f_pic"><a href="#"><img src="${ctx}/images/pic_news_post_1.jpg" alt="" /></a></div>
                            <p class="title">
                                <h1>中国工厂太魔幻：未来每2分钟下线一辆汽车</h1>
                            </p>
                            
                            <div class="info">
                                <div class="date"><p>15 July, 2012</p></div>
                                <div class="author"><p>作者: <a href="#">王敏</a></p></div>
                                    
                                <div class="r_part">
                                    <a href="#" class="views">0</a>
                                    <a href="#" class="comments">0</a>
                                </div>
                            </div>
                            
                            <div class="content">
                                <p class="text_p">　世界，正处在新科技革命和产业变革的交汇点上。信息化、工业化不断融合，以机器人技术为代表的智能装备产业蓬勃兴起。2017年，中国继续成为全球第一大工业机器人市场，销量突破12万台，约占全球总产量的三分之一。与此同时，中国连续第九年成为全球高端数控机床第一消费大国，全球50%的数控机床装在了中国的生产线上。这一年，中国的人工智能企业总数接近600家，跃升世界第二,小编在这为您梳理中国智造“英雄谱”，相信你看完一定会被它们惊艳↓↓↓</p>
                                <h3>重器：智能制造核心-数字化仿真智能工厂</h3>
                                <p class="text_p"><b>最牛实力：</b>这间数字化仿真工厂，冲压环节的零件加工合格率达到100%，焊装环节的焊点定位合格率达到99.8%，总装环节的装配合格率更是达到100%。工程师们通过在仿真系统中的模拟演练，可以减少人为失误风险，大幅节约制造成本，缩短研发周期。.</p> 
                                <div class="pic_con_sty1"> 
                                    <img class="pic_con_style_tu" src="${ctx}/images/pic_technology_big.jpg" alt="" />
                                </div>
                                       
                                <p class="text_p"><b>重器地位:</b>这是中国第一套全流程汽车仿真生产系统。如今，仿真工厂验收成功，智能工厂投入生产！未来这里每两分钟将有一辆高端家用汽车下线，更多的中国消费者将在价格不变的情况下，享受到性能比肩国外高端品牌的国产汽车。</p> 
                                <h3>重器：传统产业智能制造先锋—起重机转台智能生产线</h3>
                                <p class="text_p"><b>　重器地位：</b>全球起重机行业首条大型结构件智能化生产线，覆盖20余种产品，是多品种、小批量、离散型的传统工业探索智能制造的里程碑.</p> 
                                <p class="text_p">　智能制造时代来临，中国正在涌现一个又一个“智造先锋”，涵盖石化、钢铁、航空、汽车等82个行业。两年来，平均生产效率提高30%，能源利用率提升10%。<a href="#" class="lnk_blue text_a"><b>智能制造时代</b></a>查看恢弘气势</p>  
                                <blockquote class="full">引言样式</blockquote>
                                
                            </div>
                        </article>
                        
                        <div class="separator" style="height:4px;"></div>
                        
                        <div class="block_post_tags">
                            <p>标签: <a href="#">商业,</a><a href="#">股票</a></p>
                        </div>
                        
                        
                    </div>
                
                	
                </div>
            </div>
        </div>
    	<!-- CONTENT END -->
    </div>

	<!-- login -->
	<%@ include file="login.jsp"%>  
	
</body>
<script type="text/javascript">
    <!-- 回车登陆 -->
    $(document).keyup(function(e) {
        if (e.keyCode == 13) {
            $("#submit1").click()
        }
    });
    /*点赞，点击变换图片*/
    function toggle(){
        debugger;
        var xihuan_change = $('#xihuan_change');
        var val = xihuan_change.attr("src").indexOf('2');
          
        if(val >= 0){
            $('#xihuan_change').attr('src', 'layout/images/xihuan1.png');  
        }else{
            $('#xihuan_change').attr('src', 'layout/images/xihuan2.png');  
        }
    }
</script>
</html>