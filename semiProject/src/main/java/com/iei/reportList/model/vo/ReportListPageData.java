package com.iei.reportList.model.vo;

import java.util.ArrayList;

public class ReportListPageData {
	private ArrayList<ReportList> list;
	private String pageNavi;
	private int start;
	public ReportListPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReportListPageData(ArrayList<ReportList> list, String pageNavi, int start) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
	}
	public ArrayList<ReportList> getList() {
		return list;
	}
	public void setList(ArrayList<ReportList> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	
	
	

}
