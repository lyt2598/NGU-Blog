package com.liaoyingtai.blog.service.about;

import com.liaoyingtai.blog.entity.about.AboutMe;
import com.liaoyingtai.blog.entity.userInfo.UserInfo;

public interface AboutMeService {

	/**
	 * 通过用户名查询该用户个人介绍信息
	 * 
	 * @param userId
	 *            用户id
	 * @return 返回个人介绍信息
	 * @throws Exception
	 */
	public AboutMe getAboutMeByUserId(String userId) throws Exception;

	/**
	 * 添加个人介绍信息
	 * 
	 * @param aboutMe
	 *            个人介绍信息,如果为空使用默认信息
	 * @param userId
	 *            用户id
	 * @throws Exception
	 */
	public void insertAboutMeInfo(AboutMe aboutMe, String userId) throws Exception;

	/**
	 * 通过用户ID修改用户个人介绍浏览次数
	 * 
	 * @param aboutMe
	 *            需要传一个完整的个人信息对象
	 * @param userId
	 *            当前登录用户ID
	 * @throws Exception
	 */
	public void updateAboutMeViewCountByUserId(AboutMe aboutMe, String userId) throws Exception;

	/**
	 * 修改个人介绍
	 * 
	 * @param aboutMeId
	 *            个人介绍ID
	 * @param aboutMe
	 *            个人介绍其他修改值
	 * @param userInfo
	 *            当前登录的用户信息
	 * @throws Exception
	 */
	public void updateAboutMe(int aboutMeId, AboutMe aboutMe, UserInfo userInfo) throws Exception;
}
