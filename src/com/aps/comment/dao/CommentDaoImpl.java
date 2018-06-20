package com.aps.comment.dao;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.aps.entity.Comment;
import com.framework.BaseDao;
import com.framework.SqlUtils;

@Repository
public class CommentDaoImpl extends BaseDao<Comment, String> {
	@Resource
	private SessionFactory sessionFactory;

	public Comment findCommentById(Integer commentId) {
		Query query = this.sessionFactory.getCurrentSession().createQuery("from Comment where commentId=" + commentId);
		return (Comment) query.uniqueResult();
	}

	/**
	 * @dec 批量删除用户的评论
	 * @author Ray
	 * @param userInfoIds
	 * @return
	 */
	public int deleteComments(String userInfoIds) {
		int ret = 1;

		Query querys = this.sessionFactory.getCurrentSession().createQuery(
				"from Comment n where n.userInfo.userInfoId in" + SqlUtils.toLikeSqlForStr(userInfoIds, ","));
		// querys.list();
		List<Comment> list  = new ArrayList<Comment>(0);
		list=querys.list();
		
		//先删除子评论
		for (int i = 0; i < querys.list().size(); i++) {
			Comment comments = (Comment) querys.list().get(i);
			if (comments.getParentComment() != null) {
				//System.out.print(comments.getCommentContent());
				deleteComment(comments.getCommentId());
			}
		}
		//再删除所有评论
		Query query = this.sessionFactory.getCurrentSession().createQuery(
				"from Comment n where n.userInfo.userInfoId in" + SqlUtils.toLikeSqlForStr(userInfoIds, ","));
		// query.list();
		List<Comment> list1  = new ArrayList<Comment>(0);
		list1=query.list();
	    int len=list1.size();
		//System.out.print("开始删父评论");
		for (int i = 0; i < query.list().size();i=0) {
			Comment comment = (Comment) query.list().get(i);
			//System.out.print(comment.getCommentContent());
			deleteComment(comment.getCommentId());
		}
		return ret;
	}

	/**
	 * @function 删除评论
	 * @author Ray
	 * @param commentId
	 *            评论的id
	 */
	public void deleteComment(int commentId) {
		try {
			Query query = this.sessionFactory.getCurrentSession()
					.createQuery("delete from Comment c where c.commentId=" + commentId);
			int ret = query.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @fucntion 根据commentId查询单个评论
	 * @author Ray
	 * @param commentId
	 * @return
	 */
	public Comment getComment(Integer commentId) {
		try {
			return this.get(commentId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

}
