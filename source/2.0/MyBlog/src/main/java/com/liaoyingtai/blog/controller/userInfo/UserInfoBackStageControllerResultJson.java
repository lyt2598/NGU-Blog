package com.liaoyingtai.blog.controller.userInfo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.liaoyingtai.blog.annotation.CheckUserLogin;
import com.liaoyingtai.blog.annotation.NotLoadHeadMenu;

@Controller
@NotLoadHeadMenu
@CheckUserLogin
@RequestMapping("/backStage")
public class UserInfoBackStageControllerResultJson {

}
