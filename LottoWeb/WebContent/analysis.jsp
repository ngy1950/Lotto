<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.ArrayList"%>
<%@page import="lotto.util.JdbcConnection"%>
<%@page import="lotto.count.countVO" %>
<jsp:useBean id="jdbcConnection" class="lotto.util.JdbcConnection" scope="page" />
<jsp:useBean id="countVO" class="lotto.count.countVO" />
<%
	ArrayList<countVO> list = jdbcConnection.lotto_Select();
	int CurDate = Integer.parseInt(request.getParameter("CurDate"));
	if(CurDate >= 2020){
		CurDate = 2020;
	}else if(CurDate <=2002){
		CurDate = 2002;
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
				<li><a href="./makeNumber.jsp" style="color: white;">로또번호 생성기</a></li>
				<li><a href="./analysis.jsp?CurDate=<%=CurDate%>" style="color: black; background-color: white; font-weight:800;">로또 분석</a></li>
				<li><a href="#" style="color: white;">로또 1등 판매점</a></li>
				<li><a href="#" style="color: white;">CONTACT</a></li>
			</ul><!-- main-menu -->

		</div><!-- conatiner -->
</header>	



<section class="section blog-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-1 col-md-4"></div>
				
				<div class="col-lg-10 col-md-4">
					<h4 class="h1-sub mt-3"><strong>누적 번호</strong></h4>
					<hr>
					<div class="blog-posts">
						<canvas id="canvas"></canvas>
						<br>
						<!-- <center><a class="btn caegory-btn" href="#"><b>분석보기</b></a></center> --> 
					
						<h4 class="h1-sub mt-3"><strong>연도별</strong>
						<hr>
							<center>
								<a class="btn caegory-btn" href="analysis.jsp?CurDate=<%=CurDate - 1%>">
									<div class="glyphicon glyphicon-chevron-left"></div>
								</a>&nbsp;
								<a href="#"><div class="glyphicon glyphicon-calendar" ></div></a><span style="font-size: 1.2em; color: red;"><%=CurDate%>년</span>&nbsp;
								
								<a class="btn caegory-btn" href="analysis.jsp?CurDate=<%=CurDate + 1%>">
									<div class="glyphicon glyphicon-chevron-right"></div>
								</a>
							</center>
							<right>
								
							</right>
						
						</h4>
						
						<canvas id="canvas_year"></canvas>
						<br>
						
						<div class="col-lg-12 col-md-12">
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
				</div>
			</div>
		</div>
	</section>
	
	
<script>

var ctx = document.getElementById('canvas').getContext('2d');
var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'line',

    // The data for our dataset
    data: {
        labels: [ 
        		<%for(int i=0;i<45;i++){%>
        			<%= list.get(i).getLottoNum()%>
        			<%if(i<44){%>
        				,
        			<%}%>
        		<%}%>
        		
        		
        		
        ],
        datasets: [{
            label: '역대 번호 당첨 횟수',
            backgroundColor: [
            	'rgba(0,0,0,0)'
            ],
            borderColor: 'red',
            data: [
            	<%for(int i=0;i<45;i++){%>
    			<%= list.get(i).getLottoWin()%>
    			<%if(i<44){%>
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
                    labelString: '당첨 번호'
                },
            }],
            yAxes: [{
                display: true,
                ticks: {
                    autoSkip: false,
                },
                scaleLabel: {
                    display: true,
                    labelString: '당첨 횟수'
                }
            }]
        }}
});



new Chart(document.getElementById("canvas_year"), {
    type: 'horizontalBar',
    data: {
        labels: ['43', '42', '38', '35','1', '5', '3', '34', '22', '26'],
        datasets: [{
            label: '역대 번호 당첨 횟수',
            data: [92, 85, 76, 75,43, 42, 30, 26, 20, 3],
            borderColor: "rgba(255, 255, 255, 255)", 
            backgroundColor: //"rgba(255, 201, 14, 0.5)",
            [
            	 "#f38b4a",
                 "#56d798",
                 "#ff8397",
                 "#6970d5", 
                 "#f38b4a",
                 "#56d798",
                 "#ff8397",
                 "#6970d5" 
            ],
            fill: true,
        }]
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
        }
    }
});




new Chart(document.getElementById("canvas_month"), {
    type: 'horizontalBar',
    data: {
        labels: ['43', '42', '38', '35','1', '5', '3', '34', '22', '26'],
        datasets: [{
            label: '역대 번호 당첨 횟수',
            data: [92, 85, 76, 75,43, 42, 30, 26, 20, 3],
            borderColor: "rgba(255, 255, 255, 255)", 
            backgroundColor: //"rgba(255, 201, 14, 0.5)",
            [
            	 "#f38b4a",
                 "#56d798",
                 "#ff8397",
                 "#6970d5", 
                 "#f38b4a",
                 "#56d798",
                 "#ff8397",
                 "#6970d5" 
            ],
            fill: true,
        }]
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
        }
    }
});
</script>
</body>
</html>