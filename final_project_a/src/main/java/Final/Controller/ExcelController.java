package Final.Controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
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
	public String tiles() {
		return "Tiles/excel_layout";
	}

	@RequestMapping("/save.do")
	public ModelAndView save(HttpServletRequest request) {
		return new ModelAndView("downView", "request", request);
	}

	@SuppressWarnings("resource")
	   @RequestMapping(value="/save1.do", method=RequestMethod.POST)
	   public String save1(HttpServletRequest request){
	      XSSFWorkbook workbook=new XSSFWorkbook();
	      XSSFSheet sheet=workbook.createSheet("sheet");
	      XSSFRow row=null;
	      XSSFCell cell=null;
	      for (int i=0;i<100;i++){
	         row=sheet.createRow(i);
	         for (int j=0;j<26;j++){
	            char c=(char)(65+j);
	            String cell_num=""+c+(i+1);
	            cell=row.createCell(j);
	            if(request.getParameter(cell_num)!=null&&request.getParameter(cell_num)!=""){
	               if(request.getParameter(cell_num).indexOf("=")==0){
	                  String formula=request.getParameter(cell_num).substring(1);
	                  cell.setCellFormula(formula);
	               }
	               if(request.getParameter(cell_num)=="true" || request.getParameter(cell_num)=="false"){
	                  cell.setCellValue(Boolean.getBoolean(request.getParameter(cell_num)));
	               }else{
	                  try{
	                     cell.setCellValue(Double.parseDouble(request.getParameter(cell_num)));
	                  }catch(NumberFormatException e){
	                     cell.setCellValue(request.getParameter(cell_num));
	                  }catch(Exception e){
	                     
	                  }
	               }
	            }
	         }
	      }
	      try {
	         FileOutputStream fileoutputstream=new FileOutputStream("F:\\final_test\\test1.xlsx");
	         try {
	            workbook.write(fileoutputstream);
	            fileoutputstream.close();
	            existExcel(request);
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      } catch (FileNotFoundException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      return "Tiles/excel_layout";
	   }

	
	
	   @SuppressWarnings("resource")
	//   @RequestMapping("/existExcel.do")
	   public void existExcel(HttpServletRequest request) throws IOException {
	      DecimalFormat df = new DecimalFormat();
	      HashMap map = new HashMap();
	      Workbook workbook = null;
	      File file = new File("F:\\final_test\\test1.xlsx");
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
	      Sheet sheet = workbook.getSheetAt(0);
	      int rows = sheet.getPhysicalNumberOfRows();
	      int colNum = 0;
	      
	      for (rowindex = 0; rowindex < rows; rowindex++) {
	         Row row = sheet.getRow(rowindex);
	         colNum = colNum + 1;

	         if (row != null) {
	            int cells = row.getPhysicalNumberOfCells();
	            
	            for (columnindex = 0; columnindex <= cells+1; columnindex++) {
	               Cell cell = row.getCell(columnindex);
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
	                         if(evaluator.evaluateFormulaCell(cell)==Cell.CELL_TYPE_NUMERIC){
	                                 double num_data = cell.getNumericCellValue();
	                                 value=df.format(num_data);
	                         }else if(evaluator.evaluateFormulaCell(cell)==Cell.CELL_TYPE_STRING){
	                               value = cell.getStringCellValue();
	                         }else if(evaluator.evaluateFormulaCell(cell)==Cell.CELL_TYPE_BOOLEAN){
	                               boolean data = cell.getBooleanCellValue();         
	                               value = String.valueOf(data);
	                         }
	                         break;
	                     case Cell.CELL_TYPE_NUMERIC:
	                         if (HSSFDateUtil.isCellDateFormatted(cell)){
	                            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
	                             value = formatter.format(cell.getDateCellValue());   
	                         } else{
	                             double ddata = cell.getNumericCellValue();   
	                             value = df.format(ddata);
	                         }
	                         break;        
	                     case Cell.CELL_TYPE_STRING:
	                        value = cell.getStringCellValue() + "";
	                        break;
	                     case Cell.CELL_TYPE_BLANK:
	                        value = "";
	                        break;
	                     case Cell.CELL_TYPE_ERROR:
	                        value = cell.getErrorCellValue() + "";
	                        break;
	                  }

	               }
	               map.put(cellName, value);

	               //request.setAttribute("rows", new Integer(rows));
	               //request.setAttribute("cells", new Integer(cells));
	            }
	         }
	      }
	      request.setAttribute("map", map);
	      //return new ModelAndView("excel_final", "map", map);
	      
	   }
	   
	   
	/*
	 * @RequestMapping("/existExcel.do") public ModelAndView existExcel(String
	 * title) throws FileNotFoundException {
	 * 
	 * File file = new File("C:/Users/wonmo/Desktop/123.xls");
	 * 
	 * return new ModelAndView("uploadExcelView", "file", file); }
	 */
	
}