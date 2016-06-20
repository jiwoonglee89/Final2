package Final.Dao;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import Final.Model.MemberInfo;


public class MemberDao extends SqlSessionDaoSupport{

	//���̵� ������ ȸ������ ���� ��������
	public MemberInfo getMember(String id){
		return getSqlSession().selectOne("member.one", id);
	}
	//ȸ������ ����
	public int modify(MemberInfo memberInfo) {
		return getSqlSession().update("member.modify",memberInfo);
	}
	//���̵� �˻�
	public String idSearch(MemberInfo memberInfo) {

		return getSqlSession().selectOne("member.idSearch", memberInfo);
	}
	//��й�ȣ �˻�
	public String pwSearch (MemberInfo memberInfo) {

		return getSqlSession().selectOne("member.pwSearch", memberInfo);
	}
	//�α��� �Ǵܿ���
	public String loginSuccess(MemberInfo memberInfo) {
		String password = null;

		password = getSqlSession().selectOne("member.loginSucess", memberInfo);

		return password;
	}
	//ȸ�� ����
	public int insert(MemberInfo memberInfo)
	{
		return getSqlSession().insert("member.insert", memberInfo);
	}
	//ȸ�� ���� ����
	public MemberInfo modifyForm(String id){

		return getSqlSession().selectOne("member.modifyForm",id);
	}
	//ȸ�� Ż��
	public int delete(Map map)
	{
		return getSqlSession().delete("member.delete",map);
	}

}
