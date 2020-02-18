package com.zeroPoint.user.domain;

public class User {
	private String name;//姓名
	private String id;//学号
	private String sex;//性别
	private String yuanxi;//院系
	private String major;//专业
	private String class1;//班级
	private String phone;//电话
	private String qqNumber;//qq
	private String email;//邮箱
	private String password;//密码
	private String verify;//验证码
	private Project project; //项目
	private int statu;	// 参赛状态

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getYuanxi() {
		return yuanxi;
	}
	public void setYuanxi(String yuanxi) {
		this.yuanxi = yuanxi;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getClass1() {
		return class1;
	}
	public void setClass1(String class1) {
		this.class1 = class1;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getQqNumber() {
		return qqNumber;
	}
	public void setQqNumber(String qqNumber) {
		this.qqNumber = qqNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getVerify() {
		return verify;
	}
	public void setVerify(String verify) {
		this.verify = verify;
	}
	public Project getProject(){return this.project;}
	public void setProject(Project project) {this.project = project;}
	public int getStatu() {return this.statu;}
	public void setStatu(int statu) {this.statu = statu;}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String name, String id, String sex, String yuanxi, String major, String class1, String phone,
			String qqNumber, String email, String password, String verify) {
		super();
		this.name = name;
		this.id = id;
		this.sex = sex;
		this.yuanxi = yuanxi;
		this.major = major;
		this.class1 = class1;
		this.phone = phone;
		this.qqNumber = qqNumber;
		this.email = email;
		this.password = password;
		this.verify = verify;
	}
	@Override
	public String toString() {
		return "User [name=" + name + ", id=" + id + ", sex=" + sex + ", yuanxi=" + yuanxi + ", major=" + major
				+ ", class1=" + class1 + ", phone=" + phone + ", qqNumber=" + qqNumber + ", email=" + email
				+ ", password=" + password + ", verify=" + verify + ", project=" + project + ", statu=" + statu + "]";
	}
	
	
}
