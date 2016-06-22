package Final.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Final.Dao.FileLoadDao;
import Final.Dao.MemberDao;
import Final.Dao.ZipcodeDao;
import Final.Model.MemberInfo;

@Controller
public class MemberController {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private FileLoadDao fileLoadDao;
	@Autowired
	private ZipcodeDao zipcodeDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public void setFileLoadDao(FileLoadDao fileLoadDao) {
		this.fileLoadDao = fileLoadDao;
	}
	
	public void setZipcodeDao(ZipcodeDao zipcodeDao)
	{
		this.zipcodeDao = zipcodeDao;
	}

	@ModelAttribute("memberInfo")
	public MemberInfo memberInfo() {
		return new MemberInfo();
	}
	
	//로그인 화면 이동(id 존재여부에따라 view 나뉨)
	@RequestMapping("/loginForm.do")
	public String login() {

		return "loginPage/loginForm";
	}
	//로그인 하기
	@RequestMapping("/login.do")
	public String loginPro(HttpServletRequest request)
	{
		String id = request.getParameter("id");
		String pass = request.getParameter("password");
		HttpSession session = request.getSession();
		
		MemberInfo memberInfo = memberDao.getMember(id);
		if (memberInfo !=null){
			if(memberInfo.getPassword().equals(pass))
			{
				session.setAttribute("id", id);
			}else{
				request.setAttribute("fail", "fail");
				return "loginPage/loginForm";
			}
		}else{
			request.setAttribute("fail", "fail");
			return "loginPage/loginForm";
		}
		return "loginPage/loginPro";
	}

	//회원가입 화면으로 이동 
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String joinMove()
	{
		return "joinPage/join";
	}
	//회원가입 후 메인으로 이동
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join(@ModelAttribute("memberInfo") MemberInfo memberInfo, HttpServletRequest request)
	{
		//이메일주소 종류("선택입력","직접입력")의 따라 이메일 재구성
		String emailID = request.getParameter("emailID");
		String email = request.getParameter("email");
		String emailAddress = request.getParameter("emailAddress");
		
		//직접 입력을 선택한경우
		if(email.equals("1"))
		{
			String email1 = emailID+"@"+emailAddress;
			email = email1;
			
			 System.out.println("emil에 대입될 값 : : : "+ email1 );
			 System.out.println("저장될 email 주소 : : : "+ email );
		}
		//select option에서 체크한경우
		else
		{
			String email2 = emailID+"@"+email;
			email = email2;
			
			 System.out.println("emil에 대입될 값: : :"+email2);
			 System.out.println("저장될 email 주소 : : : "+ email );
		}
		//생년월일 재구성
		String year = request.getParameter("birthY");
		String month = request.getParameter("birthM");
		String day = request.getParameter("birthD");
		String birth = year+"-"+month+"-"+day;
		System.out.println(birth);
		
		memberInfo.setBirth(birth);
		memberInfo.setEmail(email);
		
		//데이터 삽입을 확인하기 위한 변수 선언
		int success=0;
		success=memberDao.insert(memberInfo);
		//데이터 삽입 성공여부를 확인하기위해 출력
		System.out.println(success);
		
		return "loginPage/loginForm";

	}
	//아이디와비밀번호 찾는 화면으로 이동
	@RequestMapping("/idpwSearchNew.do")
	public String idpwSearchNew() {
		return "loginPage/idpwSearchNew";
	}
	//아이디 중복화면 관련 
	@RequestMapping("/confirmId.do")
	public String confirmID(Model model, HttpServletRequest request) {
		// 아이디 중복 여부 변수
		int check = 0;
		// view에서 받은 id변수 값 받아서 Stirng 형식의 id 변수에 저장
		String id = request.getParameter("id");
		MemberInfo member = null;
		// DB에서 ID있는지 확인
		member = memberDao.getMember(id);

		if (member == null) {
			// DB에 ID가 없는경우
			check = 1;

		} else {
			// DB에 ID가 있는 경우
			check = 0;
		}
		model.addAttribute("check", check);
		return "joinPage/confirmId";
	}
	//회원 정보 수정 화면 이동
	@RequestMapping("/modifyForm.do")
	public ModelAndView modifyForm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		//System.out.println("세션에 저장된 ID값: : :"+id);
		ModelAndView mav = new ModelAndView("Mypage/modifyForm");
		MemberInfo member = memberDao.modifyForm(id);

		//메일값 잘라넣기
		String mail_array[] = member.getEmail().split("@");
		request.setAttribute("emailID", mail_array[0]);
		request.setAttribute("emailAddress", mail_array[1]);
		
		//생일값 잘라넣기
		String birth_array[] = member.getBirth().split("-");	
		request.setAttribute("birthY", birth_array[0]);
		request.setAttribute("birthM", birth_array[1]);
		request.setAttribute("birthD", birth_array[2]);

		mav.addObject("memberInfo", member);

		
		return mav;
	}
	//회원 정보 수정 완료후 마이페이지 이동
	@RequestMapping("/modify.do")
	public String modify(@ModelAttribute("memberInfo") MemberInfo memberInfo,HttpServletRequest request,Model model)
	{
		//이메일 재설정
		String emailID = request.getParameter("emailID");
		String email = request.getParameter("email");
		String emailAddress = request.getParameter("emailAddress");

		if(email.equals("1"))
		{
			String email1 = emailID+"@"+emailAddress;
			email = email1;
			//System.out.println("저장될 값:::"+email);
		}
		else
		{
			String email2 = emailID+"@"+email;
			email = email2;
			//System.out.println("저장될 값:::"+email);
		}

		//생년월일 재설정
		String year = request.getParameter("birthY");
		String month = request.getParameter("birthM");
		String day = request.getParameter("birthD");
		String birth = year+"-"+month+"-"+day;
		
		//수정된 생년월일, 메일 저장
		memberInfo.setBirth(birth);
		memberInfo.setEmail(email);
		
		int success = memberDao.modify(memberInfo);
		
		if (success>0)
		{
			String id = memberInfo.getId();
			MemberInfo member = memberDao.getMember(id);
			model.addAttribute("listM", member);
			return "Mypage/myPage";
		}
		return "Mypage/modifyForm";
	}
	//회원 탈퇴화면으로 이동
	@RequestMapping(value="/MemberDelete.do", method=RequestMethod.GET)
	public String moveDelete() 
	{
		return "Mypage/MemberDelete";
	}
	//회원탈퇴
	@RequestMapping(value="/MemberDelete.do", method=RequestMethod.POST)
	public String memberDelete(MemberInfo memberInfo,MemberDao member,HttpServletRequest request) 
	{
		HttpSession session=request.getSession();
		String password = request.getParameter("password");
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		System.out.println(password);
		Map map = new HashMap();
		map.put("id", id);
		map.put("password", password);
		member.delete(map);
		
		return "loginPage/loginForm";
	}
	//로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session != null) {
			session.invalidate();
		}
		return "loginPage/loginForm";
	}
	@RequestMapping(value="/zipCheck.do", method=RequestMethod.GET)
	public String zipcodeMove()
	{
		return "joinPage/zipCheck";
	}
	//우편번호 검색(우편번호 검색화면은 JSP에서 처리함)
	@RequestMapping(value="/zipCheck.do", method=RequestMethod.POST)
	public String zipcodePro(Model model,String area4)
	{
		List<ZipcodeDao> zipcodeDaoList = zipcodeDao.zipcodeSerach(area4);
		String check = "n";
		model.addAttribute("zipcode", zipcodeDaoList);
		model.addAttribute("check",check);
		return "joinPage/zipCheck";
	}
	//마이페이지로 이동할때 해당 아이디값을 모두 가져와 보내는 코드
	@RequestMapping(value="/myPage.do", method=RequestMethod.GET)
	public String moveMyPage(HttpServletRequest request,Model model)
	{
		//세션에 저장된 ID값 가져오기.
		HttpSession session=request.getSession();
		String id = (String)session.getAttribute("id");
		
		//세션에서 가져온 아이디값으로 해당 정보 불러오기.
		MemberInfo member = null;
		member = memberDao.getMember(id);
			
		model.addAttribute("listM", member);
		
		return "Mypage/myPage";
	}
}
