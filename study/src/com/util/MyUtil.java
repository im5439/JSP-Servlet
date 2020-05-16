package com.util;

public class MyUtil {

	//전체 페이지수 구하기
	//numPerPage : 한 화면에 표시할 데이터 갯수
	//dataCount : 전체 데이터의 갯수
	public int getPageCount(int numPerPage, int dataCount) {
		
		int pageCount = 0;
		
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage != 0)
			pageCount++;
		
		return pageCount;
		
	}
	
	
	//페이징 처리
	//currentPage : 현재 표시할 페이지
	//totalPage : 전체 페이지 수
	//listUrl : 링크를 설정할 url (list.jsp)
	public String pageIndexList(int currentPage, int totalPage, String listUrl) {
		
		int numPerBlock = 5; //하단의 페이지 번호 5개까지 표시
		int currentPageSetup; //이전◀(표시할 첫 페이지 -1)
		int page;
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage == 0 || totalPage == 0) // 데이터 없을경우
			return "";
		
		//list.jsp
		//list.jsp?searchKep="name"&searchValue="배수지"
		if(listUrl.indexOf("?") != -1) { // 주소줄에 ?표가 있다면 &를 붙임
			listUrl = listUrl + "&";
		} else {
			listUrl = listUrl + "?";
		}
		
		//currentPage가 9 이면
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock; // (9/5)*5=5
		
		//만약 currentPage가 5,10,15,20...이면
		//currentPageSetup=(currentPage / numPerBlock)*numPerBlock; // (10/5)*5=10
		if(currentPage % numPerBlock == 0) // 10%5=0
			currentPageSetup = currentPageSetup-numPerBlock; // 10-5=5(표시할 첫페이지 -1 해준 값)
		
		//◀이전 과 1
		if(totalPage > numPerBlock && currentPageSetup > 0) { //(34 > 5 && 9 >0)
			
			sb.append("<a href=\"" + listUrl + "pageNum=" + currentPageSetup + "\">◀이전</a>&nbsp;");
			//<a href="list.jsp?pageNum=5">◀이전</a>&nbsp;
			
		}
		
		//바로가기 페이지
		page = currentPageSetup + 1; // 5+1=6
		//if(6 <= 12 && 6 <= 5 + 5) : 결국 6 7 8 9 10
		while(page <= totalPage && page <= (currentPageSetup + numPerBlock)) {
			
			if(page == currentPage) {
				
				sb.append("<font color=\"Fuchsia\">" + page + "</font>&nbsp;");
				//<font color\"Fuchsia">6</font>&nbsp;
				
			} else {
				sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">" + page + "</a>&nbsp;");
				//<a href="list.jsp?pageNum=?7">7</a>&nbsp;
			}
			
			page++; //5번(6,7,8,9,10) 반복 후 page 값은 11
			
		}
		
		//다음▶, 마지막페이지
		//if(12-5 > 5)
		if(totalPage - currentPageSetup > numPerBlock) {
			sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">다음▶</a>&nbsp;");
			//<a href="list.jsp?pageNum=11">다음▶</a>&nbsp;
			
		}
		
		return sb.toString();
		
	}
	
	
}
