package Final.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DownloadController {
	@RequestMapping(value="/download.do")
	public ModelAndView save(HttpServletRequest request, String title) throws IOException {
		File file = new File("C:\\final_test\\"+title+".xlsx");
		FileInputStream fis = new FileInputStream(file);
		XSSFWorkbook workbook = new XSSFWorkbook(fis);
		
		HashMap download_data=new HashMap();
		download_data.put("title", title);
		download_data.put("d_workbook", workbook);
		return new ModelAndView("downView", "download_data", download_data);
	}
}
