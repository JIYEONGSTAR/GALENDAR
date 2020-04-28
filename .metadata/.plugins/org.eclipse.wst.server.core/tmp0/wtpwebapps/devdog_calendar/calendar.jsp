<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="devdog_calendar.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>todaycalendar</title>
    <style>
        table { border-collapse: collapse; }
        td { border: 1px solid gray; width: 120px; height: 120px; vertical-align: top; }
        th { background-color: #dddddd; border: 1px solid gray; height: 30px; }
        td:nth-child(1), th:nth-child(1) { color: red; }
        span.green {  font-size: 9pt; color: green; }
        span.gray {  font-size: 9pt; color: gray; }
        td:hover { background-color: #ffd; cursor: pointer; }
    </style>
</head>
<body>
    <h1>지금 년도</h1>
    <table>
        <thead>
            <tr>
                <th>일</th>
                <th>월</th>
                <th>화</th>
                <th>수</th>
                <th>목</th>
                <th>금</th>
                <th>토</th>
            </tr>
        </thead>
        <tbody>
        		<% int day=1; %>
        			<tr>
        			<% for(int j=1;j<calendar1.startDay();j++){ %>
        				<td> </td>
        			<%}%>
        			<% for(int j=calendar1.startDay();j<=7;j++,day++){%>
        				<td><%=day %></td>
        			<%}%>     			
        </tbody>
    </table>    
</body>
</html>
