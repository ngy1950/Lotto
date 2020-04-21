<%@page import="lotto.makeNumber.makeNumberVO"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lotto.util.JdbcConnection"%>
<%@page import="lotto.count.CountMstVO" %>
<jsp:useBean id="jdbcConnection" class="lotto.util.JdbcConnection" scope="page" />
<jsp:useBean id="countVO" class="lotto.count.CountMstVO" />
<%
	
	ArrayList<CountMstVO> list = jdbcConnection.lotto_Select();
	SimpleDateFormat SDate = new SimpleDateFormat("yyyy.mm.dd hh:mm:ss", Locale.KOREA);
	Date current = new Date();
	String CurDate = SDate.format(current);
	CurDate = CurDate.substring(0,4);
	
	int nowPageNo = Integer.parseInt(request.getParameter("pageNo"));
	ArrayList<makeNumberVO> make_list = jdbcConnection.lotto_Select_makeNumber(nowPageNo);
	
%>
<html>
<head>
<script>

	

	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">

<!-- Stylesheets -->

<link href="./res/common-css/bootstrap.css" rel="stylesheet">
<link href="./res/common-css/ionicons.css" rel="stylesheet">
<link href="./res/common-css/layerslider.css" rel="stylesheet">
<link href="./res/01-homepage/css/styles.css" rel="stylesheet">
<link href="./res/01-homepage/css/responsive.css" rel="stylesheet">
<link href="./res/01-homepage/css/numberCircle.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

</head>
<body>

<header>
		<div class="bottom-area" style="background-color: gray;">

			<div class="menu-nav-icon" data-nav-menu="#main-menu"><i class="ion-navicon"></i></div>

			<ul class="main-menu visible-on-click" id="main-menu">
				<li><a href="./index.jsp?"style="color: black; background-color: white; font-weight:800;">HOME</a></li>
				<li><a href="./makeNumber.jsp" style="color: white;">로또번호 생성기</a></li>
				<li><a href="./analysis.jsp?CurDate=<%=CurDate%>" style="color: white;">로또 분석</a></li>
				<li><a href="./location.jsp?pageNo=1" style="color: white;">로또 1등 판매점</a></li>
				<li><a href="#" style="color: white;">money</a></li>
			</ul><!-- main-menu -->

		</div><!-- conatiner -->
</header>	

<section class="section blog-area">
		<div class="col-lg-12 col-md-4">

		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-1 col-md-4"></div>
				
				<div class="col-lg-10 col-md-4">
					
					<div class="col-md-5"></div>.
				
				
					<div class="blog-posts">
						<canvas id="canvas"></canvas>
						
						<br>
						<center><a class="btn caegory-btn" href="./analysis.jsp"><b>분석보기</b></a></center>
						<h4 class="h1-sub mt-3"><strong>로또생성기 생성내역</strong></h4>

						<hr>
						<div class="row">
									<%
					for (int i = 0; i <= list.size(); i++) {
						if (i < make_list.size()) {
							System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!\n"+make_list.size());
							int [] arr = new int[6];
							arr[0] = make_list.get(i).getNum1();
							arr[1] = make_list.get(i).getNum2();
							arr[2] = make_list.get(i).getNum3();
							arr[3] = make_list.get(i).getNum4();
							arr[4] = make_list.get(i).getNum5();
							arr[5] = make_list.get(i).getNum6();
				%>
						
							<div class="col-lg-6 col-md-12">
								<div class="card text-center mt-2 mb-2">
									<div class="card-body mx-auto clearfix px-0 py-2">
									<div class="d-inline-block small mr-1">
											<strong>878회</strong>
										</div>
									<%
									for(int j=0;j<6;j++){
										int num = arr[j];										
									%>
										
			  	<% 			  	
			  			if(arr[j] <=10){
			  	%>
							<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong style="color: white;"><%=arr[j]%></strong></div>
				<%
						}else if(arr[j] >10 && arr[j] <= 20){
				%>
							<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong style="color: white;"><%=arr[j]%></strong></div>
				<%		
						}else if(arr[j] > 20 && arr[j] <= 30){
				%>
							<div class="d-inline-block numberCircle border-danger bg-danger text-style"><strong style="color: white;"><%=arr[j]%></strong></div>										
				<%		
						}else if(arr[j] > 30 && arr[j] <= 40){
				%>
							<div class="d-inline-block numberCircle border-secondary bg-secondary text-style"><strong style="color: white;"><%=arr[j]%></strong></div>				
				<%
						}else{
				%>
							<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong style="color: white;"><%=arr[j]%></strong></div>				
				<%
					}}
			  	%>			
										<div class="col-md-12" style="font-size: 1.1em">
											<div class="small text-muted mt-1" >
												guest: 
												<div class="glyphicon glyphicon-time"></div>
											 	<%=make_list.get(i).getDate()%>
											</div>
											
										</div>												
									</div>
								</div>
							</div>
				<%}} %>	
					
							<div class="col-lg-12 col-md-12">
							
								<center>
								<%if(nowPageNo>1){ %>
									<a class="btn caegory-btn" href="./index.jsp?pageNo=<%=nowPageNo-1%>">
										<div class="glyphicon glyphicon-chevron-left"></div>
									</a>&nbsp;&nbsp;&nbsp;
								<%}else{%>
									<a class="btn caegory-btn" href="./index.jsp?pageNo=<%=nowPageNo%>">
										<div class="glyphicon glyphicon-chevron-left"></div>
									</a>&nbsp;&nbsp;&nbsp;	
								<%} %>
									<strong style="font-size: 1.0em"><%=nowPageNo%></strong>&nbsp;&nbsp;&nbsp; 
									<a class="btn caegory-btn" href="./index.jsp?pageNo=<%=nowPageNo+1%>">
										<div class="glyphicon glyphicon-chevron-right"></div>
									</a>
								</center>
								<div class="col-lg-12 col-md-12">
								<br>
									<center>
										<a class="btn caegory-btn" href="#" style="background-color: blue; width: 100%;">
										<span style="color: white;">로또번호 생성하기</span>
										</a>
									</center>
								</div>
							</div>							
					</div>
					<br><br>
					<h4 class="h1-sub mt-3"><strong>로또생성기 당첨내역</strong></h4>
					<hr>
					
					<div class="row">
						
							<div class="col-lg-6 col-md-12">
								<div class="card text-center mt-2 mb-2">
									<div class="card-body mx-auto clearfix px-0 py-2">
										<div class="d-inline-block small mr-1">
											<strong>878회</strong>
										</div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>5</strong></div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>7</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>9</strong></div>
										<div class="d-inline-block numberCircle border-danger bg-danger text-light"><strong>12</strong></div>
										<div class="d-inline-block numberCircle border-secondary bg-secondary text-light"><strong>15</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>23</strong></div>
										<div class="col-md-12" style="font-size: 1.1em">
											<div class="small text-muted mt-1" >
												guest: 
												<div class="glyphicon glyphicon-time"></div>
											 	2020.02.11 15:01:17
											</div>
											
										</div>												
									</div>
								</div>
							</div>
							
							<div class="col-lg-6 col-md-12">
								<div class="card text-center mt-2 mb-2">
									<div class="card-body mx-auto clearfix px-0 py-2">
										<div class="d-inline-block small mr-1">
											<strong>878회</strong>
										</div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>5</strong></div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>7</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>9</strong></div>
										<div class="d-inline-block numberCircle border-danger bg-danger text-light"><strong>12</strong></div>
										<div class="d-inline-block numberCircle border-secondary bg-secondary text-light"><strong>15</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>23</strong></div>
										<div class="col-md-12" style="font-size: 1.1em">
											<div class="small text-muted mt-1" >
												guest: 
												<div class="glyphicon glyphicon-time"></div>
											 	2020.02.11 15:01:17
											</div>
											
										</div>												
									</div>
								</div>
							</div>
							
							<div class="col-lg-6 col-md-12">
								<div class="card text-center mt-2 mb-2">
									<div class="card-body mx-auto clearfix px-0 py-2">
										<div class="d-inline-block small mr-1">
											<strong>878회</strong>
										</div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>5</strong></div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>7</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>9</strong></div>
										<div class="d-inline-block numberCircle border-danger bg-danger text-light"><strong>12</strong></div>
										<div class="d-inline-block numberCircle border-secondary bg-secondary text-light"><strong>15</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>23</strong></div>
										<div class="col-md-12" style="font-size: 1.1em">
											<div class="small text-muted mt-1" >
												guest: 
												<div class="glyphicon glyphicon-time"></div>
											 	2020.02.11 15:01:17
											</div>
											
										</div>												
									</div>
								</div>
							</div>
							
							<div class="col-lg-6 col-md-12">
								<div class="card text-center mt-2 mb-2">
									<div class="card-body mx-auto clearfix px-0 py-2">
										<div class="d-inline-block small mr-1">
											<strong>878회</strong>
										</div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>5</strong></div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>7</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>9</strong></div>
										<div class="d-inline-block numberCircle border-danger bg-danger text-light"><strong>12</strong></div>
										<div class="d-inline-block numberCircle border-secondary bg-secondary text-light"><strong>15</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>23</strong></div>	
										<div class="col-md-12" style="font-size: 1.1em">
											<div class="small text-muted mt-1" >
												guest: 
												<div class="glyphicon glyphicon-time"></div>
											 	2020.02.11 15:01:17
											</div>
											
										</div>											
									</div>
								</div>
							</div>
							
							<div class="col-lg-6 col-md-12">
								<div class="card text-center mt-2 mb-2">
									<div class="card-body mx-auto clearfix px-0 py-2">
										<div class="d-inline-block small mr-1">
											<strong>878회</strong>
										</div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>5</strong></div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>7</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>9</strong></div>
										<div class="d-inline-block numberCircle border-danger bg-danger text-light"><strong>12</strong></div>
										<div class="d-inline-block numberCircle border-secondary bg-secondary text-light"><strong>15</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>23</strong></div>	
										<div class="col-md-12" style="font-size: 1.1em">
											<div class="small text-muted mt-1" >
												guest: 
												<div class="glyphicon glyphicon-time"></div>
											 	2020.02.11 15:01:17
											</div>
											
										</div>											
									</div>
								</div>
							</div>
							
							<div class="col-lg-6 col-md-12">
								<div class="card text-center mt-2 mb-2">
									<div class="card-body mx-auto clearfix px-0 py-2">
										<div class="d-inline-block small mr-1">
											<strong>878회</strong>
										</div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>5</strong></div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>7</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>9</strong></div>
										<div class="d-inline-block numberCircle border-danger bg-danger text-light"><strong>12</strong></div>
										<div class="d-inline-block numberCircle border-secondary bg-secondary text-light"><strong>15</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>23</strong></div>	
										<div class="col-md-12" style="font-size: 1.1em">
											<div class="small text-muted mt-1" >
												guest: 
												<div class="glyphicon glyphicon-time"></div>
											 	2020.02.11 15:01:17
											</div>
											
										</div>											
									</div>
								</div>
							</div>
							
							<div class="col-lg-6 col-md-12">
								<div class="card text-center mt-2 mb-2">
									<div class="card-body mx-auto clearfix px-0 py-2">
										<div class="d-inline-block small mr-1">
											<strong>878회</strong>
										</div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>5</strong></div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>7</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>9</strong></div>
										<div class="d-inline-block numberCircle border-danger bg-danger text-light"><strong>12</strong></div>
										<div class="d-inline-block numberCircle border-secondary bg-secondary text-light"><strong>15</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>23</strong></div>	
										<div class="col-md-12" style="font-size: 1.1em">
											<div class="small text-muted mt-1" >
												guest: 
												<div class="glyphicon glyphicon-time"></div>
											 	2020.02.11 15:01:17
											</div>
											
										</div>											
									</div>
								</div>
							</div>
							
							<div class="col-lg-6 col-md-12">
								<div class="card text-center mt-2 mb-2">
									<div class="card-body mx-auto clearfix px-0 py-2">
										<div class="d-inline-block small mr-1">
											<strong>878회</strong>
										</div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>5</strong></div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>7</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>9</strong></div>
										<div class="d-inline-block numberCircle border-danger bg-danger text-light"><strong>12</strong></div>
										<div class="d-inline-block numberCircle border-secondary bg-secondary text-light"><strong>15</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>23</strong></div>	
										<div class="col-md-12" style="font-size: 1.1em">
											<div class="small text-muted mt-1" >
												guest: 
												<div class="glyphicon glyphicon-time"></div>
											 	2020.02.11 15:01:17
											</div>
											
										</div>										
									</div>
								</div>
							</div>
							
							<div class="col-lg-6 col-md-12">
								<div class="card text-center mt-2 mb-2">
									<div class="card-body mx-auto clearfix px-0 py-2">
										<div class="d-inline-block small mr-1">
											<strong>878회</strong>
										</div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>5</strong></div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>7</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>9</strong></div>
										<div class="d-inline-block numberCircle border-danger bg-danger text-light"><strong>12</strong></div>
										<div class="d-inline-block numberCircle border-secondary bg-secondary text-light"><strong>15</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>23</strong></div>	
										<div class="col-md-12" style="font-size: 1.1em">
											<div class="small text-muted mt-1" >
												guest: 
												<div class="glyphicon glyphicon-time"></div>
											 	2020.02.11 15:01:17
											</div>
											
										</div>											
									</div>
								</div>
							</div>
							
							<div class="col-lg-6 col-md-12">
								<div class="card text-center mt-2 mb-2">
									<div class="card-body mx-auto clearfix px-0 py-2">
										<div class="d-inline-block small mr-1">
											<strong>878회</strong>
										</div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>5</strong></div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>7</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>9</strong></div>
										<div class="d-inline-block numberCircle border-danger bg-danger text-light"><strong>12</strong></div>
										<div class="d-inline-block numberCircle border-secondary bg-secondary text-light"><strong>15</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>23</strong></div>	
										<div class="col-md-12" style="font-size: 1.1em">
											<div class="small text-muted mt-1" >
												guest: 
												<div class="glyphicon glyphicon-time"></div>
											 	2020.02.11 15:01:17
											</div>
											
										</div>											
									</div>
								</div>
							</div>
							
							<div class="col-lg-6 col-md-12">
								<div class="card text-center mt-2 mb-2">
									<div class="card-body mx-auto clearfix px-0 py-2">
										<div class="d-inline-block small mr-1">
											<strong>878회</strong>
										</div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>5</strong></div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>7</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>9</strong></div>
										<div class="d-inline-block numberCircle border-danger bg-danger text-light"><strong>12</strong></div>
										<div class="d-inline-block numberCircle border-secondary bg-secondary text-light"><strong>15</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>23</strong></div>
										<div class="col-md-12" style="font-size: 1.1em">
											<div class="small text-muted mt-1" >
												guest: 
												<div class="glyphicon glyphicon-time"></div>
											 	2020.02.11 15:01:17
											</div>
											
										</div>												
									</div>
								</div>
							</div>
							
							<div class="col-lg-6 col-md-12">
								<div class="card text-center mt-2 mb-2">
									<div class="card-body mx-auto clearfix px-0 py-2">
										<div class="d-inline-block small mr-1">
											<strong>878회</strong>
										</div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>5</strong></div>
										<div class="d-inline-block numberCircle border-warning bg-warning text-light"><strong>7</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>9</strong></div>
										<div class="d-inline-block numberCircle border-danger bg-danger text-light"><strong>12</strong></div>
										<div class="d-inline-block numberCircle border-secondary bg-secondary text-light"><strong>15</strong></div>
										<div class="d-inline-block numberCircle border-primary bg-primary text-light"><strong>23</strong></div>	
										<div class="col-md-12" style="font-size: 1.1em">
											<div class="small text-muted mt-1" >
												guest: 
												<div class="glyphicon glyphicon-time"></div>
											 	2020.02.11 15:01:17
											</div>
											
										</div>											
									</div>
								</div>
							</div>	
				</div>
				</div>
			</div>
		</div>
		
	</section>

<script>
var ctx = document.getElementById('canvas').getContext('2d');
var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'horizontalBar',

    // The data for our dataset
    data: {
        labels: [ 
        		<%for(int i=0;i<12;i++){%>
        			<%= list.get(i).getLottoNum()%>
        			<%if(i<11){%>
        				,
        			<%}%>
        		<%}%>
        		
        		
        		
        ],
        datasets: [{
            label: '역대 번호 당첨 횟수',
            backgroundColor: [
            	<%for(int i=0;i<12;i++){%>
    			<% if(list.get(i).getLottoNum()<=10){%>
    				'#ffc107'
    			<%}else if(list.get(i).getLottoNum()>10 && list.get(i).getLottoNum()<=20){%>
    				'#007bff'
    			<%}else if(list.get(i).getLottoNum()>20 && list.get(i).getLottoNum()<=30){%>
    				'#dc3545'
    			<%}else if(list.get(i).getLottoNum()>30 && list.get(i).getLottoNum()<=40){%>
    				'#6c757d'
    			<%}else{%>
    				'#808080'
    			<%}%>
    			<%if(i<11){%>
    				,
    			<%}%>
    		<%}%>
            ],
            borderColor: 'rgb(255, 99, 132)',
            data: [
            	<%for(int i=0;i<12;i++){%>
    			<%= list.get(i).getLottoWin()%>
    			<%if(i<11){%>
    				,
    			<%}%>
    		<%}%>
    		,90
            ]
        }],
    },
    options: {
        responsive: true,
        title: {
            display: true,
            text: ''
        },
        tooltips: {
            mode: 'index',
            intersect: false,
        },
        hover: {
            mode: 'nearest',
            intersect: true
        },
        scales: {
            xAxes: [{
                display: true,
                scaleLabel: {
                    display: true,
                    labelString: '당첨 횟수'
                },
            }],
            yAxes: [{
                display: true,
                ticks: {
                    autoSkip: false,
                },
                scaleLabel: {
                    display: true,
                    labelString: '당첨 번호'
                }
            }]
        }}
});


</script>
</body>
</html>