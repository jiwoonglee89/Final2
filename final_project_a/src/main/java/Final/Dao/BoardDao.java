package Final.Dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import Final.Model.FileInfo;

public class BoardDao extends SqlSessionDaoSupport{
	
	public List<FileInfo> fileload(String id){
		return getSqlSession().selectList("fileload", id);
	}
	public int deletefile(Map map){
		return getSqlSession().delete("filedelete", map);
	}
}