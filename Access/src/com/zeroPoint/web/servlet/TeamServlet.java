package com.zeroPoint.web.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zeroPoint.service.TeamService;
import com.zeroPoint.service.UserException;
import com.zeroPoint.service.UserService;
import com.zeroPoint.user.domain.Competitor;
import com.zeroPoint.user.domain.Game;
import com.zeroPoint.user.domain.PageBean;
import com.zeroPoint.user.domain.Team;
import com.zeroPoint.user.domain.User;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

public class TeamServlet extends BaseServlet {
	private TeamService teamService = new TeamService();
	private UserService userService = new UserService();
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
		
		try {
			Team c = CommonUtils.toBean(request.getParameterMap(), Team.class);
			c.setId(CommonUtils.uuid());
			c.setDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			c.setResult("0");
			Game game = (Game) getServletContext().getAttribute("gameInfo");
			c.setGid(game.getId());
			userService.editTeamStatu(c, "1");
			teamService.add(c);
			User user = userService.load(c.getFid());
			request.getSession().setAttribute("sessionUser", user);
			request.getSession().setAttribute("Teams", teamService.load(c.getFid()));
			request.getSession().setAttribute("team_statu", teamService.getKind(user.getId()));
			request.setAttribute("msg", "<h1>恭喜，报名成功！</h1><a href='/Access/user/userProfile.jsp'/>点击这里回到个人中心</a>");
			return "f:/msg.jsp";
		} catch (UserException e) {
			request.setAttribute("msg", e.getMessage());
			return "f:/user/entoll.jsp";
		}
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
	
	public String findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 获取页面传递的pc
		 * 2. 给定ps的值
		 * 3. 使用pc和ps调用service方法，得到PageBean，保存到request域
		 * 4. 转发到list.jsp
		 */
		int pc = getPc(request);//得到pc
		int ps = 10;//给定ps的值，第页10行记录
		PageBean<Competitor> pb = teamService.findAllCompetitor(pc, ps);//传递pc, ps给Service，得到PageBean
		
		// 设置url
		pb.setUrl(getUrl(request));
		
		request.setAttribute("pb", pb);//保存到request域中
		return "f:/user/projectList.jsp";//转发到list.jsp
	}
	
	public String mark(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, UserException {
		/*
		 * 1. 封装表单数据到Customer对象中
		 * 2. 调用service方法完成修改
		 * 3. 保存成功信息到request域
		 * 4. 转发到msg.jsp显示成功信息
		 */
		// 已经封装了cid到Customer对象中
		String uid = request.getParameter("uid");
		String score = request.getParameter("score");
		teamService.mark(uid, score);
		userService.editTeamStatu(teamService.getTeamByUid(uid), "3");
		request.setAttribute("msg", "评分成功！<a href='/Access/TeamServlet?method=findAll'/>点击这里继续评分</a>");
		return "f:/msg.jsp";
	}
	
	public String editTeam(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 封装表单数据到Customer对象中
		 * 2. 调用service方法完成修改
		 * 3. 保存成功信息到request域
		 * 4. 转发到msg.jsp显示成功信息
		 */
		// 已经封装了cid到Customer对象中
		Team c = CommonUtils.toBean(request.getParameterMap(), Team.class);
		String id = request.getParameter("id");
		c.setId(id);
		teamService.editTeam(c);
		request.setAttribute("msg", "修改完成！！");
		return "f:/user/zeroPoint.jsp";
	}
	
	public String findAll2(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 获取页面传递的pc
		 * 2. 给定ps的值
		 * 3. 使用pc和ps调用service方法，得到PageBean，保存到request域
		 * 4. 转发到list.jsp
		 */
		int pc = getPc(request);//得到pc
		int ps = 10;//给定ps的值，第页10行记录
		PageBean<Team> pb = teamService.findAllTeam(pc, ps);//传递pc, ps给Service，得到PageBean
		
		// 设置url
		pb.setUrl(getUrl(request));
		
		request.setAttribute("pb", pb);//保存到request域中
		return "f:/teamList.jsp";//转发到teamList.jsp
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
	
	
	
	
	public String delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		teamService.delete(request.getParameter("id"));
		request.setAttribute("msg", "删除成功！");
		return "f:/teamList.jsp";
	}

	
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
		Team criteria = CommonUtils.toBean(request.getParameterMap(), Team.class);
		
		/*
		 * 处理GET请求方式编码问题！
		 */
		criteria = encoding(criteria);
		
		int pc = getPc(request);//得到pc
		int ps = 10;//给定ps的值，第页10行记录
		PageBean<Team> pb = teamService.query(criteria, pc, ps);
		
		// 得到url，保存到pb中
		pb.setUrl(getUrl(request));
		
		request.setAttribute("pb", pb);
		return "f:/list.jsp";
	}
	
	/**
	 * 处理四样
	 * @param criteria
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	private Team encoding(Team criteria) throws UnsupportedEncodingException {
		String cname = criteria.getFid();
		String gender = criteria.getId();
		String cellphone = criteria.getTid();
		String email = criteria.getFid();
		
		if(cname != null && !cname.trim().isEmpty()) {
			cname = new String(cname.getBytes("ISO-8859-1"), "utf-8");
			criteria.setFid(cname);
		}
		
		if(gender != null && !gender.trim().isEmpty()) {
			gender = new String(gender.getBytes("ISO-8859-1"), "utf-8");
			criteria.setId(gender);
		}
		
		if(cellphone != null && !cellphone.trim().isEmpty()) {
			cellphone = new String(cellphone.getBytes("ISO-8859-1"), "utf-8");
			criteria.setTid(cellphone);
		}
		
		if(email != null && !email.trim().isEmpty()) {
			email = new String(email.getBytes("ISO-8859-1"), "utf-8");
			criteria.setFid(email);
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
