package devdog_calendar.jdbc;

public class Schedule {
	int scheduleID;
	int dateYear;
	int dateMonth;
	int dateDate;
	String contents;
	public int getScheduleID() {
		return scheduleID;
	}
	public void setScheduleID(int scheduleID) {
		this.scheduleID = scheduleID;
	}
	public int getDateYear() {
		return dateYear;
	}
	public void setDateYear(int dateYear) {
		this.dateYear = dateYear;
	}
	public int getDateMonth() {
		return dateMonth;
	}
	public void setDateMonth(int dateMonth) {
		this.dateMonth = dateMonth;
	}
	public int getDateDate() {
		return dateDate;
	}
	public void setDateDate(int dateDate) {
		this.dateDate = dateDate;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}

}
