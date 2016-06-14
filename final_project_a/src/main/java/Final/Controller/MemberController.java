package Final.Controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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
	
	//�α��� ȭ�� �̵�(id ���翩�ο����� view ����)
	@RequestMapping("/loginForm.do")
	public String login(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		model.addAttribute("id", id);

		return "loginPage/loginForm";
	}
	//�α��� �ϱ�
	@RequestMapping("/login.do")
	public String loginPro(Model model,HttpServletRequest request)
	{
		String id = request.getParameter("id");
		String pass = request.getParameter("password");
		
		MemberInfo memberInfo = memberDao.getMember(id);
		if (memberInfo !=null) 
		{
			if(memberInfo.getPassword().equals(pass))
			{
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
			}
		}
		return "loginPage/loginForm";
	}

	//ȸ������ ȭ������ �̵� 
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String joinMove()
	{
		return "joinPage/join";
	}
	//ȸ������ �� �������� �̵�
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join(@ModelAttribute("memberInfo") MemberInfo memberInfo, HttpServletRequest request)throws ParseException
	{
		System.out.println("Ȯ�ο�");
		System.out.println(memberInfo.getBirth());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd",Locale.KOREA);
		Date birth = sdf.parse(request.getParameter("birth"));
		Map map=new HashMap();
		map.put("id", memberInfo.getId());
		map.put("password", memberInfo.getPassword());
		map.put("name", memberInfo.getName());
		map.put("birth", birth);
		map.put("phone", memberInfo.getPhone());
		map.put("email", memberInfo.getEmail());
		map.put("zipcode", memberInfo.getZipcode());
		map.put("address", memberInfo.getAddress());
		int success=0;
		success=memberDao.insert(map);
		System.out.println(success);
		
		return "loginPage/loginForm";
	}
	//���̵�ͺ�й�ȣ ã�� ȭ������ �̵�
	@RequestMapping("/idpwSearchNew.do")
	public String idpwSearchNew() {
		return "loginPage/idpwSearchNew";
	}
	//���̵� �ߺ�ȭ�� ���� 
	@RequestMapping("/confirmId.do")
	public String confirmID(Model model, HttpServletRequest request) {
		// ���̵� �ߺ� ���� ����
		int check = 0;
		// view���� ���� id���� �� �޾Ƽ� Stirng ������ id ������ ����
		String id = request.getParameter("id");
		MemberInfo member = null;
		// DB���� ID�ִ��� Ȯ��
		member = memberDao.getMember(id);

		if (member == null) {
			// DB�� ID�� ���°��
			check = 1;

		} else {
			// DB�� ID�� �ִ� ���
			check = 0;
		}
		model.addAttribute("check", check);
		return "joinPage/confirmId";
	}
	//ȸ�� ���� ���� ȭ�� �̵�
	@RequestMapping("/modifyForm.do")
	public ModelAndView modifyForm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		ModelAndView mav = new ModelAndView("modifyForm");
		MemberInfo member = memberDao.modifyForm(id);

		mav.addObject("memberInfo", member);

		return mav;
	}
	//ȸ�� ���� ���� �Ϸ��� ���������� �̵�
	@RequestMapping("/modify.do")
	public String modify(@ModelAttribute("memberInfo") MemberInfo memberInfo) {

		int success = memberDao.modify(memberInfo);

		if (success > 0) {
			return "board";
		}
		return "login";
	}
	//ȸ�� Ż��
	@RequestMapping("/delete.do")
	public String delete(String title) {
		int success = fileLoadDao.delete(title);

		if (success > 0) {
			return "board";
		}

		return "";
	}
	//�α׾ƿ�
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
	//�����ȣ �˻�(�����ȣ �˻�ȭ���� JSP���� ó����)
	@RequestMapping(value="/zipCheck.do", method=RequestMethod.POST)
	public String zipcodePro(Model model,String area4)
	{
		List<ZipcodeDao> zipcodeDaoList = zipcodeDao.zipcodeSerach(area4);
		String check = "n";
		model.addAttribute("zipcode", zipcodeDaoList);
		model.addAttribute("check",check);
		return "joinPage/zipCheck";
	}
	@RequestMapping("/test.do")
	public String CheckTime(Model model, HttpServletRequest request) throws ParseException
	{
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd",Locale.KOREA);
		Date today = sdf.parse(request.getParameter("birth"));
		
		return "joinPage/join";
	}
}
