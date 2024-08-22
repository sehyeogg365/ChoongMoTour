package com.marondal.choongmotour.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.marondal.choongmotour.common.FileManagerService;
import com.marondal.choongmotour.common.PermissionInterceptor;//이거 수동으로 추가시킴

@Configuration
public class WebMVCConfig implements WebMvcConfigurer {
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		registry.addResourceHandler("/images/**")
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH + "/");//파일저장한 경로
		//api 와 아작스 와 설정 이모두를 모두 끊어서 천천히 해나간다 생각
	}
	
	//여기를 주석처리 해놔서 안됐던것. 프리핸들 작동부분
	@Override
	public void addInterceptors(InterceptorRegistry registry) {//인터셉터
		PermissionInterceptor interceptor = new PermissionInterceptor();//객체 생성
		
		registry.addInterceptor(interceptor)// 임시로 넣은 널이 아닌 인터셉터 객체가 들어가야 함
		.addPathPatterns("/**") //인터셉터를 거쳐서 처리할 페에지의 url 규칙
		.excludePathPatterns("/user/signout", "/static/**", "/images/**");//추가 패턴 인터셉터를 거치지 않을 예외 페이지 url 규칙
	}

}
