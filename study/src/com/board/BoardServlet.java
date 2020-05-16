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

		MyUtil myUtil = new MyUtil(); //����¡

		String uri = req.getRequestURI(); // study/sboard/list.do

		String url; // forword �� �� ��

		if (uri.indexOf("created.do") != -1) {
			
			//-------------���ǿ� ������ �ִ��� Ȯ�� ,������ �α���â����
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

			url = cp + "/sboard/list.do"; // �����ּ�

			resp.sendRedirect(url);

		} else if (uri.indexOf("list.do") != -1) {

			// �Ѿ�� ������ ��ȣ(myUtil,article)
			String pageNum = req.getParameter("pageNum");

			int currentPage = 1; // �ȳѾ���� 1�������� �ҷ���

			if (pageNum != null) {
				currentPage = Integer.parseInt(pageNum);
			} else {
				pageNum = "1";
			}

			// �˻�-----------------------------------------
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			if (searchValue != null) { // �˻��� ������

				if (req.getMethod().equalsIgnoreCase("GET")) { // �˻�â�� �ѱ��� �Է������� ���ڵ� ���������� ������ �Ѿ
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}

			} else { // �˻��� ��������

				searchKey = "subject";
				searchValue = "";

			}
			// �˻�------------------------------------------

			// ��ü ������ ���ϱ�
			int dataCount = dao.getDataCount(searchKey, searchValue);

			// �� �������� ǥ���� ������ ����
			int numPerPage = 3;

			// ��ü �������� ����
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);

			// �����͸� �����ؼ� �������� �پ��� �� ó��
			if (currentPage > totalPage) {
				currentPage = totalPage;
			}

			// ������ ������ ���۰� �� ����
			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;

			List<BoardDTO> lists = dao.getLists(start, end, searchKey, searchValue);

			String param = "";
			if (!searchValue.equals("")) { // �˻��� ������

				param = "?searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

			}

			// ����¡ ó��
			String listUrl = "list.do" + param;
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);

			// �� ���뺸�� �ּ�����
			String articleUrl = cp + "/sboard/article.do";
			if (param.equals("")) {// �˻� ��������
				articleUrl += "?pageNum=" + currentPage + "&searchValue" + URLEncoder.encode(searchValue, "UTF-8");
			} else {// �˻� ������
				articleUrl += param + "&pageNum=" + currentPage;
			}

			// �������� ������
			req.setAttribute("lists", lists);
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);

			url = "/bbs/list.jsp"; // �����ּ�
			foward(req, resp, url);

		} else if (uri.indexOf("article.do") != -1) {

			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");

			// �˻�-----------------------------------------
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			if (searchValue != null) { // �˻��� ������

				if (req.getMethod().equalsIgnoreCase("GET")) { // �˻�â�� �ѱ��� �Է������� ���ڵ� ���������� ������ �Ѿ
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}

			} else { // �˻��� ��������

				searchKey = "subject";
				searchValue = "";

			}
			// �˻�------------------------------------------

			// ��ȸ�� ����
			dao.updateHitCount(num);

			// �� ��������
			BoardDTO dto = dao.getReadData(num);

			if (dto == null) {
				url = cp + "/sboard/list.do";
				resp.sendRedirect(url);
			}

			// �� ���μ�
			int lineSu = dto.getContent().split("\n").length; // \n(enter)������ ���� ������ ������ ����.

			// �� ������ ���͸� <br/>�� ��ȯ
			dto.setContent(dto.getContent().replaceAll("\n", "<br/>")); // i = i + 1�� ���� ���� dto.getContent()�� �ҷ��ͼ� \n��
																		// br�� ��ȯ�ϰ� �ٽ� set��

			String params = "pageNum=" + pageNum;
			if (!searchValue.equals("")) { // �˻��� ������

				params += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

			}

			// dto, lineSu, pageNum, param �ѱ�
			req.setAttribute("dto", dto);
			req.setAttribute("lineSu", lineSu);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("params", params); // param�������� �ٸ���������� servlet���庯���� �ȵ�

			url = "/bbs/article.jsp"; // ���� �ּ�
			foward(req, resp, url);

		} else if (uri.indexOf("deleted_ok.do") != -1) {

			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");

			dao.deleteData(num);

			// �˻�-----------------------------------------
			String searchKey = req.getParameter("searchKey");
			String searchValue = req.getParameter("searchValue");

			String params = "pageNum=" + pageNum;
			if (searchValue != null) { // �˻��� ������

				params += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");

			}
			// �˻�-----------------------------------------

			url = cp + "/sboard/list.do?" + params;
			resp.sendRedirect(url);

		} else if (uri.indexOf("updated.do") != -1) {

			int num = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");

			// �˻�-----------------------------------------
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
			// �˻�-----------------------------------------

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

			// �˻�-----------------------------------------
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
			// �˻�-----------------------------------------
			
			String params = "pageNum=" + pageNum;
			if (!searchValue.equals("") && searchValue != null) { // String �����͸� ���о���� �������־ �Ѵ� ����
				params += "&searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}

			url = cp + "/sboard/list.do?" + params;
			resp.sendRedirect(url);

		}

	}

}
