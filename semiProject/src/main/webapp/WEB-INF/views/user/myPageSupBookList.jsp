<%@page import="com.iei.mypage.vo.SupportBook"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ArrayList<SupportBook> supList = (ArrayList<SupportBook>)request.getAttribute("supList");
    String pageNavi = (String)request.getAttribute("pageNavi");
    int start = (int)request.getAttribute("start");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/css/mypageDefault.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,1,0" />
</head>
<style>
    .line-content{

        overflow: hidden;
    }
    .book-box{
    	width: 400px;
    	height: 180px;
        display: flex;
        float: left;
        margin: 20px;
        justify-content: space-between;
    }
    .book-img{
        width: 130px;
        background-color: #a7a7a7;
        border-radius: 4px;
        margin-right: 10px;
    }
    .book-info>div, .book-info>div>div{
        padding: 3px 0px 3px 0px;
    }
    .book-info{
    	width: 280px;
    	position: relative;
    }
    .book-info-head{
        display: flex;
        justify-content: space-between;
    }
    .close-btn{
        cursor: pointer;
    }
    .book-title{
        font-size: 18px;
        font-family: ns-m;
    }
    .genre{
        font-size: 12px;
    }
    .book-date{
        font-size: 12px;
        color: #a7a7a7;
    }
    .writer-wrap{
        display: flex;
    }
    .writer-wrap>.material-symbols-outlined{
    	margin: 0;
        font-size: 18px;
        margin-right: 3px;
    }
    .writer{
        font-size: 15px;
    }
	.box{
        position: absolute;
        bottom: 0;
    }
    div>.sup-btn{
        width: 260px;
        text-align: center;
        font-size: 16px;

    }
    .sup-money{
        color: #ffc6d3;
        font-size: 18px;

    }
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
    <div class="page-content mypage-content">
    	<%@include file="/WEB-INF/views/user/myPageMenu.jsp" %>
        <div class="mypage-detail">
            <div class="page-title">후원작품 목록</div>
            <div class="content-wrap">
                <div class="line-content">
                	<%for(int i=0; i<supList.size(); i++) { %>
                		<%SupportBook sb = supList.get(i); %>
	                    <div class="book-box">
	                        <div class="book-img"></div>
	                        <div class="book-info">
	                            <div class="book-info-head">
	                                <div class="book-title"><%=sb.getBookTitle() %></div>
	                            </div>
	                            <div class=box>
		                            <div class="genre"><%=sb.getGenreName() %></div>
		                            <div class="writer-wrap">
		                                <span class="material-symbols-outlined">drive_file_rename_outline</span>
		                                <div class="writer"><%=sb.getBookWriter() %></div>
		                            </div>
		                            <div class="book-date">작품 등록일 : <span class="book-date"><%=sb.getBookDate() %></span></div>
		                            <div>
		                                <div class="btn bc4 sup-btn">총 후원금액 : <span class="sup-money"><%=sb.getTotalSupportMoney() %></span> P</div>
		                            </div>
	                            </div>
	                        </div>
	                    </div>
                	<%} %>
            	</div>
       		</div>
       		<div id="pageNavi"><%=pageNavi %></div>
       	</div>
    </div>
</body>
</html>