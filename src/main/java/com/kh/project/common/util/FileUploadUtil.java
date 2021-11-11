package com.kh.project.common.util;

import java.util.Calendar;

public class FileUploadUtil {
	// 현재 날짜와 시간을 문자열로 리턴
	public static String getNowDateTime() {
		// 캘린더 객체 생성
		Calendar cal = Calendar.getInstance();
		// 현재 날짜및시간을 문자열로 저장할 변수
		String nowDateTime = "";
		
		// 현재 날짜및시간을 문자열로 생성
		nowDateTime += cal.get(Calendar.YEAR);
		nowDateTime += cal.get(Calendar.MONTH) + 1;
		nowDateTime += cal.get(Calendar.DATE);
		nowDateTime += cal.get(Calendar.HOUR);
		nowDateTime += cal.get(Calendar.MINUTE);
		nowDateTime += cal.get(Calendar.SECOND);
		nowDateTime += cal.get(Calendar.MILLISECOND);
		
		return nowDateTime;
	}
	
	public static String getBeforMonth() {
		Calendar mon = Calendar.getInstance();
	    mon.add(Calendar.MONTH , -1);
	    String beforMonth = new java.text.SimpleDateFormat("yyyy-MM-dd").format(mon.getTime());
	    
	    return beforMonth;
	}
	
	public static String getNowMonth() {
		Calendar nowDate = Calendar.getInstance();
	    String nowMonth = new java.text.SimpleDateFormat("yyyy-MM-dd").format(nowDate.getTime());
		return nowMonth;
	}
	
}
