package com.liaoyingtai.blog.service.learningNotes.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.liaoyingtai.blog.dao.mapper.learningNotes.LearningNotesMapper;
import com.liaoyingtai.blog.entity.learningNotes.LearningNotes;
import com.liaoyingtai.blog.entity.learningNotes.LearningNotesCustom;
import com.liaoyingtai.blog.entity.userInfo.UserInfo;
import com.liaoyingtai.blog.exception.base.BlogParameterException;
import com.liaoyingtai.blog.exception.base.BlogSystemException;
import com.liaoyingtai.blog.service.learningNotes.LearningNotesService;

@Service("learningNotes")
@Transactional
public class LearningNotesServiceImpl implements LearningNotesService {

	@Autowired
	private LearningNotesMapper learningNotesMapper;

	public LearningNotesCustom getLearningNotesList(String userId, UserInfo currentUser,
			LearningNotesCustom selectParam) throws Exception {
		int page = selectParam.getPage();
		int limit = selectParam.getLimit();
		if (page <= 0) {
			page = 1;
		}
		if (limit <= 0) {
			limit = 10;
		}
		if (userId == null || "".equals(userId)) {
			throw new BlogParameterException("参数错误：查询文章时用户ID不能为空");
		}
		// 当前登录用户不等于null并且当前登录用户的id等于需要查询的用户id
		if (currentUser == null
				|| !currentUser.getMyBlog_UserInfo_id().equals(selectParam.getLearningNotes_PubUser())) {
			selectParam.setLearningNotes_Private(0);
		}
		selectParam.setLimit(limit);
		selectParam.setPage(page);
		// 将id设置为0，不加入查询条件，具体看learningNotesMapper配置
		selectParam.setMyBlog_LearningNotes_id(0);
		int totalCount = learningNotesMapper.getLearningNotesListCount(selectParam);
		if (totalCount > 0) {
			selectParam.setTotalCount(totalCount);
			int totalPage = totalCount / limit;
			if (totalCount % limit != 0) {
				totalPage++;
			}
			selectParam.setTotalPage(totalPage);
			int begin = (page - 1) * limit;
			selectParam.setBegin(begin);
			List<LearningNotes> learningNotes = learningNotesMapper.getLearningNotesList(selectParam);
			selectParam.setLearningNotes(learningNotes);
		}
		return selectParam;
	}

	public void insertLearningNotesList(String uid, LearningNotes learningNotes) throws Exception {
		if (uid == null || "".equals(uid)) {
			throw new BlogParameterException("参数错误：发表文章时用户ID不能为空");
		}
		if (learningNotes.getLearningNotes_Context() == null || "".equals(learningNotes.getLearningNotes_Context())) {
			throw new BlogParameterException("参数错误：发表文章时正文内容不能为空");
		}
		Date pubDate = new Date();
		// 如果标题为空，那么使用当前时间作为标题
		if (learningNotes.getLearningNotes_Title() == null || "".equals(learningNotes.getLearningNotes_Title())) {
			String date = new SimpleDateFormat("yyyy年MM月dd日").format(pubDate);
			learningNotes.setLearningNotes_Title(date);
		}
		learningNotes.setLearningNotes_PubDate(pubDate);
		learningNotes.setLearningNotes_ModDate(pubDate);
		learningNotesMapper.insertLearningNotes(learningNotes);
	}

	@Override
	public LearningNotes getLearningNotesById(Integer lnId) throws Exception {
		if (lnId == null || lnId == 0) {
			throw new BlogParameterException("参数错误：查询文章时文章id不能为空");
		}
		LearningNotes learningNotes = learningNotesMapper.getLearningNotesById(lnId);
		if (learningNotes == null) {
			throw new BlogSystemException("你访问的文章不存在");
		}
		int viewCount = learningNotes.getLearningNotes_ViewCount() + 1;
		learningNotes.setLearningNotes_ViewCount(viewCount);
		return learningNotes;
	}

	@Override
	public void updateLearningNotes(Integer lnId, LearningNotes learningNotes) throws Exception {
		if (lnId == null || lnId <= 0) {
			throw new BlogParameterException("参所错误：请填写需要修改的文章id");
		}
		learningNotes.setMyBlog_LearningNotes_id(lnId);
		learningNotesMapper.updateLearningNotes(learningNotes);
	}

	@Override
	public LearningNotes getTopLearningNotes(Integer lnId, String userId) throws Exception {
		if (lnId == null || lnId <= 0) {
			throw new BlogParameterException("参数错误：请填写需要读取的文章id");
		}
		if (userId == null || "".equals(userId)) {
			throw new BlogParameterException("参数错误：请填写需要读取的文章的发表用户id");
		}
		LearningNotesCustom learningNotesCustom = new LearningNotesCustom();
		learningNotesCustom.setMyBlog_LearningNotes_id(lnId);
		learningNotesCustom.setLearningNotes_Private(0);
		learningNotesCustom.setLearningNotes_PubUser(userId);
		learningNotesCustom.setLimit(1);
		LearningNotes learningNotes = learningNotesMapper.getTopLearningNotes(learningNotesCustom);
		if (learningNotes == null) {
			throw new BlogSystemException("您访问的文章不存在");
		}
		return learningNotes;
	}

	@Override
	public LearningNotes getNextLearningNotes(Integer lnId, String userId) throws Exception {
		if (lnId == null || lnId <= 0) {
			throw new BlogParameterException("参数错误：请填写需要读取的文章id");
		}
		if (userId == null || "".equals(userId)) {
			throw new BlogParameterException("参数错误：请填写需要读取的文章的发表用户id");
		}
		LearningNotesCustom learningNotesCustom = new LearningNotesCustom();
		learningNotesCustom.setMyBlog_LearningNotes_id(lnId);
		learningNotesCustom.setLearningNotes_Private(0);
		learningNotesCustom.setLearningNotes_PubUser(userId);
		learningNotesCustom.setLimit(1);
		LearningNotes learningNotes = learningNotesMapper.getNextLearningNotes(learningNotesCustom);
		return learningNotes;
	}

	@Override
	public List<LearningNotes> getOtherLearningNotes(int lnId, int limit) throws Exception {
		if (lnId <= 0) {
			throw new BlogParameterException("参数错误：请填写需要读取的文章id");
		}
		if (limit <= 0) {
			limit = 10;
		}
		LearningNotesCustom learningNotesCustom = new LearningNotesCustom();
		learningNotesCustom.setLearningNotes_Private(0);
		learningNotesCustom.setMyBlog_LearningNotes_id(lnId);
		learningNotesCustom.setLimit(limit);
		List<LearningNotes> learningNotes = learningNotesMapper.getOtherLearningNotes(learningNotesCustom);
		return learningNotes;
	}

	@Override
	public LearningNotes getLearningNotes(UserInfo userInfo, int lnId) throws Exception {
		LearningNotes learningNotes = getLearningNotesById(lnId);
		if (learningNotes.getLearningNotes_Private() > 0) {
			String uId = learningNotes.getLearningNotes_PubUser();
			if (userInfo == null || "".equals(userInfo.getMyBlog_UserInfo_id())) {
				throw new BlogSystemException("请登录后再执行该操作");
			}
			if (!userInfo.equals(uId)) {
				throw new BlogSystemException("您没有权限访问该文章");
			}
		}
		return learningNotes;
	}

}
