<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>��������</title>
</head>
<body>
	<h2>���� ���� ���α׷�</h2>
	<hr/>
	<!-- ul : unordered list / ol : ordered ist -->
	<ul>
		<li>
			<a href="inform.jsp">�������</a>
		</li>
		<li>
			<a href="read.jsp">��ü��ȸ</a>
			<!-- score ���̺� �ִ� ������ id������ ���� -->
		</li>
		<li>
		 	<form action="search.jsp"method="post">
		 	 	�˻�<input type="text" name="word" size="8"/>
		 	 	<input type="submit"/>
		 	</form>
		 </li>
		
	</ul>
</body>
</html>