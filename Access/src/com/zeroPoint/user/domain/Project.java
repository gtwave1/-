package com.zeroPoint.user.domain;

public class Project {
	private String id;
	private String name;
	private String word;
	private String video;
	private String synopsis;
	private String code;
	private String tid;
	
	
	public Project(String id, String name, String word, String video, String synopsis, String code, String tid) {
		super();
		this.id = id;
		this.name = name;
		this.word = word;
		this.video = video;
		this.synopsis = synopsis;
		this.code = code;
		this.tid = tid;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Project(String id, String name, String word, String video, String synopsis) {
		super();
		this.id = id;
		this.name = name;
		this.word = word;
		this.video = video;
		this.synopsis = synopsis;
	}
	public String getSynopsis() {
		return synopsis;
	}
	public void setSynopsis(String synopsis) {
		this.synopsis = synopsis;
	}
	@Override
	public String toString() {
		return "Project [id=" + id + ", name=" + name + ", word=" + word + ", video=" + video + ", synopsis=" + synopsis
				+ ", code=" + code + ", tid=" + tid + "]";
	}
	public Project(String id, String name, String word, String video) {
		super();
		this.id = id;
		this.name = name;
		this.word = word;
		this.video = video;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
