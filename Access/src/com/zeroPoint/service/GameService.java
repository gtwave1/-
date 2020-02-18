package com.zeroPoint.service;


import com.zeroPoint.user.dao.GameDao;
import com.zeroPoint.user.domain.Competitor;
import com.zeroPoint.user.domain.Game;
import com.zeroPoint.user.domain.PageBean;

public class GameService {
GameDao gameDao = new GameDao();
	
	public void entoll(Game form){
		gameDao.addCompetitor(form);
	}
	
	//查询所有
	public PageBean<Game> findAll(int pc, int ps) {
		return gameDao.findAll(pc, ps);
	}
	
	public void add(Game c) {
		gameDao.addCompetitor(c);
	}
	public Game load(String cid) {
		return gameDao.load(cid);
	}
	
	
	public void edit(Game c) {
		gameDao.edit(c);
	}
	
	public void delete(String cid){
		gameDao.delete(cid);
	}
	public PageBean<Game> query(Game criteria, int pc, int ps) {
		return gameDao.query(criteria, pc, ps);
	}

	public Game find() {
		// TODO Auto-generated method stub
		return gameDao.find();
	}

	public PageBean<Competitor> findAllCompetitor(int pc, int ps) {
		// TODO Auto-generated method stub
		return gameDao.findAllCompetitor(pc, ps);
	}

}
