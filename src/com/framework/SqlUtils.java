/**
 * @FileName com.framework/SqlUtils.java 
 * @Project News-Publishing-System
 * @author lenovo 
 * @date 2018年4月16日 下午5:14:11
 * @version 
 * @Description TODO
 */

package com.framework;

/**
 * 
 * @ClassName SqlUtils
 * @Description SQL工具类
 * @author HanChen 
 * @version
 *
 */

public class SqlUtils {
	/**
	 * 将字符串转换为in的sql查询条件,带括号
	 * @param val
	 * @param regex
	 * @return
	 */
	public static String toLikeSqlForStr(String val, String regex){
		String likeWhere = "(";
		if(val.indexOf(regex) != -1){
			for(String str : val.split(regex)){
				likeWhere += "'" + str + "',";
			}
			likeWhere = likeWhere.substring(0, likeWhere.length() - 1);
		} else {
			likeWhere += "'" + val + "'";
		}
		likeWhere += ")";
		return likeWhere;
	}
}
