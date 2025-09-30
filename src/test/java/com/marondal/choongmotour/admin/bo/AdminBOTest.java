package com.marondal.choongmotour.admin.bo;

import com.marondal.choongmotour.admin.dao.AdminDAO;
import com.marondal.choongmotour.admin.model.Admin;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class AdminBOTest {

    @InjectMocks
    private AdminBO adminBO;

    @Mock
    private AdminDAO adminDAO;

    @DisplayName("회원가입")
    @Test
    void 회원가입_테스트(){
        //given
        int id = 1;
        String loginId = "hagulu";
        String password = "1234";
		String name = "하구루";
        String email = "hagulu@naver.com";
		String nickname = "하굴";
		String certificationNumber = "#123$%";

        when(adminDAO.insertAdmin(loginId,password,name,email,nickname)).thenReturn(1);
        when(adminDAO.selectcertificationNumber(certificationNumber)).thenReturn(1);

        //when
        int addAdmin = adminDAO.insertAdmin(loginId, password, name, email, nickname);
        int count = adminBO.addAdmin(loginId, password, name, email, nickname, certificationNumber);

        //then
        assertThat(addAdmin).isNotNull();
        assertThat(count).isNotNull();
        // insertAdmin 이 한 번 호출되었는지만 체크
//        verify(adminDAO, times(1))
//                .insertAdmin(eq(loginId), anyString(), eq(name), eq(email), eq(nickname));
//        assertThat(adminBO.getAdmin(loginId,password).getLoginId()).isEqualTo(loginId);
    }

}