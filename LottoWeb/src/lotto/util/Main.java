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
		// ��÷���� ���� insert
		String turn = "0";
		while(true) {
			try {
				int turn_int = Integer.parseInt(turn) + 1;
				turn = Integer.toString(turn_int);
				result = new URL("https://nlotto.co.kr/common.do?method=getLottoNumber&drwNo=" + turn);

				InputStreamReader isr = new InputStreamReader(result.openConnection().getInputStream(), "UTF-8");

				JSONObject object = (JSONObject) JSONValue.parse(isr);

				if ("success".equals(object.get("returnValue"))) {
					System.out.println("��÷ ȸ��: " +object.get("drwNo"));
					System.out.println("��÷��: " +object.get("drwNoDate"));
					System.out.println("�� �Ǹž�: "+object.get("totSellamnt"));		// �� �Ǹž�
					System.out.println("1�� ��÷�� �Ѿ�: "+object.get("firstAccumamnt"));	// 1�� ��÷�� �Ѿ�	
					
					
					int drwNo = Integer.parseInt(object.get("drwNo").toString());
					
					Date drwNoDate = Date.valueOf(object.get("drwNoDate").toString());
					
					Long totSellamnt =   Long.parseLong(object.get("totSellamnt").toString());
					Long firstAccumamnt = Long.parseLong(object.get("firstAccumamnt").toString());
					System.out.println("!!!!!" + drwNoDate);
					jdbc.lotto_win_info_insert(drwNo, drwNoDate, totSellamnt, firstAccumamnt);
					
				} else {
					System.out.println(turn + "ȸ�� �ζ� ���� �б⸦ �����Ͽ����ϴ�.");
					
				}
			} catch (Exception e) {
				System.out.println(turn+"ȸ�� ������ �����ϴ�.");
				e.printStackTrace();
				break;	
			}
		}
*/	
		
		
		
/*
		// �ش� ȸ�� Update ___ ������ ȸ�� ������Ʈ : 899
		int bonus = 0;
		String turn = "0";
		try {
			result = new URL("https://nlotto.co.kr/common.do?method=getLottoNumber&drwNo=" + turn);
			
			InputStreamReader isr = new InputStreamReader(result.openConnection().getInputStream(), "UTF-8");
			
			JSONObject object = (JSONObject)JSONValue.parse(isr);
			
			if("success".equals(object.get("returnValue"))) {
				System.out.println(turn+"ȸ �ζ� ��÷��ȣ");
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
				System.out.println(turn + "ȸ�� �ζ� ���� �б⸦ �����Ͽ����ϴ�.");
			}	
		}catch (Exception e) {
			e.printStackTrace();
		}	
		
		System.out.println("-----------------------------------------");
		System.out.println();
		for(int i=1;i<=45;i++) {
			System.out.print(i+ ": " +arr[i-1] + "��  ");
			if(i%4 == 0)
				System.out.println();
		}
		if(jdbc.lotto_Insert(arr, bonus) > 0) {
			System.out.println("DB�۾� ����!");
		}else {
			System.out.println("DB�۾� ����");
		}
*/
		
/*		
 		//1ȸ�� ~ ũ�Ѹ� ������ ã��
		int [] bonus = new int[45];
		String turn = "0";
 			try {
				int turn_int = Integer.parseInt(turn) + 1; 
				turn = Integer.toString(turn_int);
				result = new URL("https://nlotto.co.kr/common.do?method=getLottoNumber&drwNo=" + turn);
				
				InputStreamReader isr = new InputStreamReader(result.openConnection().getInputStream(), "UTF-8");
				
				JSONObject object = (JSONObject)JSONValue.parse(isr);
				
				if("success".equals(object.get("returnValue"))) {
					System.out.println(turn+"ȸ �ζ� ��÷��ȣ");
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
							System.out.println(" (���ʽ�: + " + object.get("bnusNo") + ")");
							bonus[j-1] += 1;
 						}
						
					}
					
				}else {
					System.out.println(turn + "ȸ�� �ζ� ���� �б⸦ �����Ͽ����ϴ�.");
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
					System.out.println(turn+"ȸ �ζ� ��÷��ȣ");
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
							System.out.println(" (���ʽ�: + " + object.get("bnusNo") + ")");
							bonus[j-1] += 1;
 						}
						
					}
					
				}else {
					System.out.println(turn + "ȸ�� �ζ� ���� �б⸦ �����Ͽ����ϴ�.");
					break;
				}
			}catch (Exception e) {
				e.printStackTrace();
			}	
		}

		System.out.println("-----------------------------------------");
		System.out.println();
		for(int i=1;i<=45;i++) {
			System.out.print(i+ ": " +arr[i-1] + "��  ");
			if(i%4 == 0)
				System.out.println();
		}
		System.out.println();
		System.out.println("----------------- ���ʽ�----------------------");
		System.out.println();
		for(int i=1;i<=45;i++) {
			System.out.print(i+ ": " +bonus[i-1] + "��  ");
			if(i%4 == 0)
				System.out.println();
		}
		if(jdbc.lotto_Insert(arr, bonus) > 0) {
			System.out.println("DB�۾� ����!");
		}else {
			System.out.println("DB�۾� ����");
		}
*/
	}	
}
