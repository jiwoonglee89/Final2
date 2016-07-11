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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import Final.Dao.FileLoadDao;
import Final.Model.FileInfo;
import net.sf.json.JSONObject;

@Controller
public class ExcelController {
	@Autowired
	private FileLoadDao fileLoadDao;

	public void setFileLoadDao(FileLoadDao fileLoadDao) {
		this.fileLoadDao = fileLoadDao;
	}
	
	//타이틀 세션에저장
	public String session_Title(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String title = (String) session.getAttribute("title");
		return title;
	}
	
	//시트에맞는 엑셀 불러와서 map에 저장
	public HashMap getData(XSSFWorkbook workbook,int sheetNum){
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

	//board에서 엑셀파일목록 클릭시 불러오기
	@RequestMapping(value="/excel.do",method=RequestMethod.GET)
	public String selectExcel(String title, HttpServletRequest request) throws IOException {

		HashMap map = null;
	
		
		HttpSession session = request.getSession();
		session.setAttribute("title", title);

		File file = new File("C://final_test//" + title + ".xlsx");
		FileInputStream fis = new FileInputStream(file);
		XSSFWorkbook workbook = new XSSFWorkbook(fis);

		
		int sheetNum = (workbook.getNumberOfSheets())-1;

		map = getData(workbook, sheetNum);
		
		request.setAttribute("map", map);
		request.setAttribute("tagNum", sheetNum);
		request.setAttribute("sheetNum", sheetNum);

		return "Tiles/excel_layout";
	} 
	
	//기존엑셀파일 불러오기
	@RequestMapping(value="/load.do", method = RequestMethod.POST)
	public String load(MultipartHttpServletRequest request) throws IllegalStateException, IOException{
		MultipartFile file= request.getFile("file");
		HashMap map = null;
		File nfile = null;
		if (file.isEmpty()) {
			System.out.println("파일없음");
		}else {
			int xlsx = file.getOriginalFilename().lastIndexOf(".");
			String file_name = (file.getOriginalFilename().substring(0,xlsx));
			nfile = new File("C://final_test//"+file_name+".xlsx");
			//사용자 기존엑셀파일 서버에 복사
			file.transferTo(nfile);
			HttpSession session = request.getSession();
			session.setAttribute("title", file_name);
		}
		FileInputStream fis = new FileInputStream(nfile);
		XSSFWorkbook workbook = new XSSFWorkbook(fis);
		
		int sheetNum = (workbook.getNumberOfSheets())-1;
		
		map = getData(workbook, sheetNum);
		
		request.setAttribute("map", map);
		request.setAttribute("tagNum", sheetNum);
		request.setAttribute("sheetNum", sheetNum);

		return "Tiles/excel_layout";
	}

	//사용자 엑셀생성
	@RequestMapping("/tiles.do")
	public String tiles(String title, HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		session.setAttribute("title", title);
		String path = null;

		XSSFWorkbook workbook = new XSSFWorkbook();

		XSSFSheet sheet = workbook.createSheet();

		try {
			path = "C:\\final_test\\" + session_Title(request) + ".xlsx";
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
		request.setAttribute("title", title);
		request.setAttribute("sheetNum", 0);
		return "Tiles/excel_layout";
	}

	//사용자 엑셀파일저장
	@RequestMapping(value = "/save1.do", method = RequestMethod.POST)
	public void save1(HttpServletRequest request, HttpServletResponse res) throws IOException {
		String path = null;
		JSONObject json = new JSONObject();
		List<String> cell_name = new ArrayList<String>();
		List<String> cell_value = new ArrayList<String>();
		DecimalFormat df = new DecimalFormat();
		String cellName = "";
		int rowindex = 0;
		int columnindex = 0;
		String title = session_Title(request);
		
		File file = new File("C://final_test//" + title + ".xlsx");
		FileInputStream fis = new FileInputStream(file);
		XSSFWorkbook workbook = new XSSFWorkbook(fis);

		XSSFRow row = null;
		XSSFCell cell = null;
		// 시트 이름
		int sheetNum = Integer.parseInt(request.getParameter("sheetNum"));

		XSSFSheet sheet = workbook.getSheetAt(sheetNum-1);
		System.out.println("저장에서 sheetNum:::"+(sheetNum-1));
		FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
		
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
		try {
			path = "C:\\final_test\\"+title+".xlsx";
			FileOutputStream fileoutputstream = new FileOutputStream(path);
			try {
				workbook.write(fileoutputstream);
				fileoutputstream.close();
				existExcel(request, res, title);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}

		request.setAttribute("tagNum", sheetNum);
		request.setAttribute("sheetNum", sheetNum);
		
		
		FileInfo fileinfo = new FileInfo();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		fileinfo.setId(id);
		fileinfo.setTitle(session_Title(request));
		fileinfo.setPath(path);
		fileLoadDao.save(fileinfo);
	}
	
	//엑셀파일 제이슨에 담기
	public void existExcel(HttpServletRequest request, HttpServletResponse res,String title) throws IOException {
		JSONObject json = new JSONObject();
		List<String> cell_name = new ArrayList<String>();
		List<String> cell_value = new ArrayList<String>();
		DecimalFormat df = new DecimalFormat();
		Workbook workbook = null;
		File file = new File("C:\\final_test\\"+title+".xlsx");
		FileInputStream fis = new FileInputStream(file);
		if (file.getName().endsWith(".xls")) {
			workbook = new HSSFWorkbook(fis);
		} else {
			workbook = new XSSFWorkbook(fis);
		}

		FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();

		String cellName = "";
		int rowindex = 0;
		int columnindex = 0;
		// 시트 수 (첫번째에만 존재하므로 0을 준다)
		// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
		int sheetNum = workbook.getNumberOfSheets();
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
		out.print(json.toString());
	}

}