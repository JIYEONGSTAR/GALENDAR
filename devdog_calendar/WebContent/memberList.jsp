<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, devdog_calendar.jdbc.*"%>
<%
	List <Member> list = MemberDAO.findAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>갤린더</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
@font-face {
	font-family: 'Binggrae-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	padding: 50px;
	font-family: 'Binggrae-Bold';
}

table {
	border-collapse: collapse;
	text-align: center;
	margin: auto;
	font-family: 'Binggrae-Bold';
}

h1 {
	text-align: center;
}

th {
	background-color: #dddddd;
	border: 1px solid gray;
	height: 30px;
	text-align: center;
}

.top_bar {
	position: fixed;
	top: 0;
	display: flex;
	width: 100%;
	margin: 0;
	padding: 0;
	background-color: white;
	list-style-type: none;
}

.top_bar_menu {
	padding: 15px;
}

.top_bar_menu a {
	text-align: center;
	text-decoration: none;
	color: black;
	font-size: 20px;
	font-family: 'Binggrae-Bold';
}

.top_bar_menu a:hover {
	color: black;
}
</style>
</head>
<body>
	<header>
		<nav>
			<ul class="top_bar">
				<li class="top_bar_menu"><a href="calendar.jsp" target="_self">달력</a></li>
			</ul>
		</nav>
	</header>
	<h1>멤버리스트</h1>
	<div class="container">
		<table class="table table-bordered table-condensed">
			<thead>
				<tr>
					<th>아이디</th>
					<th>학번</th>
					<th>이름</th>
					<th>생일</th>
				</tr>
			</thead>
			<tbody>
				<% for (Member member : list) { %>
				<tr>
					<td><%= member.getId() %></td>
					<td><%= member.getStudentID() %></td>
					<td><%= member.getName() %></td>
					<td><%= member.getBirth() %></td>
				</tr>
				<% } %>
			</tbody>
		</table>

	</div>
</body>
</html>