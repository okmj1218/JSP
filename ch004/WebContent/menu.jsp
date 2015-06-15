<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>성적관리</title>
</head>
<body>
	<h2>성적 관리 프로그램</h2>
	<hr/>
	<!-- ul : unordered list / ol : ordered ist -->
	<ul>
		<li>
			<a href="inform.jsp">성적등록</a>
		</li>
		<li>
			<a href="read.jsp">전체조회</a>
			<!-- score 테이블에 있는 내용을 id순으로 정렬 -->
		</li>
		<li>
		 	<form action="search.jsp"method="post">
		 	 	검색<input type="text" name="word" size="8"/>
		 	 	<input type="submit"/>
		 	</form>
		 </li>
		
	</ul>
</body>
</html>