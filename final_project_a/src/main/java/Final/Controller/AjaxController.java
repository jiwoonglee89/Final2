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
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import net.sf.json.JSONObject;

@Controller
public class AjaxController {
	
	@RequestMapping(value="/save.do", method=RequestMethod.POST)
	public void save(HttpServletRequest request, HttpServletResponse response){		
		String path=null;
		String error="#error";
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
	                  try{
	                	  cell.setCellFormula(formula);  
	                  }catch(Exception e){
	                	  cell.setCellValue(error);
	                  }
	                  
	               }
	               else if(request.getParameter(cell_num)=="true" || request.getParameter(cell_num)=="false"){
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
	    	  path="C:\\final_test\\test1.xlsx";
	         FileOutputStream fileoutputstream=new FileOutputStream(path);
	         try {
	            workbook.write(fileoutputstream);
	            fileoutputstream.close();
	            existExcel(request, response);
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      } catch (FileNotFoundException e) {
	         e.printStackTrace();
	      }
	   }
	 public void existExcel(HttpServletRequest request, HttpServletResponse res) throws IOException {
		   JSONObject json=new JSONObject();
		   List<String> cell_name=new ArrayList<String>();
		   List<String> cell_value=new ArrayList<String>();
	      DecimalFormat df = new DecimalFormat();
	      Workbook workbook = null;
	      File file = new File("C:\\final_test\\test1.xlsx");
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
	      // ��Ʈ �� (ù��°���� �����ϹǷ� 0�� �ش�)
	      // ���� �� ��Ʈ�� �б����ؼ��� FOR���� �ѹ��� �����ش�
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
	                  value = "";
	                  continue;
	               } else {
	                  // Ÿ�Ժ��� ���� �б�
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
	                        value = cell.getErrorCellValue()+"";
	                        break;
	                  }

	               }
	               cell_name.add(cellName);
	               cell_value.add(value);
	            }
	         }
	      }
	      json.put("cell_name", cell_name);
	      json.put("cell_value", cell_value);
	      res.setContentType("text/html; charset=UTF-8");
	      PrintWriter out=res.getWriter();
	      out.print(json.toString());
	   }
	   	
}