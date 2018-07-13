<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
        <!-- FOOTER BEGIN -->
        <footer>
            <div id="footer">
            	<section class="top">
                	<div class="inner">
                        <div class="block_to_top">
                        	<a href="#">返回顶部</a>
                        </div>
                    </div>
                </section>
                <script type="text/javascript">
                $(function(){
                  $(".block_to_top").click(function() {
                     $("html,body").animate({scrollTop:0}, 500); }); 
                                                      })

                </script>
                
            	
                
            	<section class="bottom">
                	<div class="inner">
                    	<div class="line_1"></div>
                        
                        <div class="fr">
                        	<div class="block_menu_footer">
                            	<ul>
                                	<li><a href="${ctx}/business.jsp">Business</a></li>
                                    <li><a href="${ctx}/technology.jsp">Technology</a></li>
                                    <li><a href="${ctx}/education.jsp">Education</a></li>
                                    <li><a href="${ctx}/media.jsp">Media</a></li>
                                </ul>
                            </div>
                            
                            <div class="block_social_footer">
                            	<ul>
                                	<li><a href="#" class="fb">Facebook</a></li>
                                    <li><a href="#" class="tw">Twitter</a></li>
                                    <li><a href="#" class="rss">RSS</a></li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="block_copyrights"><p>&copy; 2011 Business Press. All rights reserved.</p></div>
                    </div>
                </section>
            </div>
        </footer>
        <!-- FOOTER END -->
