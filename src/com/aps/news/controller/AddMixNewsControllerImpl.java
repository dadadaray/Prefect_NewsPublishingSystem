package com.aps.news.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashSet;
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
import com.aps.entity.ModMixCenter;
import com.aps.entity.ModMixLR;
import com.aps.entity.ModMixSingle;
import com.aps.entity.News;
import com.aps.news.service.AddNewsServiceImpl;
import com.aps.news.service.NewsServiceImpl;
import com.aps.newsType.service.NewsTypeServiceImpl;
import com.aps.notice.service.NoticeServiceImpl;

@Controller
@RequestMapping("addnews")
public class AddMixNewsControllerImpl {
	@Resource
	private AddNewsServiceImpl addNewsServiceImpl;

	@Resource
	private NewsTypeServiceImpl NewsTypeServiceImpl;

	@Resource
	private NewsServiceImpl newsServiceImpl;

	@Resource
	private NoticeServiceImpl noticeServiceImpl;
	
	@Resource
	private NewsTypeServiceImpl newsTypeServiceImpl;
	/**
	 * @dec 模板2 上传新闻
	 * @actor Ray
	 * @param file1
	 * @param file2
	 * @param file3
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "mod2SendNews", method = RequestMethod.POST)
	public String mod2SendNews(@RequestParam("mod2title") String mod2title, @RequestParam("file1") MultipartFile file1,
			@RequestParam("textarea1") String textarea1, @RequestParam("file2") MultipartFile file2,
			@RequestParam("textarea2") String textarea2, @RequestParam("file3") MultipartFile file3,
			@RequestParam("textarea3") String textarea3, @RequestParam("selectmod2") Integer selectmod2,
			@RequestParam("coverImg") MultipartFile coverImg, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IOException {
		// 获取用户信息
		LoginUser loginUser = (LoginUser) session.getAttribute("bloginUser");

		// 第一个图片
		String filename1 = file1.getOriginalFilename();
		String newFileName1 = addNewsServiceImpl.makeFileName(filename1);

		// 第二个图片
		String filename2 = file2.getOriginalFilename();
		String newFileName2 = addNewsServiceImpl.makeFileName(filename2);

		// 第三个图片
		String filename3 = file3.getOriginalFilename();
		String newFileName3 = addNewsServiceImpl.makeFileName(filename3);

		// 封面图片
		String coverImgname = coverImg.getOriginalFilename();
		String newcoverImgname = addNewsServiceImpl.makeFileName(coverImgname);

		// 写入本地磁盘
		InputStream is = file1.getInputStream();
		InputStream is1 = file2.getInputStream();
		InputStream is2 = file3.getInputStream();
		InputStream is3 = coverImg.getInputStream();

		byte[] bs = new byte[1024];
		int len;
		// 保存路径
		String realpath = System.getProperty("b2cweb.root") + "newsImgUp";
		File saveFile = new File(realpath);
		if (!saveFile.exists()) {
			saveFile.mkdirs();
		}
		OutputStream os = new FileOutputStream(realpath + "\\" + newFileName1);
		while ((len = is.read(bs)) != -1) {
			os.write(bs, 0, len);
		}
		os.close();
		is.close();
		OutputStream os1 = new FileOutputStream(realpath + "\\" + newFileName2);
		while ((len = is1.read(bs)) != -1) {
			os1.write(bs, 0, len);
		}
		os1.close();
		is1.close();
		OutputStream os2 = new FileOutputStream(realpath + "\\" + newFileName3);
		while ((len = is2.read(bs)) != -1) {
			os2.write(bs, 0, len);
		}
		os2.close();
		is2.close();
		OutputStream os3 = new FileOutputStream(realpath + "\\" + newcoverImgname);
		while ((len = is3.read(bs)) != -1) {
			os3.write(bs, 0, len);
		}
		os3.close();
		is3.close();

		// 存入新闻
		News news1 = new News();
		news1.setNewsTitle(mod2title);
		news1.setCoverImgUrl(newcoverImgname);
		// 获取当前时间
		Date currentTime = new Date();
		news1.setCreateTime(currentTime);
		news1.setStatues(1);
		news1.setTopShow(0);
		// 设置审核人id
		if (loginUser.getUserInfo().getSendpassNum() == null) {
			loginUser.getUserInfo().setSendpassNum(0);
		}
		
		loginUser.getUserInfo().setSendpassNum(loginUser.getUserInfo().getSendpassNum() + 1);
		news1.setCommentNum(0);
		news1.setViews(0);
		news1.setShare(0);
		news1.setLikes(0);
		news1.setAuditorId(30);
		// 设置新闻编辑人
		LoginUser u = (LoginUser) session.getAttribute("bloginUser");
		news1.setUserInfo(u.getUserInfo());
		Set<ModMixCenter> modMixCenters = new HashSet<ModMixCenter>(0);
		// 保存模板
		ModMixCenter mod = this.addNewsServiceImpl.saveModMixCenter(newFileName1, textarea1, newFileName2, textarea2,
				newFileName3, textarea3, news1);
		modMixCenters.add(mod);
		news1.setModMixCenters(modMixCenters);
		// 设置新闻类型
		news1.setNewsType(this.NewsTypeServiceImpl.getNewTypeById(selectmod2));
		this.newsServiceImpl.saveNews(news1);
		// 给管理员发送通知
		this.noticeServiceImpl.publish(news1.getNewsId(), loginUser);

		session.setAttribute("newsmodMixCenter", news1);
		session.setAttribute("1", mod);

		return "redirect:/backstage/news/checking/list";
	}

	/**
	 * @dec 模板二保存到草稿箱
	 * @param mod2title
	 * @param file1
	 * @param textarea1
	 * @param file2
	 * @param textarea2
	 * @param file3
	 * @param textarea3
	 * @param selectmod2
	 * @param coverImg
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "mod2SaveDraftNews", method = RequestMethod.POST)
	public String saveDraft(@RequestParam(value = "mod2title", required = false) String mod2title,
			@RequestParam(value = "file1", required = false) MultipartFile file1,
			@RequestParam(value = "textarea1", required = false) String textarea1,
			@RequestParam(value = "file2", required = false) MultipartFile file2,
			@RequestParam(value = "textarea2", required = false) String textarea2,
			@RequestParam(value = "file3", required = false) MultipartFile file3,
			@RequestParam(value = "textarea3", required = false) String textarea3,
			@RequestParam(value = "selectmod2", required = false) Integer selectmod2,
			@RequestParam(value = "coverImg", required = false) MultipartFile coverImg, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws IOException {

		// 第一个图片
		String filename1 = file1.getOriginalFilename();
		String newFileName1 = addNewsServiceImpl.makeFileName(filename1);

		// 第二个图片
		String filename2 = file2.getOriginalFilename();
		String newFileName2 = addNewsServiceImpl.makeFileName(filename2);

		// 第三个图片
		String filename3 = file3.getOriginalFilename();
		String newFileName3 = addNewsServiceImpl.makeFileName(filename3);

		// 封面图片
		String coverImgname = coverImg.getOriginalFilename();
		String newcoverImgname = addNewsServiceImpl.makeFileName(coverImgname);

		// 写入本地磁盘
		InputStream is = file1.getInputStream();
		InputStream is1 = file2.getInputStream();
		InputStream is2 = file3.getInputStream();
		InputStream is3 = coverImg.getInputStream();

		byte[] bs = new byte[1024];
		int len;
		// 保存路径
		String realpath = System.getProperty("b2cweb.root") + "newsImgUp";
		File saveFile = new File(realpath);
		if (!saveFile.exists()) {
			saveFile.mkdirs();
		}
		OutputStream os = new FileOutputStream(realpath + "\\" + newFileName1);
		while ((len = is.read(bs)) != -1) {
			os.write(bs, 0, len);
		}
		os.close();
		is.close();
		OutputStream os1 = new FileOutputStream(realpath + "\\" + newFileName2);
		while ((len = is1.read(bs)) != -1) {
			os1.write(bs, 0, len);
		}
		os1.close();
		is1.close();
		OutputStream os2 = new FileOutputStream(realpath + "\\" + newFileName3);
		while ((len = is2.read(bs)) != -1) {
			os2.write(bs, 0, len);
		}
		os2.close();
		is2.close();
		OutputStream os3 = new FileOutputStream(realpath + "\\" + newcoverImgname);
		while ((len = is3.read(bs)) != -1) {
			os3.write(bs, 0, len);
		}
		os3.close();
		is3.close();

		// 存入新闻
		News news1 = new News();
		news1.setNewsTitle(mod2title);
		news1.setCoverImgUrl(newcoverImgname);
		// 获取当前时间
		Date currentTime = new Date();
		news1.setCreateTime(currentTime);
		news1.setTopShow(0);
		news1.setStatues(0);
		// 设置审核人id
		news1.setAuditorId(30);
		// 设置新闻编辑人
		LoginUser u = (LoginUser) session.getAttribute("bloginUser");
		news1.setUserInfo(u.getUserInfo());

		Set<ModMixCenter> modMixCenters = new HashSet<ModMixCenter>(0);
		// 保存模板
		ModMixCenter mod = this.addNewsServiceImpl.saveModMixCenter(newFileName1, textarea1, newFileName2, textarea2,
				newFileName3, textarea3, news1);
		modMixCenters.add(mod);
		news1.setModMixCenters(modMixCenters);
		// 设置新闻类型
		news1.setNewsType(this.NewsTypeServiceImpl.getNewTypeById(selectmod2));
		this.newsServiceImpl.saveNews(news1);

		session.setAttribute("newsmodMixCenterDraft", news1);
		session.setAttribute("1", mod);
		return "redirect:/backstage/draft/list";
	}

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
			HttpSession session) throws IOException {
		
		// 获取用户信息
		LoginUser loginUser = (LoginUser) session.getAttribute("bloginUser");

		// 第一个图片
		String filename1 = file1.getOriginalFilename();
		String newFileName1 = addNewsServiceImpl.makeFileName(filename1);

		// 第二个图片
		String filename2 = file2.getOriginalFilename();
		String newFileName2 = addNewsServiceImpl.makeFileName(filename2);

		// 第三个图片
		String filename3 = file3.getOriginalFilename();
		String newFileName3 = addNewsServiceImpl.makeFileName(filename3);

		// 封面图片
		String coverImgname = coverImg.getOriginalFilename();
		String newcoverImgname = addNewsServiceImpl.makeFileName(coverImgname);

		// 写入本地磁盘
		InputStream is = file1.getInputStream();
		InputStream is1 = file2.getInputStream();
		InputStream is2 = file3.getInputStream();
		InputStream is3 = coverImg.getInputStream();

		byte[] bs = new byte[1024];
		int len;
		// 保存路径
		String realpath = System.getProperty("b2cweb.root") + "newsImgUp";
		File saveFile = new File(realpath);
		if (!saveFile.exists()) {
			saveFile.mkdirs();
		}
		OutputStream os = new FileOutputStream(realpath + "\\" + newFileName1);
		while ((len = is.read(bs)) != -1) {
			os.write(bs, 0, len);
		}
		os.close();
		is.close();
		OutputStream os1 = new FileOutputStream(realpath + "\\" + newFileName2);
		while ((len = is1.read(bs)) != -1) {
			os1.write(bs, 0, len);
		}
		os1.close();
		is1.close();
		OutputStream os2 = new FileOutputStream(realpath + "\\" + newFileName3);
		while ((len = is2.read(bs)) != -1) {
			os2.write(bs, 0, len);
		}
		os2.close();
		is2.close();
		OutputStream os3 = new FileOutputStream(realpath + "\\" + newcoverImgname);
		while ((len = is3.read(bs)) != -1) {
			os3.write(bs, 0, len);
		}
		os3.close();
		is3.close();

		// 存入新闻
		News news2 = new News();
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
		news2.setCommentNum(0);
		news2.setViews(0);
		news2.setShare(0);
		news2.setLikes(0);
		// 设置审核人id
		news2.setAuditorId(30);
		// 设置新闻编辑人
		LoginUser u = (LoginUser) session.getAttribute("bloginUser");
		news2.setUserInfo(u.getUserInfo());

		Set<ModMixLR> modMixLRs = new HashSet<ModMixLR>(0);
		// 保存模板

		ModMixLR mod = this.addNewsServiceImpl.saveModMixLR(newFileName1, textarea1, newFileName2, textarea2,
				newFileName3, textarea3, news2);
		modMixLRs.add(mod);
		news2.setModMixLRs(modMixLRs);

		// 设置新闻类型
		news2.setNewsType(this.NewsTypeServiceImpl.getNewTypeById(selectmod2));
		// 保存新闻模板
		this.newsServiceImpl.saveNews(news2);
		// 给管理员发送通知
		this.noticeServiceImpl.publish(news2.getNewsId(), loginUser);

		session.setAttribute("newsmodMixLR", news2);
		return "redirect:/backstage/news/checking/list";
	}

	/**
	 * @dec 模板1 保存到草稿箱
	 * @actor Ray
	 * @param file1
	 * @param file2
	 * @param file3
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "mod1SaveNewsdraft", method = RequestMethod.POST)
	public String mod1SaveNewsDraft(@RequestParam("mod1title") String mod2title,
			@RequestParam(value = "file1", required = false) MultipartFile file1, 
			@RequestParam(value = "textarea1", required = false) String textarea1,
			@RequestParam(value = "file2", required = false) MultipartFile file2, 
			@RequestParam(value = "textarea2", required = false) String textarea2,
			@RequestParam(value = "file3", required = false) MultipartFile file3, 
			@RequestParam(value = "textarea3", required = false) String textarea3,
			@RequestParam(value = "selectmod1", required = false) Integer selectmod2, 
			@RequestParam(value = "coverImg", required = false) MultipartFile coverImg,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		/*Integer selectmod2 = 0;
		if(StringUtils.isNotEmpty(selectmod1)){
			selectmod2 = Integer.valueOf(selectmod1);
		}*/
		// 第一个图片
		String filename1 = file1.getOriginalFilename();
		String newFileName1 = addNewsServiceImpl.makeFileName(filename1);

		// 第二个图片
		String filename2 = file2.getOriginalFilename();
		String newFileName2 = addNewsServiceImpl.makeFileName(filename2);

		// 第三个图片
		String filename3 = file3.getOriginalFilename();
		String newFileName3 = addNewsServiceImpl.makeFileName(filename3);

		// 封面图片
		String coverImgname = coverImg.getOriginalFilename();
		String newcoverImgname = addNewsServiceImpl.makeFileName(coverImgname);

		// 写入本地磁盘
		InputStream is = file1.getInputStream();
		InputStream is1 = file2.getInputStream();
		InputStream is2 = file3.getInputStream();
		InputStream is3 = coverImg.getInputStream();

		byte[] bs = new byte[1024];
		int len;
		// 保存路径
		String realpath = System.getProperty("b2cweb.root") + "newsImgUp";
		File saveFile = new File(realpath);
		if (!saveFile.exists()) {
			saveFile.mkdirs();
		}
		OutputStream os = new FileOutputStream(realpath + "\\" + newFileName1);
		while ((len = is.read(bs)) != -1) {
			os.write(bs, 0, len);
		}
		os.close();
		is.close();
		OutputStream os1 = new FileOutputStream(realpath + "\\" + newFileName2);
		while ((len = is1.read(bs)) != -1) {
			os1.write(bs, 0, len);
		}
		os1.close();
		is1.close();
		OutputStream os2 = new FileOutputStream(realpath + "\\" + newFileName3);
		while ((len = is2.read(bs)) != -1) {
			os2.write(bs, 0, len);
		}
		os2.close();
		is2.close();
		OutputStream os3 = new FileOutputStream(realpath + "\\" + newcoverImgname);
		while ((len = is3.read(bs)) != -1) {
			os3.write(bs, 0, len);
		}
		os3.close();
		is3.close();

		// 存入新闻
		News news2 = new News();
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

		Set<ModMixLR> modMixLRs = new HashSet<ModMixLR>(0);
		// 保存模板
		ModMixLR mod = this.addNewsServiceImpl.saveModMixLR(newFileName1, textarea1, newFileName2, textarea2,
				newFileName3, textarea3, news2);
		modMixLRs.add(mod);
		news2.setModMixLRs(modMixLRs);
		// 设置新闻类型
		news2.setNewsType(this.NewsTypeServiceImpl.getNewTypeById(selectmod2));
		this.newsServiceImpl.saveNews(news2);

		session.setAttribute("newsDraft", news2);
		session.setAttribute("newsmodMixLR", news2);

		return "redirect:/backstage/draft/list";
	}

	/**
	 * Deck 模板3 上传新闻
	 * 
	 * @actor Ray
	 * @param file1
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "mod3SendNews", method = RequestMethod.POST)
	public String mod3SendNews(@RequestParam("mod3title") String mod2title, @RequestParam("file1") MultipartFile file1,
			@RequestParam("textarea1") String textarea1, @RequestParam("selectmod3") Integer selectmod2,
			@RequestParam("coverImg") MultipartFile coverImg, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IOException {
		// 获取用户信息
		LoginUser loginUser = (LoginUser) session.getAttribute("bloginUser");

		// 第一个图片
		String filename1 = file1.getOriginalFilename();
		String newFileName1 = addNewsServiceImpl.makeFileName(filename1);

		// 封面图片
		String coverImgname = coverImg.getOriginalFilename();
		String newcoverImgname = addNewsServiceImpl.makeFileName(coverImgname);

		// 写入本地磁盘
		InputStream is = file1.getInputStream();
		InputStream is3 = coverImg.getInputStream();

		byte[] bs = new byte[1024];
		int len;
		// 保存路径
		String realpath = System.getProperty("b2cweb.root") + "newsImgUp";
		File saveFile = new File(realpath);
		if (!saveFile.exists()) {
			saveFile.mkdirs();
		}
		OutputStream os = new FileOutputStream(realpath + "\\" + newFileName1);
		while ((len = is.read(bs)) != -1) {
			os.write(bs, 0, len);
		}
		os.close();
		is.close();
		OutputStream os3 = new FileOutputStream(realpath + "\\" + newcoverImgname);
		while ((len = is3.read(bs)) != -1) {
			os3.write(bs, 0, len);
		}
		os3.close();
		is3.close();

		// 存入新闻
		News news3 = new News();
		news3.setNewsTitle(mod2title);
		news3.setCoverImgUrl(newcoverImgname);
		// 获取当前时间
		Date currentTime = new Date();
		news3.setCreateTime(currentTime);
		// 设置发表数量
		if (loginUser.getUserInfo().getSendpassNum() == null) {
			loginUser.getUserInfo().setSendpassNum(0);
		}
		loginUser.getUserInfo().setSendpassNum(loginUser.getUserInfo().getSendpassNum() + 1);
		news3.setCommentNum(0);
		news3.setViews(0);
		news3.setShare(0);
		news3.setLikes(0);
		news3.setStatues(1);
		news3.setTopShow(0);
		// 设置审核人id
		news3.setAuditorId(30);
		// 设置新闻编辑人
		LoginUser u = (LoginUser) session.getAttribute("bloginUser");
		news3.setUserInfo(u.getUserInfo());

		Set<ModMixSingle> modMixSingles = new HashSet<ModMixSingle>(0);
		// 保存模板
		ModMixSingle mod = this.addNewsServiceImpl.saveModMixSingle(newFileName1, textarea1, news3);
		modMixSingles.add(mod);
		news3.setModMixSingles(modMixSingles);
		// 设置新闻类型

		news3.setNewsType(this.NewsTypeServiceImpl.getNewTypeById(selectmod2));
		this.newsServiceImpl.saveNews(news3);

		// 给管理员发送通知
		this.noticeServiceImpl.publish(news3.getNewsId(), loginUser);

		session.setAttribute("newsmodMixLR", news3);

		return "redirect:/backstage/news/checking/list";
	}

	/**
	 * Deck 模板3 保存新闻
	 * 
	 * @actor Ray
	 * @param file1
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "mod3saveNewsDraft", method = RequestMethod.POST)
	public String mod3SaveNewsDraft(@RequestParam(value = "mod3title") String mod2title,
			@RequestParam(value = "file1", required = false) MultipartFile file1, 
			@RequestParam(value = "textarea1", required = false) String textarea1,
			@RequestParam(value = "selectmod3", required = false) Integer selectmod2, 
			@RequestParam(value = "coverImg", required = false) MultipartFile coverImg,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		// 第一个图片
		String filename1 = file1.getOriginalFilename();
		String newFileName1 = addNewsServiceImpl.makeFileName(filename1);

		// 封面图片
		String coverImgname = coverImg.getOriginalFilename();
		String newcoverImgname = addNewsServiceImpl.makeFileName(coverImgname);

		// 写入本地磁盘
		InputStream is = file1.getInputStream();
		InputStream is3 = coverImg.getInputStream();

		byte[] bs = new byte[1024];
		int len;
		// 保存路径
		String realpath = System.getProperty("b2cweb.root") + "newsImgUp";
		File saveFile = new File(realpath);
		if (!saveFile.exists()) {
			saveFile.mkdirs();
		}
		OutputStream os = new FileOutputStream(realpath + "\\" + newFileName1);
		while ((len = is.read(bs)) != -1) {
			os.write(bs, 0, len);
		}
		os.close();
		is.close();
		OutputStream os3 = new FileOutputStream(realpath + "\\" + newcoverImgname);
		while ((len = is3.read(bs)) != -1) {
			os3.write(bs, 0, len);
		}
		os3.close();
		is3.close();

		// 存入新闻
		News news3 = new News();
		news3.setNewsTitle(mod2title);
		news3.setCoverImgUrl(newcoverImgname);
		// 获取当前时间
		Date currentTime = new Date();
		news3.setCreateTime(currentTime);
		news3.setStatues(0);
		news3.setTopShow(0);
		// 设置审核人id
		news3.setAuditorId(30);
		// 设置新闻编辑人
		LoginUser u = (LoginUser) session.getAttribute("bloginUser");
		news3.setUserInfo(u.getUserInfo());

		Set<ModMixSingle> modMixSingles = new HashSet<ModMixSingle>(0);
		// 保存模板
		ModMixSingle mod = this.addNewsServiceImpl.saveModMixSingle(newFileName1, textarea1, news3);
		modMixSingles.add(mod);
		news3.setModMixSingles(modMixSingles);
		// 设置新闻类型
		news3.setNewsType(this.NewsTypeServiceImpl.getNewTypeById(selectmod2));
		this.newsServiceImpl.saveNews(news3);

		session.setAttribute("newsmodMixLR", news3);

		return "redirect:/backstage/draft/list";
	}

	/**
	 * @dec 图文混合模板二 预览功能
	 * @author Ray
	 * @param mod2title
	 * @param file1
	 * @param textarea1
	 * @param file2
	 * @param textarea2
	 * @param file3
	 * @param textarea3
	 * @param selectmod2
	 * @param coverImg
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws IOException
	 */
	// 模板二预览新闻
	@RequestMapping("previewMixMod2")
	public String viewNewsMod2(@RequestParam("mod2title") String mod2title, @RequestParam("file1") MultipartFile file1,
			@RequestParam("textarea1") String textarea1, @RequestParam("file2") MultipartFile file2,
			@RequestParam("textarea2") String textarea2, @RequestParam("file3") MultipartFile file3,
			@RequestParam("textarea3") String textarea3, @RequestParam("selectmod2") String selectmod2,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		// 新闻预览不保存，只设置session
		session.setAttribute("mod2title", mod2title);
		session.setAttribute("mod2textarea1", textarea1);
		session.setAttribute("mod2textarea2", textarea2);
		session.setAttribute("mod2textarea3", textarea3);
		session.setAttribute("previewselectmod", selectmod2);
		Date currentTime = new Date();
		session.setAttribute("mod2viewcurrentTime", currentTime);
		// System.out.print(file1.getOriginalFilename());

		// 第一个图片
		String filename1 = file1.getOriginalFilename();
		String newFileName1 = addNewsServiceImpl.makeFileName(filename1);

		// 第二个图片
		String filename2 = file2.getOriginalFilename();
		String newFileName2 = addNewsServiceImpl.makeFileName(filename2);

		// 第三个图片
		String filename3 = file3.getOriginalFilename();
		String newFileName3 = addNewsServiceImpl.makeFileName(filename3);

		// 写入本地磁盘
		InputStream is = file1.getInputStream();
		InputStream is1 = file2.getInputStream();
		InputStream is2 = file3.getInputStream();

		byte[] bs = new byte[1024];
		int len;
		// 保存路径
		String realpath = System.getProperty("b2cweb.root") + "preViewImgUp";
		File saveFile = new File(realpath);
		if (!saveFile.exists()) {
			saveFile.mkdirs();
		}
		OutputStream os = new FileOutputStream(realpath + "\\" + newFileName1);
		while ((len = is.read(bs)) != -1) {
			os.write(bs, 0, len);
		}
		os.close();
		is.close();
		OutputStream os1 = new FileOutputStream(realpath + "\\" + newFileName2);
		while ((len = is1.read(bs)) != -1) {
			os1.write(bs, 0, len);
		}
		os1.close();
		is1.close();
		OutputStream os2 = new FileOutputStream(realpath + "\\" + newFileName3);
		while ((len = is2.read(bs)) != -1) {
			os2.write(bs, 0, len);
		}
		os2.close();
		is2.close();
		session.setAttribute("premod2F1", newFileName1);
		session.setAttribute("premod2F2", newFileName2);
		session.setAttribute("premod2F3", newFileName3);

		return "news_post_style1_eye";
	}

	/**
	 * @dec 图文混合模板1 预览功能
	 * @author Ray
	 * @param mod2title
	 * @param file1
	 * @param textarea1
	 * @param file2
	 * @param textarea2
	 * @param file3
	 * @param textarea3
	 * @param selectmod2
	 * @param coverImg
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws IOException
	 */
	// 模板二预览新闻
	@RequestMapping("previewMixMod1")
	public String viewNewsMod1(@RequestParam("mod1title") String mod2title, @RequestParam("file1") MultipartFile file1,
			@RequestParam("textarea1") String textarea1, @RequestParam("file2") MultipartFile file2,
			@RequestParam("textarea2") String textarea2, @RequestParam("file3") MultipartFile file3,
			@RequestParam("textarea3") String textarea3, @RequestParam("selectmod1") String selectmod2,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		// 新闻预览不保存，只设置session
		session.setAttribute("mod1title", mod2title);
		session.setAttribute("mod1textarea1", textarea1);
		session.setAttribute("mod1textarea2", textarea2);
		session.setAttribute("mod1textarea3", textarea3);
		
		session.setAttribute("previewselectmod1", selectmod2);
		Date currentTime = new Date();
		session.setAttribute("mod1viewcurrentTime", currentTime);
		// System.out.print(file1.getOriginalFilename());

		// 第一个图片
		String filename1 = file1.getOriginalFilename();
		String newFileName1 = addNewsServiceImpl.makeFileName(filename1);

		// 第二个图片
		String filename2 = file2.getOriginalFilename();
		String newFileName2 = addNewsServiceImpl.makeFileName(filename2);

		// 第三个图片
		String filename3 = file3.getOriginalFilename();
		String newFileName3 = addNewsServiceImpl.makeFileName(filename3);

		// 写入本地磁盘
		InputStream is = file1.getInputStream();
		InputStream is1 = file2.getInputStream();
		InputStream is2 = file3.getInputStream();

		byte[] bs = new byte[1024];
		int len;
		// 保存路径
		String realpath = System.getProperty("b2cweb.root") + "preViewImgUp";
		File saveFile = new File(realpath);
		if (!saveFile.exists()) {
			saveFile.mkdirs();
		}
		OutputStream os = new FileOutputStream(realpath + "\\" + newFileName1);
		while ((len = is.read(bs)) != -1) {
			os.write(bs, 0, len);
		}
		os.close();
		is.close();
		OutputStream os1 = new FileOutputStream(realpath + "\\" + newFileName2);
		while ((len = is1.read(bs)) != -1) {
			os1.write(bs, 0, len);
		}
		os1.close();
		is1.close();
		OutputStream os2 = new FileOutputStream(realpath + "\\" + newFileName3);
		while ((len = is2.read(bs)) != -1) {
			os2.write(bs, 0, len);
		}
		os2.close();
		is2.close();
		System.out.print(realpath + newFileName1);
		session.setAttribute("premod1F1", newFileName1);
		session.setAttribute("premod1F2", newFileName2);
		session.setAttribute("premod1F3", newFileName3);

		return "news_post_style2_eye";
	}

	/**
	 * @dec 模板三预览功能
	 * @author Ray
	 * @param mod3title
	 * @param file1
	 * @param textarea1
	 * @param selectmod3
	 * @param request
	 * @param response
	 * @param session
	 * @return
	 * @throws IOException
	 */

	@RequestMapping("previewMixMod3")
	public String viewNewsMod3(@RequestParam("mod3title") String mod3title, @RequestParam("file1") MultipartFile file1,
			@RequestParam("textarea1") String textarea1, @RequestParam("selectmod3") Integer selectmod3,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

		// 新闻预览不保存，只设置session
		session.setAttribute("mod3title", mod3title);
		session.setAttribute("mod3textarea1", textarea1);
		String modName=newsTypeServiceImpl.getNewTypeById(selectmod3).getTypeName();
		session.setAttribute("previewselectmod3", modName);
		Date currentTime = new Date();
		session.setAttribute("mod3viewcurrentTime", currentTime);
		// System.out.print(file1.getOriginalFilename());
		// System.out.println(mod3title+textarea1+file1.getOriginalFilename());
		// 第一个图片
		String filename1 = file1.getOriginalFilename();
		String newFileName1 = addNewsServiceImpl.makeFileName(filename1);

		// 写入本地磁盘
		InputStream is = file1.getInputStream();

		byte[] bs = new byte[1024];
		int len;
		// 保存路径
		String realpath = System.getProperty("b2cweb.root") + "preViewImgUp";
		File saveFile = new File(realpath);
		if (!saveFile.exists()) {
			saveFile.mkdirs();
		}
		OutputStream os = new FileOutputStream(realpath + "\\" + newFileName1);
		while ((len = is.read(bs)) != -1) {
			os.write(bs, 0, len);
		}
		os.close();
		is.close();
		// System.out.print(realpath + newFileName1);
		session.setAttribute("premod3F1", newFileName1);

		return "news_post_style3_eye";
	}
}
