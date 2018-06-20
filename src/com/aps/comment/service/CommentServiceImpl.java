package com.aps.comment.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aps.comment.dao.CommentDaoImpl;
import com.aps.entity.Comment;

@Service
public class CommentServiceImpl {
	
	@Resource
	private CommentDaoImpl commentDaoImpl;
	
	/**
	 * @dec 批量删除用户的所有评论
	 * @param userInfoIds
	 * @return
	 */
	@Transactional(readOnly = false)
	public int deleteComments(String userInfoIds) {
		return this.commentDaoImpl.deleteComments(userInfoIds);	
	}

	/**
	 * @dec 保存评论
	 * @author Ray
	 * @param comment
	 */
	@Transactional(readOnly = false)
	public void saveComment(Comment comment) {
		try {
			this.commentDaoImpl.save(comment);
			System.out.println(comment.getParentComment().getCommentId());
		} catch (Exception e) {
			// TODO Auto-generated catch block1
			System.out.println("comment save question!");
		}
	}
	
	/**
	 * @dec 根据评论id 查找评论
	 * @param commentId
	 * @return
	 */
	public Comment getCommentById(Integer commentId) {
		try {
			return this.commentDaoImpl.get(commentId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return this.commentDaoImpl.findCommentById(commentId);

		}
	}
}
