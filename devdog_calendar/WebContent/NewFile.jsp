<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Insert title</title>
    </head>
    <script>
        function goTo()
        {
          document.frm.submit()
        }
    </script>
    <body>
        <div align="center">
            <div style="overflow-x:auto;">              
                <%
                    Calendar calendar = new GregorianCalendar();
                    Date date = new Date();
                    String dateString = new String();
                    int day, month, year;
                    int numDays, weekStartDay, totalWeeks;
                    calendar.setTime(date);
                    day = calendar.get(Calendar.DATE);
                    month = calendar.get(Calendar.MONTH);
                    year = calendar.get(Calendar.YEAR);
                    dateString += calendar.get(Calendar.YEAR) +" "+ calendar.get(Calendar.MONTH) + " " + calendar.get(Calendar.DATE);
                    numDays = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
                    weekStartDay = calendar.get(Calendar.DAY_OF_WEEK);
                    calendar = new GregorianCalendar(year, month, numDays);
                    totalWeeks = calendar.get(Calendar.WEEK_OF_MONTH);
                %>          
                <table>
                    <tr>
                        <%= year %> 
                        <%= month %> 
                        <%= month %> 
                        
                        <%= dateString %>
                        <button type="button" onclick="goTo()"> - <% month--; %></button>
                        <button type="button" onclick="goTo()"> + <% month++; %></button>
                    </tr>
                </table>
            </div>
        </div>      
    </body>
</html>