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
		System.out.println(request.getParameter("sheetNum"));
		
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
		
		/*FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();

		String cellName = "";
		int rowindex = 0;
		int columnindex = 0;
		// 시트 수 (첫번째에만 존재하므로 0을 준다)
		// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
		for (int i = 0; i < sheetNum; i++) {
			Sheet sheet = workbook.getSheetAt(i);
			int rows = sheet.getPhysicalNumberOfRows();
			int colNum = 0;

			for (rowindex = 0; rowindex < rows; rowindex++) {
				Row row = sheet.getRow(rowindex);
				colNum = colNum + 1;

				if (row != null) {
					int cells = row.getPhysicalNumberOfCells();

					for (columnindex = 0; columnindex <= cells + 1; columnindex++) {
						XSSFCell cell = (XSSFCell) row.getCell(columnindex);
						char rowrowrow = (char) (65 + columnindex);
						cellName = rowrowrow + "" + colNum;
						String value = "";

						if (cell == null) {
							value = "";
							continue;
						} else {
							// 타입별로 내용 읽기
							switch (cell.getCellType()) {
							case Cell.CELL_TYPE_BOOLEAN:
								boolean bool_data = cell.getBooleanCellValue();
								value = String.valueOf(bool_data);
								break;
							case Cell.CELL_TYPE_FORMULA:
								if (evaluator.evaluateFormulaCell(cell) == Cell.CELL_TYPE_NUMERIC) {
									String ddata = Double.toString(cell.getNumericCellValue());
									if (ddata.endsWith(".0")) {
										String[] arr = ddata.split("\\.");
										value = arr[0];
									} else {
										value = ddata;
									}
								} else if (evaluator.evaluateFormulaCell(cell) == Cell.CELL_TYPE_STRING) {
									value = cell.getStringCellValue();
								} else if (evaluator.evaluateFormulaCell(cell) == Cell.CELL_TYPE_BOOLEAN) {
									boolean data = cell.getBooleanCellValue();
									value = String.valueOf(data);
								}
								break;
							case Cell.CELL_TYPE_NUMERIC:
								if (HSSFDateUtil.isCellDateFormatted(cell)) {
									SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
									value = formatter.format(cell.getDateCellValue());
								} else {
									String ddata = Double.toString(cell.getNumericCellValue());
									if (ddata.endsWith(".0")) {
										String[] arr = ddata.split("\\.");
										value = arr[0];
									} else {
										value = ddata;
									}
								}
								break;
							case Cell.CELL_TYPE_STRING:
								value = cell.getStringCellValue() + "";
								break;
							case Cell.CELL_TYPE_BLANK:
								value = "";
								break;
							case Cell.CELL_TYPE_ERROR:
								value = cell.getErrorCellString();
								break;
							}

						}
						cell_name.add(cellName);
						cell_value.add(value);
					}
				}
			}
		}
		json.put("cell_name", cell_name);
		json.put("cell_value", cell_value);
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.print(json.toString());*/
	}

}
