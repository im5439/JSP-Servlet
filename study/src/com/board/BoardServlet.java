package com.board;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.CustomInfo;
import com.util.DBCPConn;
import com.util.MyUtil;

public class BoardServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void foward(HttpServletRequest req, HttpServletResponse resp, String url)
			throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();

		Connection conn = DBCPConn.getConnection();
		BoardDAO dao = new BoardDAO(conn);

		MyUtil myUtil = new MyUtil(); //페이징

		String uri = req.getRequestURI(); // study/sboard/list.do

		String url; // forword 할 때 씀

		if (uri.indexOf("created.do") != -1) {
			
			//-------------세션에 정보가 있는지 확인 ,없으면 로그인창으로
			HttpSession session = req.getSession();
			
			CustomInfo info = (CustomInfo) session.getAttribute("customInfo");
			
			if(info == null) {
				
				url = "/member/login.jsp";
				foward(req, resp, url);
				return;
				
			}
			
			//-------------
			url = "/bbs/created.jsp";
			foward(req, resp, url);

		} else if (uri.indexOf("created_ok.do") != -1) {

			BoardDTO dto = new BoardDTO();

			int maxNum = dao.getMaxNum();

			dto.setNum(maxNum + 1);
			dto.setSubject(req.getParameter("subject"));
			dto.setName(req.getParameter("name"));
			dto.setEmail(req.getParameter("email"));
			dto.setPwd(req.getParameter("pwd"));
			dto.setContent(req.getParameter("content"));
			dto.setIpAddr(req.getRemoteAddr());

			dao.insertData(dto);

			url = cp + "/sboard/list.do"; // 가상주소

			resp.sendRedirect(url);

		} else if (uri.indexOf("list.do") != -1) {

			// 넘어온 페이지 번호(myUtil,article)
			String pageNum = req.getParameter("pageNum");

			int currentPage = 1; // 안넘어오면 1페이지를 불러옴

			if (pageNum != null) {
				currentPage = Integer.parseInt(pageNum);
			} else {
				pageNum = "1";
			}

			// 검색-----------------------------------------
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			if (searchValue != null) { // 검색을 했을때

				if (req.getMethod().equalsIgnoreCase("GET")) { // 검색창에 한글을 입력했을떄 디코딩 하지않으면 깨져서 넘어감
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}

			} else { // 검색을 안했을때

				searchKey = "subject";
				searchValue = "";

			}
			// 검색------------------------------------------

			// 전체 데이터 구하기
			int dataCount = dao.getDataCount(searchKey, searchValue);

			// 한 페이지에 표시할 데이터 갯수
			int numPerPage = 3;

			// 전체 페이지의 갯수
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			// 데이터를 삭제해서 페이지가 줄었을 때 처리
			if (currentPage > totalPage) {
				currentPage = totalPage;
			}

			// 가져올 데이터 시작과 끝 지정
			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;

			List<BoardDTO> lists = dao.getLists(start, end, searchKey, searchValue);

			String param = "";
			if (!searchValue.equals("")) { // 검색을 했을때

				param = "?searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

			}

			// 페이징 처리
			String listUrl = "list.do" + param;
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

			// 글 내용보기 주소정리
			String articleUrl = cp + "/sboard/article.do";
			if (param.equals("")) {// 검색 안했을때
				articleUrl += "?pageNum=" + currentPage + "&searchValue" + URLEncoder.encode(searchValue, "UTF-8");
			} else {// 검색 했을때
				articleUrl += param + "&pageNum=" + currentPage;
			}

			// 포워딩할 데이터
			req.setAttribute("lists", lists);
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);

			url = "/bbs/list.jsp"; // 실제주소
			foward(req, resp, url);

		} else if (uri.indexOf("article.do") != -1) {

			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");

			// 검색-----------------------------------------
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			if (searchValue != null) { // 검색을 했을때

				if (req.getMethod().equalsIgnoreCase("GET")) { // 검색창에 한글을 입력했을떄 디코딩 하지않으면 깨져서 넘어감
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}

			} else { // 검색을 안했을때

				searchKey = "subject";
				searchValue = "";

			}
			// 검색------------------------------------------

			// 조회수 증가
			dao.updateHitCount(num);

			// 글 가져오기
			BoardDTO dto = dao.getReadData(num);

			if (dto == null) {
				url = cp + "/sboard/list.do";
				resp.sendRedirect(url);
			}

			// 글 라인수
			int lineSu = dto.getContent().split("\n").length; // \n(enter)단위로 글을 나눠서 갯수를 센다.

			// 글 내용의 엔터를 <br/>로 변환
			dto.setContent(dto.getContent().replaceAll("\n", "<br/>")); // i = i + 1과 같은 원리 dto.getContent()를 불러와서 \n을
																		// br로 변환하고 다시 set함

			String params = "pageNum=" + pageNum;
			if (!searchValue.equals("")) { // 검색을 했을때

				params += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

			}

			// dto, lineSu, pageNum, param 넘김
			req.setAttribute("dto", dto);
			req.setAttribute("lineSu", lineSu);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("params", params); // param변수명을 다르게해줘야함 servlet내장변수라 안됨

			url = "/bbs/article.jsp"; // 실제 주소
			foward(req, resp, url);

		} else if (uri.indexOf("deleted_ok.do") != -1) {

			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");

			dao.deleteData(num);

			// 검색-----------------------------------------
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			String params = "pageNum=" + pageNum;
			if (searchValue != null) { // 검색을 했을때

				params += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

			}
			// 검색-----------------------------------------

			url = cp + "/sboard/list.do?" + params;
			resp.sendRedirect(url);

		} else if (uri.indexOf("updated.do") != -1) {

			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");

			// 검색-----------------------------------------
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			if (searchValue != null) {
				if (req.getMethod().equals("GET")) {
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}
			} else {
				searchKey = "subject";
				searchValue = "";
			}
			// 검색-----------------------------------------

			BoardDTO dto = dao.getReadData(num);

			String params = "pageNum=" + pageNum;
			if (searchValue != null) {
				params += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}

			if (dto == null) {
				url = cp + "/sboard/list.do?" + params;
				resp.sendRedirect(url);
			}
			req.setAttribute("dto", dto);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("params", params);
			req.setAttribute("searchKey", searchKey);
			req.setAttribute("searchValue", searchValue);

			url = "/bbs/updated.jsp";
			foward(req, resp, url);

		} else if (uri.indexOf("updated_ok.do") != -1) {

			String pageNum = req.getParameter("pageNum");

			BoardDTO dto = new BoardDTO();

			dto.setNum(Integer.parseInt(req.getParameter("num")));
			dto.setSubject(req.getParameter("subject"));
			dto.setName(req.getParameter("name"));
			dto.setEmail(req.getParameter("email"));
			dto.setContent(req.getParameter("content"));
			dto.setPwd(req.getParameter("pwd"));

			dao.updateData(dto);

			// 검색-----------------------------------------
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			if (searchValue != null) {
				if (req.getMethod().equals("GET")) {
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}
			} else {
				searchKey = "subject";
				searchValue = "";
			}
			// 검색-----------------------------------------
			
			String params = "pageNum=" + pageNum;
			if (!searchValue.equals("") && searchValue != null) { // String 데이터를 못읽어오는 오류가있어서 둘다 쓴다
				params += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}

			url = cp + "/sboard/list.do?" + params;
			resp.sendRedirect(url);

		}

	}

}
