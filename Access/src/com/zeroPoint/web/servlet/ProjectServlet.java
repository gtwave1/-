package com.zeroPoint.web.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
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

import com.zeroPoint.service.ProjectService;
import com.zeroPoint.service.TeamService;
import com.zeroPoint.service.UserService;
import com.zeroPoint.user.domain.PageBean;
import com.zeroPoint.user.domain.Project;
import com.zeroPoint.user.domain.Team;
import com.zeroPoint.util.CompressedFileUtil;
import com.zeroPoint.util.FileUtil;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

/**
 * Servlet implementation class ProjectServlet
 */
public class ProjectServlet extends BaseServlet {
	private ProjectService projectService = new ProjectService();
	private TeamService teamService = new TeamService();
	private UserService userService = new UserService();
	
	/**
	 * 添加客户
	 */
	public String add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String path = this.getServletContext().getRealPath("/temp");
		DiskFileItemFactory factory = new DiskFileItemFactory(1024 * 1024 * 1024, new File(path));
		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setFileSizeMax(1024 * 1024 * 1024);
		Project c = new Project();

		List<FileItem> fileItems;
		try {
			fileItems = sfu.parseRequest(request);
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			
			File file = new File(path + "/" + map.get("id"));
			if(!file.exists()) file.mkdir();
			
			Team team = teamService.getTeamById(map.get("id"));
			
			for(FileItem item : fileItems) {
				if(item.isFormField()) {
					map.put(item.getFieldName(), item.getString("UTF-8"));
				} else {
					File fileItem = FileUtil.createFile(item, file.getAbsolutePath()+"\\", map.get("id"));
					FileUtil.saveFile(item, fileItem);
					map.put(item.getFieldName(), "/temp/"+map.get("id")+"/"+fileItem.getName());
				}
			}
			c.setId(CommonUtils.uuid());
			c.setName(fileItems.get(0).getString("UTF-8"));
			c.setSynopsis(fileItems.get(1).getString("UTF-8"));
			c.setWord(map.get("word"));
			c.setVideo(map.get("video"));
			c.setCode(map.get("code"));
			c.setTid(team.getId());
			projectService.add(c);
			team.setPid(c.getId());
			teamService.editTeam(team);
			userService.editTeamStatu(team, "2");
			request.getSession().setAttribute("sessionUser", userService.load(map.get("id")));
			request.getSession().setAttribute("Teams", teamService.load(map.get("id")));
			request.getSession().setAttribute("id_team", team);
			request.getSession().setAttribute("project", projectService.find(team.getId()));
			/*c = CommonUtils.toBean(map, Project.class);
			projectService.add(c);*/
			
			path = new File(c.getVideo()).getParent();
			String savePath = ((new File(c.getVideo()).getParentFile()).getParentFile()).getAbsolutePath();
			CompressedFileUtil.compressedFile(path, savePath);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("msg", "恭喜，项目提交成功！<p><a href='/Access/user/userProfile.jsp'/>点击这里回到个人中心</a></p>");
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
		PageBean<Project> pb = projectService.findAll(pc, ps);//传递pc, ps给Service，得到PageBean
		
		request.setAttribute("pb", pb);//保存到request域中
		return "f:/userList.jsp";//转发到list.jsp
	}
	public 	String find(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		String tid = request.getParameter("tid");
		Project pro = projectService.find(tid);
		Team team = teamService.getTeamById(tid);
		request.setAttribute("id_project", pro);
		request.getSession().setAttribute("id_team", team);
		request.getSession().setAttribute("uid", team.getFid());
		return "f:video/video.jsp";
	}
	 
	//下载源码
	public void download(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			
			String tid = request.getParameter("tid");
			Project pro = projectService.find(tid);
			String path = new File(pro.getVideo()).getParent();
			
			//文件下载
			response.setCharacterEncoding("UTF-8");
			//设置ContentType字段值
			response.setContentType("text/html;charset=utf-8");
			
			String filename = path.substring(path.lastIndexOf("\\")+1) + ".zip";
			response.addHeader("Content-type", "appllication/zip");
			response.addHeader("Content-Disposition", "attachment;filename="+filename);
			
			FileInputStream input = new FileInputStream(path + ".zip");
			ServletOutputStream output = response.getOutputStream();
			IOUtils.copy(input,output);
            input.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public 	String ufind(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		String id = request.getParameter("id");
		Team team = teamService.getTeamById(id);
		Project pro = projectService.find(team.getTid());
		
		request.getSession().setAttribute("id_team", team);
		request.getSession().setAttribute("project", pro);
		
		return "r:/project/project.jsp";
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
		Project cstm = projectService.find(cid);
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
		Project c = CommonUtils.toBean(request.getParameterMap(), Project.class);
		projectService.edit(c);
		request.setAttribute("msg", "恭喜，编辑成功！");
		return "f:/msg.jsp";
	}
	
	
}