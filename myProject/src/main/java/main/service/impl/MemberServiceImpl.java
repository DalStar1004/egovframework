package main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.MemberService;
import main.service.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Resource(name="memberDAO")
	public MemberDAO memberDAO;
	
	
	@Override 
	/* 다형성
	 * 오버라이딩 : 상속관계에서 부모 클래스에 있는 내용을 재구성하는 방법
	 * 오바로딩 : 같은 클래스 내부에서 같은 이름으로 메소드 만드는 방법 
	 */
	public String insertMember(MemberVO vo) throws Exception {
		return memberDAO.insertMember(vo);
	}


	@Override
	public int selectMemberIdCheck(String userid) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectMemberIdCheck(userid);
	}


	@Override
	public List<?> selectPostList(String dong) throws Exception {
		// TODO Auto-generated method stub
		return memberDAO.selectPostList(dong);
	}


	@Override
	public int selectMemberCount(MemberVO vo) throws Exception {
		return memberDAO.selectMemberCount(vo);
	}

}
