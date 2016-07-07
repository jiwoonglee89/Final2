package Final.View;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractXlsView;

@Component("downView")
public class DownloadView extends AbstractXlsView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HashMap map=(HashMap)model.get("download_data");
		response.setHeader("Content-Disposition", "attachment; filename=\""+map.get("title")+".xls\";"); 
		//sheet 만들기
		workbook=(XSSFWorkbook)map.get("d_workbook");
		int totalsheetNum = workbook.getNumberOfSheets();
		
		for(int i=0;i<totalsheetNum;i++){
			XSSFSheet sheet = (XSSFSheet)workbook.getSheetAt(i);
			int rows = sheet.getPhysicalNumberOfRows();
			int colNum = 0;
			int rowindex = 0;
			int columnindex = 0;
			String cellName = "";
			FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
			DecimalFormat df = new DecimalFormat();
			for (rowindex = 0; rowindex < rows; rowindex++) {
				Row row = sheet.getRow(rowindex);
				colNum = colNum + 1;

				if (row != null) {
					int cells = row.getPhysicalNumberOfCells();

					for (columnindex = 0; columnindex <= cells + 1; columnindex++) {
						Cell cell = row.getCell(columnindex);
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
									double num_data = cell.getNumericCellValue();
									value = df.format(num_data);
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
					}
				}
			}
		}
	}
}
