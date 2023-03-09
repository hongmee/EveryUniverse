<%@page import="com.iei.report.model.vo.*"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<ReportVo> list = (ArrayList<ReportVo>) request.getAttribute("list");
String pageNavi = (String)request.getAttribute("pageNavi");
int start = (int)request.getAttribute("start");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 관리</title>
<link rel="stylesheet" href="/css/report.css">
</head>
<body>
<script src="/js/jquery-3.6.3.min.js">
</script>
<style>
.report-tr{
	text-align:center;
}
</style>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="page-content">
		<div class="report-wrap">
			<div class="report-header">
				<span>신고 관리</span>
			</div>
			<%-- 검색 폼 태그 시작 --%>
			<div class="div-form-box">
				<form id="searchForm" action="/report/searchReportList.do">
					<select id="searchType" class="select" name="searchType">
						<%-- 검색 선택 구간 --%>
						<option value="1" id="select1">신고자</option>
						<option value="2" id="select2">신고제목</option>
					</select> <input type="hidden" name="searchValue" id="hiddenSearchValue">
				</form>
				<input type="text" id="searchValue" class="select"
					onkeydown="javascript:if(event.keyCode==13) searchReport()">
				<button onclick="searchReport()" class="select bttn" id="search">검색</button>
			</div>
			<br>
			<br>
			<br>
			<%-- 검색 폼 태그 종료 --%>
			<%-- 검색 미 입력시 나올 alert 띄우기 시작 --%>
			<script>
				function searchReport(){
					if($("#searchValue").val() == ""){
						alert("검색어를 입력해 주세요.");
						return;
					}
					$("#hiddenSearchValue").val($("#searchValue").val());
					$("#searchForm").submit();
				}
			</script>
			<%-- 검색 미 입력시 나올 alert 띄우기 종료 --%>
			<table class="report-tbl">
				<%
				if (list.size() < 1) {
				%>
				<tr class="report-tr">
					<td class="report-td">조회 결과가 없습니다.</td>
				</tr>
				<%
				} else {
				%>
				<thead>
					<tr class="report-tr">
						<td class="report-td" style="width:5%;padding:10px;">순번</td>
						<td class="report-td kk" style="width:10%;">신고자</td>
						<td class="report-td" style="width:30%;">신고제목</td>
						<td class="report-td" style="width:10%;">종류</td>
						<td class="report-td" style="width:10%;">신고일자</td>
					</tr>
				</thead>
				<tbody>
					<%
					for (int i = 0; i < list.size(); i++) {
					%>
					<%
					ReportVo u = list.get(i);
					%>
					<tr class="report-tr">
						<td class="report-td"style="font-size:14px;"><%=i+start %></td>
						<td class="report-td kk"style="font-size:14px;"><%=u.getReporterId() %></td>
						<td class="report-td"style="font-size:14px;">
						<a class="text-inline" href="/reportView.do?reportNo=<%=u.getReportNo()%>"><%=u.getReportTitle()%></a></td>
						<td class="report-td"style="font-size:14px;">
						<% if(u.getReportType() == 1 ){%>유저
						<%}else if(u.getReportType() == 2 ){%>게시판
						<%}else if(u.getReportType() == 3 ){%>소설<%} %></td>
						<td class="report-td"style="font-size:14px;"><%=u.getReportDate() %>
					<%
					}
					}
					%>
				</tbody>
			</table>
			<br>
			<div id="pageNavi"><%=pageNavi %>
			<br>
		</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>