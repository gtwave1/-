package com.zeroPoint.web.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zeroPoint.service.UserException;
import com.zeroPoint.service.UserService;
import com.zeroPoint.user.domain.User;
import com.zeroPoint.util.MD5Util;

import cn.itcast.commons.CommonUtils;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");//请求编码(POST)
		response.setContentType("text/html;charset=utf-8");//响应编码
		
		UserService userService = new UserService();
		
		User form = CommonUtils.toBean(request.getParameterMap(), User.class);
		
		Map<String, String> errors = new HashMap<String, String>();
		
		//对用户名进行校验
				String username = form.getName();//获取用户名
				if(username == null || username.trim().isEmpty()){
					errors.put("username", "用户名不能为空!");
				}else if(username.length() < 0 || username.length() > 15){
					errors.put("username", "用户名长度必须在0~15之间!");
				}else if(username.contains("zeroPoint") || username.contains("admin")){
					errors.put("username", "名称有非法词汇");
				}
				
				//对密码进行校验
				String password = form.getPassword();
				String password1 = request.getParameter("password1");
				if(password == null || password.trim().isEmpty()){
					errors.put("password", "密码不能为空！");
				}else if(password.length() < 3 || password.length() > 15){
					errors.put("password", "密码长度必须在3~15之间!");
				}else if(!password.equals(password1)){
					errors.put("password", "两次密码输入不一致!");
				}
				
				//对id校验
				String id = form.getId();
				if(id == null || id.trim().isEmpty()){
					errors.put("id", "学号不能为空");
				}else if(id.contains("zeroPoint") || id.contains("admin")){
					errors.put("id", "此id含有非法词汇");
				}
				
				//对性别校验
				String sex = form.getSex();
				if(sex == null || sex.trim().isEmpty()){
					errors.put("sex", "性别不能为空");
				}
				
				//对院系校验
				String yuanxi = form.getYuanxi();
				if(yuanxi == null || yuanxi.trim().isEmpty()){
					errors.put("yuanxi", "院系不能为空");
				}
				
				//对专业校验
				String major = form.getMajor();
				if(major == null || major.trim().isEmpty()){
					errors.put("major", "专业不能为空");
				}
				
				//对班级校验
				String class1 = form.getClass1();
				if(class1 == null || class1.trim().isEmpty()){
					errors.put("class1", "班级不能为空");
				}
				
				//对电话进行校验
				String phone = form.getPhone();
				if(phone == null || phone.trim().isEmpty()){
					errors.put("phone", "电话不能为空");
				}
				
				//对qq进行校验
				String qq = form.getQqNumber();
				if(qq == null || qq.trim().isEmpty()){
					errors.put("qq", "qq不能为空");
				}
				
				//对邮箱进行验证
				String email = form.getEmail();
				if(email == null || email.trim().isEmpty()){
					errors.put("email", "邮箱不能为空");
				}
				
				if(errors != null && errors.size() > 0){
					request.setAttribute("errors", errors);
					request.setAttribute("user", form);
					request.getRequestDispatcher("/register.jsp").forward(request, response);
					return;
				}
				form.setPassword(MD5Util.MD5Encode(form.getPassword(), "utf8"));
				userService.register(form);
				response.getWriter().print("<h1>注册成功！</h1><a href='" + 
						request.getContextPath() + 
						"/user/login.jsp" + "'>点击这里去登录</a>");
				//request.getRequestDispatcher("/user/regist_success.jsp").forward(request, response);
				
	}

}
