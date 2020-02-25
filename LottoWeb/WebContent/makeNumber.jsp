<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">
<link href="./res/common-css/bootstrap.css" rel="stylesheet">
<link href="./res/common-css/ionicons.css" rel="stylesheet">
<link href="./res/common-css/layerslider.css" rel="stylesheet">
<link href="./res/01-homepage/css/styles.css" rel="stylesheet">
<link href="./res/01-homepage/css/responsive.css" rel="stylesheet">
<link href="./res/01-homepage/css/numberCircle.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.text-style {
	color: #f8f9fa !important;
	padding-top: 15px;
}

.numberCircle {
	border-radius: 50%;
	width: 52px;
	height: 52px;
	border: 2px solid;
	text-align: center;
	font: 14px Arial, sans-serif;
}

strong {
	font-size: large;
}

.yellow {
	margin-bottom: 40px;
	margin-top: 30px;
}

.blue {
	margin-bottom: 40px;
}

.red {
	margin-bottom: 40px;
}

.grey {
	margin-bottom: 40px;
}

.green {
	margin-bottom: 40px;
}

.number-wrap {
	margin-left: 23px;
	padding-top: 4px;
}

.title {
	text-align: center;
	font-size: x-large;
	margin-top: 40px;
}
/* makeNumber*/
.number-box{
   width: 100%;
    height: 500px;
    margin-top: 30px;
    border: 1px;
    background-color: #99999929;
    border-radius: 10px;
    box-shadow: 0px 60px 100px -90px #000000, 60px 0px 100px -90px #000000;
    border-color:#fffdfd;
}
.result-box{
	width: 100%;
    height: 80px;
    border: 1px solid;
    border-radius: 10px;
    margin-top: 80px;
	background-color: #99999929;
	border-color:#333;
}
</style>


</head>
<body>

<header>

		<div class="top-menu">
<!--  
			<ul class="left-area welcome-area">
				<li class="hello-blog">Hello nice people, welcome to my blog</li>
				<li><a href="mailto:contact@juliblog.com">contact@juliblog.com</a></li>
			</ul>

			<div class="right-area">
				<div class="src-area">
					<form action="post">
						<input class="src-input" type="text" placeholder="Search">
						<button class="src-btn" type="submit"><i class="ion-ios-search-strong"></i></button>
					</form>
				</div>


				<ul class="social-icons">
					<li><a href="#"><i class="ion-social-facebook-outline"></i></a></li>
					<li><a href="#"><i class="ion-social-twitter-outline"></i></a></li>
					<li><a href="#"><i class="ion-social-instagram-outline"></i></a></li>
					<li><a href="#"><i class="ion-social-vimeo-outline"></i></a></li>
					<li><a href="#"><i class="ion-social-pinterest-outline"></i></a></li>
				</ul><

			</div>
-->
		</div>
<!--  
		<div class="middle-menu center-text"><a href="#" class="logo"><img src="./res/images/logo.png" alt="Logo Image"></a></div>
-->
		<div class="bottom-area" style="background-color: gray;">

			<div class="menu-nav-icon" data-nav-menu="#main-menu"><i class="ion-navicon"></i></div>

			<ul class="main-menu visible-on-click" id="main-menu">
				<li><a href="./index.jsp"style="color: white;">HOME</a></li>
				<li><a href="./makeNumber.jsp" style="color: black; background-color: white; font-weight:800;">로또번호 생성기</a></li>
				<li><a href="./analysis.jsp" style="color: white;">로또 분석</a></li>
				<li><a href="#" style="color: white;">로또 1등 판매점</a></li>
				<li><a href="#" style="color: white;">CONTACT</a></li>
			</ul><!-- main-menu -->

		</div><!-- conatiner -->
	</header>	
	
	<section class="section blog-area">
	<div class="container" style="height: 1000px; width: 1100px;">
		<div class="title">
			<b><span style="">제외할 번호</span>를 클릭해주세요.</b>
		</div>
		<div class="number-box" id="numbox">
			<div class="number-wrap">
				<div class="yellow">
					<% 		int ball[] = new int[45];
			for (int i = 1; i <= ball.length; i++) { %>
					<% if(i>=1 && i<11){ %>
					<input type="checkbox" name="check" value="check" /><%=i%>
					<div
						class="d-inline-block numberCircle border-warning bg-warning text-style"
						style="margin: 0px 10px 0px 12px;">
						<strong><%=i%></strong>
					</div>
					<% }else{
							break;
						}
					}%>
				</div>

				<div class="blue">
					<%
			for (int j = 11; j <= ball.length; j++) { %>
					<% if(j>=11 && j<21){ %>
					<input type="checkbox" name="check" value="check" /><%=j%>
					<div
						class="d-inline-block numberCircle border-primary bg-primary text-style"
						style="margin: 0px 7px 0px 7px;">
						<strong><%=j%></strong>
					</div>
					<% }else{
							break;
							}
					}%>
				</div>

				<div class="red">
					<% 	
			for (int k = 21; k <= ball.length; k++) { %>
					<% if(k>=21 && k<31){ %>
					<input type="checkbox" name="check" value="check" /><%=k%>
					<div
						class="d-inline-block numberCircle border-danger bg-danger text-style"
						style="margin: 0px 7px 0px 7px;">
						<strong><%=k%></strong>
					</div>
					<% }else{
							break;
							}
					}%>
				</div>
				<div class="grey">
					<% 	
			for (int l = 31; l <= ball.length; l++) { %>
					<% if(l>=31 && l<41){ %>
					<input type="checkbox" name="check" value="check" /><%=l%>
					<div
						class="d-inline-block numberCircle border-secondary bg-secondary text-style"
						style="margin: 0px 7px 0px 7px;">
						<strong><%=l%></strong>
					</div>
					<% }else{
							break;
							}
					}%>
				</div>
				<div class="green">
					<% 
			for (int m = 41; m <= ball.length; m++) { %>
					<% if(m>=41){ %>
					<input type="checkbox" name="check" value="check" /><%=m%>
					<div class="d-inline-block numberCircle text-style"
						style="background: #29b72c; border-color: #29b72c; margin: 0px 7px 0px 7px;">
						<strong><%=m%></strong>
					</div>
					<% }else{
							break;
							}
					}%>
				</div>
			</div>
		</div>
		<a class="btn caegory-btn" href="#"
			style="background-color: #31708fcf; width: 100%; border: none; margin-top: 80px;">
			<span style="color: white;">로또번호 생성하기</span>
		</a>

		<div class="result-box"></div>

	</div>
	</section>
	
</body>
</html>