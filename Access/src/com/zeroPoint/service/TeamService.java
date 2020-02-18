package com.zeroPoint.service;


import java.util.List;

import com.zeroPoint.user.dao.TeamDao;
import com.zeroPoint.user.domain.Competitor;
import com.zeroPoint.user.domain.PageBean;
import com.zeroPoint.user.domain.Team;
import com.zeroPoint.user.domain.User;

public class TeamService {
TeamDao teamDao = new TeamDao();
	
	public void add(Team form){
		teamDao.addTeam(form);
	}
	
	//查询所有已提交项目的参赛选手
	public PageBean<Competitor> findAllCompetitor(int pc, int ps) {
		return teamDao.findAllCompetitor(pc, ps);
	}
	
	//查询所有团队
		public PageBean<Team> findAllTeam(int pc, int ps) {
			return teamDao.findAllTeam(pc, ps);
		}
	
	public Team getTeamById(String id){
		return teamDao.getTeam(id);
	}
	public Team getTeamByUid(String uid){
		return teamDao.getTeam(uid);
	}
	public List<User> load(String cid) {
		return teamDao.load(cid);
	}
	public void mark(String uid, String score) {//修改信息
		teamDao.mark(uid, score);
	}
	
	public void editTeam(Team c){
		teamDao.editTeam(c);
	}
	public void delete(String cid){
		teamDao.delete(cid);
	}
	public PageBean<Team> query(Team criteria, int pc, int ps) {
		return teamDao.query(criteria, pc, ps);
	}

	public String getKind(String id) {
		// TODO Auto-generated method stub
		return teamDao.getKind(id);
	}
}
