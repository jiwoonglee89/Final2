package Final.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Final.Dao.MemberDao;
import Final.Model.MemberInfo;


	

	@Controller
	public class IdPwSearchController  {
	
	@Autowired
	MemberDao memberDao;
	
	
	public void setMemberDao(MemberDao memberDao){
		this.memberDao=memberDao;
		
	}
	//비밀번호를 찾는경우
	@RequestMapping("/pwSearch.do")
	public String action1(MemberInfo memberInfo, Model model, HttpServletRequest request){
		
		String id = request.getParameter("id");
		String phone = request.getParameter("phone");
		String birth = request.getParameter("birth");
		
		String password = memberDao.pwSearch(memberInfo);

		if(password==null){
			String message="일치하는 회원정보가 없습니다.";
			model.addAttribute("message",message);
		}else {
			String message = null;
			model.addAttribute("message", message);
			model.addAttribute("password", password);
			System.out.println(password);
		}
	
		return "/loginPage/pwSearch";
	}
	//아이디를 찾는경우
	@RequestMapping("/idSearch.do")
	public String requestPro11(HttpServletRequest request,MemberInfo memberInfo, Model model){
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		String id=memberDao.idSearch(memberInfo);
		
		if(id==null){
			String message="일치하는 아이디가 없습니다.";
			model.addAttribute("message",message);
		} else{
			String message=null;
			model.addAttribute("message",message);
			model.addAttribute("id", id);
			}
		
		return "/loginPage/idSearch";
	}
}
