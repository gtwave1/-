package com.zeroPoint.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.zeroPoint.user.domain.PageBean;
import com.zeroPoint.user.domain.User;

import cn.itcast.jdbc.TxQueryRunner;


public class UserDao {
	
	private QueryRunner qr = new TxQueryRunner();
	public User findByUsername(String username) {
		try {
			String sql = "select * from person where id=?";
			return qr.query(sql, new BeanHandler<User>(User.class), username);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	@SuppressWarnings("null")
	public User findByEmail(String email) {
		try {
			String sql = "select * from person where email=?";
			return qr.query(sql, new BeanHandler<User>(User.class), email);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public void add(User user) {
		try {
			String sql = "insert into person values(?,?,?,?,?,?,?,?,?,?,?)";
			Object[] params = { user.getName(),user.getId(),user.getSex(),user.getYuanxi(),
					user.getMajor(),user.getClass1()
					,user.getPhone(),user.getQqNumber(),user.getEmail(),user.getPassword(),0};
			qr.update(sql, params);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	

	/**
	 * 添加客户
	 * 
	 * @param c
	 */
	public void add1(User c) {
		try {
			String sql = "insert into person values(?,?,?,?,?,?,?,?,?,?,?)";
			Object[] params = { c.getName(),c.getId(),c.getSex(),c.getYuanxi(),c.getMajor(),c.getClass1()
					,c.getPhone(),c.getQqNumber(),c.getEmail(),c.getPassword(),0};
			qr.update(sql, params);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 查询所有
	 * @return
	 */
	public PageBean<User> findAllUser(int pc, int ps) {
		try {
			/*
			 * 1. 他都PageBean对象pb
			 * 2. 设置pb的pc和ps
			 * 3. 得到tr，设置给pb
			 * 4. 得到beanList，设置给pb
			 * 5. 返回pb
			 */
			PageBean<User> pb = new PageBean<User>();
			pb.setPc(pc);
			pb.setPs(ps);
			/*
			 * 得到tr
			 */
			String sql = "select count(*) from person where id not like 'zeroPoint%' and id not like 'admin%'";
			Number num = (Number)qr.query(sql, new ScalarHandler());
			int tr = num.intValue();
			pb.setTr(tr);
			/*
			 * 得到beanList
			 */
			sql = "select * from person where id not like 'zeroPoint%' and id not like 'admin%' order by name limit ?,?";
			List<User> beanList = qr.query(sql, 
					new BeanListHandler<User>(User.class), 
					(pc-1)*ps, ps);
			pb.setBeanList(beanList);
			return pb;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public PageBean<User> findAllJudge(int pc, int ps) {
		try {
			/*
			 * 1. 他都PageBean对象pb
			 * 2. 设置pb的pc和ps
			 * 3. 得到tr，设置给pb
			 * 4. 得到beanList，设置给pb
			 * 5. 返回pb
			 */
			PageBean<User> pb = new PageBean<User>();
			pb.setPc(pc);
			pb.setPs(ps);
			/*
			 * 得到tr
			 */
			String sql = "select count(*) from person where id like 'zeroPoint%'";
			Number num = (Number)qr.query(sql, new ScalarHandler());
			int tr = num.intValue();
			pb.setTr(tr);
			/*
			 * 得到beanList
			 */
			sql = "select * from person where id like 'zeroPoint%' order by name limit ?,?";
			List<User> beanList = qr.query(sql, 
					new BeanListHandler<User>(User.class), 
					(pc-1)*ps, ps);
			pb.setBeanList(beanList);
			return pb;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 加载客户
	 * @param cid
	 * @return
	 */
	public User load(String cid) {
		try {
			String sql = "select * from person where id=?";
			return qr.query(sql, new BeanHandler<User>(User.class), cid);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 编辑用户
	 * @param c
	 */
	public User edit(User c) {
		try {
			String sql = "update person set name=?,sex=?," +
					"yuanxi=?,major=?,class1=?,phone=?,qqNumber=?,email=?"
					 +"where id=?";
			Object[] params = {c.getName(), 
					c.getSex(), c.getYuanxi(), c.getMajor(),
					c.getClass1(), c.getPhone(),c.getQqNumber()
					,c.getEmail(),c.getId()};
			qr.update(sql, params);
			return load(c.getId());
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	/*
	 * 删除用户
	 */
	public void delete(String cid){
		
		String sql = "delete from person where id = ?";
		try {
			qr.update(sql,cid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 多条件组合查询
	 * @param criteria
	 * @return
	 */
//	public List<Customer> query(Customer criteria) {
//		try {
//			/*
//			 * 1. 给出sql模板
//			 * 2. 给出参数
//			 * 3. 调用query方法，使用结果集处理器：BeanListHandler
//			 */
//			/*
//			 * 一、　给出sql模板
//			 * 二、　给出参数！
//			 */
//			/*
//			 * 1. 给出一个sql语句前半部
//			 */
//			StringBuilder sql = new StringBuilder("select * from t_customer where 1=1");
//			/*
//			 * 2. 判断条件，完成向sql中追加where子句
//			 */
//			/*
//			 * 3. 创建一个ArrayList，用来装载参数值
//			 */
//			List<Object> params = new ArrayList<Object>();
//			String cname = criteria.getCname();
//			if(cname != null && !cname.trim().isEmpty()) {
//				sql.append(" and cname like ?");
//				params.add("%" + cname + "%");
//			}
//			
//			String gender = criteria.getGender();
//			if(gender != null && !gender.trim().isEmpty()) {
//				sql.append(" and gender=?");
//				params.add(gender);
//			}
//			
//			String cellphone = criteria.getCellphone();
//			if(cellphone != null && !cellphone.trim().isEmpty()) {
//				sql.append(" and cellphone like ?");
//				params.add("%" + cellphone + "%");
//			}
//			
//			String email = criteria.getEmail();
//			if(email != null && !email.trim().isEmpty()) {
//				sql.append(" and email like ?");
//				params.add("%" + email + "%");
//			}
//			
//			/*
//			 * 三、执行query
//			 */
//			return qr.query(sql.toString(), 
//					new BeanListHandler<Customer>(Customer.class), 
//					params.toArray());
//		} catch(SQLException e) {
//			throw new RuntimeException(e);
//		}
//	}
	
	public PageBean<User> query(User criteria, int pc, int ps) {
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
			PageBean<User> pb = new PageBean<User>();
			pb.setPc(pc);
			pb.setPs(ps);
			
			/*
			 * 得到tr
			 */
			
			/*
			 * 1. 给出一个sql语句前半部
			 */
			StringBuilder cntSql = new StringBuilder("select count(*) from person");
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
			
			String gender = criteria.getSex();
			if(gender != null && !gender.trim().isEmpty()) {
				whereSql.append(" and sex=?");
				params.add(gender);
			}
			
			String cellphone = criteria.getPhone();
			if(cellphone != null && !cellphone.trim().isEmpty()) {
				whereSql.append(" and phone like ?");
				params.add("%" + cellphone + "%");
			}
			
			String email = criteria.getEmail();
			if(email != null && !email.trim().isEmpty()) {
				whereSql.append(" and email like ?");
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
			StringBuilder sql = new StringBuilder("select * from person");
			// 我们查询beanList这一步，还需要给出limit子句
			StringBuilder limitSql = new StringBuilder(" limit ?,?");
			// params中需要给出limit后两个问号对应的值
			params.add((pc-1)*ps);
			params.add(ps);
			// 执行之
			List<User> beanList = qr.query(sql.append(whereSql).append(limitSql).toString(), 
					new BeanListHandler<User>(User.class), 
					params.toArray());
			pb.setBeanList(beanList);
			
			return pb;
			
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public void editStatus(String id, String statu) {
		try {
			String sql = "update person set statu=? where id=?";
			Object[] params = {statu, id};
			qr.update(sql, params);
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
