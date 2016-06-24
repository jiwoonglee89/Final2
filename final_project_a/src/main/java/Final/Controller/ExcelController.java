package Final.Controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Final.Dao.FileLoadDao;

@Controller
public class ExcelController {
	@Autowired
	private FileLoadDao fileLoadDao;

	public void setFileLoadDao(FileLoadDao fileLoadDao) {
		this.fileLoadDao = fileLoadDao;
	}

	@RequestMapping("/newExcel.do")
	public String form() {
		return "NewFile";
	}
	
	@RequestMapping("/tiles.do")
	public String tiles(){
		return "Tiles/excel_layout";
	}
	
	@RequestMapping("/save.do")
	public ModelAndView save(HttpServletRequest request){
		;
		return new ModelAndView("downView","request",request);
	}

	/*
	 * @RequestMapping("/existExcel.do") public ModelAndView existExcel(String
	 * title) throws FileNotFoundException {
	 * 
	 * File file = new File("C:/Users/wonmo/Desktop/123.xls");
	 * 
	 * return new ModelAndView("uploadExcelView", "file", file); }
	 */

	// 기존엑셀파일 불러오기
	@SuppressWarnings("resource")
	@RequestMapping("/existExcel.do")
	public String existExcel(HttpServletRequest request) throws IOException {

		Map map = new HashMap();
		Workbook workbook = null;

		File file = new File("C:/Users/user2/Downloads/Formulas.xlsx");
		FileInputStream fis = new FileInputStream(file);
		
		if (file.getName().endsWith(".xls")) {
			workbook = new HSSFWorkbook(fis);
		} else {
			workbook = new XSSFWorkbook(fis);
		}

		String cellName = "";
		int rowindex = 0;
		int columnindex = 0;
		// 시트 수 (첫번째에만 존재하므로 0을 준다)
		// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
		Sheet sheet = workbook.getSheetAt(0);
		int rows = sheet.getPhysicalNumberOfRows();
		int colNum = 0;

		System.out.println("rows:::"+rows);
		
		for (rowindex = 0; rowindex < rows; rowindex++) {
			Row row = sheet.getRow(rowindex);

			colNum = colNum + 1;

			if (row != null) {
				int cells = row.getPhysicalNumberOfCells();
				System.out.println("cells:::"+cells);
				request.setAttribute("cells", new Integer(colNum));
				
				for (columnindex = 0; columnindex <= cells+1; columnindex++) {
					Cell cell = row.getCell(columnindex);

					char rowrowrow = (char) (65 + columnindex);

					System.out.println("rows:::" + rowrowrow + "cells:::" + colNum);
					
					cellName = rowrowrow + "" + colNum;

					String value = "";
					if (cell == null) {
						value = " ";
						continue;
					} else {
						// 타입별로 내용 읽기
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_FORMULA:
							value = "="+cell.getCellFormula();
							break;
						case Cell.CELL_TYPE_NUMERIC:
							value = cell.getNumericCellValue() + "";
							break;
						case Cell.CELL_TYPE_STRING:
							value = cell.getStringCellValue() + "";
							break;
						case Cell.CELL_TYPE_BLANK:
							value = cell.getBooleanCellValue() + "";
							break;
						case Cell.CELL_TYPE_ERROR:
							value = cell.getErrorCellValue() + "";
							break;
						}

					}
					System.out.println("cellName:::" + cellName);
					map.put(cellName, value);
					request.setAttribute("key", cellName);
					request.setAttribute("value", value);
					request.setAttribute("map", map);
					request.setAttribute("rows", new Integer(rows));
					

					System.out.println("셀 내용 :" + value);
					// cell 은 값
				}
			}
		}
		return "Tiles/excel_layout";
	}

	// 삭제 ㄴㄴ
	/*
	 * @RequestMapping("/existExcel.do") public ModelAndView existExcel(String
	 * title) throws FileNotFoundException {
	 * 
	 * FileInfo fileInfo = fileLoadDao.path(title); String path =
	 * fileInfo.getPath(); FileInputStream fis = null;
	 * 
	 * if (fileInfo != null) {
	 * 
	 * fis = new FileInputStream(path); }
	 * 
	 * return new ModelAndView("uploadExcelView", "fis", fis); }
	 */

	@RequestMapping("/readTxt.do")
	public ModelAndView readTxtFile(String path) {

		ModelAndView mav = new ModelAndView("test");
		Map map = new HashMap();
		File file = new File("C:/Users/wonmo/Desktop/123.txt");
		// 수정필
		try {

			BufferedReader br = new BufferedReader(new FileReader(file));

			String s;
			int a;
			String value = null;
			char i = 64;
			int j = 1;
			for (int size =0; size<20; size++) {
				for (int colLine = 0; colLine < 26; colLine++) {

					value = br.readLine();
					i = (char) (i + 1);

					

					String colName = i + "" + j;
					map.put(colName, value);
					
					System.out.println("colName::" + colName);
					System.out.println("value::" + value);
					
					if (value==null) {
						br.close();
					}

				}

				

				i = 64;
				j = j + 1;
					

				mav.addObject("map", map);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}
}