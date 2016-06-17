package Final.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Final.Dao.FileLoadDao;
import Final.Model.FileInfo;

@Controller
public class BoardController {
	
	@Autowired
	private FileLoadDao fileLoadDao;

	public void setFileLoadDao(FileLoadDao fileLoadDao){
		
		this.fileLoadDao = fileLoadDao;
	}

	@RequestMapping("/list.do")
	public String form(Model model, HttpServletRequest request){
		
		List<FileInfo> a = null;
		String id = (String) request.getSession().getAttribute("id");
		a = fileLoadDao.getList(id);
				
		model.addAttribute("lists", a);
		
		return "list";
	}
	
	//업데이트
	@RequestMapping(value = "/updateForm.do", method = RequestMethod.GET)
	public String form(int file_number, Model model){
		
		
		model.addAttribute("update", fileLoadDao.update(file_number));
		
		return "updateForm";
	}
	
	@RequestMapping(value = "/updatePro.do", method = RequestMethod.POST)
	public String update(FileInfo fileInfo){
		
		int i = 0;
		
		i = fileLoadDao.updatePro(fileInfo);
		
		if(i==1){
			return "list";
		}else{
			return "updateForm";
		}
	}
	//글쓰기
	@RequestMapping(value ="/writeForm.do", method = RequestMethod.GET)
	public String form(HttpServletRequest request, Model model){

		String id=(String) request.getSession().getAttribute("id");
		model.addAttribute("id", id);
		
		return "writeForm";
	}
	
	@RequestMapping(value="/wirtePro.do")
	public String write(FileInfo fileInfo){
		
		int i;
		i = fileLoadDao.write(fileInfo);
		
		if(i==1){
			return "loginForm";
		}else{
			
		}
		
		return "writeForm";
	}
}