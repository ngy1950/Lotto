package lotto.util;
import java.net.URL;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Locale;

public class Main {
	public static void main(String[] args) {
		JdbcConnection jdbc = new JdbcConnection();
		int [] arr = new int[45];
		URL result;
		
		SimpleDateFormat SDate = new SimpleDateFormat("yyyy.mm.dd hh:mm:ss", Locale.KOREA);
		Date current = new Date();
		String CurDate = SDate.format(current);
		System.out.println(CurDate.substring(0,4));
/*
		// 당첨정보 최초 insert
		String turn = "0";
		while(true) {
			try {
				int turn_int = Integer.parseInt(turn) + 1;
				turn = Integer.toString(turn_int);
				result = new URL("https://nlotto.co.kr/common.do?method=getLottoNumber&drwNo=" + turn);

				InputStreamReader isr = new InputStreamReader(result.openConnection().getInputStream(), "UTF-8");

				JSONObject object = (JSONObject) JSONValue.parse(isr);

				if ("success".equals(object.get("returnValue"))) {
					System.out.println("당첨 회차: " +object.get("drwNo"));
					System.out.println("당첨일: " +object.get("drwNoDate"));
					System.out.println("총 판매액: "+object.get("totSellamnt"));		// 총 판매액
					System.out.println("1등 당첨금 총액: "+object.get("firstAccumamnt"));	// 1등 당첨금 총액	
					
					
					int drwNo = Integer.parseInt(object.get("drwNo").toString());
					
					Date drwNoDate = Date.valueOf(object.get("drwNoDate").toString());
					
					Long totSellamnt =   Long.parseLong(object.get("totSellamnt").toString());
					Long firstAccumamnt = Long.parseLong(object.get("firstAccumamnt").toString());
					System.out.println("!!!!!" + drwNoDate);
					jdbc.lotto_win_info_insert(drwNo, drwNoDate, totSellamnt, firstAccumamnt);
					
				} else {
					System.out.println(turn + "회차 로또 정보 읽기를 실패하였습니다.");
					
				}
			} catch (Exception e) {
				System.out.println(turn+"회차 정보가 없습니다.");
				e.printStackTrace();
				break;	
			}
		}
*/	
		
		
		
/*
		// 해당 회차 Update ___ 마지막 회차 업데이트 : 899
		int bonus = 0;
		String turn = "0";
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
*/
	}	
}
