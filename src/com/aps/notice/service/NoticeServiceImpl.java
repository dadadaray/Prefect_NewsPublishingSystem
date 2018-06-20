/**
 * @FileName com.aps.notice.service/NoticeServiceImpl.java 
 * @Project News-Publishing-System
 * @author lenovo 
 * @date 2018年3月14日 上午10:07:01
 * @version 
 * @Description TODO
 */

package com.aps.notice.service;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aps.entity.LoginUser;
import com.aps.entity.News;
import com.aps.entity.Notice;
import com.aps.entity.UserInfo;
import com.aps.news.dao.NewsDaoImpl;
import com.aps.notice.dao.NoticeDaoImpl;
import com.framework.Page;

/**
 * 
 * @ClassName NoticeServiceImpl
 * @Description 通知service
 * @author HanChen
 * @version
 *
 */
@Service
public class NoticeServiceImpl {
	
	@Resource
	private NoticeDaoImpl noticeDaoImpl;
	
	@Resource
	private NewsDaoImpl newsDaoImpl;
	
	/**
	 * @Title: listNotice
	 * @Description: 分页查询所有的通知
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @return
	 * @author HanChen
	 * @return Page<Notice>
	 */
	public Page<Notice> listNotice(int pageNum, int pageSize, Object[] params) {
		return this.noticeDaoImpl.findAllNotice(pageNum, pageSize, params);
	}
	
	/**
	 * @Title: listNotice1
	 * @Description: 分页查询管理员收到的所有通知
	 * @param pageNum
	 * @param pageSize
	 * @param params
	 * @return
	 * @author HanChen 
	 * @return Page<Notice>
	 */
	public Page<Notice> listNotice1(int pageNum, int pageSize, Object[] params) {
		return this.noticeDaoImpl.findAllNotice1(pageNum, pageSize, params);
	}
	
	/**
	 * @Title: deleteNotice
	 * @Description: 删除通知
	 * @param noticeIds
	 * @author HanChen 
	 * @return int
	 */
	@Transactional(readOnly = false)
	public int deleteNotice(String noticeIds) {
		return this.noticeDaoImpl.deleteNotice(noticeIds);
	}
	
	/**
	 * @Title: getNoticeByNewsId
	 * @Description: 根据新闻id查询通知id
	 * @param newsIds
	 * @return
	 * @author HanChen 
	 * @return String
	 */
	public String getNoticeByNewsId(String newsIds){
		return this.noticeDaoImpl.getNoticeByNewsId(newsIds);
	}
	
	/**
	 * @Title: getNoticeByUserId
	 * @Description: 查询与用户相关的通知
	 * @param userIds
	 * @return
	 * @author HanChen  
	 * @return String
	 */
	public String getNoticeByUserId(String userIds){
		return this.noticeDaoImpl.getNoticeByUserId(userIds);
	}
	
	/**
	 * @Title: saveNotice
	 * @Description: 保存通知
	 * @param notice
	 * @return
	 * @author HanChen
	 * @return int
	 */
	@Transactional(readOnly = false)
	public int saveNotice(Notice notice){
		return this.noticeDaoImpl.saveNotice(notice);
	}
	
	/**
	 * @Title: getNoticeById
	 * @Description: 根据noticeId 查询Notice
	 * @param noticeId
	 * @return
	 * @author HanChen 
	 * @return Notice
	 */
	public Notice getNoticeById(Integer noticeId){
		return this.noticeDaoImpl.getNoticeById(noticeId);
	}
	
	/**
	 * @Title: publish
	 * @Description: 发布新闻给管理员
	 * @param newsId
	 * @param loginUser
	 * @return
	 * @author lenovo 
	 * @return int
	 */
	public int publish(Integer newsId,LoginUser loginUser){
		int result = 0;
		News news = newsDaoImpl.getOneNews(newsId);	
		news.setStatues(1);
		newsDaoImpl.updateNews(news);
		
		Notice notice = new Notice();
		notice.setNoticeContent(loginUser.getLoginName()+"发来新文章《" + news.getNewsTitle() + "》");
		notice.setNoticeType(3);
		notice.setNews(news);
		Date currentTime = new Date();
		notice.setNoticeCreatTime(currentTime);
		
		//设置通知发送人 
		UserInfo sendPerson = new UserInfo();
		sendPerson = loginUser.getUserInfo();
		notice.setUserInfo(sendPerson);
		
		//设置通知接收人
		notice.setReciveId(news.getAuditorId());
		result = noticeDaoImpl.saveNotice(notice);
		
		return result;
	}
}
