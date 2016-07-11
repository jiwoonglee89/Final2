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
import org.springframework.stereotype.Component;

import net.sf.json.JSONObject;

@Component
public class CommonMethod {

	// 세션에있는 title 가져오기
	public String session_Title(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String title = (String) session.getAttribute("title");
		return title;
	}

	// 시트에맞는 엑셀 불러와서 map에 저장
	public HashMap getData(XSSFWorkbook workbook, int sheetNum) {
		HashMap map = new HashMap();
		String cellName = "";
		int rowindex = 0;
		int columnindex = 0;
		FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();

		XSSFSheet sheet = workbook.getSheetAt(sheetNum);

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
						value = " ";
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
					map.put(cellName, value);

					// request.setAttribute("rows", new Integer(rows));
					// request.setAttribute("cells", new Integer(cells));
				}
			}
		}
		return map;
	}

	// 데이터가져와서 삽입
	public void insertData(XSSFWorkbook workbook, int sheetNum, HttpServletRequest request) {
		XSSFSheet sheet = workbook.getSheetAt(sheetNum);
		XSSFRow row = null;
		XSSFCell cell = null;

		for (int i = 0; i < 100; i++) {
			row = sheet.createRow(i);
			for (int j = 0; j < 26; j++) {
				char c = (char) (65 + j);
				String cell_num = "" + c + (i + 1);
				cell = row.createCell(j);
				if (request.getParameter(cell_num) != null && request.getParameter(cell_num) != "") {
					if (request.getParameter(cell_num).indexOf("=") == 0) {
						String formula = request.getParameter(cell_num).substring(1);
						try {
							cell.setCellFormula(formula);
						} catch (Exception e) {
							cell.setCellErrorValue(FormulaError.NAME);
						}

					} else if (request.getParameter(cell_num) == "true" || request.getParameter(cell_num) == "false") {
						cell.setCellValue(Boolean.getBoolean(request.getParameter(cell_num)));
					} else {
						try {
							cell.setCellValue(Double.parseDouble(request.getParameter(cell_num)));
						} catch (NumberFormatException e) {
							cell.setCellValue(request.getParameter(cell_num));
						} catch (Exception e) {

						}
					}
				}
			}
		}
	}
	
	
	public void inputJson(HttpServletResponse res,List<String> cell_name, List<String> cell_value) throws IOException{
		JSONObject json = new JSONObject();
		
		json.put("cell_name", cell_name);
		json.put("cell_value", cell_value);
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		out.print(json.toString());
		
	}
}