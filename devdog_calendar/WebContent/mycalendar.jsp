<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="devdog_calendar.*,java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>todaycalendar</title>
<style>
table {
   border-collapse: collapse;
}
td {
   border: 1px solid gray;
   width: 120px;
   height: 120px;
   vertical-align: top;
}
th {
   background-color: #dddddd;
   border: 1px solid gray;
   height: 30px;
}
td:nth-child(1), th:nth-child(1) {
   color: red;
}
span.green {
   font-size: 9pt;
   color: green;
}
span.gray {
   font-size: 9pt;
   color: gray;
}
td:hover {
   background-color: #ffd;
   cursor: pointer;
}
</style>
	
</head>
<body>
	<%
		Calendar cr = Calendar.getInstance();
		int month = cr.get(Calendar.MONTH);
		int year = cr.get(Calendar.YEAR);
		cr.set(year,month,1);
		%>
   <h1><%=month+1%>월</h1>
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
         <tr>
           
            <%int count=0; %>
            <%
               for (int i=1;i<calendar1.startDay(month);i++) {
                    count++;
              %>
            <td>&nbsp;</td>
            <%
                 }
                 for(int day=1;day<=calendar1.lastDate(month);day++){
                    count++;
              %>
            <td><%= day %></td>
            <%
                 if(count%7==0&&day<calendar1.lastDate(month)){
              %>
         </tr>
         <tr>
            <%
                 }
                 }
                 while(count%7!=0){
              %>
            <td>&nbsp;</td>
            <%
               count++;
                 }
            %>
         </tr>
      </tbody>
   </table>
</body>
</html>