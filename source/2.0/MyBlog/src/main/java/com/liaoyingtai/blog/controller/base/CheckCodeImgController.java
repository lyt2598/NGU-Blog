package com.liaoyingtai.blog.controller.base;

import java.awt.image.BufferedImage;
import java.io.OutputStream;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.liaoyingtai.blog.utils.CheckImgUtils;

/**
 * 生成验证码，并将验证码放入到session中
 * 
 * @author Lyt
 *
 */
@Controller
// 归纳到img下，防止拦截器进行拦截
@RequestMapping("/img")
public class CheckCodeImgController {

	@RequestMapping("/checkCode")
	public void checkCode(HttpSession session, HttpServletResponse response) throws Exception {
		CheckImgUtils checkImgUtils = new CheckImgUtils();
		BufferedImage bImage = checkImgUtils.getCheckImg();
		String checkCode = checkImgUtils.getCheckStr();
		session.setAttribute("SESSION_CHECK_CODE", checkCode);
		// 读取response的输出流
		OutputStream outputStream = response.getOutputStream();
		// 调用图片输出输入流将图片写入到response的输出流中
		ImageIO.write(bImage, "png", outputStream);
	}

}
