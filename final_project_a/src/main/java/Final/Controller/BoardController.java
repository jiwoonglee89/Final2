package Final.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		List<FileInfo> files=null;
		if(boardDao.fileload(id).size()!=0){
			files=boardDao.fileload(id);
		}
		return new ModelAndView("BoardPage/list", "files", files);
	}
	@RequestMapping("/file_delete.do")
	public ModelAndView file_delete(HttpServletRequest request){
		Map map=new HashMap();
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		int file_num=Integer.parseInt(request.getParameter("num"));
		map.put("id", id);
		map.put("num", file_num);
		int success=boardDao.deletefile(map);
		return new ModelAndView("BoardPage/result", "success", success);

	}
/*	@RequestMapping("/newdivedit.do")
	public String moveExcel(String title,HttpServletRequest request)
	{
		System.out.println(title);
	    request.setAttribute("title" , title);
		
	    return "Tiles/";
	}*/
	@RequestMapping(value="/title.do", method=RequestMethod.GET)
    public String moveTitle()
    {
       return "BoardPage/title";
    }
	@RequestMapping("/Iframe.do")
	public String moveframe()
	{
		return "Tiles/Iframe";
	}
}