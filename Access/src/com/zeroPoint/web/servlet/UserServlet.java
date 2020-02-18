package com.zeroPoint.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zeroPoint.service.ProjectService;
import com.zeroPoint.service.TeamService;
import com.zeroPoint.service.UserException;
import com.zeroPoint.service.UserService;
import com.zeroPoint.user.domain.PageBean;
import com.zeroPoint.user.domain.Team;
import com.zeroPoint.user.domain.User;
import com.zeroPoint.util.MD5Util;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

public class UserServlet extends BaseServlet {
	private UserService userService = new UserService();
	private TeamService teamService = new TeamService();
	private ProjectService projectService = new ProjectService();
	
	public String registerJudge(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
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
					errors.put("id", "账号不能为空");
				}else if(!id.contains("zeroPoint")){
					errors.put("id", "此账号格式不匹配未符合要求!");
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
					request.getRequestDispatcher("/adminUser/addJudge.jsp").forward(request, response);
				}
				form.setPassword(MD5Util.MD5Encode(form.getPassword(), "utf8"));
				userService.register(form);
				request.setAttribute("msg", "添加成功!");
				return "f:/adminUser/judgeList.jsp";
	}
	
	/**
	  * 登录
	 */
	public String login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");//请求编码(POST)
		response.setContentType("text/html;charset=utf-8");//响应编码
		
		User form = new User();
		form.setId(request.getParameter("id"));
		form.setPassword(request.getParameter("password"));
		try {
			User user = userService.login(form);
			
			if(user.getId().contains("zeroPoint")){
				request.getSession().setAttribute("sessionZeroPoint", user);
				return "r:/user/zeroPoint.jsp";
			}
			else if(user.getId().contains("admin")){
				request.getSession().setAttribute("sessionAdmin", user);
				return "r:/user/adminProfile.jsp";
			}
			else{
				List<User> list = teamService.load(user.getId());//把组员返回回去
				Team team = teamService.getTeamByUid(user.getId());
				request.getSession().setAttribute("sessionUser", user);
				request.getSession().setAttribute("Teams", list);
				if(list != null) {
					request.getSession().setAttribute("id_team", team);
					request.getSession().setAttribute("project", projectService.find(team.getId()));
				}
				return "r:/user/userProfile.jsp";
			}
		} catch(UserException e) {
			request.setAttribute("msg", e.getMessage());
			request.setAttribute("user", form);
			return "f:/user/login.jsp";
		}
	}
	
	/**
	 * 注销
	 * @throws Exception 
	 */
	public String logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");//请求编码(POST)
		response.setContentType("text/html;charset=utf-8");//响应编码
		
		HttpSession session = request.getSession();
		session.setAttribute("sessionUser", null);
		request.getSession().setAttribute("Teams", null);
		request.getSession().setAttribute("id_team", null);
		request.getSession().setAttribute("project", null);
		
		session.setAttribute("sessionZeroPoint", null);
		session.setAttribute("sessionAdmin", null);
		return "r:/user/login.jsp";
	}
	
	/**
	 * 添加客户
	 */
	public String add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 封装表单数据到Customer对象
		 * 2. 补全：cid，使用uuid
		 * 3. 使用service方法完成添加工作
		 * 4. 向request域中保存成功信息
		 * 5. 转发到msg.jsp
		 */
		User c = CommonUtils.toBean(request.getParameterMap(), User.class);
		//c.setCid(CommonUtils.uuid());
		userService.add(c);
		request.setAttribute("msg", "恭喜，添加成功！");
		return "f:/msg.jsp";
	}
	
	/**
	 * 查询所有
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
//	public String findAll(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		/*
//		 * 1. 调用service得到所有客户
//		 * 2. 保存到request域
//		 * 3. 转发到list.jsp
//		 */
//		request.setAttribute("cstmList", customerService.findAll());
//		return "f:/list.jsp";
//	}
	
	public String findAllUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 获取页面传递的pc
		 * 2. 给定ps的值
		 * 3. 使用pc和ps调用service方法，得到PageBean，保存到request域
		 * 4. 转发到list.jsp
		 */
		int pc = getPc(request);//得到pc
		int ps = 10;//给定ps的值，第页10行记录
		PageBean<User> pb = userService.findAllUser(pc, ps);//传递pc, ps给Service，得到PageBean
		
		// 设置url
		pb.setUrl(getUrl(request));
		request.setAttribute("pb", pb);//保存到request域中
		return "f:/adminUser/userList.jsp";//转发到list.jsp
	}
	
	public String findAllJudge(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 获取页面传递的pc
		 * 2. 给定ps的值
		 * 3. 使用pc和ps调用service方法，得到PageBean，保存到request域
		 * 4. 转发到list.jsp
		 */
		int pc = getPc(request);//得到pc
		int ps = 10;//给定ps的值，第页10行记录
		PageBean<User> pb = userService.findAllJudge(pc, ps);//传递pc, ps给Service，得到PageBean
		
		// 设置url
		pb.setUrl(getUrl(request));
		request.setAttribute("pb", pb);//保存到request域中
		return "f:/adminUser/judgeList.jsp";//转发到list.jsp
	}
	/**
	 * 获取pc
	 * @param request
	 * @return
	 */
	private int getPc(HttpServletRequest request) {
		/*
		 * 1. 得到pc
		 *   如果pc参数不存在，说明pc=1
		 *   如果pc参数存在，需要转换成int类型即可
		 */
		String value = request.getParameter("pc");
		if(value == null || value.trim().isEmpty()) {
			return 1;
		}
		return Integer.parseInt(value);
	}
	
	/**
	 * 编辑之前的加载工作
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String preEdit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 获取cid
		 * 2. 使用cid来调用service方法，得到Customer对象
		 * 3. 把Customer保存到request域中
		 * 4. 转发到edit.jsp显示在表单中
		 */
		String cid = request.getParameter("id");
		User cstm = userService.load(cid);
		
		request.setAttribute("sessionUser", cstm);
		return "f:/edit1.jsp";
	}
	
	public String edit1(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		/*
		 * 1. 封装表单数据到Customer对象中
		 * 2. 调用service方法完成修改
		 * 3. 保存成功信息到request域
		 * 4. 转发到msg.jsp显示成功信息
		 */
		// 已经封装了cid到Customer对象中
		User c = CommonUtils.toBean(request.getParameterMap(), User.class);
		c = userService.edit(c);
		
		if(c.getId().contains("zeroPoint")){
			request.getSession().setAttribute("sessionzeroPoint", c);
			return "r:/UserServlet?method=findAllJudge";
		}
		else{
			List<User> list = teamService.load(c.getId());//把组员返回回去
			request.getSession().setAttribute("sessionUser", c);
			request.getSession().setAttribute("Teams", list);
			return "r:/UserServlet?method=findAllUser";
		}
	}
	
	/**
	 * 编辑方法
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 * @throws UserException 
	 */
	public String edit(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		/*
		 * 1. 封装表单数据到Customer对象中
		 * 2. 调用service方法完成修改
		 * 3. 保存成功信息到request域
		 * 4. 转发到msg.jsp显示成功信息
		 */
		// 已经封装了cid到Customer对象中
		User c = CommonUtils.toBean(request.getParameterMap(), User.class);
		c = userService.edit(c);
		
		if(c.getId().contains("zeroPoint")){
			request.getSession().setAttribute("sessionzeroPoint", c);
			return "r:/user/zeroPoint.jsp";
		}
		else{
			List<User> list = teamService.load(c.getId());//把组员返回回去
			request.getSession().setAttribute("sessionUser", c);
			request.getSession().setAttribute("Teams", list);
			return "r:/user/userProfile.jsp";
		}
	}
	
	public String deleteUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		userService.delete(request.getParameter("cid"));
		request.setAttribute("msg", "删除成功！");
		return "f:/UserServlet?method=findAllUser";
	}
	
	public String deleteJudge(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		userService.delete(request.getParameter("cid"));
		request.setAttribute("msg", "删除成功！");
		return "f:/UserServlet?method=findAllJudge";
	}
	
//	public String query(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		/*
//		 * 1. 封装表单数据到Customer对象中，它只有四个属性（cname、gender、cellphone、email）
//		 *   它就是一个条件
//		 * 2. 使用Customer调用service方法，得到List<Customer>
//		 * 3. 保存到request域中
//		 * 4. 转发到list.jsp
//		 */
//		Customer criteria = CommonUtils.toBean(request.getParameterMap(), Customer.class);
//		List<Customer> cstmList = customerService.query(criteria);
//		request.setAttribute("cstmList", cstmList);
//		return "/list.jsp";
//	}
	
	public String query(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		System.out.println(getUrl(request));
		/*
		 * 0. 把条件封装到Customer对象中
		 * 1. 得到pc
		 * 2. 给定ps
		 * 3. 使用pc和ps，以及条件对象，调用service方法得到PageBean
		 * 4. 把PageBean保存到request域中
		 * 5. 转发到list.jsp
		 */
		// 获取查询条件
		User criteria = CommonUtils.toBean(request.getParameterMap(), User.class);
		
		/*
		 * 处理GET请求方式编码问题！
		 */
		criteria = encoding(criteria);
		
		int pc = getPc(request);//得到pc
		int ps = 10;//给定ps的值，第页10行记录
		PageBean<User> pb = userService.query(criteria, pc, ps);
		
		// 得到url，保存到pb中
		pb.setUrl(getUrl(request));
		
		request.setAttribute("pb", pb);
		return "f:/userList.jsp";
	}
	
	/**
	 * 处理四样
	 * @param criteria
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	private User encoding(User criteria) throws UnsupportedEncodingException {
		String cname = criteria.getName();
		String gender = criteria.getSex();
		String cellphone = criteria.getPhone();
		String email = criteria.getEmail();
		
		if(cname != null && !cname.trim().isEmpty()) {
			cname = new String(cname.getBytes("ISO-8859-1"), "utf-8");
			criteria.setName(cname);
		}
		
		if(gender != null && !gender.trim().isEmpty()) {
			gender = new String(gender.getBytes("ISO-8859-1"), "utf-8");
			criteria.setSex(gender);
		}
		
		if(cellphone != null && !cellphone.trim().isEmpty()) {
			cellphone = new String(cellphone.getBytes("ISO-8859-1"), "utf-8");
			criteria.setPhone(cellphone);
		}
		
		if(email != null && !email.trim().isEmpty()) {
			email = new String(email.getBytes("ISO-8859-1"), "utf-8");
			criteria.setEmail(email);
		}
		return criteria;
	}

	/**
	 * 截取url
	 *   /项目名/Servlet路径?参数字符串
	 * @param request
	 * @return
	 */
	private String getUrl(HttpServletRequest request) {
		String contextPath = request.getContextPath();//获取项目名
		String servletPath = request.getServletPath();//获取servletPath，即/CustomerServlet
		String queryString = request.getQueryString();//获取问号之后的参数部份
		
		//  判断参数部份中是否包含pc这个参数，如果包含，需要截取下去，不要这一部份。
		if(queryString.contains("&pc=")) {
			int index = queryString.lastIndexOf("&pc=");
			queryString = queryString.substring(0, index);
		}
		
		return contextPath + servletPath + "?" + queryString;
	}
}