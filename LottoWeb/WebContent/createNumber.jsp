<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="lotto.makeNumber.makeNumberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lotto.util.JdbcConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%
	JdbcConnection jdbc = new JdbcConnection();
	//ArrayList<makeNumberVO> array = jdbc.sale_Select();

	int no0 = Integer.parseInt(request.getParameter("no0"));
	int no1 = Integer.parseInt(request.getParameter("no1"));
	int no2 = Integer.parseInt(request.getParameter("no2"));
	int no3 = Integer.parseInt(request.getParameter("no3"));
	int no4 = Integer.parseInt(request.getParameter("no4"));
	int no5 = Integer.parseInt(request.getParameter("no5"));
	
	if (no0 != 0 && no1 != 0 && no2 != 0 && no3 != 0 && no4 != 0 && no5 != 0) {
		jdbc.makeNumber(no0, no1, no2, no3, no4, no5);
	}
%>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
<script>
function run() {
	
}
</script>
</head>
<body onload="run();"> 

</body>
</html>