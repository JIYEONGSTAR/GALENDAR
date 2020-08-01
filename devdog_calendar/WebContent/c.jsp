<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, devdog_calendar.*,java.util.Calendar,java.util.List, devdog_calendar.jdbc.*"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>갤린더</title>
<style>
@font-face { font-family: 'Binggrae-Bold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae-Bold.woff') format('woff'); font-weight: normal; font-style: normal; }
body{
 font-family: 'Binggrae-Bold';
 }
table {
   border-collapse: collapse;
   text-align: center;
   margin: auto;
   font-family: 'Binggrae-Bold';
}

#date {
   margin: auto;
}

#ym td {
   left: 50%;
   border: none;
   height: 20px;
   padding-top: 30px;
   padding-bottom: 30px;
}

#ym_b {
   width: 100px;
   height: 100px;
   font-size: 50px;
   border: 0;
   outline: 0;
   background-color: #FFFFFF
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

td:nth-child(7), th:nth-child(7) {
   color: blue;
}

span.green {
   font-size: 9pt;
   color: green;
}

span.gray {
   font-size: 9pt;
   color: gray;
}

.table td:hover {
   background-color: grey;
   cursor: pointer;
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
<header>
   <nav>
      <ul class="top_bar">
         <li class="top_bar_menu"><a href="memberList.jsp" target="_self">멤버리스트</a></li>
      </ul>
   </nav>
</header>
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
   <table id="date">
      <tr id="ym">
          <td><input type="button" id="ym_b" value="◁" onClick="monthDown(this.form)" ></td>
             <td><select name="year" id="ym_b" style="width: 150px;" onchange="selectCheck(this.form)">
          <%
          for(int i=year-10;i<year+10;i++){
             String selected = (i == year)?"selected":"";
             String color = (i == year)?"#CCCCCC":"#FFFFFF";
             out.print("<option value="+i+" "+selected+" style=background:"+color+">"+i+"</option>");       
          }
          %>
          </select></td>
            <td><select name="month" id="ym_b" onchange="selectCheck(this.form)">
            <%
            for(int i=1;i<=12;i++){
                String selected = (i == month+1)?"selected":"";
               out.print("<option value="+i+" "+selected+">"+i+"</option>");       
            }
            %>
            </select></td>
            <td><input type="button" id="ym_b" value="▷" onClick="monthUp(this.form)"></td>
       </tr>
    </table>    
</form>
   <table id="table">
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
            <td><%=i%><br>
            <% 
				int memoyear,memomonth,memoday;
				try{
					 String sql= "SELECT * FROM schedule";
					 Connection connection = DB.getConnection("devdog");
					 PreparedStatement statement = connection.prepareStatement(sql);
					 ResultSet rs = statement.executeQuery();
					 while(rs.next()){
						 memoyear=rs.getInt("dateYear");
						 memomonth=rs.getInt("dateMonth");
						 memoday=rs.getInt("dateDate");
						 if(year==memoyear && month+1==memomonth && i==memoday){
							 out.println(rs.getString("contents")+"<br>"); 
						 }
					 }
					 rs.close();
				}
				catch(Exception e){
					System.out.println(e);
				};
				%>
				</td>
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