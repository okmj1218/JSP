<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
String id = request.getParameter("id");
int kk = Integer.parseInt(request.getParameter("k"));
int ee = Integer.parseInt(request.getParameter("e"));
int mm = Integer.parseInt(request.getParameter("m"));
float avg = (float)((kk+ee+mm)/3.0);
boolean pass=true;

if(kk<40 || ee<40 || mm<40){
	pass=false;
} else {
	if(avg<50){
		pass=false;
	}else {
		pass=true;
	}
}

Connection conn = null;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>