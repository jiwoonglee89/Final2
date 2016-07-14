package Final.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FormulaError;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import net.sf.json.JSONObject;

@Controller
public class AjaxController extends CommonMethod {
	@RequestMapping(value = "/save.do", method = RequestMethod.POST)
	public void save(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String path = null;
		File file = new File("C://final_test//"+session_Title(request)+".xlsx");
	    FileInputStream fis = new FileInputStream(file);
		XSSFWorkbook workbook = new XSSFWorkbook(fis);
		XSSFRow row = null;
		XSSFCell cell = null;

		
		int sheetNum = Integer.parseInt(request.getParameter("sheetNum"));
		
		insertData(workbook, sheetNum, request);

		try {
			path = "C:\\final_test\\"+session_Title(request)+".xlsx";
			FileOutputStream fileoutputstream = new FileOutputStream(path);
			try {
				workbook.write(fileoutputstream);
				fileoutputstream.close();
				existExcel(request, response,session_Title(request));
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}

	public void existExcel(HttpServletRequest request, HttpServletResponse res,String title) throws IOException {
		JSONObject json = new JSONObject();
		List<String> cell_name = new ArrayList<String>();
		List<String> cell_value = new ArrayList<String>();
		DecimalFormat df = new DecimalFormat();
	
		File file = new File("C:\\final_test\\"+title+".xlsx");
		FileInputStream fis = new FileInputStream(file);
		XSSFWorkbook workbook = new XSSFWorkbook(fis);

		int sheetNum = workbook.getNumberOfSheets();
		HashMap map = getData(workbook, (sheetNum-1));
		
		Iterator keys = map.keySet().iterator();
		while (keys.hasNext()) {
			String key = (String) keys.next();
			cell_name.add(key);
			cell_value.add((String) map.get(key));
		}
		
		inputJson(res, cell_name, cell_value);
	}

}
