package lotto.sale;

import java.util.Date;

public class SaleVO {
	private int code;
	private String name;
	private String type;
	private String location;
	private int win_turn;
	private Date win_date;
	private int count;
	private int getRow;
	
	
	
	public int getGetRow() {
		return getRow;
	}
	public void setGetRow(int getRow) {
		this.getRow = getRow;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getWin_turn() {
		return win_turn;
	}
	public void setWin_turn(int win_turn) {
		this.win_turn = win_turn;
	}
	public Date getWin_date() {
		return win_date;
	}
	public void setWin_date(Date win_date) {
		this.win_date = win_date;
	}
	
	
}
