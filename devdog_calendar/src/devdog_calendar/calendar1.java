package devdog_calendar;

import java.util.Calendar;

public class calendar1 {

	public static void printCalendar(int firstDayofWeek, int lastDay) {
		firstDayofWeek %= 7;
		int day=1;
		for(int i=0;i<firstDayofWeek;i++) {
			System.out.print("   ");//요일 시작하기 전 만큼 칸 비우기
		}
		while(day<=lastDay) {
			System.out.printf("%4d", day);
			if((day+firstDayofWeek-2) %7==6)
				System.out.println("");
			day++;
		}
	}

	public static int startDay(int selectmonth) {
		Calendar cr = Calendar.getInstance();
		int year = cr.get(Calendar.YEAR);
		int month = selectmonth;
		cr.set(year,month,1);
		int startDay = cr.get(Calendar.DAY_OF_WEEK);
		return startDay;
	}

	public static int lastDate(int selectmonth) {
		Calendar cr = Calendar.getInstance();
		int year = cr.get(Calendar.YEAR);
		int month = selectmonth;
		cr.set(year,month,1);
		//이번 달 마지막 날짜 구하기
		cr.add(Calendar.MONTH,1);//월은 하나 추가시키고
		cr.add(Calendar.DATE, -1);//날짜는 하나 다운....
		int lastDate=cr.get(Calendar.DATE);
		return lastDate;
	}
}
