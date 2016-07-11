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
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FormulaError;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Final.Dao.FileLoadDao;
import net.sf.json.JSONObject;

@Controller
public class SheetController extends CommonMethod{

	@Autowired
	private FileLoadDao fileLoadDao;

	public void setFileLoadDao(FileLoadDao fileLoadDao) {
		this.fileLoadDao = fileLoadDao;
	}

	// ��Ʈ ����
	@RequestMapping("/deletesheet.do")
	public void delete_sheet(HttpServletRequest request, HttpServletResponse res) throws IOException {
		JSONObject json = new JSONObject();
		List<String> cell_name = new ArrayList<String>();
		List<String> cell_value = new ArrayList<String>();
		DecimalFormat df = new DecimalFormat();
		
		String title = session_Title(request);
		String path ="C:\\final_test\\"+title+".xlsx";
		//String path = fileLoadDao.getPath(title);
		File file = new File(path);

		FileInputStream fis = new FileInputStream(file);
		XSSFWorkbook workbook = new XSSFWorkbook(fis);

		int sheetNum = Integer.parseInt(request.getParameter("sheetNum"));
		// ��Ʈ����
		workbook.removeSheetAt(sheetNum);
		
		
		try {
			
			FileOutputStream fileoutputstream = new FileOutputStream(path);
			try {
				workbook.write(fileoutputstream);
				fileoutputstream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

		file = new File(path);
		fis = new FileInputStream(file);
		workbook = new XSSFWorkbook(fis);

		HashMap map = getData(workbook, sheetNum - 1);

		Iterator keys = map.keySet().iterator();
		while (keys.hasNext()) {
			String key = (String) keys.next();
			cell_name.add(key);
			cell_value.add((String) map.get(key));
		}

		inputJson(res, cell_name, cell_value);

	}
	// ��Ʈ�߰�

	@RequestMapping(value = "/plus.do", method = RequestMethod.POST)
	public void sheet_plus(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String title = session_Title(request);
		//String path = fileLoadDao.getPath(title);
		String path ="C:\\final_test\\"+title+".xlsx";
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		XSSFWorkbook workbook = new XSSFWorkbook(fis);

		insertData(workbook, 0, request);

		workbook.createSheet();

		try {
			FileOutputStream fileoutputstream = new FileOutputStream(path);
			try {
				workbook.write(fileoutputstream);
				fileoutputstream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/plus2.do", method = RequestMethod.POST)
	public void save(HttpServletRequest request, HttpServletResponse response) throws IOException {
		XSSFRow row = null;
		XSSFCell cell = null;
		String title = session_Title(request);
		//String path = fileLoadDao.getPath(title);
		String path="C:\\final_test\\"+title+".xlsx";
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		XSSFWorkbook workbook = new XSSFWorkbook(fis);

		int totalsheetNum = Integer.parseInt(request.getParameter("totalsheetNum"));

		insertData(workbook, totalsheetNum - 1, request);

		workbook.createSheet();
		try {
			FileOutputStream fileoutputstream = new FileOutputStream(path);
			try {
				workbook.write(fileoutputstream);
				fileoutputstream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/sheet.do", method = RequestMethod.POST)
	public void existExcel(HttpServletRequest request, HttpServletResponse res) throws IOException {
		System.out.println("sheet.do");
		JSONObject json = new JSONObject();
		List<String> cell_name = new ArrayList<String>();
		List<String> cell_value = new ArrayList<String>();
		DecimalFormat df = new DecimalFormat();
		
		String title = session_Title(request);
		//String path = fileLoadDao.getPath(title);
		String path = "C:\\final_test\\"+title+".xlsx";
		File file = new File(path);

		
		FileInputStream fis = new FileInputStream(file);
		XSSFWorkbook workbook = new XSSFWorkbook(fis);

		// ��Ʈ �� (ù��°���� �����ϹǷ� 0�� �ش�)
		// ���� �� ��Ʈ�� �б����ؼ��� FOR���� �ѹ��� �����ش�

		int sheetNum = Integer.parseInt(request.getParameter("sheetNum"));

		HashMap map = getData(workbook, sheetNum);

		Iterator keys = map.keySet().iterator();
		while (keys.hasNext()) {
			String key = (String) keys.next();
			cell_name.add(key);
			cell_value.add((String) map.get(key));
		}

		inputJson(res, cell_name, cell_value);
	}
}