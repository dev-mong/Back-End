package member;

public class MemberInfo {
	private String id;
	private String pw;
	private String chk;
	public MemberInfo(String id, String pw, String chk) {
		super();
		this.id = id;
		this.pw = pw;
		this.chk = chk;
	}
	public String getId() {
		return id;
	}
	
	public String getPw() {
		return pw;
	}
	
	public String getChk() {
		return chk;
	}
	
	@Override
	public String toString() {
		return "MemberInfo [id=" + id + ", pw=" + pw + ", chk=" + chk + "]";
	}
	

	
}
