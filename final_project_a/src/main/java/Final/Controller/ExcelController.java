package Final.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.FormulaError;
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
public class ExcelController extends CommonMethod{
	@Autowired
	private FileLoadDao fileLoadDao;

	public void setFileLoadDao(FileLoadDao fileLoadDao) {
		this.fileLoadDao = fileLoadDao;
	}
	
	//타이틀 세션에저장
	
	
	//board에서 엑셀파일목록 클릭시 불러오기
	@RequestMapping(value="/excel.do",method=RequestMethod.GET)
	public String selectExcel(String title, HttpServletRequest request) throws IOException {

		HttpSession session = request.getSession();
		session.setAttribute("title", title);
		//String path = fileLoadDao.getPath(title);
		String path = "C:\\final_test\\"+title+".xlsx";
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		XSSFWorkbook workbook = new XSSFWorkbook(fis);

		
		int sheetNum = (workbook.getNumberOfSheets())-1;

		HashMap map = getData(workbook, sheetNum);
		
		request.setAttribute("map", map);
		request.setAttribute("tagNum", sheetNum);
		request.setAttribute("sheetNum", sheetNum);

		return "Tiles/excel_layout";
	} 
	
	//기존엑셀파일 불러오기
	@RequestMapping(value="/load.do", method = RequestMethod.POST)
	public String load(MultipartHttpServletRequest request) throws IllegalStateException, IOException{
		MultipartFile file= request.getFile("file");
		File nfile = null;
		if (file.isEmpty()) {
			System.out.println("파일없음");
		}else {
			int index = file.getOriginalFilename().lastIndexOf(".");
			String file_name = (file.getOriginalFilename().substring(0,index));
			nfile = new File("C://final_test//"+file_name+".xlsx");
			//사용자 기존엑셀파일 서버에 복사
			file.transferTo(nfile);
			HttpSession session = request.getSession();
			session.setAttribute("title", file_name);
		}
		FileInputStream fis = new FileInputStream(nfile);
		XSSFWorkbook workbook = new XSSFWorkbook(fis);
		
		int sheetNum = (workbook.getNumberOfSheets())-1;
		
		HashMap map = getData(workbook, sheetNum);
		
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
			path = "C://final_test//" + title + ".xlsx";
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
		DecimalFormat df = new DecimalFormat();
		String title = session_Title(request);
		//String path = fileLoadDao.getPath(title);
		String path = "C:\\final_test\\"+title+".xlsx";
		File file = new File(path);
		
		FileInputStream fis = new FileInputStream(file);
		XSSFWorkbook workbook = new XSSFWorkbook(fis);

		XSSFRow row = null;
		XSSFCell cell = null;
		// 시트 이름
		int sheetNum = Integer.parseInt(request.getParameter("sheetNum"));

		insertData(workbook, sheetNum-1, request);
		
		try {
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
		fileinfo.setTitle(title);
		fileinfo.setPath(path);
		
		int count=0;
		List<String> titles=fileLoadDao.get_title(id);
		for(String t:titles){
			if(t.equals(title)){
				count++;
			}
		}
		if(count>0){
			fileLoadDao.update_file(fileinfo);
		}else{
			fileLoadDao.save(fileinfo);
		}
	}
	
	//엑셀파일 제이슨에 담기
	public void existExcel(HttpServletRequest request, HttpServletResponse res,String title) throws IOException {
		JSONObject json = new JSONObject();
		List<String> cell_name = new ArrayList<String>();
		List<String> cell_value = new ArrayList<String>();
		DecimalFormat df = new DecimalFormat();
		XSSFWorkbook workbook = null;
		//퍼일경로 
		//String path = fileLoadDao.getPath(title);
		String path = "C:\\final_test\\"+title+".xlsx";
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		workbook = new XSSFWorkbook(fis);
		int sheetNum = workbook.getNumberOfSheets();
		
		HashMap map = getData(workbook, (sheetNum-1));
		
		//map에서 key값 value값 array에 입력
		Iterator keys = map.keySet().iterator();
		while (keys.hasNext()) {
			String key = (String) keys.next();
			cell_name.add(key);
			cell_value.add((String) map.get(key));
		}
	
		inputJson(res, cell_name, cell_value);
	}
}