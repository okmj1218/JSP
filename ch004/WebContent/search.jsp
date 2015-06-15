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
	//String sql="select * from info order by nick asc";	
	String sql="select * from score where ID = ?";	
	ps=conn.prepareStatement(sql);
	//out.println(word+"<br/>");
	ps.setString(1,word);
	
	// 3. 작업수행
	// ps.executeUpdate()  -- db 에 조작이 일어나는 경우에 사용 - Create, Update, Delete
	//                     -- return 값은 int형으로 영향을 받은 라인 갯수 
	// ps.executeQuery     -- db 의 결과물을 확보하는 경우 - Read
	//                     -- Resultset 을 반환하는데 결과값을 확인할 수 있게 해주는 객체
	rs=ps.executeQuery();
	
	// 4. 결과값을 통한 작업
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
		out.println("검색결과가 없습니다.<br/>");
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