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
	System.out.println("db ���� �ߵ�");
	out.println("db ���� �ߵ�");
	
	String sql = "insert into score values(?,?,?,?,?,?)";
	
	PreparedStatement ps = conn.prepareStatement(sql);
	
	ps.setString(1,id);
	ps.setInt(2,kk);
	ps.setInt(3,ee);
	ps.setInt(4,mm);
	ps.setFloat(5,avg);
	if(pass==true)
		ps.setString(6,"�հ�");
	else
		ps.setString(6,"���հ�");
	
	int m = ps.executeUpdate();
	out.println("�غ� ��");
	
}catch(Exception e){
	e.printStackTrace();
	out.println("������ �ֽ��ϴ�.");
}	
%>
<html>
<head>
<title>inproc</title>
</head>
<body>
���� ���� : <%=kk %><br/>
���� ���� : <%=ee %><br/>
���� ���� : <%=mm %><br/>
<hr/>
��� ���� : <%=avg %><br/>
<%if(kk<40 || ee<40 || mm<40){ %>
<font color = "red"><b>���հ��Դϴ�.</b></font>
<%}else{ %>
<%if(avg<50){ %>
<font color="red"><b>�հ��Դϴ�.</b></font>
<%} %> 
<%} %>
</body>
</html>