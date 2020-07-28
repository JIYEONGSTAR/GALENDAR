package devdog_calendar.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import devdog_calendar.DB;

public class ScheduleDAO {

	 int memoyear, memomonth, memoday;
     try{
       // select 문장을 문자열 형태로 구성한다.
      String sql= "SELECT dateYear, dateMonth, dateDate, contents FROM schedule";
      pstmt= conn.prepareStatement(sql);
       // select 를 수행하면 데이터 정보가 ResultSet 클래스의 인스턴스로 리턴
      ResultSet rs= pstmt.executeQuery();
      while (rs.next()) { // 마지막 데이터까지 반복함.
       //날짜가 같으면 데이터 출력
       memoyear=rs.getInt("calendarmemo_year");
       memomonth=rs.getInt("calendarmemo_month");
       memoday=rs.getInt("calendarmemo_day");
       if(year==memoyear && month+1==memomonth && i==memoday) {
        out.println(rs.getString("calendarmemo_contents")+"<br>");
       }
      }
      rs.close();
     }
     catch(Exception e) {
      System.out.println(e);
     };
}
