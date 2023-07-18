package ReFarmProject;

public class Work {
	private String title;
	private String workname;
	private String career;
	private String day;
	private String endday;
	
	public Work(String title, String workname, String career, String day, String endday) {
		super();
		this.title = title;
		this.workname = workname;
		this.career = career;
		this.day = day;
		this.endday = endday;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWorkname() {
		return workname;
	}
	public void setWorkname(String workname) {
		this.workname = workname;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getEndday() {
		return endday;
	}
	public void setEndday(String endday) {
		this.endday = endday;
	}
	public Work() {
		
	}
}
