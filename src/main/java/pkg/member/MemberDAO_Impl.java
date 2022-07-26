package pkg.member;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class MemberDAO_Impl implements MemberDAO{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override	
	public String loginchk(Map<String, Object> map) { // 로그인 체크
		sqlSessionTemplate.selectList("loginchk",map);
		if(map.get("error1")==null) {
			return (String) map.get("result");	
		}
		
		return "FAIL";
	}

	public String chk(Map<String, Object> map) { // ID,닉네임 중복체크
		Map<String, Object> hmep = (Map<String,Object>)map.get("data");
		System.out.println(hmep);
		sqlSessionTemplate.selectList("chk",hmep);	
		
		return (String) hmep.get("result");
	}
	@Override
	public String insmem(Map<String, Object> map) { // 회원가입
		System.out.println(map);
		sqlSessionTemplate.selectList("insmem",map);
		System.out.println(map.get("error"));	
		System.out.println(map.get("error2"));	
		
		
		return (String)map.get("result");
	}
	@Override
	public List<MemberVO> selmem(Map<String, Object> map) { // 회원 정보(일반페이지)
		sqlSessionTemplate.selectList("selmem",map);

		
		return (List<MemberVO>)map.get("result");
	}
	@Override
	public String delmem(Map<String, Object> map) { // 회원 탈퇴(일반페이지)
		sqlSessionTemplate.selectList("delmem",map);
		System.out.println(map.get("result"));
		System.out.println(map.get("error"));
		System.out.println(map.get("error2"));
		
		System.out.println("------------");
		return (String)map.get("result");
	}

	
	@Override
	public String updatemem(Map<String, Object> map) { // 회원정보수정 (본인)
		sqlSessionTemplate.selectList("updatemem",map);
		System.out.println((String)map.get("result"));
		System.out.println((String)map.get("error"));
		System.out.println((String)map.get("error2"));
		
		return (String)map.get("result");
	}

	@Override
	public Map<String, Object>  showmemberList(Map<String, Object> map) { // 회원 멤버리스트 보여주기(관리자페이지)
		System.out.println("showmemberlist");
		sqlSessionTemplate.selectList("memberlist",map);
		sqlSessionTemplate.selectList("authlist",map);
		System.out.println(map.get("resultauthList"));
		System.out.println(map.get("maxpage"));
		System.out.println(map.get("errormsg"));
		
		return map;
	}

	@Override
	public Map<String, Object> updatememberList(Map<String, Object> map) { // 회원 멤버리스트 수정(관리자페이지)
		
		
		List<Map<String, Object>> members = (List<Map<String, Object>>)map.get("data");
		System.out.println("update dao 발동 rkskek");
		Map<String, Object> result = new HashMap<>() ;
		for(Map<String, Object> member : members) {
			sqlSessionTemplate.selectList("updatememlist",member);
			System.out.println(member.get("result"));
			System.out.println(member.get("memberid"));
			
			if(member.get("result").equals("FAIL")){
				result.put("memberid",member.get("memberid"));
				result.put("result",member.get("result"));
			}else {
				result.put("result",member.get("result"));
							
			}
			
		}
		System.out.println(result);
		
		
		return result;
	}
	
	@Override
	public Map<String, Object> authList(Map<String, Object> map) { // 권한데이터 Sel(관리자페이지)
		sqlSessionTemplate.selectList("authlist",map);
		System.out.println(map.get("resultauthList"));
		System.out.println(map);
		System.out.println("---------");
		return map;
	}

	@Override
	public Map<String, Object> delmemberList(Map<String, Object> map) { // 회원 삭제
		List<Map<String, Object>> delmemlist = (List<Map<String, Object>>) map.get("deldata");
		Map<String, Object> result = new HashMap<>() ;
		for(Map<String, Object> member : delmemlist) {
			sqlSessionTemplate.selectList("delmem",member);
			
			if(member.get("result").equals("FAIL")){
				result.put("memberid",member.get("memberid"));
				result.put("result","FAIL");
			}else {
				result.put("result","SUC");
			}
				
			
		}

		
		return result;
	}

	
	

}
