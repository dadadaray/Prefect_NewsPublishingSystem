package com.aps.hibernateSearch.dao;

import java.util.List;

import org.apache.commons.lang.ObjectUtils;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.cn.ChineseAnalyzer;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.SearchFactory;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Repository;
import org.springframework.util.ReflectionUtils;

import com.aps.entity.News;
import com.framework.BaseDao;
import com.framework.Page;

@Repository
public class HibernateSearchDaoImpl extends BaseDao<News, String> {
//	/**
//	 * @author Ray_1
//	 * @功能：查询4条 news，并用高亮显示。
//	 * @param search
//	 * @return
//	 */
//
//	public List<Object> searchNewsByHiber(String search) {
//
//		Session session = super.getSession();
//		List<Object> list = null;
//		try {
//			String sql = "select newsTitle from News where newsTitle like '%";
//			// 解析搜索内容 空格分隔的话…
//			String[] search_s = search.split("\\s+");
//			for (int i = 0; i < search_s.length; i++) {
//				sql += search_s[i] + "%";
//			}
//			sql += "'";
//			list = session.createSQLQuery(sql).list();
//			for (int i = 0; i < list.size(); i++) {
//				String title = list.get(i).toString();
//				if (title.length() > 60) {
//					title = title.substring(0, 60);
//					title += "...";
//				}
//				// 加粗处理
//				title = title.replaceAll(search_s[0], "<font style='font-weight:bold;'>" + search_s[0] + "</font>");
//				list.set(i, title);
//			}
//		} catch (Exception e) {
//
//		}
//		return list;
//	}
	
	/**
	 * @author Ray_1
	 * @desc 分页查询news，结果用高亮显示，并且存放到page对象中。
	 * @param pageNum
	 * @param pageSize
	 * @param search
	 * @param params
	 * @return
	 * @throws Exception
	 */

	public Page<News> findNewsByHiberPage(int pageNum, int pageSize, String search) throws Exception {
		// long total = findCountByPage("select count(*) " + hql, params);
		Session session = super.getSession();
		FullTextSession fullTextSession = Search.getFullTextSession(session);
		try {
			fullTextSession.createIndexer().startAndWait();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SearchFactory sf = fullTextSession.getSearchFactory();
		QueryBuilder qb = sf.buildQueryBuilder().forEntity(News.class).get();
		List<News> list = null;
		try {
			// 精确短语查询(Exact Phrase Query)
			org.apache.lucene.search.Query luceneQuery = qb.keyword()
					.onFields("bugTitle", "bugDescribe", "bugReason", "bugMethod").matching(search).createQuery();
			Query hibQuery = fullTextSession.createFullTextQuery(luceneQuery);
			hibQuery.setFirstResult((pageNum - 1) * pageSize);
			hibQuery.setMaxResults(pageSize);
			list = hibQuery.list();

			// 集关键字高亮的实现代码
			SimpleHTMLFormatter formatter = new SimpleHTMLFormatter("<font color='red';>", "</font>");
			QueryScorer queryScorer = new QueryScorer(luceneQuery);
			Highlighter highlighter = new Highlighter(formatter, queryScorer);
			Analyzer analyzer = new ChineseAnalyzer();
			String[] fieldNames = { "bugTitle", "bugDescribe", "bugReason", "bugMethod" };
			for (News q : list) {
				for (String fieldName : fieldNames) {
					// 运用反射得到具体的标题内容
					Object fieldValue = ReflectionUtils
							.invokeMethod(BeanUtils.getPropertyDescriptor(News.class, fieldName).getReadMethod(), q);
					String hightLightFieldValue = null;
					if (fieldValue instanceof String) {
						// 获得高亮关键字
						System.out.println("bug 高亮" + fieldValue);
						hightLightFieldValue = highlighter.getBestFragment(analyzer, fieldName,
								ObjectUtils.toString(fieldValue, null));
					}
					// 这个判断很关键，否则如果标题或内容中没有关键字的话，就会出现不显示的问题。
					if (hightLightFieldValue != null) {
						// 运用反射设置结果集中的关键字高亮
						ReflectionUtils.invokeMethod(
								BeanUtils.getPropertyDescriptor(News.class, fieldName).getWriteMethod(), q,
								hightLightFieldValue);
					}
				}
			}
		} catch (Exception e) {
		}
		//
		// 获取查询总数。
		if (list != null) {
			System.out.println("按条件查询" + list);
			long total = list.size();
			Page<News> page = new Page<News>(pageNum, pageSize);
			page.setTotalCount((int) total);
			page.setList(list);
			return page;
		}
		return null;
	}
}
