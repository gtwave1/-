package com.zeroPoint.user.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.zeroPoint.user.domain.PageBean;
import com.zeroPoint.user.domain.Project;
import com.zeroPoint.user.domain.Team;
import com.zeroPoint.user.domain.User;

import cn.itcast.jdbc.TxQueryRunner;

public class ProjectDao {
private TxQueryRunner qr = new TxQueryRunner();
	
	public void addProject(Project form){	
		try {
			String sql = "select * from team where id=?";//查队伍id
			Team t = qr.query(sql, new BeanHandler<Team>(Team.class), form.getTid());
			
			sql = "insert into project values(?,?,?,?,?,?,?)";//插入
			Object[] params = { form.getId(),form.getVideo(),form.getWord()
					,form.getName(),form.getSynopsis(),form.getCode(),form.getTid()};
			qr.update(sql, params);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}

	}
	

public PageBean<Project> findAll(int pc, int ps) {
	try {
		/*
		 * 1. 他都PageBean对象pb
		 * 2. 设置pb的pc和ps
		 * 3. 得到tr，设置给pb
		 * 4. 得到beanList，设置给pb
		 * 5. 返回pb
		 */
		PageBean<Project> pb = new PageBean<Project>();
		pb.setPc(pc);
		pb.setPs(ps);
		/*
		 * 得到tr
		 */
		String sql = "select count(*) from project";
		Number num = (Number)qr.query(sql, new ScalarHandler());
		int tr = num.intValue();
		pb.setTr(tr);
		/*
		 * 得到beanList
		 */
		sql = "select * from project order by id limit ?,?";
		List<Project> beanList = qr.query(sql, 
				new BeanListHandler<Project>(Project.class), 
				(pc-1)*ps, ps);
		pb.setBeanList(beanList);
		return pb;
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}

public Project find(String tid) {
	try {
		String sql = "select * from project where tid=?";
		return qr.query(sql, new BeanHandler<Project>(Project.class), tid);
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}

/**
 * 编辑客户
 * @param c
 */
public void edit(Project c) {
	try {
		String sql = "update project set video=?,word=?,name=? where id = ?";
		Object[] params = {c.getVideo(),c.getWord(),c.getName(),c.getId()};
		qr.update(sql, params);
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}
public PageBean<Project> query(Project criteria, int pc, int ps) {
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
		PageBean<Project> pb = new PageBean<Project>();
		pb.setPc(pc);
		pb.setPs(ps);
		
		/*
		 * 得到tr
		 */
		
		/*
		 * 1. 给出一个sql语句前半部
		 */
		StringBuilder cntSql = new StringBuilder("select count(*) from project");
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
		
		/*String cellphone = criteria.getJobb();
		if(cellphone != null && !cellphone.trim().isEmpty()) {
			whereSql.append(" and jobb like ?");
			params.add("%" + cellphone + "%");
		}
		
		String email = criteria.getEmail();
		if(email != null && !email.trim().isEmpty()) {
			whereSql.append(" and email like ?");
			params.add("%" + email + "%");
		}
		*/
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
		StringBuilder sql = new StringBuilder("select * from t_customer");
		// 我们查询beanList这一步，还需要给出limit子句
		StringBuilder limitSql = new StringBuilder(" limit ?,?");
		// params中需要给出limit后两个问号对应的值
		params.add((pc-1)*ps);
		params.add(ps);
		// 执行之
		List<Project> beanList = qr.query(sql.append(whereSql).append(limitSql).toString(), 
				new BeanListHandler<Project>(Project.class), 
				params.toArray());
		pb.setBeanList(beanList);
		
		return pb;
		
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}	
}
