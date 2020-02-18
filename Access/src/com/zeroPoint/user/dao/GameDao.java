package com.zeroPoint.user.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.zeroPoint.user.domain.Competitor;
import com.zeroPoint.user.domain.Game;
import com.zeroPoint.user.domain.PageBean;

import cn.itcast.jdbc.TxQueryRunner;

public class GameDao {
private TxQueryRunner qr = new TxQueryRunner();
	
	public void addCompetitor(Game form){	
		try {
			String sql = "insert into game values(?,?,?,?,?,?,?,?,?)";
			Object[] params = { form.getId(),form.getName(),form.getDetail(),form.getStart(),
					form.getStop(),form.getEnd(),form.getStatu(),form.getKind(),form.getWord()};
			qr.update(sql, params);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}

	}
	

public PageBean<Game> findAll(int pc, int ps) {
	try {
		/*
		 * 1. 他都PageBean对象pb
		 * 2. 设置pb的pc和ps
		 * 3. 得到tr，设置给pb
		 * 4. 得到beanList，设置给pb
		 * 5. 返回pb
		 */
		PageBean<Game> pb = new PageBean<Game>();
		pb.setPc(pc);
		pb.setPs(ps);
		/*
		 * 得到tr
		 */
		String sql = "select count(*) from game";
		Number num = (Number)qr.query(sql, new ScalarHandler());
		int tr = num.intValue();
		pb.setTr(tr);
		/*
		 * 得到beanList
		 */
		sql = "select * from game order by name limit ?,?";
		List<Game> beanList = qr.query(sql, 
				new BeanListHandler<Game>(Game.class), 
				(pc-1)*ps, ps);
		pb.setBeanList(beanList);
		return pb;
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}

public void add(Game c) {
	/*try {
		String sql = "insert into t_customer values(?,?,?,?,?,?,?)";
		Object[] params = { c.getId(), c.getName(), c.getEmail(),c.getJobb()};
		qr.update(sql, params);
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}*/
}
public Game load(String cid) {
	try {
		String sql = "select * from game where id=?";
		return qr.query(sql, new BeanHandler<Game>(Game.class), cid);
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}


/**
 * 编辑客户
 * @param c
 */
/*public void edit(Game c) {//修改分数
	try {
		String sql = "update game set score = ? where id = ?";
		Object[] params = {c.getScore(),c.getId()};
		qr.update(sql, params);
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}*/

public void edit(Game c) {//修改成员信息
	try {
		String sql = "update game set name=?,detail=?,start=?,stop=?,end=?,statu=?,kind=? where id = ?";
		Object[] params = {c.getName(),c.getDetail(),c.getStart(),c.getStop(),c.getEnd()
				,c.getStatu(),c.getKind(),c.getId()};
		qr.update(sql, params);
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}

/*
 * 删除用户
 */
public void delete(String cid){
	
	String sql = "delete from game where id = ?";
	try {
		qr.update(sql,cid);
	} catch (SQLException e) {
		e.printStackTrace();
	}
}
public PageBean<Game> query(Game criteria, int pc, int ps) {
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
		PageBean<Game> pb = new PageBean<Game>();
		pb.setPc(pc);
		pb.setPs(ps);
		
		/*
		 * 得到tr
		 */
		
		/*
		 * 1. 给出一个sql语句前半部
		 */
		StringBuilder cntSql = new StringBuilder("select count(*) from game");
		StringBuilder whereSql = new StringBuilder(" where 1=1");
		/*
		 * 2. 判断条件，完成向sql中追加where子句
		 */
		/*
		 * 3. 创建一个ArrayList，用来装载参数值
		 */
		List<Object> params = new ArrayList<Object>();
		String cname = criteria.getName();
		if(cname != null && !cname.trim().isEmpty()) {
			whereSql.append(" and name like ?");
			params.add("%" + cname + "%");
		}
		
		String gender = criteria.getId();
		if(gender != null && !gender.trim().isEmpty()) {
			whereSql.append(" and id=?");
			params.add(gender);
		}
		
		/*String cellphone = criteria.getStatu();
		if(cellphone != null && !cellphone.trim().isEmpty()) {
			whereSql.append(" and statu like ?");
			params.add("%" + cellphone + "%");
		}
		
		String email = criteria.getKind();
		if(email != null && !email.trim().isEmpty()) {
			whereSql.append(" and kind like ?");
			params.add("%" + email + "%");
		}*/
		
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
		StringBuilder sql = new StringBuilder("select * from game");
		// 我们查询beanList这一步，还需要给出limit子句
		StringBuilder limitSql = new StringBuilder(" limit ?,?");
		// params中需要给出limit后两个问号对应的值
		params.add((pc-1)*ps);
		params.add(ps);
		// 执行之
		List<Game> beanList = qr.query(sql.append(whereSql).append(limitSql).toString(), 
				new BeanListHandler<Game>(Game.class), 
				params.toArray());
		pb.setBeanList(beanList);
		
		return pb;
		
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}


public Game find() {
	try {
		String sql = "select * from game where statu=0";
		return qr.query(sql, new BeanHandler<Game>(Game.class));
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}


public PageBean<Competitor> findAllCompetitor(int pc, int ps) {
	// TODO Auto-generated method stub
	return null;
}	
}
