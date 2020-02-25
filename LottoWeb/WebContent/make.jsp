<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script>
function make() {
	/*
	 *	선택 번호 제외하고 번호표 뽑기	
	*/
	var lotto_ban = new Array(45);
	var array = new Array();
	for(i=0;i<45;i++){
		lotto_ban[i] = 0;
	}
	
	$("input[name=1]:checked").each(function() {
		console.log($(this).val());
		lotto_ban[$(this).val()] = 1;
	});
	
	for(var i=0; i<6;i++){
		number = parseInt(Math.random() * 45 + 1);
		array.push(number);
		if(lotto_ban[number] == 0){
			for(var j=0; j<i; j++){
				if(array[i] == array[j]){
					array.pop();
					i--;
				}
			}
		}else{
			array.pop();
			i--;
		}
	}
	console.log(array.sort());
	
	
/*
	var array = new Array();
	
	for(var i=0; i<6;i++){
		number = parseInt(Math.random() * 6 + 1);
		array.push(number);
		for(var j=0; j<i; j++){
			if(array[i] == array[j]){
				array.pop();
				i--;
			}
		}
	}
	array.sort();
	console.log(array);
*/
}
</script>
</head>
<body>
	<input type="checkbox" value="1" id="1" name="1">
	<input type="checkbox" value="2" id="2" name="1">
	<input type="checkbox" value="3" id="3" name="1">
	<input type="checkbox" value="4" id="5" name="1">
			
	<button onclick="make()">번호 생성</button>
</body>
</html>