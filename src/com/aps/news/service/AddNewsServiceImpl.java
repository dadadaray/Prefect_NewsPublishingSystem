package com.aps.news.service;

import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.aps.entity.ModAudio;
import com.aps.entity.ModBigImg;
import com.aps.entity.ModFree;
import com.aps.entity.ModMixCenter;
import com.aps.entity.ModMixLR;
import com.aps.entity.ModMixSingle;
import com.aps.entity.ModVedio;
import com.aps.entity.News;
import com.aps.modAudio.ModAudioDaoImpl;
import com.aps.modBigImg.dao.ModBigImgDaoImpl;
import com.aps.modFree.ModFreeDaoImpl;
import com.aps.modMixCenter.modMixCenterDaoImpl;
import com.aps.modMixLF.modMixLFDaoImpl;
import com.aps.modMixSingle.modMixSingleDaoImpl;
import com.aps.modVideo.ModVedioDaoImpl;
import com.framework.EncodingTool;

@Service
public class AddNewsServiceImpl {
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

	/**
	 * @Method: makeFileName
	 * @Description: 生成上传文件的文件名，文件名以：uuid+"_"+文件的原始名称
	 * @Anthor:Ray
	 * @param filename
	 *            文件的原始名称
	 * @return uuid+"_"+文件的原始名称
	 */
	public String makeFileName(String filename) {
		// 2.jpg
		// 为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
		// System.out.print(UUID.randomUUID().toString() + "_" + filename);
		if(filename==null||filename==""){
			return null;
		}
		return UUID.randomUUID().toString() + "_" + filename;
	}

	/**
	 * @dec 新闻模板居中保存并返回
	 * @author Ray
	 * @param f1
	 * @param t1
	 * @param f2
	 * @param t2
	 * @param f3
	 * @param t3
	 */
	public ModMixCenter saveModMixCenter(String f1, String t1, String f2, String t2, String f3, String t3,News news) {

		ModMixCenter modMixCenter = new ModMixCenter();
		modMixCenter.setmMixCenterImgOne(f1);
		modMixCenter.setmMixCenterContentOne(t1);
		modMixCenter.setmMixCenterImgTwo(f2);
		modMixCenter.setmMixCenterContentTwo(t2);
		modMixCenter.setmMixCenterImgThree(f3);
		modMixCenter.setmMixCenterContentThree(t3);
		modMixCenter.setNews(news);
		this.addNewsDaoImpl.saveModMixCenterDao(modMixCenter);
		return modMixCenter;
	}

	/**
	 * @dec 新闻模板左右保存并返回
	 * @author Ray
	 * @param f1
	 * @param t1
	 * @param f2
	 * @param t2
	 * @param f3
	 * @param t3
	 */
	public ModMixLR saveModMixLR(String f1, String t1, String f2, String t2, String f3, String t3,News news) {
		ModMixLR modMixLR = new ModMixLR();
		modMixLR.setmMixLRImgOne(f1);
		modMixLR.setmMixLRContentOne(t1);
		modMixLR.setmMixLRImgTwo(f2);
		modMixLR.setmMixLRContentTwo(t2);
		modMixLR.setmMixLRImgThree(f3);
		modMixLR.setmMixLRContentThree(t3);
		modMixLR.setNews(news);
		try {
			this.modMixLFDaoImpl.saveModMixLF(modMixLR);
			return modMixLR;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}

	/**
	 * @dec 图文混合一个保存并返回
	 * @author Ray
	 * @param f1
	 * @param t1
	 * @param t3
	 */
	public ModMixSingle saveModMixSingle(String f1, String t1,News news) {
		ModMixSingle modMixSingle = new ModMixSingle();
		modMixSingle.setmMixSingleImgOne(f1);
		modMixSingle.setmMixSingleContentOne(t1);
		modMixSingle.setNews(news);
		try {
			this.modMixSingleDaoImpl.saveModMixSingle(modMixSingle);
			return modMixSingle;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}
	/**
	 * @dec 保存大图模板
	 * @author Ray
	 * @param f
	 * @param t
	 * @return
	 */
	public ModBigImg saveModBigImg(String f,String t,News news){
		ModBigImg modBigImg=new ModBigImg();
		modBigImg.setModBigImgContent(t);
		modBigImg.setModBigImgUrl(f);
		modBigImg.setNews(news);
		this.modBigImgDaoImpl.saveModBigImgDao(modBigImg);
		return modBigImg;
	}
	
	/**
	 * @Title: saveModVedio
	 * @Description: 保存视频模板
	 * @param f
	 * @param t
	 * @return
	 * @author HanChen
	 * @return ModVedio
	 */
	public ModVedio saveModVedio(String f,String t,String c, News news){
		ModVedio modVedio = new ModVedio();
		modVedio.setMvideoUrl(f);
		modVedio.setModVedioContent(t);
		modVedio.setmVideoCoverImgUrl(c);
		modVedio.setNews(news);
		this.modModVedioDaoImpl.saveModVedioDao(modVedio);
		return modVedio;
	}
	
	/**
	 * @Title: saveModAudio
	 * @Description: 保存音频模板
	 * @param f
	 * @param t
	 * @return
	 * @author HanChen 
	 * @return ModAudio
	 */
	public ModAudio saveModAudio(String f, String t,News news){
		ModAudio modAudio = new ModAudio();
		modAudio.setmAudioUrl(f);
		modAudio.setModAudioContent(t);
		modAudio.setNews(news);
		this.modAudioDaoImpl.saveModAudioDao(modAudio);
		return modAudio;
	}
	
	/**
	 * @dec 保存自由模板
	 * @author Ray
	 * @param con
	 * @param news
	 * @return
	 */
	public ModFree saveFreeMod(String con,News news){
		ModFree modFree=new ModFree();
		modFree.setModFreeContent(con);
		modFree.setNews(news);
		this.modFreeDaoImpl.saveModFreeDao(modFree);
		return modFree;
	}
	

}
