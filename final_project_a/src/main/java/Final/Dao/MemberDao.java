package Final.Dao;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import Final.Model.MemberInfo;


public class MemberDao extends SqlSessionDaoSupport{

	//아이디 값으로 회원정보 한줄 가져오기
	public MemberInfo getMember(String id){
		return getSqlSession().selectOne("member.one", id);
	}
	//회원정보 수정
	public int modify(MemberInfo memberInfo) {
		return getSqlSession().update("member.modify",memberInfo);
	}
	//아이디 검색
	public String idSearch(MemberInfo memberInfo) {

		return getSqlSession().selectOne("member.idSearch", memberInfo);
	}
	//비밀번호 검색
	public String pwSearch (MemberInfo memberInfo) {

		return getSqlSession().selectOne("member.pwSearch", memberInfo);
	}
	//로그인 판단여부
	public String loginSuccess(MemberInfo memberInfo) {
		String password = null;

		password = getSqlSession().selectOne("member.loginSucess", memberInfo);

		return password;
	}
	//회원 가입
	public int insert(MemberInfo memberInfo)
	{
		return getSqlSession().insert("member.insert", memberInfo);
	}
	//회원 정보 수정
	public MemberInfo modifyForm(String id){

		return getSqlSession().selectOne("member.modifyForm",id);
	}
	//회원 탈퇴
	public int delete(Map map)
	{
		return getSqlSession().delete("member.delete",map);
	}

}
