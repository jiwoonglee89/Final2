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
		HashMap<String, String> map=(HashMap)model.get("download_data");
		String value = null;
		int rowNum = 0;
		for (int i = 1; i <= 100; i++) {
			Row firstRow=sheet.createRow(i-1);
			for (int j = 0; j < 26; j++) {
				Cell cell=firstRow.createCell(j);
				char c = (char)(65+j);
				value = (String)map.get(""+c+i);
				cell.setCellValue(value);
			}
			rowNum++;
		}
	}
	private Sheet createFirstView(Workbook workbook) {
		Sheet sheet = workbook.createSheet();
		workbook.setSheetName(0, "TEST");
		return sheet;
	}

	
}
