package Final.Dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import Final.Model.FileInfo;

public class FileLoadDao extends SqlSessionDaoSupport{
	public int save(FileInfo fileinfo){
		return getSqlSession().insert("save", fileinfo);		
	}

	public List<FileInfo> getList(String id){
		return getSqlSession().selectList("file.allById", id);
	}

	public int delete(String title) {
		return getSqlSession().delete("file.delete", title);
	}

	//파일이름으로 경로가져오기
	public String getPath(String title) {
		FileInfo fileinfo = getSqlSession().selectOne("file.selByTitle", title);
		String path = fileinfo.getPath();
		return path;
	}

	public int write(FileInfo fileInfo){
		
		int n;
		n = getSqlSession().insert("fileMapper.write", fileInfo);
		
		return n;
	}
	
	public int update(int file_number){
		
		return getSqlSession().update("file.update", file_number);
	}
	
	public int updatePro(FileInfo fileInfo){
		
		return getSqlSession().update("file.updatePro", fileInfo);
	}
}