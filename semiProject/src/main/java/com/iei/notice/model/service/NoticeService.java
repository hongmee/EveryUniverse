package com.iei.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.iei.notice.model.dao.NoticeDao;
import com.iei.notice.model.vo.Notice;
import com.iei.notice.model.vo.NoticePageData;

import common.JDBCTemplate;

public class NoticeService {
	private NoticeDao dao;

	public NoticeService() {
		super();
		dao = new NoticeDao();
	}

	public int insertNotice(Notice n) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.insertNotice(conn, n);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public NoticePageData selectNoticeList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;
		int end = numPerPage*reqPage;
		int start = end - numPerPage + 1;
		ArrayList<Notice> list = dao.selectNoticeList(conn,start,end);
		int totalCount = dao.selectNoticeCount(conn);
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage + 1;
		}
		int pageNaviSize = 5;
		
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize + 1;
		
		String pageNavi = "<ul class='pagination circle-style'>";
		if(pageNo != 1) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/noticeList.do?reqPage="+(pageNo-1)+"'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/noticeList.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/noticeList.do?reqPage="+(pageNo)+"'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<li>";
			pageNavi += "<a class='page-item' href='/noticeList.do?reqPage="+(pageNo)+"'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";
		
		
		JDBCTemplate.close(conn);
		NoticePageData npd = new NoticePageData(list, pageNavi, start);
		return npd;
	}

	public Notice selectOneNotice(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		Notice n = dao.selectOneNotice(conn, noticeNo);
		JDBCTemplate.close(conn);
		return n;
	}

	public Notice getNotice(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		Notice n = dao.selectOneNotice(conn, noticeNo);
		JDBCTemplate.close(conn);
		return n;
	}

	public int updateNotice(Notice n) {
		Connection conn = JDBCTemplate.getConnection();
		int result = dao.updateNotice(conn, n);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Notice deleteNotice(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		Notice n = dao.selectOneNotice(conn, noticeNo);
		int result = dao.deleteNotice(conn, noticeNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
			n = null;
		}
		JDBCTemplate.close(conn);
		return n;
	}


}
