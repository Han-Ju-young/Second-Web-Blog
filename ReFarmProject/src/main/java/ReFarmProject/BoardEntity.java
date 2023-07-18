package ReFarmProject;

import java.util.Date;

public class BoardEntity {
	private String id;
	private String passwd;
	private String name;
	private Date date;
	private int showcnt;
	private String title;
	private String content;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getShowcnt() {
		return showcnt;
	}
	public void setShowcnt(int showcnt) {
		this.showcnt = showcnt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	//자동으로 생성된, 모든 필드에 대한 getter와 setter
	
}
