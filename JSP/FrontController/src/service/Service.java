package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Service {
	
	//인터페이스 
	//멤버 메소드가 모두 추상 메소드 
	//멤버 변수 : 상수
	//view page 반환 메소드
	//사용자 요청의 핵심 처리
	//request속성에 데이터 저장
	String getViewPage(HttpServletRequest request,HttpServletResponse response);
	
}
