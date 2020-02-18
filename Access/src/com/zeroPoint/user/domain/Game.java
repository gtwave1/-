package com.zeroPoint.user.domain;

public class Game {
	private String name;
	private String id;
	private String detail;
	private String start;
	private String stop;
	private String end;
	private int statu;
	private int kind;
	private String word;
	
	public Game(String name, String id, String detail, String start, String stop, String end, int statu, int kind,
			String word) {
		super();
		this.name = name;
		this.id = id;
		this.detail = detail;
		this.start = start;
		this.stop = stop;
		this.end = end;
		this.statu = statu;
		this.kind = kind;
		this.word = word;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
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
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getStop() {
		return stop;
	}
	public void setStop(String stop) {
		this.stop = stop;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public int getStatu() {
		return statu;
	}
	public void setStatu(int statu) {
		this.statu = statu;
	}
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	@Override
	public String toString() {
		return "Game [name=" + name + ", id=" + id + ", detail=" + detail + ", start=" + start + ", stop=" + stop
				+ ", end=" + end + ", statu=" + statu + ", kind=" + kind + ", word=" + word + "]";
	}
	
	public Game() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
