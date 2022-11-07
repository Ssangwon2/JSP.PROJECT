<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">

<title>JSP 掲示板のウェブサイト</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<nav class="navbar navbar-default">
		<div class="nabvar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 掲示板のウェブサイト</a>
		</div>
		<div class="collaspse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp">メイン</a></li>
				<li><a href="bbs.jsp">掲示板</a></li>
			</ul>
			<%
			if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">接続する<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">ログイン</a></li>
						<li><a href="join.jsp">会員登録</a></li>
					</ul></li>
			</ul>
			<%
			} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">会員管理<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">ログアウト</a></li>

					</ul></li>
			</ul>
			<%
			}
			%>

		</div>
	</nav>
	<div class="comtainer">
		<div class="jumbotron">
			<div class="container">
				<h1>ウェブサイトの紹介</h1>
				<P>このウェブサイトはブートストラップで作られたJSPウェブサイトです。簡単なロジックだけを使って作りました.</P>
				<P>
					<a class="btn btn-primary btn-pull" href="#" role="button">詳しくはこちら</a>
				</P>

			</div>
		</div>
	</div>

	<div class="container">
		<div id=myCarousel " class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/1.JPG">
				</div>
				<div class="item">
					<img src="images/2.JPG">
				</div>
				<div class="item">
					<img src="images/3.JPG">
				</div>
			</div>
		</div>
		<a class ="left carousel-control" href = "#myCarousel" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left"></span>
		</a>
			<a class ="right carousel-control" href = "#myCarousel" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right"></span>
		</a>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>