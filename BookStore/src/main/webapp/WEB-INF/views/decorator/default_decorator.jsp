<!-- sitemesh 사용을 위한 설정 파일 -->
<!-- 작성자 : 이영환 -->
<!-- 작성일 : 2020-06-30 -->
<%@page import="com.bookStore.member.vo.LoginVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
	
<%
LoginVO loginVO = (LoginVO) session.getAttribute("login");

%>	
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>웹짱:<decorator:title /></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
header, footer {
	background: AntiqueWhite;
}

pre {
	background: white;
	border: 0px;
}

/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: black;
	padding: 25px;
	color: #ddd;
}

.carousel-inner img {
	width: 100%; /* Set width to 100% */
	margin: auto;
	min-height: 200px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

article {
	min-height: 400px;
	margin-top: 80px;
	margin-bottom: 120px;
}

#welcome {
	color: grey;
	margin: 0 auto;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
<decorator:head/>
</head>
<body>
	<header>
<!-- 		<div><img href="/upload/image/cat01.jpg" style="width: 100%; height: 150px;" /></div> -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/">Logo</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li><a href="/notice/list.jsp">공지사항</a></li>
						<li><a href="/image/list.jsp">갤러리</a></li>
						<li><a href="/board/list.jsp">게시판</a></li>
					<% if(loginVO != null && loginVO.getGradeNo() == 9) { %>				
						<li><a href="/member/list.jsp">회원관리</a></li>
						<li><a href="/grade/list.jsp">등급관리</a></li>
					<% }%>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<%if(loginVO == null) { %>						
     					<li><a href="/member/writeForm.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp;회원가입</a></li>
     					<li><a href="/member/loginForm.jsp">
     					<span class="glyphicon glyphicon-log-in"></span>&nbsp;로그인</a></li>
     					<% } else {%>
     					<li><a href="/member/view.jsp?id=<%= loginVO.getId()%>"><span class="glyphicon glyphicon-user"></span>
     					&nbsp;<%= loginVO.getName() %>(<%=loginVO.getGradeName()%>)&nbsp;&nbsp;[ID:&nbsp;<%= loginVO.getId()%>]</a></li>
     					<li><a href="/member/logout.jsp"><span class="glyphicon glyphicon-log-out"></span>&nbsp;로그아웃</a></li>
     					<%} %>
 				    </ul>
				</div>
			</div>
		</nav>
	</header>
	<article>
		<decorator:body />
	</article>
	<footer class="container-fluid text-center navbar navbar-inverse navbar-fixed-bottom">
		<p>이 홈페이지의 저작권은 이영환에게 있습니다.</p>
	</footer>
</body>
</html>