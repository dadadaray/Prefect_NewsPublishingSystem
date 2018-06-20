<%@ page language="java" contentType="text/html;	charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}/backstage"></c:set>
<c:set var="ctx1" value="${pageContext.request.contextPath}"></c:set>

<!doctype html>
      <html>

      <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <title>新闻天下发布系统</title>
      <meta name="description" content="这是一个 index 页面">
      <meta name="keywords" content="index">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="renderer" content="webkit">
      <meta http-equiv="Cache-Control" content="no-siteapp" />
      <link rel="icon" type="image/png" href="${ctx}/assets/i/favicon.png">
      <link rel="apple-touch-icon-precomposed" href="${ctx}/assets/i/app-icon72x72@2x.png">
      <meta name="apple-mobile-web-app-title" content="Amaze UI" />
      <link rel="stylesheet" href="${ctx}/assets/css/amazeui.min.css" />
      <link rel="stylesheet" href="${ctx}/assets/css/admin.css">
      <link rel="stylesheet" href="${ctx}/assets/css/app.css">
      <link rel="stylesheet" href="${ctx}/assets/css/mystyle.css">
      <script src="${ctx}/assets/js/echarts.min.js"></script>
      </head>

      <body data-type="index">


      <header class="am-topbar am-topbar-inverse admin-header">
        <div class="am-topbar-brand">
          <a href="javascript:;" class="tpl-logo">
            <img src="${ctx}/assets/img/logo.png" alt="">
          </a>
        </div>
        <div class="am-icon-list tpl-header-nav-hover-ico am-fl am-margin-right">

        </div>

        <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

        <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

          <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list tpl-header-list">
             <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen" class="tpl-header-list-link"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a>
              </li>

                    <li class="am-dropdown" data-am-dropdown data-am-dropdown-toggle>
                      <a href="${ctx}/userinfo.jsp">
                        <span class="tpl-header-list-user-nick">管理员身份</span><span class="tpl-header-list-user-ico"> <img src="${ctx}/assets/img/user01.png"></span>
                      </a>
                    </li>
                    <li><a href="${ctx1}/backstage/logOut" class="tpl-header-list-link"><span class="am-icon-sign-out tpl-header-list-ico-out-size"></span></a></li>
                  </ul>
                </div>
     </header>
     <div class="tpl-page-container tpl-page-header-fixed">


      <div class="tpl-left-nav tpl-left-nav-hover">
        <div class="tpl-left-nav-list">
          <ul class="tpl-left-nav-menu">
            <li class="tpl-left-nav-item">
              <a href="${ctx1}/backstage/indexBack" class="nav-link">
                <i class="am-icon-home"></i>
                <span>首页</span>
              </a>
            </li>
           <li class="tpl-left-nav-item">
            <a href="javascript:;" class="nav-link tpl-left-nav-link-list">
              <i class="am-icon-file-text"></i>
              <span>文章管理</span>
              <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
            </a>
            <ul class="tpl-left-nav-sub-menu">
              <li>
                  <a href="${ctx1}/backstage/news/back/checking/list">
                    <i class="am-icon-angle-right"></i>
                    <span>待审新文章</span>
                  </a>
                  <a href="${ctx1}/backstage/news/back/publish/list">
                    <i class="am-icon-angle-right"></i>
                    <span>已发布文章</span>
                  </a>
                  <a href="${ctx1}/backstage/news/back/unchecked/list">
                    <i class="am-icon-angle-right"></i>
                    <span>未通过文章</span>
                  </a>
             </li>
           </ul>
         </li>
        <li class="tpl-left-nav-item">
         <a href="javascript:;" class="nav-link tpl-left-nav-link-list avtive">
          <i class="am-icon-users"></i>
          <span>用户管理</span>
          <i class="am-icon-angle-right tpl-left-nav-more-ico am-fr am-margin-right"></i>
        </a>
        <ul class="tpl-left-nav-sub-menu" style="display:block;">
          <li>
            <a href="${ctx1}/backstageLoginUser/user/list?roleId=2">
              <i class="am-icon-angle-right"></i>
              <span>记者用户</span>
            </a>
            <a href="${ctx1}/backstageLoginUser/user/list?roleId=1" class="avtive">
              <i class="am-icon-angle-right"></i>
              <span>网站用户</span>
            </a>
            </li>
          </ul>
        </li> 
        <li class="tpl-left-nav-item">
          <a href="${ctx1}/backstage/logOut" class="nav-link tpl-left-nav-link-list">
            <i class="am-icon-sign-out"></i>
            <span>退出登陆</span>
          </a>
        </li>
    </ul>
  </div>
</div>

        <div class="tpl-content-wrapper">
            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-file-text-o"> </span>  用户列表
                    </div>
                    <div class="tpl-portlet-input tpl-fz-ml">
                        <div class="portlet-input input-small input-inline">
                            <div class="input-icon right">
                                <i class="am-icon-search"></i>
                                <input type="text" class="form-control form-control-solid" placeholder="搜索..."> </div>
                            </div>
                        </div>


                    </div>
                    <div class="tpl-block">
                        <div class="am-g">
                            <div class="am-u-sm-12 am-u-md-9">
                                <div class="am-btn-toolbar">
                                    <div class="am-btn-group am-btn-group-xs">
                                         <button type="button" class="am-btn am-btn-default am-btn-danger" onclick="deleteItem()"><span class="am-icon-trash-o"></span> 批量删除
                                         </button>
                                    </div>
                                </div>
                            </div>
                           
                      </div>
                      <div class="am-g">
                        <div class="am-u-sm-12">
                            <form class="am-form">
                                <table class="am-table am-table-striped am-table-hover table-main">
                                    <thead>
                                        <tr>
                                            <th class="table-check">
                                                <input type="checkbox" class="tpl-table-fz-check" id="checkall" onclick="checkallcheckbox();">
                                            </th>
                                            <th class="table-id">ID</th> 
                                            <th class="user-names">用户名</th>
                                            <th class="table-number am-hide-sm-only">电话</th>
                                            <th class="table-number am-hide-sm-only">邮箱 </th>
                                            <th class="table-date am-show-lg-only">注册日期</th>
                                            <th class="table-set">操作</th>
                                        </tr>
                                    </thead>
                                    <tbody id="doc-modal-list">
	                                    <c:if test="${not empty page and page.totalCount > 0}">
	                                    	<c:forEach items="${page.list}" var="user" varStatus="status">
		                                        <tr>
		                                            <td><input class="checkOne" type="checkbox" name="box" onclick="checkonebox()" value="${user.userInfo.userInfoId}"></td>
		                                            <td>${status.index+1}</td>
		                                            <td>
		                                                <img src="${ctx}/assets/img/user06.png" alt="" class="author_pics">
		                                                <a class="user-name" href="###">${user.loginName}</a>
		                                            </td>
		                                            <td class="am-hide-sm-only">
			                                            <c:if test="${not empty user.userInfo.phone}">
			                                            	${user.userInfo.phone}
			                                            </c:if>
			                                            <c:if test="${empty user.userInfo.phone}">
			                                            	无
			                                            </c:if>
		                                            </td>
		                                             <td class="am-hide-sm-only">${user.loginEmail}</td>
		                                            <td class="am-show-lg-only"><fmt:formatDate value="${user.userInfo.userRegistTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		                                            <td>
		                                                <div class="am-btn-toolbar">
		                                                    <div class="am-btn-group am-btn-group-xs">
		                                                        
		                                                        <input type="hidden" data-id="${user.userInfo.userInfoId}"/>
		                                                        <button type="button" class="btn-close am-btn am-btn-default am-btn-xs am-text-danger ">
		                                                            <span class="am-icon-trash-o"></span> 删除
		                                                        </button>
		                                                    </div>
		                                                </div>
		                                            </td>
		                                        </tr>
                                        	</c:forEach>
                                        </c:if>
                                        <c:if test="${empty page or page.totalCount <= 0}">
                               			<tr>
                               				<td colspan="7">无信息</td>
                               			</tr>
                               		</c:if>  
                                    </tbody>
                            </table>
                            <div class="am-cf">
                                <div class="am-fr">
                                    <ul class="am-pagination tpl-pagination">
                                        <li class="am-disabled"><a href="${ctx1}/backstageLoginUser/user/list?pageNum=${page.prePageNum}&roleId=1">«</a></li>
                                        <c:forEach begin="1" end="${page.totalPageNum}" var="pageNum">
                                        	<c:if test="${pageNum == page.currentPageNum}">
                                        		<li class="am-active"><a href="${ctx1}/backstageLoginUser/user/list?pageNum=${pageNum}&roleId=1">${pageNum}</a></li>
                                        	</c:if>
                                        	<c:if test="${pageNum != page.currentPageNum}">
                                        		<li><a href="${ctx1}/backstageLoginUser/user/list?pageNum=${pageNum}&roleId=1">${pageNum}</a></li>
                                        	</c:if>
                                        </c:forEach>
                                        <li><a href="${ctx1}/backstageLoginUser/user/list?pageNum=${page.nextPageNum}&roleId=1">»</a></li>
                                    </ul>
                                </div>
                            </div>
                            <hr>

                        </form>
                    </div>

                </div>
            </div>
            <div class="tpl-alert"></div>
        </div>

    </div>

</div>

    <div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
      <div class="am-modal-dialog">
        <div class="am-modal-bd" style="padding:40px 10px">
          	你，确定要删除这条记录吗？
        </div>
        <div class="am-modal-footer">
          <span class="am-modal-btn" data-am-modal-cancel>取消</span>
          <span class="am-modal-btn" data-am-modal-confirm>确定</span>
        </div>
      </div>
    </div>
<script src="${ctx}/assets/js/jquery.min.js"></script>
<script src="${ctx}/assets/js/amazeui.min.js"></script>
<script src="${ctx}/assets/js/iscroll.js"></script>
<script src="${ctx}/assets/js/app.js"></script>
<script type="text/javascript">

    //删除
    $('#doc-modal-list').find('.btn-close').on('click', function() {
        $('#my-confirm').modal({
          relatedTarget: this,
          onConfirm: function(options) {
            var $link = $(this.relatedTarget).prev('input');
            var id = $link.data('id');
            var msg =  '你要删除的链接 ID 为 ' + $link.data('id');
            $.ajax({
				type:"post",
				url:"/News-Publishing-System/backstageLoginUser/user/delete",
				data : {
					userIds : id,
				},
				success : function(data, status) {
					if (data != "0") {
						alert("删除成功！");
						window.location.href ="/News-Publishing-System/backstageLoginUser/user/list?roleId=1";
					}else{
						alert("删除出错！");
					}
				},
				error :function(){
					alert("删除出错！");
				}
			});
          },
          // closeOnConfirm: false,
          onCancel: function() {
            alert('算求，不弄了');
          }
        });
    });
    
    //用户批量删除
	function deleteItem(){
		var count = 0;
		var ids = "";
		$(".checkOne:checked").each(function(){
			ids = ids + $(this).val()+",";
			count++;
		});
		if(count==0){
			alert("请至少选择一条记录进行删除！");
			return false;
		}else{
			$.ajax({
				type:"post",
				url:"/News-Publishing-System/backstageLoginUser/user/delete",
				data : {
					userIds : ids
				},
				success : function(data, status) {
					if (data != "0") {
						alert("删除成功！");
						window.location.href ="/News-Publishing-System/backstageLoginUser/user/list?roleId=1";
					}else{
						alert("删除出错！");
					}
				},
				error :function(){
					alert("删除出错！");
				}
			});
		}
	}     

    //全选/全不选功能
    function checkallcheckbox() { 
        var ischecked = document.getElementById("checkall").checked; 
        if(ischecked) { 
            checkallbox(); 
        }else { 
            discheckallbox(); 
        } 
    } 
    //选中全部复选框
    function checkallbox() { 
        var boxarray = document.getElementsByName("box"); 
        for(var i = 0; i < boxarray.length; i++) { 
        if(boxarray[i].disabled != true)
            boxarray[i].checked = true; 
        } 
    } 
    
    //取消选中全部复选框
    function discheckallbox() { 
        var boxarray = document.getElementsByName("box"); 
        for(var i = 0; i < boxarray.length; i++) {
            boxarray[i].checked = false; 
        } 
    }
    
    //点击每个checkbox时判断是否所有的checkbox全部选中  
    function checkonebox() { 
        if(isallchecked()) { 
            document.getElementById("checkall").checked = true; 
        }
        if(isalldischecked()) { 
            document.getElementById("checkall").checked = false; 
        } 
    } 
    
    //是否全部选中
    function isallchecked() { 
        var boxarray = document.getElementsByName("box"); 
        for(var i = 0; i < boxarray.length; i++) { 
            if(!boxarray[i].checked) { 
                return false; 
            } 
        } 
        return true; 
    } 
    
    //是否没有全部选中
    function isalldischecked() { 
        var boxarray = document.getElementsByName("box"); 
        for(var i = 0; i < boxarray.length; i++) { 
            if(!boxarray[i].checked) { 
                return true; 
            } 
        } 
        return false; 
    } 

    //查看用户
    function userPreview(){
      window.open("${ctx}/userinfo.jsp");
    }
</script>
</body>

</html>