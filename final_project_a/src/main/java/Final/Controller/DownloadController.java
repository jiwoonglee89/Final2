package Final.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DownloadController {
	public String session_Title(HttpServletRequest request){
		HttpSession session = request.getSession();
		String title = (String) session.getAttribute("title");
		return title;
	}
	@RequestMapping(value="/download.do")
	public ModelAndView save(HttpServletRequest request) throws IOException {
		File file = new File("C:\\final_test\\"+session_Title(request)+".xlsx");
		FileInputStream fis = new FileInputStream(file);
		XSSFWorkbook workbook = new XSSFWorkbook(fis);
		
		HashMap download_data=new HashMap();
		download_data.put("title", session_Title(request));
		download_data.put("d_workbook", workbook);
		return new ModelAndView("downView", "download_data", download_data);
	}
}
