package Final.Controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.bind.annotation.RequestMapping;

public class SheetController {
	@RequestMapping("/plus.do")
	public String plus(){
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet sheet = workbook.createSheet();
		sheet = workbook.createSheet();
		try {
			String path = "F:\\final_test\\test1.xlsx";
			FileOutputStream fileoutputstream = new FileOutputStream(path);
			try {
				workbook.write(fileoutputstream);
				fileoutputstream.close();
				}catch(Exception e){
				}
		}catch(Exception e){
		}
		return "excel_layout";
	}

	// 시트추가
	@RequestMapping("/sheet.do")
	public String plus_sheet(HttpServletRequest request) {
		String path = null;
		String error = "#error";
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFRow row = null;
		XSSFCell cell = null;

		// 시트 이름
		// int sheetNum = Integer.parseInt(request.getParameter("sheetNum"));

		for (int z = 0; z < 1; z++) {
			XSSFSheet sheet = workbook.createSheet("sheet" + z);

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
								cell.setCellValue(error);
							}

						} else if (request.getParameter(cell_num) == "true"
								|| request.getParameter(cell_num) == "false") {
							cell.setCellValue(Boolean.getBoolean(request.getParameter(cell_num)));
						} else {
							try {
								cell.setCellValue(Double.parseDouble(request.getParameter(cell_num)));
							} catch (NumberFormatException e) {
								cell.setCellValue(request.getParameter(cell_num));
							} catch (Exception e) {

							}
						}
					} else {
						cell.setCellValue("");
					}
				}
			}
		}
		try {
			path = "F:\\final_test\\test1.xlsx";
			FileOutputStream fileoutputstream = new FileOutputStream(path);
			try {
				workbook.write(fileoutputstream);
				fileoutputstream.close();
				//existExcel(request);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "excel_layout";
	}
}
