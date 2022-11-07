<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
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
	int bbsID = 0;
	if (request.getParameter("bbsID") != null) {
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if (bbsID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('無効な投稿です.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");

	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
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
				<li><a href="main.jsp">メイン</a></li>
				<li class="active"><a href="bbs.jsp">掲示板</a></li>
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
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;">掲示板の投稿
							見る</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">タイトル</td>
						<td colspan="2"><%=bbs.getBbsTitle().replaceAll("", "&nbsp;").replaceAll("<", "&lt;").replaceAll("<", "&gt;").replaceAll("\n",
		"<br>")%></td></td>
					</tr>
					<tr>
						<td>作者</td>
						<td colspan="2"><%=bbs.getUserID()%></td>
					</tr>
					<tr>
						<td>作成日</td>
						<td colspan="2"><%=bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "時"
		+ bbs.getBbsDate().substring(14, 16) + "分"%></td>
					</tr>
					<tr>
						<td>内容</td>
						<td colspan="2" style="height: 200px; text-align: left;"><%=bbs.getBbsContent().replaceAll("", "&nbsp;").replaceAll("<", "&lt;").replaceAll("<", "&gt;").replaceAll("\n",
		"<br>")%></td>
					</tr>
				</tbody>
			</table>
			<a href="bbs.jsp" class="btn btn-primary">リスト</a>
			<%
			if (userID != null && userID.equals(bbs.getUserID())) {
			%>
			<a href="update.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">修正</a>
			<a onclick = "return confirm('本当に削除しますか？?')" href="deleteAction.jsp?bbsID=<%=bbsID%>" class="btn btn-primary">削除</a>
			<%
			}
			%>
			<input type="submit" class="btn btn-primary pull-right" value="書く">
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

</body>
</html>