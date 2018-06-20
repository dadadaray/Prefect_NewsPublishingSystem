package com.aps.news.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.aps.entity.LoginUser;
import com.aps.entity.ModBigImg;
import com.aps.entity.ModMixCenter;
import com.aps.entity.News;
import com.aps.news.service.AddNewsServiceImpl;
import com.aps.news.service.NewsServiceImpl;
import com.aps.newsType.service.NewsTypeServiceImpl;
import com.aps.notice.service.NoticeServiceImpl;

@Controller
@RequestMapping("addnews/bigImg")
public class AddBigImgNewsControllerImpl {

	@Resource
	private AddNewsServiceImpl addNewsServiceImpl;
	@Resource
	private NewsTypeServiceImpl NewsTypeServiceImpl;

	@Resource
	private NewsServiceImpl newsServiceImpl;

	@Resource
	private NoticeServiceImpl noticeServiceImpl;

	/**
	 * @dec 大图轮播的发布
	 * @param files
	 * @param textInfos
	 * @param title
	 * @param selectmod
	 * @param textarea
	 * @param coverfile
	 * @param session
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "sendBigImgNews", method = RequestMethod.POST)
	private String sendBigImg(@RequestParam("file") List<MultipartFile> files,
			@RequestParam("textInfo") List<String> textInfos, @RequestParam("title") String title,
			@RequestParam("selectmod") Integer selectmod, @RequestParam("textarea") String textarea,
			@RequestParam("coverfile") MultipartFile coverfile, HttpSession session) throws IOException {
		// 获取用户信息
		LoginUser loginUser = (LoginUser) session.getAttribute("bloginUser");

		// 将图片依次遍历存入模板中
		byte[] bs = new byte[1024];
		int len;
		// 保存路径
		String realpath = System.getProperty("b2cweb.root") + "newsImgUp";
		File saveFile = new File(realpath);
		if (!saveFile.exists()) {
			saveFile.mkdirs();
		}

		// 保存封面图
		// 封面图片
		String coverImgname = coverfile.getOriginalFilename();
		String newcoverImgname = addNewsServiceImpl.makeFileName(coverImgname);
		InputStream is3 = coverfile.getInputStream();
		OutputStream os3 = new FileOutputStream(realpath + "\\" + newcoverImgname);
		while ((len = is3.read(bs)) != -1) {
			os3.write(bs, 0, len);
		}
		os3.close();
		is3.close();
		// 存入新闻
		News news1 = new News();
		news1.setNewsTitle(title);
		news1.setCoverImgUrl(newcoverImgname);
		// 获取当前时间
		Date currentTime = new Date();
		news1.setCreateTime(currentTime);
		news1.setStatues(1);
		news1.setTopShow(0);
		// 设置审核人id
		news1.setAuditorId(30);
		// 设置发表数量
		if (loginUser.getUserInfo().getSendpassNum() == null) {
			loginUser.getUserInfo().setSendpassNum(0);
		}
		news1.setCommentNum(0);
		news1.setViews(0);
		news1.setShare(0);
		news1.setLikes(0);
		loginUser.getUserInfo().setSendpassNum(loginUser.getUserInfo().getSendpassNum() + 1);
		// 设置新闻编辑人
		LoginUser u = (LoginUser) session.getAttribute("bloginUser");
		news1.setUserInfo(u.getUserInfo());

		// 设置新闻类型
		news1.setNewsType(this.NewsTypeServiceImpl.getNewTypeById(selectmod));
		// 设置新闻简介
		news1.setBigImgContent(textarea);
		Set<ModBigImg> modBigImgs = new HashSet<ModBigImg>(0);
		// 遍历
		for (int i = 0; i < files.size(); i++) {
			String filename = files.get(i).getOriginalFilename();
			String newFileName = addNewsServiceImpl.makeFileName(filename);
			InputStream is = files.get(i).getInputStream();
			OutputStream os = new FileOutputStream(realpath + "\\" + newFileName);
			while ((len = is.read(bs)) != -1) {
				os.write(bs, 0, len);
			}
			os.close();
			is.close();
			ModBigImg m = new ModBigImg();
			m.setModBigImgUrl(newFileName);
			m.setModBigImgContent(textInfos.get(i));

			// 保存模板
			ModBigImg mod = this.addNewsServiceImpl.saveModBigImg(m.getModBigImgUrl(), m.getModBigImgContent(), news1);
			modBigImgs.add(mod);
		}

		// 保存模板

		// 设置新闻模板
		news1.setModBigImgs(modBigImgs);

		// 保存新闻
		this.newsServiceImpl.saveNews(news1);

		// 给管理员发送通知
		this.noticeServiceImpl.publish(news1.getNewsId(), loginUser);

		return "redirect:/backstage/news/checking/list";
	}
	
	@RequestMapping(value = "saveBigImgNewsDraft", method = RequestMethod.POST)
	private String SaveBigImgDraft(@RequestParam("file") List<MultipartFile> files,
			@RequestParam("textInfo") List<String> textInfos, @RequestParam("title") String title,
			@RequestParam("selectmod") Integer selectmod, @RequestParam("textarea") String textarea,
			@RequestParam("coverfile") MultipartFile coverfile, HttpSession session) throws IOException {
		// 获取用户信息
		LoginUser loginUser = (LoginUser) session.getAttribute("bloginUser");

		// 将图片依次遍历存入模板中
		byte[] bs = new byte[1024];
		int len;
		// 保存路径
		String realpath = System.getProperty("b2cweb.root") + "newsImgUp";
		File saveFile = new File(realpath);
		if (!saveFile.exists()) {
			saveFile.mkdirs();
		}

		// 保存封面图
		// 封面图片
		String coverImgname = coverfile.getOriginalFilename();
		String newcoverImgname = addNewsServiceImpl.makeFileName(coverImgname);
		InputStream is3 = coverfile.getInputStream();
		OutputStream os3 = new FileOutputStream(realpath + "\\" + newcoverImgname);
		while ((len = is3.read(bs)) != -1) {
			os3.write(bs, 0, len);
		}
		os3.close();
		is3.close();
		// 存入新闻
		News news1 = new News();
		news1.setNewsTitle(title);
		news1.setCoverImgUrl(newcoverImgname);
		// 获取当前时间
		Date currentTime = new Date();
		news1.setCreateTime(currentTime);
		news1.setStatues(0);
		news1.setTopShow(0);
		// 设置审核人id
		news1.setAuditorId(30);
		// 设置发表数量
		if (loginUser.getUserInfo().getSendpassNum() == null) {
			loginUser.getUserInfo().setSendpassNum(0);
		}
		loginUser.getUserInfo().setSendpassNum(loginUser.getUserInfo().getSendpassNum() + 1);
		// 设置新闻编辑人
		LoginUser u = (LoginUser) session.getAttribute("bloginUser");
		news1.setUserInfo(u.getUserInfo());

		// 设置新闻类型
		news1.setNewsType(this.NewsTypeServiceImpl.getNewTypeById(selectmod));
		// 设置新闻简介
		news1.setBigImgContent(textarea);
		Set<ModBigImg> modBigImgs = new HashSet<ModBigImg>(0);
		// 遍历
		for (int i = 0; i < files.size(); i++) {
			String filename = files.get(i).getOriginalFilename();
			String newFileName = addNewsServiceImpl.makeFileName(filename);
			InputStream is = files.get(i).getInputStream();
			OutputStream os = new FileOutputStream(realpath + "\\" + newFileName);
			while ((len = is.read(bs)) != -1) {
				os.write(bs, 0, len);
			}
			os.close();
			is.close();
			ModBigImg m = new ModBigImg();
			m.setModBigImgUrl(newFileName);
			m.setModBigImgContent(textInfos.get(i));

			// 保存模板
			ModBigImg mod = this.addNewsServiceImpl.saveModBigImg(m.getModBigImgUrl(), m.getModBigImgContent(), news1);
			modBigImgs.add(mod);
		}

		// 保存模板

		// 设置新闻模板
		news1.setModBigImgs(modBigImgs);

		// 保存新闻
		this.newsServiceImpl.saveNews(news1);

		// 给管理员发送通知
		this.noticeServiceImpl.publish(news1.getNewsId(), loginUser);

		return "redirect:/backstage/draft/list";
	}
	
	@RequestMapping(value = "preBigImgview", method = RequestMethod.POST)
	private String preBigImgview(@RequestParam("file") List<MultipartFile> files,
			@RequestParam("textInfo") List<String> textInfos, @RequestParam("title") String title,
			@RequestParam("selectmod") Integer selectmod, @RequestParam("textarea") String textarea,
			@RequestParam("coverfile") MultipartFile coverfile, HttpSession session) throws IOException {

		session.setAttribute("title", title);
		session.setAttribute("textarea", textarea);
		// 将图片依次遍历存入模板中
		byte[] bs = new byte[1024];
		int len;
		// 保存路径
		String realpath = System.getProperty("b2cweb.root") + "preViewImgUp";
		File saveFile = new File(realpath);
		if (!saveFile.exists()) {
			saveFile.mkdirs();
		}

		Set<ModBigImg> modBigImgs = new HashSet<ModBigImg>(0);
		// 遍历
		for (int i = 0; i < files.size(); i++) {
			String filename = files.get(i).getOriginalFilename();
			String newFileName = addNewsServiceImpl.makeFileName(filename);
			InputStream is = files.get(i).getInputStream();
			OutputStream os = new FileOutputStream(realpath + "\\" + newFileName);
			while ((len = is.read(bs)) != -1) {
				os.write(bs, 0, len);
			}
			os.close();
			is.close();
			ModBigImg m = new ModBigImg();
			m.setModBigImgUrl(newFileName);
			m.setModBigImgContent(textInfos.get(i));
			modBigImgs.add(m);
			session.setAttribute("modBigImgs", modBigImgs);
		}

		return "Bgimgshow_eye";

	}
}
