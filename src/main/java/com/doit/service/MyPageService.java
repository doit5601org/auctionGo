package com.doit.service;

import com.doit.dao.MyPageDAO;
import com.doit.dto.UserInfoDTO;

public class MyPageService {

	private final MyPageDAO myPageDao;

	public MyPageService(MyPageDAO dao) {
		this.myPageDao = dao;
	}

	// 회원 정보 변경 (비밀번호 확인 후 업데이트)
	public String changeInfo(String userLoginId, String userPwd, UserInfoDTO dto) {
		String result = null;
		
		int check = myPageDao.checkPwd(userLoginId, userPwd);
		
		if(check>0) {
			int changeInfo = myPageDao.modifyUserProfile(dto);
			if(changeInfo>0) {
				result = "정보 수정이 완료되었습니다.";
			}else {
				result = "오류가 발생하여 수정이 완료되지 않았습니다.";
			}
		}else if(check==0) {
			result = "비밀번호가 일치하지 않습니다.";
		}
		
		return result;
	}
	
	// 비밀번호 변경 
	public String changePw(String userLoginId, String userPwd, String changePwd) {
		String result = null;
		
		
		int check = myPageDao.checkPwd(userLoginId, userPwd);
		
		if(check>0) {
			int changeUserPwd = myPageDao.modifyUserPwd(userLoginId, changePwd);	
			
			if(changeUserPwd>0) {
				result = "정보 수정이 완료되었습니다.";
			}else {
				result = "오류가 발생하여 수정이 완료되지 않았습니다.";
			}
			
			
		}else {
			result ="비밀번호가 일치하지 않습니다.";
		}
		
		
		return result;
	}
	
	
}
