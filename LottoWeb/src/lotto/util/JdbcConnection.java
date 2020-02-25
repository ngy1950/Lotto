package lotto.util;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import lotto.count.countVO;
import lotto.sale.SaleVO;

public class JdbcConnection {
	private Connection conn;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	public JdbcConnection() {}
	
	public int lotto_Insert(int [] winNum, int bonusNum) {
		String SQL = "INSERT INTO lotto_count_test(lotto_win, bonus) VALUES(?, ?)";						// 1회차 ~ 당첨 번호 횟수 
		String UPDATE_WIN = "update lotto_count_test set lotto_win = lotto_win + 1 where lotto_num = ?";	// 당첨 번호 횟수 증가
		String UPDATE_BONUS = "update lotto_count_test set bonus = bonus + 1 where lotto_num = ?";			// 당첨 보너스 보너스 번호 횟수 증가
/*
		//		로또번호 최초 INSERT시 
		try {
			join();
			pstmt = conn.prepareStatement(SQL);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		for(int i=0;i<winNum.length;i++) {
			System.out.println(i +": "+ winNum[i] + "번 "+ "-----("+bonusNum[i]+")");
			
			try {
				
				pstmt.setInt(1, winNum[i]);
				pstmt.setInt(2, bonusNum[i]);
				pstmt.executeUpdate();
			}catch (Exception e) {
				e.printStackTrace();
				return -1;
			}
		}
		close();
		return 1;
*/

//		로또 당첨 번호 update 
		try {
			join();
			pstmt = conn.prepareStatement(UPDATE_WIN);
			for(int i=0;i<winNum.length; i++) {
				if(winNum[i] > 0) {
					pstmt.setInt(1, i+1);
					pstmt.executeUpdate();
				}
			}
			pstmt = conn.prepareStatement(UPDATE_BONUS);
			pstmt.setInt(1, bonusNum);
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
		close();
		return 1;
	}
	
	public ArrayList<SaleVO> sale_Select(){
		SaleVO vo;
		ArrayList<SaleVO> list = new ArrayList();
		String SELECT_SALE = "select count(location) count, name, location,type, win_date, win_turn from lotto_sale_test group by location order by 1 desc";
		String SELECT = "select count(*) from lotto_sale_test group by location";
		
		try {
			join();
			pstmt = conn.prepareStatement(SELECT);
			rs = pstmt.executeQuery();
			rs.last();
			int row = rs.getRow();			// 검색 결과 개수
			
			pstmt = conn.prepareStatement(SELECT_SALE);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo =  new SaleVO();
				vo.setCount(rs.getInt("count"));
				vo.setLocation(rs.getString("location"));
				vo.setName(rs.getString("name"));
				vo.setType(rs.getString("type"));
				vo.setWin_date(rs.getDate("win_date"));
				vo.setWin_turn(rs.getInt("win_turn"));
				
				if(list.size() < 1) {
					vo.setGetRow(row);
				}
				
				list.add(vo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		close();
		
		return list;
	}
	
	public ArrayList<countVO> lotto_Select() {
		countVO vo;
		ArrayList<countVO> list = new ArrayList();
		//int [] lotto_win = new int[45];
		//int [] bonus = new int[45];
		//int [] number = new int[45];
		
		
		String SELECT_WIN = "select * from lotto_count_test order by lotto_win desc";
		
		try {
			join();
			pstmt = conn.prepareStatement(SELECT_WIN);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new countVO();
				vo.setLottoNum(rs.getInt("lotto_num"));
				vo.setLottoWin(rs.getInt("lotto_win"));
				vo.setBouns(rs.getInt("bonus"));;
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			
		}
		return list;
	}
	
	public int lotto_sale_insert() {
		String INSERT_SALE = "insert into lotto_sale_test(name, type, location, win_turn, win_date, win_total) values(?, ?, ?, ?, ?, ?)";
		try {
			join();
			pstmt = conn.prepareStatement(INSERT_SALE);
		}catch (Exception e) {
			
		}
		return 1;
	}
	
	public int lotto_win_info_insert(int drwNo, Date drwNoDate, long totSellamnt, long firstAccumamnt) {
		String INSERT_WIN_INFO = "insert into win_info_test(drwNo, drDate, totSellamnt, firstWinamnt) values(?, ?, ?, ?)";
		try {
			join();
			pstmt = conn.prepareStatement(INSERT_WIN_INFO);
			pstmt.setInt(1, drwNo);
			pstmt.setDate(2, drwNoDate);
			pstmt.setLong(3, totSellamnt);
			pstmt.setLong(4, firstAccumamnt);
			
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return 1;
	}
	
	public void close() {
		try {
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void join() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/Lotto?serverTimezone=Asia/Seoul&useSSL=false";
			String dbID = "root";
			String dbPassword = "qwer1321";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}	
}
