package ReFarmProject;

public class ReCountry {
	private String title;
	private String country;
	private String img;
	private String state;
	
	public ReCountry() {
		
	}

	public ReCountry(String title, String country, String img, String state) {
		super();
		this.title = title;
		this.country = country;
		this.img = img;
		this.state = state;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
}
