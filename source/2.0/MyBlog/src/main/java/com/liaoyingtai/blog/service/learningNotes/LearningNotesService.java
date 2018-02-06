package com.liaoyingtai.blog.service.learningNotes;

import java.util.List;

import com.liaoyingtai.blog.entity.learningNotes.LearningNotes;
import com.liaoyingtai.blog.entity.learningNotes.LearningNotesCustom;
import com.liaoyingtai.blog.entity.userInfo.UserInfo;

public interface LearningNotesService {

	/**
	 * 查询学习笔记文章列表, learningNotes_Private如果设置值是大于等于0小于等于2则表示通过条件查询，其他值均为查询所有
	 * 
	 * @param userId
	 *            需要查询的用户id
	 * @param currentUser
	 *            当前登录用户信息,如果为空则查询该用户非私有的文章
	 * @param selectParam
	 *            查询参数
	 * @return
	 * @throws Exception
	 */
	public LearningNotesCustom getLearningNotesList(String userId, UserInfo currentUser,
			LearningNotesCustom selectParam) throws Exception;

	/**
	 * 发表学习笔记文章
	 * 
	 * @param uid
	 *            用来发表文章的用户，建议使用当前登录的用户
	 * @param learningNotes
	 *            文章信息，如果title为空，那么使用当前时间作为标题，时间格式：yyyy-MM-dd
	 * @throws Exception
	 */
	public void insertLearningNotesList(String uid, LearningNotes learningNotes) throws Exception;

	/**
	 * 通过文章ID搜索文章
	 * 
	 * @param lnId
	 *            文章id
	 * @return
	 * @throws Exception
	 */
	public LearningNotes getLearningNotesById(Integer lnId) throws Exception;

	/**
	 * 通过文章ID修改文章信息
	 * 
	 * @param lnId
	 *            文章id
	 * @param learningNotes
	 *            需要修改的信息
	 * @throws Exception
	 */
	public void updateLearningNotes(Integer lnId, LearningNotes learningNotes) throws Exception;

	/**
	 * 读取上一篇学习笔记
	 * 
	 * @param lnId
	 *            读取此ID的上一篇非私有的文章
	 * @param userId
	 *            用户id
	 * @return
	 * @throws Exception
	 */
	public LearningNotes getTopLearningNotes(Integer lnId, String userId) throws Exception;

	/**
	 * 读取下一篇学习笔记
	 * 
	 * @param lnId
	 *            读取此ID的下一篇非私有的文章
	 * @param userId
	 *            用户id
	 * @return
	 * @throws Exception
	 */
	public LearningNotes getNextLearningNotes(Integer lnId, String userId) throws Exception;

	/**
	 * 读取其他文章信息
	 * 
	 * @param lnId
	 *            文章ID，设置此参数即表示不读取此id的文章
	 * @param limit
	 *            需要显示的个数
	 * @return
	 * @throws Exception
	 */
	public List<LearningNotes> getOtherLearningNotes(int lnId, int limit) throws Exception;

	/**
	 * 读取文章信息
	 * 
	 * @param userInfo
	 *            只用传入当前登录用户Id，用来判断文章是私有状态时，文章发表用户和当前登录用户是否为同一人
	 * @param lnId
	 *            文章id
	 * @return 文章信息
	 * @throws Exception
	 */
	public LearningNotes getLearningNotes(UserInfo userInfo, int lnId) throws Exception;

}
