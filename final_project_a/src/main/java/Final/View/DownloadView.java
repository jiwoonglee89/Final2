package Final.View;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractXlsView;

@Component("downView")
public class DownloadView extends AbstractXlsView{

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		response.setHeader("Content-Disposition", "attachment; filename=\"abc.xls\";"); 
		//sheet 만들기
		Sheet sheet = createFirstView(workbook);
		//label 만들기
		String value = null;
		int rowNum = 0;
		for (int i = 0; i < 100; i++) {
			for (int j = 0; j < 26; j++) {
				char c = (char)(65+j);
				String str = ""+c+i;
				value = (String)model.get(str);
				createRow_insertValue(sheet,value,j, rowNum);
			}
			rowNum++;
		}
	}

	private void createRow_insertValue(Sheet sheet, String value, int j, int rowNum) {
		//열을 만들어준다
		Row firstRow = sheet.createRow(rowNum);
		Cell cell = firstRow.createCell(j);
		//각 셀에 값입력
		cell.setCellValue(value);
	}

	private Sheet createFirstView(Workbook workbook) {
		Sheet sheet = workbook.createSheet();
		workbook.setSheetName(0, "TEST");
		return sheet;
	}

	
}
