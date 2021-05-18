package org.idx.lms.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("captcha")
public class CaptchaController {

	@RequestMapping(method = RequestMethod.GET)
	public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("image/jpg");
		int iTotalChars = 6;
		int iHeight = 40;
		int iWidth = 150;
		Font fntStyle1 = new Font("Arial", Font.BOLD, 30);
		Random randChars = new Random();
		String sImageCode = (Long.toString(Math.abs(randChars.nextLong()), 36)).substring(0, iTotalChars);
		BufferedImage biImage = new BufferedImage(iWidth, iHeight, BufferedImage.TYPE_INT_RGB);
		Graphics2D g2dImage = (Graphics2D) biImage.getGraphics();
		int iCircle = 15;
		for (int i = 0; i < iCircle; i++) {
			//g2dImage.setColor(new Color(255,255,255));
			//g2dImage.setColor(new Color(randChars.nextInt(255), randChars.nextInt(255), randChars.nextInt(255)));
			g2dImage.setColor(new Color(randChars.nextInt(255-100)+100, randChars.nextInt(255-100)+100, randChars.nextInt(255-100)+100));
			//g2dImage.setColor(new Color(Color.HSBtoRGB((float) Math.random(), (float) Math.random(), 0.5F + ((float) Math.random())*2F)));
			//g2dImage.setColor(new Color(Color.HSBtoRGB( 0.5F + ((float) Math.random())*2F,  0.5F + ((float) Math.random())*2F, 0.5F + ((float) Math.random())*2F)));
		}
		g2dImage.setFont(fntStyle1);
		for (int i = 0; i < iTotalChars; i++) {
			//g2dImage.setColor(new Color(255,255,255));
			//g2dImage.setColor(new Color(randChars.nextInt(255), randChars.nextInt(255), randChars.nextInt(255)));
			g2dImage.setColor(new Color(randChars.nextInt(255-100)+100, randChars.nextInt(255-100)+100, randChars.nextInt(255-100)+100));
			//g2dImage.setColor(new Color(Color.HSBtoRGB( 0.5F + ((float) Math.random())*2F,  0.5F + ((float) Math.random())*2F, 0.5F + ((float) Math.random())*2F)));
			if (i % 2 == 0) {
				g2dImage.drawString(sImageCode.substring(i, i + 1), 25 * i, 24);
			} else {
				g2dImage.drawString(sImageCode.substring(i, i + 1), 25 * i, 35);
			}
		}
		OutputStream osImage = response.getOutputStream();
		ImageIO.write(biImage, "jpeg", osImage);
		g2dImage.dispose();
		HttpSession session = request.getSession();
		String captcha = sImageCode+"|"+this.addHoursToJavaUtilDate(new Date(), 1);
		System.out.println(captcha);
		session.setAttribute("captcha_security",Base64.getEncoder().encodeToString(captcha.getBytes())); 
	}
	
	private String addHoursToJavaUtilDate(Date date, int hours) {
	    Calendar calendar = Calendar.getInstance();
	    calendar.setTime(date);
	    calendar.add(Calendar.HOUR_OF_DAY, hours);
	    SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	 
	    return format1.format(calendar.getTime());
	}

}