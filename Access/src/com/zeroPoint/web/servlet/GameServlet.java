package com.zeroPoint.web.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import com.zeroPoint.service.GameService;
import com.zeroPoint.service.TeamService;
import com.zeroPoint.user.domain.Competitor;
import com.zeroPoint.user.domain.Game;
import com.zeroPoint.user.domain.PageBean;
import com.zeroPoint.user.domain.Project;
import com.zeroPoint.util.FileUtil;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

public class GameServlet extends BaseServlet {
	private GameService gameService = new GameService();
	/**
	 * 添加客户
	 */
	public String add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String path = this.getServletContext().getRealPath("/temp");
		DiskFileItemFactory factory = new DiskFileItemFactory(1024 * 1024, new File(path));
		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setFileSizeMax(1024 * 1024);
		List<FileItem> fileItems;
		try {
			fileItems = sfu.parseRequest(request);
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", CommonUtils.uuid());
			
			for(FileItem item : fileItems) {
				if(item.isFormField()) {
					map.put(item.getFieldName(), item.getString("UTF-8"));
				} else {
					FileUtil.saveFile(item, new File(path+"\\"+item.getName()));
					map.put(item.getFieldName(), "/temp/"+item.getName());
				}
			}
			Game game = CommonUtils.toBean(map, Game.class);
			gameService.add(game);
			request.getSession().setAttribute("gameInfo", game);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "r:/adminUser/gameInfo.jsp";
	}
	
	public void download(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String path = this.getServletContext().getRealPath("/temp");
			String id = request.getParameter("id");
			Game game = gameService.load(id);
			File file = new File(game.getWord());
			
			//文件下载
			response.setCharacterEncoding("UTF-8");
			//设置ContentType字段值
			response.setContentType("text/html;charset=utf-8");
			
			String fileName = file.getName();
			if(fileName.endsWith(".pdf")) {
				response.addHeader("Content-type", "appllication/pdf");
			} else if(fileName.endsWith(".zip")){
				response.addHeader("Content-type", "appllication/zip");
			} else if(fileName.endsWith(".doc")){
				response.addHeader("Content-type", "appllication/msword");
			} else {
				response.addHeader("Content-type", "appllication/application/vnd.openxmlformats-officedocument.wordprocessingml.document");
			}
			response.addHeader("Content-Disposition", "attachment;filename="+fileName);
			FileInputStream input = new FileInputStream(path+"\\"+fileName);
			ServletOutputStream output = response.getOutputStream();
			IOUtils.copy(input,output);
            input.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		PageBean<Competitor> pb = gameService.findAllCompetitor(pc, ps);//传递pc, ps给Service，得到PageBean
		
		// 设置url
		pb.setUrl(getUrl(request));
		
		request.setAttribute("pb", pb);//保存到request域中
		return "f:/adminUser/setResult.jsp";//转发到list.jsp
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
		PageBean<Game> pb = gameService.findAll(pc, ps);//传递pc, ps给Service，得到PageBean
		
		// 设置url
		pb.setUrl(getUrl(request));
		
		request.setAttribute("pb", pb);//保存到request域中
		return "f:/comList.jsp";//转发到list.jsp
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
		String cid = request.getParameter("cid");
		Game cstm = gameService.load(cid);
		request.setAttribute("cstm", cstm);
		return "f:/edit.jsp";
	}
	
	/**
	 * 编辑方法
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 封装表单数据到Customer对象中
		 * 2. 调用service方法完成修改
		 * 3. 保存成功信息到request域
		 * 4. 转发到msg.jsp显示成功信息
		 */
		// 已经封装了cid到Customer对象中
		Game c = CommonUtils.toBean(request.getParameterMap(), Game.class);
		//System.out.println(request.getParameter("uid"));
		c.setId(request.getParameter("uid"));
		gameService.edit(c);
		request.setAttribute("msg", "恭喜，编辑客户成功！");
		return "f:/top.jsp";
	}
	
	
	
	public String delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		gameService.delete(request.getParameter("id"));
		request.setAttribute("msg", "删除成功！");
		return "f:/msg.jsp";
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
		Game criteria = CommonUtils.toBean(request.getParameterMap(), Game.class);
		
		/*
		 * 处理GET请求方式编码问题！
		 */
		criteria = encoding(criteria);
		
		int pc = getPc(request);//得到pc
		int ps = 10;//给定ps的值，第页10行记录
		PageBean<Game> pb = gameService.query(criteria, pc, ps);
		
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
	private Game encoding(Game criteria) throws UnsupportedEncodingException {
		String cname = criteria.getName();
		String gender = criteria.getId();
		/*String cellphone = criteria.getStatu();
		String email = criteria.getKind();*/
		
		if(cname != null && !cname.trim().isEmpty()) {
			cname = new String(cname.getBytes("ISO-8859-1"), "utf-8");
			criteria.setName(cname);
		}
		
		if(gender != null && !gender.trim().isEmpty()) {
			gender = new String(gender.getBytes("ISO-8859-1"), "utf-8");
			criteria.setId(gender);
		}
		
		/*if(cellphone != null && !cellphone.trim().isEmpty()) {
			cellphone = new String(cellphone.getBytes("ISO-8859-1"), "utf-8");
			criteria.setStatu(cellphone);
		}
		
		if(email != null && !email.trim().isEmpty()) {
			email = new String(email.getBytes("ISO-8859-1"), "utf-8");
			criteria.setKind(email);
		}*/
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
