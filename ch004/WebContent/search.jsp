<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("euc-kr");
String word=request.getParameter("word");
%>
<html>
<head>
<title>select test</title>
</head>
<body>
<%
//����� ������ �� �������� ��û��, db�� �����Ͽ� info ���̺� �ִ� ������ Ȯ��
//�׸�����, client���� �����ְ� ������.

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
try{
	// 1. driver �˻��� �����۾�
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@192.168.10.1:1521:xe";

	String user="jsp";
	String password="1111";
	
	conn = DriverManager.getConnection(url,user,password);
	System.out.println("db ���� �ߵ�");
	out.println("db���� �ߵ�<br/>");
	
	// 2. db �۾� �غ�
	//String sql="select * from info order by nick asc";	
	String sql="select * from score where ID = ?";	
	ps=conn.prepareStatement(sql);
	//out.println(word+"<br/>");
	ps.setString(1,word);
	
	// 3. �۾�����
	// ps.executeUpdate()  -- db �� ������ �Ͼ�� ��쿡 ��� - Create, Update, Delete
	//                     -- return ���� int������ ������ ���� ���� ���� 
	// ps.executeQuery     -- db �� ������� Ȯ���ϴ� ��� - Read
	//                     -- Resultset �� ��ȯ�ϴµ� ������� Ȯ���� �� �ְ� ���ִ� ��ü
	rs=ps.executeQuery();
	
	// 4. ������� ���� �۾�
	//while(rs.next()){
	if(rs.next()){
		String id=rs.getString("ID");
		int kor=rs.getInt("KOR");
		int eng=rs.getInt("ENG");
		int math=rs.getInt("MATH");
		int avg=rs.getInt("AVG");
		String rsg=rs.getString("RST");
		
		out.println(id+" KOR:"+kor+" ENG:"+eng+" MATH:"+math+" AVG:"+avg+" RST:"+rsg+"<br/>");
	} else{
		out.println("�˻������ �����ϴ�.<br/>");
	}

	out.println("db �۾� ��<br/>");
	
}catch(Exception e){
	e.printStackTrace();
	out.println("������ �ֽ��ϴ�.<br/>");
} finally{
	// 5. db close �۾�
	rs.close();
	ps.close();
	conn.close();
	out.println("db close �۾�<br/>");
}

%>
</body>
</html>