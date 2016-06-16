package Final.Dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import Final.Model.MemberInfo;
import Final.Model.Zipcode;

public class MemberDao extends SqlSessionDaoSupport{

	//���̵� ������ ȸ������ ���� ��������
	public MemberInfo getMember(String id){
		return getSqlSession().selectOne("member.one", id);
	}

	public int modify(MemberInfo memberInfo) {
		return getSqlSession().update("member.modify",memberInfo);
	}	
	public int modifyM(Map map) {
		return getSqlSession().update("member.modify",map);
	}
public String idSearch(MemberInfo memberInfo) {
		
		return getSqlSession().selectOne("member.idSearch", memberInfo);
	}
	
	public String pwSearch (MemberInfo memberInfo) {
		
		return getSqlSession().selectOne("member.pwSearch", memberInfo);
	}
	
	public String loginSuccess(MemberInfo memberInfo) {
		String password = null;
		
		password = getSqlSession().selectOne("member.loginSucess", memberInfo);
		
		return password;
	}
	public int insert(Map map)
	{
		return getSqlSession().insert("member.insert", map);
	}
public MemberInfo modifyForm(String id){
		
		return getSqlSession().selectOne("member.modifyForm",id);
	}

}
