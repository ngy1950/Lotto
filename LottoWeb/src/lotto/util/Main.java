package lotto.util;
import java.io.InputStreamReader;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

public class Main {
	public static void main(String[] args) {
		JdbcConnection jdbc = new JdbcConnection();
		int [] arr = new int[45];
		URL result;
		
		SimpleDateFormat SDate = new SimpleDateFormat("yyyy.mm.dd hh:mm:ss", Locale.KOREA);
		Date current = new Date();
		String CurDate = SDate.format(current);
		System.out.println(CurDate.substring(0,4));
		
		// 1회차 ~ INSERT
		int [] bonus = new int[45];
		String turn = "0";
		while(true) {
			try {
				int turn_int = Integer.parseInt(turn) + 1; 
				turn = Integer.toString(turn_int);
				result = new URL("https://nlotto.co.kr/common.do?method=getLottoNumber&drwNo=" + turn);
				
				InputStreamReader isr = new InputStreamReader(result.openConnection().getInputStream(), "UTF-8");
				
				JSONObject object = (JSONObject)JSONValue.parse(isr);
				
				if("success".equals(object.get("returnValue"))) {
					System.out.println(turn+"회 로또 당첨번호");
					for(int i=1;i<=6;i++) {
						int target = Integer.parseInt(object.get("drwtNo" + i).toString());
						for(int j=1;j<=45;j++) {
							if(j == target) {
								System.out.print(target + " ");
								arr[j-1] += 1;
							}
						}
					}
					int target = Integer.parseInt(object.get("bnusNo").toString());
					for(int j=1;j<=45;j++) {
						if(j == target) {
							System.out.println(" (보너스: + " + object.get("bnusNo") + ")");
							bonus[j-1] += 1;
 						}
						
					}
					
				}else {
					System.out.println(turn + "회차 로또 정보 읽기를 실패하였습니다.");
					break;
				}
			}catch (Exception e) {
				e.printStackTrace();
			}	
		}

		System.out.println("-----------------------------------------");
		System.out.println();
		for(int i=1;i<=45;i++) {
			System.out.print(i+ ": " +arr[i-1] + "번  ");
			if(i%4 == 0)
				System.out.println();
		}
		System.out.println();
		System.out.println("----------------- 보너스----------------------");
		System.out.println();
		for(int i=1;i<=45;i++) {
			System.out.print(i+ ": " +bonus[i-1] + "번  ");
			if(i%4 == 0)
				System.out.println();
		}
		if(jdbc.lotto_Insert(arr, bonus) > 0) {
			System.out.println("DB작업 성공!");
		}else {
			System.out.println("DB작업 실패");
		}
		
		
		
/*
		// 해당 회차 Update ___ 마지막 회차 업데이트 : 907회 다음 908회차부터
		int bonus = 0;
		String turn = "0";
		while(true){
			try {
				result = new URL("https://nlotto.co.kr/common.do?method=getLottoNumber&drwNo=" + turn);
				
				InputStreamReader isr = new InputStreamReader(result.openConnection().getInputStream(), "UTF-8");
				
				JSONObject object = (JSONObject)JSONValue.parse(isr);
				
				if("success".equals(object.get("returnValue"))) {
					System.out.println(turn+"회 로또 당첨번호");
					for(int i=1;i<=6;i++) {
						int target = Integer.parseInt(object.get("drwtNo" + i).toString());
						for(int j=1;j<=45;j++) {
							if(j == target) {
								System.out.print(target + " ");
								arr[j-1] += 1;	
							}
						}
					}
					bonus = Integer.parseInt(object.get("bnusNo").toString());
					System.out.println("--- ("+bonus+")");
					
				}else {
					System.out.println(turn + "회차 로또 정보 읽기를 실패하였습니다.");
				}	
			}catch (Exception e) {
				e.printStackTrace();
			}	
			
			System.out.println("-----------------------------------------");
			System.out.println();
			for(int i=1;i<=45;i++) {
				System.out.print(i+ ": " +arr[i-1] + "번  ");
				if(i%4 == 0)
					System.out.println();
			}
			if(jdbc.lotto_Insert(arr, bonus) > 0) {
				System.out.println("DB작업 성공!");
			}else {
				System.out.println("DB작업 실패");
			}	
		}
*/		

		
/*		
 		//1회차 ~ 크롤링 데이터 찾기
		int [] bonus = new int[45];
		String turn = "0";
 			try {
				int turn_int = Integer.parseInt(turn) + 1; 
				turn = Integer.toString(turn_int);
				result = new URL("https://nlotto.co.kr/common.do?method=getLottoNumber&drwNo=" + turn);
				
				InputStreamReader isr = new InputStreamReader(result.openConnection().getInputStream(), "UTF-8");
				
				JSONObject object = (JSONObject)JSONValue.parse(isr);
				
				if("success".equals(object.get("returnValue"))) {
					System.out.println(turn+"회 로또 당첨번호");
					for(int i=1;i<=6;i++) {
						int target = Integer.parseInt(object.get("drwtNo" + i).toString());
						for(int j=1;j<=45;j++) {
							if(j == target) {
								System.out.print(target + " ");
								arr[j-1] += 1;
							}
						}
					}
					int target = Integer.parseInt(object.get("bnusNo").toString());
					for(int j=1;j<=45;j++) {
						if(j == target) {
							System.out.println(" (보너스: + " + object.get("bnusNo") + ")");
							bonus[j-1] += 1;
 						}
						
					}
					
				}else {
					System.out.println(turn + "회차 로또 정보 읽기를 실패하였습니다.");
				}
			}catch (Exception e) {
				e.printStackTrace();
			}	
		
*/
	}	
}
