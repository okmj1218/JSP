d<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.sql.*" %>
<%
String id = request.getParameter("id");
int kk = Integer.parseInt(request.getParameter("kor"));
int ee = Integer.parseInt(request.getParameter("eng"));
int mm = Integer.parseInt(request.getParameter("math"));
float avg = (float)((kk+ee+mm)/3.0);
boolean pass = true;

if(kk<40 || ee<40 || mm<40){
	pass=false;
}else{
	if(avg<50){
		pass=false;
	}else{
		pass=true;
	}
}

Connection conn = null;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@192.168.10.1:1521:xe";
	
	String user = "jsp";
	String password = "1111";
	
	conn = DriverManager.getConnection(url,user,password);
	System.out.println("db 연동 잘됨");
	out.println("db 연동 잘됨");
	
	String sql = "insert into score values(?,?,?,?,?,?)";
	
	PreparedStatement ps = conn.prepareStatement(sql);
	
	ps.setString(1,id);
	ps.setInt(2,kk);
	ps.setInt(3,ee);
	ps.setInt(4,mm);
	ps.setFloat(5,avg);
	if(pass==true)
		ps.setString(6,"합격");
	else
		ps.setString(6,"불합격");
	
	int m = ps.executeUpdate();
	out.println("준비 끝");
	
}catch(Exception e){
	e.printStackTrace();
	out.println("문제가 있습니다.");
}	
%>
<html>
<head>
<title>inproc</title>
</head>
<body>
국어 점수 : <%=kk %><br/>
영어 점수 : <%=ee %><br/>
수학 점수 : <%=mm %><br/>
<hr/>
평균 점수 : <%=avg %><br/>
<%if(kk<40 || ee<40 || mm<40){ %>
<font color = "red"><b>불합격입니다.</b></font>
<%}else{ %>
<%if(avg<50){ %>
<font color="red"><b>합격입니다.</b></font>
<%} %> 
<%} %>
</body>
</html>