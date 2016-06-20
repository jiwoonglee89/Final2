package Final.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Final.Dao.BoardDao;
import Final.Model.FileInfo;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDao boardDao;
	
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@RequestMapping("/board.do")
	public ModelAndView board_view(HttpServletRequest request){
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		List<FileInfo> files=boardDao.fileload(id);
		return new ModelAndView("list", "files", files);
	}

	
}