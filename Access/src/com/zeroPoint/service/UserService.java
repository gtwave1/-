package com.zeroPoint.service;

import com.zeroPoint.user.dao.UserDao;
import com.zeroPoint.user.domain.PageBean;
import com.zeroPoint.user.domain.Team;
import com.zeroPoint.user.domain.User;
import com.zeroPoint.util.MD5Util;


public class UserService {
	
	UserDao userDao = new UserDao();
	public User login(User form) throws UserException {
		/*
		 * 1. 使用form中的username进行查询，得到User user
		 */
		User user = userDao.findByUsername(form.getId());
		/*
		 * 2. 如果返回null，说明用户名不存在，抛出异常，异常信息为“用户名不存在”
		 */
		if(user == null) throw new UserException("用户名不存在！");
		/*
		 * 3. 比较user的password和form的password，如果不同，抛出异常，异常信息为“密码错误！”
		 */
		String passEnString = MD5Util.MD5Encode(form.getPassword(), "utf8");
		if(!passEnString.equals(user.getPassword())) {
			throw new UserException("密码错误！");
		}
		
		/*
		 * 返回数据库中查询出来的user，而不是form，因为form中只有用户名和密码，而user是所有用户信息！
		 */
		return user;
	}
	
	
	public void register(User form){
		//注册直接加
		userDao.add(form);
		
	}
	public void add(User c) {
		userDao.add1(c);
	}
	
	/**
	 * 查询所有
	 * @return
	 */
	public PageBean<User> findAllUser(int pc, int ps) {
		return userDao.findAllUser(pc, ps);
	}
	public PageBean<User> findAllJudge(int pc, int ps) {
		return userDao.findAllJudge(pc, ps);
	}

	/**
	 * 加载客户
	 * @param cid
	 * @return
	 */
	public User load(String cid) {
		return userDao.load(cid);
	}

	/**
	 * 编辑客户
	 * @param c
	 */
	public User edit(User c) {
		return userDao.edit(c);
	}
	public void delete(String cid){
		userDao.delete(cid);
	}

	/**
	 * 多条件组合查询
	 * @param criteria
	 * @return
	 */
	public PageBean<User> query(User criteria, int pc, int ps) {
		return userDao.query(criteria, pc, ps);
	}


	public void editTeamStatu(Team c, String statu) throws UserException {
		
		if(c.getSid() != null && c.getSid() != "") {
			User secondUser = userDao.load(c.getSid());
			if(secondUser != null) {
				userDao.editStatus(c.getSid(), statu);
			} else {
				throw new UserException("组员2不存在或该用户未注册！");
			}
		}
		
		if(c.getTid() != null && c.getTid() != "") {
			User thridUser = userDao.load(c.getTid());
			if(thridUser != null) {
				userDao.editStatus(c.getTid(), statu);
			} else {
				throw new UserException("组员3不存在或该用户未注册！");
			}
		}
	
		if(c.getFoid() != null && c.getFoid() != "") {
			User fourthUser = userDao.load(c.getFoid());
			if(fourthUser != null) {
				userDao.editStatus(c.getFoid(), statu);
			} else {
				throw new UserException("组员4不存在或该用户未注册！");
			}
		}
		
		if(c.getFiid() != null && c.getFiid() != "") {
			User fifthUser = userDao.load(c.getFiid());
			if(fifthUser != null) {
				userDao.editStatus(c.getFiid(), statu);
			} else {
				throw new UserException("组员5不存在或该用户未注册！");
			}
		}
		
		userDao.editStatus(c.getFid(), statu);
	}
	
}
