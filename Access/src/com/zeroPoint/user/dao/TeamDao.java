package com.zeroPoint.user.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.zeroPoint.user.domain.Competitor;
import com.zeroPoint.user.domain.PageBean;
import com.zeroPoint.user.domain.Team;
import com.zeroPoint.user.domain.User;

import cn.itcast.jdbc.TxQueryRunner;

public class TeamDao {
private TxQueryRunner qr = new TxQueryRunner();
	
	public void addTeam(Team form){	
		try {
			String sql = "insert into team values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			Object[] params = { form.getId(),form.getFid(),form.getSid(),form.getTid(),form.getFoid(),
					form.getFiid(),form.getDate(),form.getPid(),form.getGid(),form.getResult(),
					form.getCategory(),form.getKind(),0};
			qr.update(sql, params);
			sql = "update person set statu=? where id=?";
			qr.update(sql, 1, form.getId());
			
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
public Team getTeam(String cid){
	try {
		String sql = "select * from team where id=? or fid=? or sid=? or tid=? or foid=? or fiid=?";
		Object[] params = {cid, cid, cid, cid, cid, cid};
		return qr.query(sql, new BeanHandler<Team>(Team.class), params);
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}

public PageBean<Competitor> findAllCompetitor(int pc, int ps) {
	try {
		/*
		 * 1. 他都PageBean对象pb
		 * 2. 设置pb的pc和ps
		 * 3. 得到tr，设置给pb
		 * 4. 得到beanList，设置给pb
		 * 5. 返回pb
		 */
		PageBean<Competitor> pb = new PageBean<Competitor>();
		pb.setPc(pc);
		pb.setPs(ps);
		/*
		 * 得到tr
		 */
		String sql = "select count(*) from team";
		Number num = (Number)qr.query(sql, new ScalarHandler());
		int tr = num.intValue();
		pb.setTr(tr);
		/*
		 * 得到beanList
		 */
		sql = "select a.id as id, b.id as tid, c.name as projectName, a.name as principal, a.phone as phone, "
				+ "b.category as category, b.kind, a.statu as statu, b.score as score "
				+ "from person a, team b, project c "
				+ "where a.id=b.fid and b.id=c.tid order by b.id limit ?,?";
		List<Competitor> beanList = qr.query(sql, 
				new BeanListHandler<Competitor>(Competitor.class), 
				(pc-1)*ps, ps);
		pb.setBeanList(beanList);
		return pb;
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}

public PageBean<Team> findAllTeam(int pc, int ps) {
	try {
		/*
		 * 1. 他都PageBean对象pb
		 * 2. 设置pb的pc和ps
		 * 3. 得到tr，设置给pb
		 * 4. 得到beanList，设置给pb
		 * 5. 返回pb
		 */
		PageBean<Team> pb = new PageBean<Team>();
		pb.setPc(pc);
		pb.setPs(ps);
		/*
		 * 得到tr
		 */
		String sql = "select count(*) from team";
		Number num = (Number)qr.query(sql, new ScalarHandler());
		int tr = num.intValue();
		pb.setTr(tr);
		/*
		 * 得到beanList
		 */
		sql = "select * from team order by id limit ?,?";
		List<Team> beanList = qr.query(sql, 
				new BeanListHandler<Team>(Team.class), 
				(pc-1)*ps, ps);
		pb.setBeanList(beanList);
		return pb;
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}

public void add(Team c) {
	/*try {
		String sql = "insert into t_customer values(?,?,?,?,?,?,?)";
		Object[] params = { c.getId(), c.getName(), c.getEmail(),c.getJobb()};
		qr.update(sql, params);
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}*/
}

public void mark(String uid, String score) {//修改分数
	try {
		String sql = "update team set score = ? where fid = ?";
		Object[] params = {score, uid};
		qr.update(sql, params);
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}

public void editTeam(Team c) {//修改分数
	try {
		String sql = "update team set fid = ?,sid=?,tid=?,foid=?,fiid=?,pid=?,gid=?,result=?, kind=? where id = ?";
		Object[] params = {c.getFid(),c.getSid(),c.getTid(),c.getFoid(),c.getFiid(),c.getPid(),c.getGid()
				,c.getResult(),c.getKind(),c.getId()};
		qr.update(sql, params);
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}
public List<User> load(String cid) {
	try {
		String sql = "select * from team where fid=? or sid=? or tid=? or foid=? or fiid=?";
		Object[] params = {cid, cid, cid, cid, cid};
		List<User> list = new ArrayList<User>();
		Team team = qr.query(sql, new BeanHandler<Team>(Team.class), params);
		if(team == null){
			return null;
		}
		if(team.getFid() != null){
			sql = "select * from person where id=?";
			list.add(qr.query(sql, new BeanHandler<User>(User.class), team.getFid()));
		}
		if(team.getSid() != null){
			sql = "select * from person where id=?";
			list.add(qr.query(sql, new BeanHandler<User>(User.class), team.getSid()));
		}
		if(team.getTid() != null){
			sql = "select * from person where id=?";
			list.add(qr.query(sql, new BeanHandler<User>(User.class), team.getTid()));
		}
		if(team.getFoid() != null){
			sql = "select * from person where id=?";
			list.add(qr.query(sql, new BeanHandler<User>(User.class), team.getFoid()));
		}
		if(team.getFiid() != null){
			sql = "select * from person where id=?";
			list.add(qr.query(sql, new BeanHandler<User>(User.class), team.getFiid()));
		}
		
		return list;
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}

/**
 * 编辑比赛
 * @param
 */

/*public void edit(Team c,String cid) {//修改成员信息
	try {
		String sql = "update team set name=?,id=?,email=?,jobb=?,name1=?"
				+ ",name2=?,name3=?,name4=? where id = ?";
		Object[] params = {c.getName(),c.getId(),c.getEmail(),c.getJobb(),c.getName1()
				,c.getName2(),c.getName3(),c.getName4(),cid};
		qr.update(sql, params);
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}*/

/*
 * 删除比赛
 */
public void delete(String cid){
	
	String sql = "delete from team where id = ?";
	try {
		qr.update(sql,cid);
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
public PageBean<Team> query(Team criteria, int pc, int ps) {
	try {
		/*
		 * 1. 创建PageBean对象　
		 * 2. 设置已有的属性，pc和ps
		 * 3. 得到tr
		 * 4. 得到beanList
		 */
		/*
		 * 创建pb，设置已有属性
		 */
		PageBean<Team> pb = new PageBean<Team>();
		pb.setPc(pc);
		pb.setPs(ps);
		
		/*
		 * 得到tr
		 */
		
		/*
		 * 1. 给出一个sql语句前半部
		 */
		StringBuilder cntSql = new StringBuilder("select count(*) from team");
		StringBuilder whereSql = new StringBuilder(" where 1=1");
		/*
		 * 2. 判断条件，完成向sql中追加where子句
		 */
		/*
		 * 3. 创建一个ArrayList，用来装载参数值
		 */
		List<Object> params = new ArrayList<Object>();
		String cname = criteria.getFid();
		if(cname != null && !cname.trim().isEmpty()) {
			whereSql.append(" and fid like ?");
			params.add("%" + cname + "%");
		}
		
		String gender = criteria.getId();
		if(gender != null && !gender.trim().isEmpty()) {
			whereSql.append(" and id=?");
			params.add(gender);
		}
		
		String cellphone = criteria.getTid();
		if(cellphone != null && !cellphone.trim().isEmpty()) {
			whereSql.append(" and tid like ?");
			params.add("%" + cellphone + "%");
		}
		
		String email = criteria.getFid();
		if(email != null && !email.trim().isEmpty()) {
			whereSql.append(" and fid like ?");
			params.add("%" + email + "%");
		}
		
		/*
		 * select count(*) .. + where子句
		 * 执行之
		 */
		Number num = (Number)qr.query(cntSql.append(whereSql).toString(), 
				new ScalarHandler(), params.toArray());
		int tr = num.intValue();
		pb.setTr(tr);
		
		/*
		 * 得到beanList
		 */
		StringBuilder sql = new StringBuilder("select * from team");
		// 我们查询beanList这一步，还需要给出limit子句
		StringBuilder limitSql = new StringBuilder(" limit ?,?");
		// params中需要给出limit后两个问号对应的值
		params.add((pc-1)*ps);
		params.add(ps);
		// 执行之
		List<Team> beanList = qr.query(sql.append(whereSql).append(limitSql).toString(), 
				new BeanListHandler<Team>(Team.class), 
				params.toArray());
		pb.setBeanList(beanList);
		
		return pb;
		
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}
public String getKind(String cid) {
	try {
		String sql = "select * from team where fid=? or sid=? or tid=? or foid=? or fiid=?";
		Object[] params = {cid, cid, cid, cid, cid};
		Team team = qr.query(sql, new BeanHandler<Team>(Team.class), params);
		return team.getKind();
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}
}
