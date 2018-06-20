/**
 * @FileName com.aps.news.service/UpdateNewsServiceImpl.java 
 * @Project News-Publishing-System
 * @author lenovo 
 * @date 2018年5月7日 下午11:34:34
 * @version 
 * @Description TODO
 */

package com.aps.news.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.aps.entity.ModMixLR;
import com.aps.entity.News;
import com.aps.modAudio.ModAudioDaoImpl;
import com.aps.modBigImg.dao.ModBigImgDaoImpl;
import com.aps.modFree.ModFreeDaoImpl;
import com.aps.modMixCenter.modMixCenterDaoImpl;
import com.aps.modMixLF.modMixLFDaoImpl;
import com.aps.modMixSingle.modMixSingleDaoImpl;
import com.aps.modVideo.ModVedioDaoImpl;

/**
 * 
 * @ClassName UpdateNewsServiceImpl
 * @Description TODO
 * @author lenovo 
 * @date 2018年5月7日下午11:34:34 
 * @version
 *
 */
@Service
public class UpdateNewsServiceImpl {
	@Resource
	private modMixCenterDaoImpl addNewsDaoImpl;
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
	
	public ModMixLR updateModMixLR(String f1, String t1, String f2, String t2, String f3, String t3,News news,int modMixLRId) {
		ModMixLR modMixLR = this.modMixLFDaoImpl.getOneModMixLR(modMixLRId);
		modMixLR.setmMixLRImgOne(f1);
		modMixLR.setmMixLRContentOne(t1);
		modMixLR.setmMixLRImgTwo(f2);
		modMixLR.setmMixLRContentTwo(t2);
		modMixLR.setmMixLRImgThree(f3);
		modMixLR.setmMixLRContentThree(t3);
		modMixLR.setNews(news);
		try {
			this.modMixLFDaoImpl.updateModMixLR(modMixLR);
			return modMixLR;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

}
