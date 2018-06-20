/**
 * @FileName com.aps.news.service/DeleteNewsServiceImpl.java 
 * @Project News-Publishing-System
 * @author lenovo 
 * @date 2018年5月8日 上午11:31:25
 * @version 
 * @Description TODO
 */

package com.aps.news.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aps.modAudio.ModAudioDaoImpl;
import com.aps.modBigImg.dao.ModBigImgDaoImpl;
import com.aps.modFree.ModFreeDaoImpl;
import com.aps.modMixCenter.modMixCenterDaoImpl;
import com.aps.modMixLF.modMixLFDaoImpl;
import com.aps.modMixSingle.modMixSingleDaoImpl;
import com.aps.modVideo.ModVedioDaoImpl;

/**
 * 
 * @ClassName DeleteNewsServiceImpl
 * @Description TODO
 * @author HanChen 
 * @version
 *
 */
@Service
public class DeleteNewsServiceImpl {
	@Resource
	private modMixCenterDaoImpl modMixCenterDaoImpl;
	@Resource
	private modMixLFDaoImpl modMixLFDaoImpl;
	@Resource
	private modMixSingleDaoImpl modMixSingleDaoImpl;
	
	@Resource
	private ModBigImgDaoImpl modBigImgDaoImpl;
	
	@Resource
	private ModVedioDaoImpl modModVedioDaoImpl;
	
	@Resource
	private ModAudioDaoImpl modAudioDaoImpl;
	
	@Resource
	private ModFreeDaoImpl modFreeDaoImpl;
	
	/**
	 * @Title: deleteMixCenter
	 * @Description: 图文混合模板一删除
	 * @param newsIds
	 * @return
	 * @author HanChen
	 * @return int
	 */
	@Transactional(readOnly = false)
	public int deleteMixCenter(String newsIds) {
		return this.modMixCenterDaoImpl.deleteModMixCenter(newsIds);	
	}
	
	/**
	 * @Title: deleteMixLF
	 * @Description: 图文混合模板二删除
	 * @param newsIds
	 * @return
	 * @author HanChen
	 * @return int
	 */
	@Transactional(readOnly = false)
	public int deleteMixLF(String newsIds) {
		return this.modMixLFDaoImpl.deleteModMixLR(newsIds);	
	}
	
	/**
	 * @Title: deleteModMixSingle
	 * @Description: 图文混合模板三删除
	 * @param newsIds
	 * @return
	 * @author HanChen 
	 * @return int
	 */
	@Transactional(readOnly = false)
	public int deleteModMixSingle(String newsIds) {
		return this.modMixSingleDaoImpl.deleteModMixSingle(newsIds);	
	}
	
	/**
	 * @Title: deleteModBigImg
	 * @Description: 大图轮播删除
	 * @param newsIds
	 * @return
	 * @author HanChen 
	 * @return int
	 */
	@Transactional(readOnly = false)
	public int deleteModBigImg(String newsIds) {
		return this.modBigImgDaoImpl.deleteModBigImg(newsIds);	
	}	
	
	/**
	 * @Title: deleteModFree
	 * @Description: 自由排版删除
	 * @param newsIds
	 * @return
	 * @author HanChen  
	 * @return int
	 */
	@Transactional(readOnly = false)
	public int deleteModFree(String newsIds) {
		return this.modFreeDaoImpl.deleteModFree(newsIds);	
	}
	
	/**
	 * @Title: deleteModVedio
	 * @Description: 视频删除
	 * @param newsIds
	 * @return
	 * @author HanChen  
	 * @return int
	 */
	@Transactional(readOnly = false)
	public int deleteModVedio(String newsIds) {
		return this.modModVedioDaoImpl.deleteModVedio(newsIds);	
	}
	
	/**
	 * @Title: deleteModAudio
	 * @Description: 音频删除
	 * @param newsIds
	 * @return
	 * @author HanChen  
	 * @return int
	 */
	@Transactional(readOnly = false)
	public int deleteModAudio(String newsIds) {
		return this.modAudioDaoImpl.deleteModAudio(newsIds);	
	}
}
