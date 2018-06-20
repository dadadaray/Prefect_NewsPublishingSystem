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
                    	<div id="logo_bottom"><a href="${ctx}/index.jsp"><img src="${ctx}/images/logo_bottom.png" alt="" /></a></div>
                        
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
                
            	<section class="middle">
                	<div class="inner">
                    	<div class="line_1"></div>
                        
                        <div class="block_footer_widgets">
                        	<div class="column">
                            	<h3>记者</h3>
                                
                                <div class="block_flickr_footer">
                                	<ul>
                                        <li><a href="http://www.flickr.com/" target="_blank"><img src="${ctx}/images/pic_flickr_1.png" alt="" /></a></li>
                                        <li><a href="http://www.flickr.com/" target="_blank"><img src="${ctx}/images/pic_flickr_2.png" alt="" /></a></li>
                                        <li><a href="http://www.flickr.com/" target="_blank"><img src="${ctx}/images/pic_flickr_3.png" alt="" /></a></li>
                                        <li><a href="http://www.flickr.com/" target="_blank"><img src="${ctx}/images/pic_flickr_4.png" alt="" /></a></li>
                                        <li><a href="http://www.flickr.com/" target="_blank"><img src="${ctx}/images/pic_flickr_5.png" alt="" /></a></li>
                                        <li><a href="http://www.flickr.com/" target="_blank"><img src="${ctx}/images/pic_flickr_6.png" alt="" /></a></li>
                                        <li><a href="http://www.flickr.com/" target="_blank"><img src="${ctx}/images/pic_flickr_7.png" alt="" /></a></li>
                                        <li><a href="http://www.flickr.com/" target="_blank"><img src="${ctx}/images/pic_flickr_8.png" alt="" /></a></li>
                                    </ul>
                                </div>
                            </div>
                            
                            <div class="column">
                            	<h3>标签</h3>
                                
                                <div class="block_tags">
                                	<ul>
                                    	<li><a href="#">商业</a></li>
                                        <li><a href="#">民生</a></li>
                                        <li><a href="#">金融</a></li>
                                        <li><a href="#">科技</a></li>
                                        <li><a href="#">education</a></li>
                                        <li><a href="#">AI</a></li>
                                        <li><a href="#">Sport</a></li>
                                        <li><a href="#">mobile</a></li>
                                        <li><a href="#">Technology</a></li>
                                        <li><a href="#">computer</a></li>
                                        <li><a href="#">Video</a></li>
                                        <li><a href="#">apple</a></li>
                                        <li><a href="#">news</a></li>
                                        <li><a href="#">flowers</a></li>
                                    </ul>
                                </div>
                            </div>
                            
                            <div class="column">
                            	<h3>浏览最多</h3>
                                
                                <div class="block_most_read_news">
                                	<div class="article">
                                    	<div class="pic">
                                        	<a href="${ctx}/news_post.jsp" class="w_hover">
                                            	<img src="${ctx}/images/pic_most_read_1.png" alt="" />
                                                <span></span>
                                            </a>
                                        </div>
                                        
                                        <div class="text">
                                        	<p class="title"><a href="${ctx}/news_post.jsp">9枚导弹飞向美国！普京的宣传片里卖的什么药？</a></p>
                                            <p class="date">08 July, 2012</p>
                                        </div>
                                    </div>
                                    <div class="line_1"></div>
                                    
                                    <div class="article">
                                    	<div class="pic">
                                        	<a href="${ctx}/news_post.jsp" class="w_hover">
                                            	<img src="${ctx}/images/pic_most_read_2.png" alt="" />
                                                <span></span>
                                            </a>
                                        </div>
                                        
                                        <div class="text">
                                        	<p class="title"><a href="${ctx}/news_post.jsp">9枚导弹飞向美国！普京的宣传片里卖的什么药？</a></p>
                                            <p class="date">08 July, 2012</p>
                                        </div>
                                    </div>
                                    <div class="line_1"></div>
                                    
                                    <div class="article">
                                    	<div class="pic">
                                        	<a href="${ctx}/news_post.jsp" class="w_hover">
                                            	<img src="${ctx}/images/pic_most_read_3.png" alt="" />
                                                <span></span>
                                            </a>
                                        </div>
                                        
                                        <div class="text">
                                        	<p class="title"><a href="${ctx}/news_post.jsp">9枚导弹飞向美国！普京的宣传片里卖的什么药？</a></p>
                                            <p class="date">08 July, 2012</p>
                                        </div>
                                    </div>
                                    <div class="line_1"></div>
                                    
                                </div>
                            </div>
                            
                            <div class="column">
                            	<h3>意见反馈</h3>
                                
                                <div class="block_contact_footer">
                                	<form action="#" />
                                    	<p class="text">姓名:</p>
                                        <div class="field"><input type="text" /></div>
                                        
                                        <p class="text">邮箱:</p>
                                        <div class="field"><input type="text" /></div>
                                        
                                        <p class="text">反馈信息:</p>
                                        <div class="textarea"><textarea cols="1" rows="1"></textarea></div>
                                        
                                        <div class="clear_form"><input type="reset" value="重新填写" /></div>
                                        <div class="send"><input type="submit" class="general_button" value="提交" /></div>
                                        
                                        <div class="clearboth"></div>
                                    </form>
                                </div>
                            </div>
                            
                            <div class="clearboth"></div>
                        </div>
                    </div>
                </section>
                
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
