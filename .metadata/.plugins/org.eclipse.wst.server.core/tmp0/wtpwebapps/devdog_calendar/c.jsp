<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="devdog_calendar.*,java.util.Calendar"%>
<!DOCTYPE HTML>
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
<script type="text/javascript">
function selectCheck(form){
	form.submit();
}

	function monthDown(form) {
		if (form.month.value > 1) {
			form.month.value--;
		} else {
			form.month.value = 12;
			form.year.value--;
		}
		form.submit();
	}
	function monthUp(form) {
		if (form.month.value < 12) {
			form.month.value++;
		} else {
			form.month.value = 1;
			form.year.value++;
		}
		form.submit();
	}
</script>
</head>
<body>
<% 
Calendar cr = Calendar.getInstance();
int year = cr.get(Calendar.YEAR);
int month = cr.get(Calendar.MONTH);
int date = cr.get(Calendar.DATE);



String input_year = request.getParameter("year");
String input_month = request.getParameter("month");
if(input_month != null){
	 month = Integer.parseInt(input_month)-1;
	}
	if(input_year != null){
	 year = Integer.parseInt(input_year);
	}
	cr.set(year,month,1);
	int startDate = cr.getMinimum(Calendar.DATE);
	int lastDate = cr.getActualMaximum(Calendar.DATE);
int startDay = cr.get(Calendar.DAY_OF_WEEK);
int count=0;
%>
	<form method="post" action="c.jsp" name="change">
	<table>
	<tr>
   <td width="140" align="right"><input type="button" value="◁" onClick="monthDown(this.form)"></td>
      <td width="120" align="center">
      <select name="year" onchange="selectCheck(this.form)">
      <%
      for(int i=year-10;i<year+10;i++){
       String selected = (i == year)?"selected":"";
       String color = (i == year)?"#CCCCCC":"#FFFFFF";
         out.print("<option value="+i+" "+selected+" style=background:"+color+">"+i+"</option>");       
      }
      %>
      </select>
      <select name="month" onchange="selectCheck(this.form)">
      <%
      for(int i=1;i<=12;i++){
       String selected = (i == month+1)?"selected":"";
       String color = (i == month+1)?"#CCCCCC":"#FFFFFF";
         out.print("<option value="+i+" "+selected+" style=background:"+color+">"+i+"</option>");       
      }
      %>
      </select></td>
      <td width="140"><input type="button" value="▷" onClick="monthUp(this.form)"></td>
    </tr>
    
</table> 	
	</form>
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
				<%
					for (int i = 1; i < startDay; i++) {
						count++;
				%>
				<td>&nbsp;</td>
				<%
					}
					for (int i = startDate;i <= lastDate; i++) {
						count++;
				%>
				<td><%=i%></td>
				<%
					if (count % 7 == 0 && i< lastDate) {
				%>
			</tr>
			<tr>
				<%
					}
					}
					while (count % 7 != 0) {
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
