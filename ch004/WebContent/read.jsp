<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<html>
<head>
<title>select test</title>
</head>
<body>
<%
//사용자 측에서 이 페이지를 요청시, db와 연결하여 info 테이블에 있는 정보를 확보
//그리고나서, client에게 보여주게 해주자.

Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
try{
	// 1. driver 검색후 연결작업
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@192.168.10.1:1521:xe";

	String user="jsp";
	String password="1111";
	
	conn = DriverManager.getConnection(url,user,password);
	System.out.println("db 연동 잘됨");
	out.println("db연동 잘됨<br/>");
	
	// 2. db 작업 준비
	String sql="select * from score";	
	ps=conn.prepareStatement(sql);
	
	
	// 3. 작업수행
	rs=ps.executeQuery();

	// 4. 결과값을 통한 작업
	while(rs.next()){
		String id=rs.getString("ID");
		int kor=rs.getInt("KOR");
		int eng=rs.getInt("ENG");
		int math=rs.getInt("MATH");
		int avg=rs.getInt("AVG");
		String rsg=rs.getString("RST");
		
		out.println(id+" KOR:"+kor+" ENG:"+eng+" MATH:"+math+" AVG:"+avg+" RST:"+rsg+"<br/>");
	}

	out.println("db 작업 끝<br/>");
	
}catch(Exception e){
	e.printStackTrace();
	out.println("문제가 있습니다.<br/>");
} finally{
	// 5. db close 작업
	rs.close();
	ps.close();
	conn.close();
	out.println("db close 작업<br/>");
}

%>
</body>
</html>