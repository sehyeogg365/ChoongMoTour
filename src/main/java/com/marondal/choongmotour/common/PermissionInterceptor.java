package com.marondal.choongmotour.common;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class PermissionInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(
			HttpServletRequest request
			, HttpServletResponse response
			, Object handler
			) throws IOException{
		
		HttpSession session = request.getSession();
		
		Integer userId = (Integer)session.getAttribute("userId");//이게저장되있으면 로그인 된상태 아니면 로그인 안된상태
		Integer adminId = (Integer)session.getAttribute("adminId");
		
		//null이저장가능하게 끔
		// /user/signin/view
		String uri = request.getRequestURI();
		
		if(userId != null) {
			// 로그인이 되었을때
			// 회원 가입, 로그인 페이지 접근하려고 하면
			// user 로 시작하는 페이지에 접근하려고 하면 
			// 리스트 페이지로 이동시켜라

			if(uri.startsWith("/user/signin/view")) {//user 라는 시작하는걸로 접근할려면?
				// 리다이렉트 
				response.sendRedirect("/lodging/main/view");//이동하고픈 주소
				//다른페이지로 이동하는거를 대신 try catch 대신 throw
				
				return false;//원래 가려 했던 그 목적페이지에 못가게 하려면 폴스
			}
			if(uri.startsWith("/user/signup/view")) {//user 라는 시작하는걸로 접근할려면?
				// 리다이렉트 
				response.sendRedirect("/lodging/main/view");//이동하고픈 주소
				//다른페이지로 이동하는거를 대신 try catch 대신 throw
				
				return false;//원래 가려 했던 그 목적페이지에 못가게 하려면 폴스
			}
			if(uri.startsWith("/user/find_id_pw/view")) {//user 라는 시작하는걸로 접근할려면?
				// 리다이렉트 
				response.sendRedirect("/lodging/main/view");//이동하고픈 주소
				//다른페이지로 이동하는거를 대신 try catch 대신 throw
				
				return false;//원래 가려 했던 그 목적페이지에 못가게 하려면 폴스
			}
			
			} else {
			// 로그인이 안되었을떄
			// 찜목록, 예약페이지, 예약목록, 마이페이지 등 페이지로 접근하려고 하면
			// post 로 시작하는 페이지에 접근하려고 하면 	
			// 로그인 페이지로 이동해라
				
				if(uri.startsWith("/lodging/lodginglist/view")) { //이것도 그냥 따로만들기
					response.sendRedirect("/user/signin/view");
					return false;
				}//그냥 이렇게 해버리는게 속편하겠다. 원래 로그인 안해도 숙소리스트, 객실리스트까지 보게 할려 했는데
			
				if(uri.startsWith("/user/mypage/view")) {
					response.sendRedirect("/user/signin/view");
					return false;
				}
				
				if(uri.startsWith("/lodging/dibspage/view")) {//찜목록페이지
					response.sendRedirect("/user/signin/view");
					return false;
				}
				
				if(uri.startsWith("/lodging/reservelist/view")) {//예약목록페이지
					response.sendRedirect("/user/signin/view");
					return false;
				}
				
				if(uri.startsWith("/lodging/reservation/view")) {//예약페이지
					response.sendRedirect("/user/signin/view");
					return false;
				}
				if(uri.startsWith("/lodging/commentwrite/view")) {//댓글작성페이지
					response.sendRedirect("/user/signin/view");
					return false;
				}
				
			}
		
		if(adminId != null) {
			// 로그인이 되었을때
			// 회원 가입, 로그인 페이지 접근하려고 하면
			// user 로 시작하는 페이지에 접근하려고 하면 
			// 리스트 페이지로 이동시켜라

			if(uri.startsWith("/admin/signin/view")) {//admin/signin/view 라는 시작하는걸로 접근할려면?
				// 리다이렉트 
				response.sendRedirect("/admin/main/view");//이동하고픈 주소
				//다른페이지로 이동하는거를 대신 try catch 대신 throw
				
				return false;//원래 가려 했던 그 목적페이지에 못가게 하려면 폴스
			}
			if(uri.startsWith("/admin/signup/view")) {//admin/signup/view 라는 시작하는걸로 접근할려면?
				// 리다이렉트 
				response.sendRedirect("/admin/main/view");//이동하고픈 주소
				//다른페이지로 이동하는거를 대신 try catch 대신 throw
				
				return false;//원래 가려 했던 그 목적페이지에 못가게 하려면 폴스
			}
			if(uri.startsWith("/admin/find_id_pw/view")) {//admin/find_id_pw/view라는 시작하는걸로 접근할려면?
				// 리다이렉트 
				response.sendRedirect("/admin/main/view");//이동하고픈 주소
				//다른페이지로 이동하는거를 대신 try catch 대신 throw
				
				return false;//원래 가려 했던 그 목적페이지에 못가게 하려면 폴스
			}
			
			} else {
			// 로그인이 안되었을떄
			// 숙소 추가, 숙소수정, 객실 추가, 객실 수정, 마이페이지 등 페이지로 접근하려고 하면
			//  로 시작하는 페이지에 접근하려고 하면 	
			// 로그인 페이지로 이동해라
					
				if(uri.startsWith("/admin/main/view")) {
					response.sendRedirect("/admin/signin/view");
					return false;
				}
				
				if(uri.startsWith("/admin/mypage/view")) {
					response.sendRedirect("/admin/signin/view");
					return false;
				}
				
				if(uri.startsWith("/admin/lodging")) {//숙소 추가 페이지, 숙소 수정 페이지
					response.sendRedirect("/admin/signin/view");
					return false;
				}
				
				if(uri.startsWith("/admin/room")) {//객실 추가 페이지, 객실 수정 페이지
					response.sendRedirect("/admin/signin/view");
					return false;
				}
				
			}
		return true;//문제없이 여기까지 왔으면 정상수행
		//pre handle override
	}
}
