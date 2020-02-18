package com.zeroPoint.service;

import com.zeroPoint.user.dao.ProjectDao;
import com.zeroPoint.user.domain.PageBean;
import com.zeroPoint.user.domain.Project;

public class ProjectService {
	ProjectDao projectDao = new ProjectDao();
	
	public void add(Project form){
		projectDao.addProject(form);
	}
	
	//查询所有
	public PageBean<Project> findAll(int pc, int ps) {
		return projectDao.findAll(pc, ps);
	}
	
	public Project find(String tid) {
		return projectDao.find(tid);
	}
	public void edit(Project c) {
		projectDao.edit(c);
	}
	
	public PageBean<Project> query(Project criteria, int pc, int ps) {
		return projectDao.query(criteria, pc, ps);
	}
}
