package lotto.winInfo;

import java.util.Date;

public class WinInfoVO {
	private int code;
	private int drwNo;
	private Date drwDate;
	private Long totSellamnt;
	private Long firstAccumamnt;
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getDrwNo() {
		return drwNo;
	}
	public void setDrwNo(int drwNo) {
		this.drwNo = drwNo;
	}
	public Date getDrwDate() {
		return drwDate;
	}
	public void setDrwDate(Date drwDate) {
		this.drwDate = drwDate;
	}
	public Long getTotSellamnt() {
		return totSellamnt;
	}
	public void setTotSellamnt(Long totSellamnt) {
		this.totSellamnt = totSellamnt;
	}
	public Long getFirstAccumamnt() {
		return firstAccumamnt;
	}
	public void setFirstAccumamnt(Long firstAccumamnt) {
		this.firstAccumamnt = firstAccumamnt;
	}
	
	
}
