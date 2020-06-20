<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, devdog.jdbc.*" %>
<%
List<Member> list = MemberDAO.findAll();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
      body { font-family: 굴림체; }
      thead th { background-color: #eee; }
      table.table { width: 700px; }
  </style>
</head>
<body>
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