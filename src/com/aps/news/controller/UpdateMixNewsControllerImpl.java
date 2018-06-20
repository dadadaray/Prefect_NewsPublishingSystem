/**
 * @FileName com.aps.news.controller/updateMixNewsControllerImpl.java 
 * @Project News-Publishing-System
 * @author lenovo 
 * @date 2018年5月8日 下午3:51:02
 * @version 
 * @Description TODO
 */

package com.aps.news.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.aps.entity.LoginUser;
import com.aps.entity.ModMixLR;
import com.aps.entity.News;
import com.aps.news.service.AddNewsServiceImpl;
import com.aps.news.service.NewsServiceImpl;
import com.aps.news.service.UpdateNewsServiceImpl;
import com.aps.newsType.service.NewsTypeServiceImpl;
import com.aps.notice.service.NoticeServiceImpl;

/**
 * 
 * @ClassName updateMixNewsControllerImpl
 * @Description TODO
 * @author HanChen
 * @version
 *
 */
@Controller
@RequestMapping("updatenews")
public class UpdateMixNewsControllerImpl {
	
	@Resource
	private AddNewsServiceImpl addNewsServiceImpl;
	
	@Resource
	private UpdateNewsServiceImpl updateNewsServiceImpl;

	@Resource
	private NewsTypeServiceImpl NewsTypeServiceImpl;

	@Resource
	private NewsServiceImpl newsServiceImpl;

	@Resource
	private NoticeServiceImpl noticeServiceImpl;
	
	/**
	 * @dec 模板1 上传新闻
	 * @actor Ray
	 * @param file1
	 * @param file2
	 * @param file3
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "mod1SendNews", method = RequestMethod.POST)
	public String mod1SendNews(@RequestParam("mod1title") String mod2title, @RequestParam("file1") MultipartFile file1,
			@RequestParam("textarea1") String textarea1, @RequestParam("file2") MultipartFile file2,
			@RequestParam("textarea2") String textarea2, @RequestParam("file3") MultipartFile file3,
			@RequestParam("textarea3") String textarea3, @RequestParam("selectmod1") Integer selectmod2,
			@RequestParam("coverImg") MultipartFile coverImg, HttpServletRequest request, HttpServletResponse response,
			@RequestParam("newsId") int newsId, HttpSession session) throws IOException {
		
		// 获取用户信息
		LoginUser loginUser = (LoginUser) session.getAttribute("bloginUser");

		// 存入新闻
		News news2 = this.newsServiceImpl.getOneNews(newsId);
		if( null != news2){
			String newFileName1 = "", newFileName2 = "", newFileName3 = "", newcoverImgname = "";
			byte[] bs = new byte[1024];
			int len;
			// 保存路径
			String realpath = System.getProperty("b2cweb.root") + "newsImgUp";
			File saveFile = new File(realpath);
			if (!saveFile.exists()) {
				saveFile.mkdirs();
			}
			// 第一个图片
			String filename1 = file1.getOriginalFilename();
			if(StringUtils.isNotEmpty(filename1)){
				newFileName1 = addNewsServiceImpl.makeFileName(filename1);
				// 写入本地磁盘
				InputStream is = file1.getInputStream();
				OutputStream os = new FileOutputStream(realpath + "\\" + newFileName1);
				while ((len = is.read(bs)) != -1) {
					os.write(bs, 0, len);
				}
				os.close();
				is.close();
			}else{
				newFileName1 = news2.getModMixLRs().iterator().next().getmMixLRImgOne();
			}
			// 第二个图片
			String filename2 = file2.getOriginalFilename();
			if(StringUtils.isNotEmpty(filename2)){
				newFileName2 = addNewsServiceImpl.makeFileName(filename2);
				InputStream is1 = file2.getInputStream();
				OutputStream os1 = new FileOutputStream(realpath + "\\" + newFileName2);
				while ((len = is1.read(bs)) != -1) {
					os1.write(bs, 0, len);
				}
				os1.close();
				is1.close();
			}else{
				newFileName2 = news2.getModMixLRs().iterator().next().getmMixLRImgTwo();
			}

			// 第三个图片
			String filename3 = file3.getOriginalFilename();
			if(StringUtils.isNotEmpty(filename3)){
				newFileName3 = addNewsServiceImpl.makeFileName(filename3);
				InputStream is2 = file3.getInputStream();
				OutputStream os2 = new FileOutputStream(realpath + "\\" + newFileName3);
				while ((len = is2.read(bs)) != -1) {
					os2.write(bs, 0, len);
				}
				os2.close();
				is2.close();
			}else{
				newFileName3 = news2.getModMixLRs().iterator().next().getmMixLRImgThree();
			}

			
			// 封面图片
			String coverImgname = coverImg.getOriginalFilename();
			if(StringUtils.isNotEmpty(coverImgname)){
				newcoverImgname = addNewsServiceImpl.makeFileName(coverImgname);
				InputStream is3 = coverImg.getInputStream();
				OutputStream os3 = new FileOutputStream(realpath + "\\" + newcoverImgname);
				while ((len = is3.read(bs)) != -1) {
					os3.write(bs, 0, len);
				}
				os3.close();
				is3.close();
			}else{
				newcoverImgname = news2.getCoverImgUrl();
			}
			
			news2.setNewsTitle(mod2title);
			news2.setCoverImgUrl(newcoverImgname);
			// 获取当前时间
			Date currentTime = new Date();
			news2.setCreateTime(currentTime);
			news2.setTopShow(0);
			news2.setStatues(1);
			// 设置发表数量
			if (loginUser.getUserInfo().getSendpassNum() == null) {
				loginUser.getUserInfo().setSendpassNum(0);
			}
			loginUser.getUserInfo().setSendpassNum(loginUser.getUserInfo().getSendpassNum() + 1);
			// 设置审核人id
			news2.setAuditorId(30);
			// 设置新闻编辑人
			LoginUser u = (LoginUser) session.getAttribute("bloginUser");
			news2.setUserInfo(u.getUserInfo());
			
			//更新模板
			Set<ModMixLR> modMixLRs = new HashSet<ModMixLR>(0);
			modMixLRs = news2.getModMixLRs();
			if( modMixLRs.size() > 0 ){
				Iterator<ModMixLR> iterator = modMixLRs.iterator();
				while(iterator.hasNext()){
					ModMixLR mod = (ModMixLR) iterator.next();
					this.updateNewsServiceImpl.updateModMixLR(newFileName1, textarea1, newFileName2, textarea2,
							newFileName3, textarea3, news2, mod.getModMixLRId());
					
				}
			}
			
			news2.setModMixLRs(modMixLRs);
	
			// 设置新闻类型
			news2.setNewsType(this.NewsTypeServiceImpl.getNewTypeById(selectmod2));
			//清空浏览量
			news2.setViews(0);
			news2.setCommentNum(0);
			news2.setLikes(0);
			news2.setShare(0);
			
			// 更新新闻模板
			this.newsServiceImpl.updateNews(news2);
			
			// 给管理员发送通知
			this.noticeServiceImpl.publish(news2.getNewsId(), loginUser);
	
			session.setAttribute("newsmodMixLR", news2);
		}
		return "redirect:/backstage/news/checking/list";
	}
	
	@RequestMapping(value = "mod1SaveNewsdraft", method = RequestMethod.POST)
	public String mod1SaveNewsDraft(@RequestParam("mod1title") String mod2title,
			@RequestParam("file1") MultipartFile file1, @RequestParam("textarea1") String textarea1,
			@RequestParam("file2") MultipartFile file2, @RequestParam("textarea2") String textarea2,
			@RequestParam("file3") MultipartFile file3, @RequestParam("textarea3") String textarea3,
			@RequestParam("selectmod1") Integer selectmod2, @RequestParam("newsId") int newsId,
			@RequestParam("coverImg") MultipartFile coverImg, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws IOException {
		// 存入新闻
		News news2 = this.newsServiceImpl.getOneNews(newsId);
		
		if( null != news2){
			String newFileName1 = "", newFileName2 = "", newFileName3 = "", newcoverImgname = "";
			byte[] bs = new byte[1024];
			int len;
			// 保存路径
			String realpath = System.getProperty("b2cweb.root") + "newsImgUp";
			File saveFile = new File(realpath);
			if (!saveFile.exists()) {
				saveFile.mkdirs();
			}
			// 第一个图片
			String filename1 = file1.getOriginalFilename();
			if(StringUtils.isNotEmpty(filename1)){
				newFileName1 = addNewsServiceImpl.makeFileName(filename1);
				// 写入本地磁盘
				InputStream is = file1.getInputStream();
				OutputStream os = new FileOutputStream(realpath + "\\" + newFileName1);
				while ((len = is.read(bs)) != -1) {
					os.write(bs, 0, len);
				}
				os.close();
				is.close();
			}else{
				newFileName1 = news2.getModMixLRs().iterator().next().getmMixLRImgOne();
			}
			// 第二个图片
			String filename2 = file2.getOriginalFilename();
			if(StringUtils.isNotEmpty(filename2)){
				newFileName2 = addNewsServiceImpl.makeFileName(filename2);
				InputStream is1 = file2.getInputStream();
				OutputStream os1 = new FileOutputStream(realpath + "\\" + newFileName2);
				while ((len = is1.read(bs)) != -1) {
					os1.write(bs, 0, len);
				}
				os1.close();
				is1.close();
			}else{
				newFileName2 = news2.getModMixLRs().iterator().next().getmMixLRImgTwo();
			}

			// 第三个图片
			String filename3 = file3.getOriginalFilename();
			if(StringUtils.isNotEmpty(filename3)){
				newFileName3 = addNewsServiceImpl.makeFileName(filename3);
				InputStream is2 = file3.getInputStream();
				OutputStream os2 = new FileOutputStream(realpath + "\\" + newFileName3);
				while ((len = is2.read(bs)) != -1) {
					os2.write(bs, 0, len);
				}
				os2.close();
				is2.close();
			}else{
				newFileName3 = news2.getModMixLRs().iterator().next().getmMixLRImgThree();
			}

			// 封面图片
			String coverImgname = coverImg.getOriginalFilename();
			if(StringUtils.isNotEmpty(coverImgname)){
				newcoverImgname = addNewsServiceImpl.makeFileName(coverImgname);
				InputStream is3 = coverImg.getInputStream();
				OutputStream os3 = new FileOutputStream(realpath + "\\" + newcoverImgname);
				while ((len = is3.read(bs)) != -1) {
					os3.write(bs, 0, len);
				}
				os3.close();
				is3.close();
			}else{
				newcoverImgname = news2.getCoverImgUrl();
			}
			
			news2.setNewsTitle(mod2title);
			news2.setCoverImgUrl(newcoverImgname);
			// 获取当前时间
			Date currentTime = new Date();
			news2.setCreateTime(currentTime);
			news2.setTopShow(0);
			news2.setStatues(0);
			// 设置审核人id
			news2.setAuditorId(30);
			// 设置新闻编辑人
			LoginUser u = (LoginUser) session.getAttribute("bloginUser");
			news2.setUserInfo(u.getUserInfo());

			//更新模板
			Set<ModMixLR> modMixLRs = new HashSet<ModMixLR>(0);
			modMixLRs = news2.getModMixLRs();
			if( modMixLRs.size() > 0 ){
				Iterator<ModMixLR> iterator = modMixLRs.iterator();
				while(iterator.hasNext()){
					ModMixLR mod = (ModMixLR) iterator.next();
					this.updateNewsServiceImpl.updateModMixLR(newFileName1, textarea1, newFileName2, textarea2,
							newFileName3, textarea3, news2, mod.getModMixLRId());
					
				}
			}
			news2.setModMixLRs(modMixLRs);
			// 设置新闻类型
			news2.setNewsType(this.NewsTypeServiceImpl.getNewTypeById(selectmod2));
	    }

		this.newsServiceImpl.updateNews(news2);

		session.setAttribute("newsDraft", news2);
		session.setAttribute("newsmodMixLR", news2);

		return "redirect:/backstage/draft/list";
	}
}
