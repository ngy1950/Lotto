<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lotto.util.JdbcConnection"%>
<%@page import="lotto.sale.SaleVO"%>

<%
	JdbcConnection jdbc = new JdbcConnection();
	ArrayList<SaleVO> array = jdbc.sale_Select();

	int nowPageNo = Integer.parseInt(request.getParameter("pageNo"));
	if (nowPageNo < 1) {
		nowPageNo = 1;
	} else if (nowPageNo > (array.get(0).getGetRow() / 10) + 1) {
		nowPageNo = (array.get(0).getGetRow() / 10) + 1;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<script
	src="https://raw.githack.com/creativetimofficial/argon-dashboard/master/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.3.1/css/all.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet">

<!-- Stylesheets -->

<link href="./res/common-css/bootstrap.css" rel="stylesheet">
<link href="./res/common-css/ionicons.css" rel="stylesheet">
<link href="./res/common-css/layerslider.css" rel="stylesheet">
<link href="./res/01-homepage/css/styles.css" rel="stylesheet">
<link href="./res/01-homepage/css/responsive.css" rel="stylesheet">
<link href="./res/01-homepage/css/numberCircle.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<style>
.detail table, th, td {
	border: 1px solid lightgrey;
}

.text-center {
	text-align: center !important;
}

.table {
	width: 100%;
	max-width: 100%;
	margin-bottom: 1rem;
	background-color: transparent;
}

.small, small {
	font-size: 80%;
	font-weight: 400;
}

thead {
	display: table-header-group;
	vertical-align: middle;
	border-color: inherit;
}
</style>
<title>Insert title here</title>

</head>
<body>

	<header>
	<div class="bottom-area" style="background-color: gray;">

		<ul class="main-menu visible-on-click" id="main-menu">
			<li><a href="./index.jsp" style="color: white;">HOME</a></li>
			<li><a href="./makeNumber.jsp" style="color: white;">로또번호
					생성기</a></li>
			<li><a href="./analysis.jsp" style="color: white;">로또 분석</a></li>
			<li><a href="./location.jsp?pageNo=1"
				style="color: black; background-color: white; font-weight: 800;">로또
					1등 판매점</a></li>
			<li><a href="#" style="color: white;">CONTACT</a></li>
		</ul>
		<!-- main-menu -->

	</div>
	<!-- conatiner --> </header>

	<br>
	<br>
	<br>
	<br>


	<div class="col-lg2 col-md-4"></div>
	<div class="col-lg-8 col-md-4">
		<form class="form-inline" action="#" method="POST">
			<div class="col-lg-8 col-md-4">
			<center>
				<select class="form-control">
					<option>주소</option>
					<option>회차</option>
				</select>

				<div class="input-group custom-search-form">
					<input type="text" class="form-control" placeholder="Search...">
					<a class="btn caegory-btn">검색</a>
				</div>
			</center>
			</div>	
		</form>
		
	</div>
<br><br><br>

	<div class="col-lg-2 col-md-4"></div>
	<div class="col-lg-8 col-md-4">
		<table class="table detail">
			<thead>
				<tr
					style="text-align: center; border: 1px solid lightgrey; background-color: #e9e9e9; font-weight: bolder;">
					<td>회차</td>
					<td>상호명</td>
					<td>소재지</td>
					<td>누적 당첨 횟수</td>

				</tr>
			</thead>
			<tbody style="text-align: center;">
				<%
					for (int i = (nowPageNo - 1) * 10; i <= (nowPageNo * 10) - 1; i++) {
						if (i < array.size()) {
							System.out.println("array.size(): " + array.size());
							System.out.println("i: " + i);
							System.out.println("nowPageNo: " + nowPageNo);
				%>
				<tr>
					<td style="font-weight: bold; color: #007bff;"><%=array.get(i).getWin_turn()%></td>
					<td><%=array.get(i).getName()%></td>
					<td><%=array.get(i).getLocation()%></td>
					<td><span style="color: red;"><%=array.get(i).getCount()%></span></td>
				</tr>
				<%
					}
					}
				%>
			</tbody>
		</table>
	</div>

	<div class="col-lg-12 col-md-12">
		<center>
			<a class="btn caegory-btn"
				href="location.jsp?pageNo=<%=nowPageNo - 1%>">
				<div class="glyphicon glyphicon-chevron-left"></div>
			</a>&nbsp;&nbsp;&nbsp; <strong style="font-size: 1.0em"><%=nowPageNo%>
				/ <%=(array.get(0).getGetRow() / 10) + 1%></strong>&nbsp;&nbsp;&nbsp; <a
				class="btn caegory-btn"
				href="location.jsp?pageNo=<%=nowPageNo + 1%>">
				<div class="glyphicon glyphicon-chevron-right"></div>
			</a>
		</center>
	</div>




	<!--===============================================================================================-->
	<script src="./res/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="./res/vendor/bootstrap/js/popper.js"></script>
	<script src="./res/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="./res/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="./res/js/main.js"></script>
</body>
</html>