package com.fileTest;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.DBCPConn;
import com.util.MyUtil;

public class FileTestServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();
		
		Connection conn = DBCPConn.getConnection();
		FileTestDAO dao = new FileTestDAO(conn);
		
		MyUtil myUtil = new MyUtil();
		
		String uri = req.getRequestURI();
		String url;
		
		String root = getServletContext().getRealPath("/");
		String path = root + File.separator + "pds" + File.separator + "saveFile";
		
		File f = new File(path);
		
		if(!f.exists()) //경로에 폴더 없으면 만들어라
			f.mkdirs();
		
		if(uri.indexOf("write.do")!=-1) {
			
			url = "/fileTest/write.jsp";
			forward(req, resp, url);

		} else if(uri.indexOf("write_ok.do")!=-1) {
			
			String encType = "UTF-8";
			int maxSize = 10*1024*1024;
			
			MultipartRequest mr = new MultipartRequest(req, path, maxSize, encType, new DefaultFileRenamePolicy());
			
			if(mr.getFile("upload") != null) { // 업로드된 파일이 있으면
				
				int maxNum = dao.getMaxNum();
				
				FileTestDTO dto = new FileTestDTO();
				
				dto.setNum(maxNum + 1);
				dto.setSubject(mr.getParameter("subject"));
				dto.setSaveFileName(mr.getFilesystemName("upload"));
				dto.setOriginalFileName(mr.getOriginalFileName("upload"));

				dao.insertData(dto);
				
			}
			
			url = cp + "/file/list.do";
			resp.sendRedirect(url);
			
		} else if(uri.indexOf("list.do")!=-1) {

			String pageNum = req.getParameter("pageNum");
			
			int currentPage = 1;
			
			if(pageNum != null) {
				currentPage = Integer.parseInt(pageNum);
			} else
				pageNum = "1";
			
			int dataCount = dao.getDataCount();
			
			int numPerPage = 5;
			
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			
			if(currentPage > totalPage)
				currentPage = totalPage;
			
			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;
			
			List<FileTestDTO> lists = dao.getList(start, end);
			
			String listUrl = "list.do";
			
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, listUrl);
			
			req.setAttribute("lists", lists);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			
			url = "/fileTest/list.jsp";
			forward(req, resp, url);
			
		}
		
	}

}
