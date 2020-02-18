package com.zeroPoint.user.domain;

public class Competitor {
	private String id;
	private String tid;
	private String projectName;
	private String principal;
	private String phone;
	private String category;
	private String kind;
	private String statu;
	private String score;
	
	@Override
	public String toString() {
		return "Competitor [id=" + id + ", tid=" + tid + ", projectName=" + projectName + ", principal=" + principal
				+ ", phone=" + phone + ", category=" + category + ", kind=" + kind + ", statu=" + statu + ", score="
				+ score + "]";
	}

	public Competitor() {
		super();
	}
	
	public Competitor(String id, String tid, String projectName, String principal, String phone, String category,
			String kind, String statu, String score) {
		super();
		this.id = id;
		this.tid = tid;
		this.projectName = projectName;
		this.principal = principal;
		this.phone = phone;
		this.category = category;
		this.kind = kind;
		this.statu = statu;
		this.score = score;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getPrincipal() {
		return principal;
	}

	public void setPrincipal(String principal) {
		this.principal = principal;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getStatu() {
		return statu;
	}

	public void setStatu(String statu) {
		this.statu = statu;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

}
