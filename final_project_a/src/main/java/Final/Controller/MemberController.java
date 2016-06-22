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
	
	//�α��� ȭ�� �̵�(id ���翩�ο����� view ����)
	@RequestMapping("/loginForm.do")
	public String login() {

		return "loginPage/loginForm";
	}
	//�α��� �ϱ�
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
			}
		}else{
			request.setAttribute("fail", "fail");
		}
		return "loginPage/loginPro";
	}

	//ȸ������ ȭ������ �̵� 
	@RequestMapping(value="/join.do", method=RequestMethod.GET)
	public String joinMove()
	{
		return "joinPage/join";
	}
	//ȸ������ �� �������� �̵�
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join(@ModelAttribute("memberInfo") MemberInfo memberInfo, HttpServletRequest request)
	{
		//�̸����ּ� ����("�����Է�","�����Է�")�� ���� �̸��� �籸��
		String emailID = request.getParameter("emailID");
		String email = request.getParameter("email");
		String emailAddress = request.getParameter("emailAddress");
		
		//���� �Է��� �����Ѱ��
		if(email.equals("1"))
		{
			String email1 = emailID+"@"+emailAddress;
			email = email1;
			
			 System.out.println("emil�� ���Ե� �� : : : "+ email1 );
			 System.out.println("����� email �ּ� : : : "+ email );
		}
		//select option���� üũ�Ѱ��
		else
		{
			String email2 = emailID+"@"+email;
			email = email2;
			
			 System.out.println("emil�� ���Ե� ��: : :"+email2);
			 System.out.println("����� email �ּ� : : : "+ email );
		}
		//������� �籸��
		String year = request.getParameter("birthY");
		String month = request.getParameter("birthM");
		String day = request.getParameter("birthD");
		String birth = year+"-"+month+"-"+day;
		System.out.println(birth);
		
		memberInfo.setBirth(birth);
		memberInfo.setEmail(email);
		
		//������ ������ Ȯ���ϱ� ���� ���� ����
		int success=0;
		success=memberDao.insert(memberInfo);
		//������ ���� �������θ� Ȯ���ϱ����� ���
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
		String id = (String)session.getAttribute("id");
		//System.out.println("���ǿ� ����� ID��: : :"+id);
		ModelAndView mav = new ModelAndView("Mypage/modifyForm");
		MemberInfo member = memberDao.modifyForm(id);

		//���ϰ� �߶�ֱ�
		String mail_array[] = member.getEmail().split("@");
		request.setAttribute("emailID", mail_array[0]);
		request.setAttribute("emailAddress", mail_array[1]);
		
		//���ϰ� �߶�ֱ�
		String birth_array[] = member.getBirth().split("-");	
		request.setAttribute("birthY", birth_array[0]);
		request.setAttribute("birthM", birth_array[1]);
		request.setAttribute("birthD", birth_array[2]);

		mav.addObject("memberInfo", member);

		
		return mav;
	}
	//ȸ�� ���� ���� �Ϸ��� ���������� �̵�
	@RequestMapping("/modify.do")
	public String modify(@ModelAttribute("memberInfo") MemberInfo memberInfo,HttpServletRequest request,Model model)
	{
		//�̸��� �缳��
		String emailID = request.getParameter("emailID");
		String email = request.getParameter("email");
		String emailAddress = request.getParameter("emailAddress");

		if(email.equals("1"))
		{
			String email1 = emailID+"@"+emailAddress;
			email = email1;
			//System.out.println("����� ��:::"+email);
		}
		else
		{
			String email2 = emailID+"@"+email;
			email = email2;
			//System.out.println("����� ��:::"+email);
		}

		//������� �缳��
		String year = request.getParameter("birthY");
		String month = request.getParameter("birthM");
		String day = request.getParameter("birthD");
		String birth = year+"-"+month+"-"+day;
		
		//������ �������, ���� ����
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
	//ȸ�� Ż��ȭ������ �̵�
	@RequestMapping(value="/MemberDelete.do", method=RequestMethod.GET)
	public String moveDelete() 
	{
		return "Mypage/MemberDelete";
	}
	//ȸ��Ż��
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
	//������������ �̵��Ҷ� �ش� ���̵��� ��� ������ ������ �ڵ�
	@RequestMapping(value="/myPage.do", method=RequestMethod.GET)
	public String moveMyPage(HttpServletRequest request,Model model)
	{
		//���ǿ� ����� ID�� ��������.
		HttpSession session=request.getSession();
		String id = (String)session.getAttribute("id");
		
		//���ǿ��� ������ ���̵����� �ش� ���� �ҷ�����.
		MemberInfo member = null;
		member = memberDao.getMember(id);
			
		model.addAttribute("listM", member);
		
		return "Mypage/myPage";
	}
}
