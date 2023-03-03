package com.iei.bookListManage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.iei.bookListManage.model.service.BookListManageService;
import com.iei.bookListManage.model.vo.BookListManagePageData;

// 질문 목록 조회
@WebServlet(name = "BookListManageList", urlPatterns = { "/bookListManage/bookListManageList.do" })
public class BookListManageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BookListManageListServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1인코딩
		request.setCharacterEncoding("utf-8");
		//2값추출
		int reqPage = Integer.parseInt(request.getParameter("reqPage"));
		//3비즈니스 로직
		BookListManageService service = new BookListManageService();
		BookListManagePageData qpd = service.selectAllBookListManageList(reqPage);
		
		//4 결과처리
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/bookListManage/bookListManageList.jsp");
		request.setAttribute("list", qpd.getList());
		request.setAttribute("pageNavi", qpd.getPageNavi());
		request.setAttribute("start", qpd.getStart());
		view.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
