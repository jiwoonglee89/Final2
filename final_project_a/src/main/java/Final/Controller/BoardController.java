package Final.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import Final.Dao.BoardDao;
import Final.Dao.FileLoadDao;
import Final.Dao.MemberDao;
import Final.Model.BoardInfo;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private FileLoadDao fileLoadDao;
	@Autowired
	private MemberDao memberDao;
	
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	public void setFileLoadDao(FileLoadDao fileLoadDao) {
		this.fileLoadDao = fileLoadDao;
	}
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	//JSP넘겨주는 매개변수를 받기위해서 
	@ModelAttribute("boardInfo")
	public BoardInfo boardInfo() {
		return new BoardInfo();
	}
	
	@RequestMapping("/list.do")
	public String moveBoard()
	{
		return "BoardPage/list";
	}
}

