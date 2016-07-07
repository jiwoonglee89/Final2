package Final.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DownloadController {
	private WebApplicationContext  context = null;
	
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.context=(WebApplicationContext)applicationContext;
	}
	@RequestMapping(value="/download.do")
	public ModelAndView download(HttpServletRequest request) throws Exception{
		File downloadFile = getFile(request);
		return new ModelAndView("downView", "downloadFile", downloadFile);
		
	}
	private File getFile(HttpServletRequest request) {
		//String path = context.getServletContext().getRealPath("/WEB-INF/Ό³Έν.txt");
		String path="C:\\final_test\\"+session_Title(request)+".xlsx";
		return new File(path);
	}
	public String session_Title(HttpServletRequest request){
		HttpSession session = request.getSession();
		String title = (String) session.getAttribute("title");
		return title;
	}
}
