package com.util;

public class MyUtil {

	//��ü �������� ���ϱ�
	//numPerPage : �� ȭ�鿡 ǥ���� ������ ����
	//dataCount : ��ü �������� ����
	public int getPageCount(int numPerPage, int dataCount) {
		
		int pageCount = 0;
		
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage != 0)
			pageCount++;
		
		return pageCount;
		
	}
	
	
	//����¡ ó��
	//currentPage : ���� ǥ���� ������
	//totalPage : ��ü ������ ��
	//listUrl : ��ũ�� ������ url (list.jsp)
	public String pageIndexList(int currentPage, int totalPage, String listUrl) {
		
		int numPerBlock = 5; //�ϴ��� ������ ��ȣ 5������ ǥ��
		int currentPageSetup; //������(ǥ���� ù ������ -1)
		int page;
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage == 0 || totalPage == 0) // ������ �������
			return "";
		
		//list.jsp
		//list.jsp?searchKep="name"&searchValue="�����"
		if(listUrl.indexOf("?") != -1) { // �ּ��ٿ� ?ǥ�� �ִٸ� &�� ����
			listUrl = listUrl + "&";
		} else {
			listUrl = listUrl + "?";
		}
		
		//currentPage�� 9 �̸�
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock; // (9/5)*5=5
		
		//���� currentPage�� 5,10,15,20...�̸�
		//currentPageSetup=(currentPage / numPerBlock)*numPerBlock; // (10/5)*5=10
		if(currentPage % numPerBlock == 0) // 10%5=0
			currentPageSetup = currentPageSetup-numPerBlock; // 10-5=5(ǥ���� ù������ -1 ���� ��)
		
		//������ �� 1
		if(totalPage > numPerBlock && currentPageSetup > 0) { //(34 > 5 && 9 >0)
			
			sb.append("<a href=\"" + listUrl + "pageNum=" + currentPageSetup + "\">������</a>&nbsp;");
			//<a href="list.jsp?pageNum=5">������</a>&nbsp;
			
		}
		
		//�ٷΰ��� ������
		page = currentPageSetup + 1; // 5+1=6
		//if(6 <= 12 && 6 <= 5 + 5) : �ᱹ 6 7 8 9 10
		while(page <= totalPage && page <= (currentPageSetup + numPerBlock)) {
			
			if(page == currentPage) {
				
				sb.append("<font color=\"Fuchsia\">" + page + "</font>&nbsp;");
				//<font color\"Fuchsia">6</font>&nbsp;
				
			} else {
				sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">" + page + "</a>&nbsp;");
				//<a href="list.jsp?pageNum=?7">7</a>&nbsp;
			}
			
			page++; //5��(6,7,8,9,10) �ݺ� �� page ���� 11
			
		}
		
		//������, ������������
		//if(12-5 > 5)
		if(totalPage - currentPageSetup > numPerBlock) {
			sb.append("<a href=\"" + listUrl + "pageNum=" + page + "\">������</a>&nbsp;");
			//<a href="list.jsp?pageNum=11">������</a>&nbsp;
			
		}
		
		return sb.toString();
		
	}
	
	
}
