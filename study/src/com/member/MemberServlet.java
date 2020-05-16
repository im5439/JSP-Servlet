package com.member;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBCPConn;

public class MemberServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void foward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();
		
		Connection conn = DBCPConn.getConnection();
		MemberDAO dao = new MemberDAO(conn);
		
		String uri = req.getRequestURI();
		String url;
		
		if (uri.indexOf("created.do") != -1) {
			
			url = "/member/created.jsp";
			foward(req, resp, url);
			
		} else if (uri.indexOf("created_ok.do") != -1) {
			
			MemberDTO dto = new MemberDTO();
			
			dto.setUserId(req.getParameter("userId"));
			dto.setUserPwd(req.getParameter("userPwd"));
			dto.setUserName(req.getParameter("userName"));
			dto.setUserBirth(req.getParameter("userBirth"));
			dto.setUserTel(req.getParameter("userTel"));
			
			dao.insertData(dto);
			
			url = cp + "/index.jsp";
			resp.sendRedirect(url);
			
		} else if (uri.indexOf("login.do") != -1) {
			
			url = "/member/login.jsp";
			foward(req, resp, url);

		} else if (uri.indexOf("login_ok.do") != -1) {
		
			String userId = req.getParameter("userId");
			String userPwd = req.getParameter("userPwd");
			
			MemberDTO dto = dao.getReadData(userId);
			
			if(dto == null || !dto.getUserPwd().equals(userPwd) ) {
				req.setAttribute("message", "아이디 또는 패스워드를 정확히 입력하세요.");
				url = "/member/login.jsp";
				foward(req, resp, url);
				return;
			}
			
			HttpSession session = req.getSession(); // 세션 만들기
			
			CustomInfo info = new CustomInfo();
			
			info.setUserId(dto.getUserId());
			info.setUserName(dto.getUserName());
			
			session.setAttribute("customInfo", info); // 세션에 올리기
			
			url = cp;
			resp.sendRedirect(url);
			
		} else if (uri.indexOf("logout_ok.do") != -1) {
			
			HttpSession session = req.getSession();
			
			session.removeAttribute("customInfo"); // 세션에 있는 데이터 삭제
			session.invalidate();
			
			url = cp;
			resp.sendRedirect(url);
		
		} else if (uri.indexOf("updated.do") != -1) {
			
			HttpSession session = req.getSession();
			
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			
			MemberDTO dto = dao.getReadData(info.getUserId());
			
			req.setAttribute("dto", dto);
			
			url = "/member/updated.jsp";
			foward(req, resp, url);
			
		} else if (uri.indexOf("updated_ok.do") != -1) {
			
			MemberDTO dto = new MemberDTO();
			
			dto.setUserId(req.getParameter("userId"));
			dto.setUserPwd(req.getParameter("userPwd"));
			dto.setUserName(req.getParameter("userName"));
			dto.setUserBirth(req.getParameter("userBirth"));
			dto.setUserTel(req.getParameter("userTel"));
			
			dao.updateData(dto);
			
			url = cp;
			resp.sendRedirect(url);
			
		} else if (uri.indexOf("findPwd.do") != -1) {
			
			url = "/member/findPwd.jsp";
			foward(req, resp, url);
		
		} else if (uri.indexOf("findPwd_ok.do") != -1) {

			String userId = req.getParameter("userId");
			String userTel = req.getParameter("userTel");
			
			MemberDTO dto = dao.getReadData(userId);
			
			if(dto == null || !dto.getUserTel().equals(userTel)) {
				req.setAttribute("message", "아이디 또는 전화번호를 정확히 입력하세요.");
				url = "/member/findPwd.jsp";
				foward(req, resp, url);
				return;
			} 
			req.setAttribute("message", "비밀번호는 [" + dto.getUserPwd() + "] 입니다.");
			url = "/member/login.jsp";
			foward(req, resp, url);
			
		} else if (uri.indexOf("deleted.do") != -1) {
			
			url = "/member/deleted.jsp";
			foward(req, resp, url);
			
		} else if (uri.indexOf("deleted_ok.do") != -1) {
			
			HttpSession session = req.getSession();
			
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			
			String userId = info.getUserId();
			String userPwd = req.getParameter("userPwd");

			MemberDTO dto = dao.getReadData(userId);
			
			if(!dto.getUserPwd().equals(userPwd)) {
				req.setAttribute("message", "비밀번호를 정확히 입력하세요.");
				url = "join/deleted.do";
				resp.sendRedirect(url);
				return;
			}
			
			dao.deleteData(userId);
			
			session.removeAttribute("customInfo"); // 세션에 있는 데이터 삭제
			session.invalidate();
			
			url = cp;
			resp.sendRedirect(url);
			
		}
		
		
		
	}
	
	
	
}
