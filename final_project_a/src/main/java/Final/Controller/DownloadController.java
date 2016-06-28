package Final.Controller;

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DownloadController {
	@RequestMapping(value="/download.do")
	public ModelAndView save(HttpServletRequest request) {
		HashMap<String, String> download_data=new HashMap<String, String>();
		for (int i=1;i<=100;i++){
			for (int j=0;j<26;j++){
				char c=(char)(65+j);
				download_data.put(""+c+i, request.getParameter(""+c+i));
			}
		}
		return new ModelAndView("downView", "download_data", download_data);
	}
}
