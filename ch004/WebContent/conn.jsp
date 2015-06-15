<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>    
<%  
//conn.jsp로 요청이 들어온 상황이고,
//웹에서 db연동한 작업을 해야되는 상황이다.

//db서버에 연결이 되는지부터 확인을 해야한다.

//db연동작업에[서 사용되는 클래스들이 있는데 java.sql.패키지에 포함되어 있다.
//throws Exception이 걸려있는 메서드가 대부분이다(예외전가)
//->try~catch 하고 작업이 필수이다.
try{
	//해당 DBMS와 연결을 지원해주는 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//DB에 연결부터 확인해보자.
	//DB 서버 경로, 계정명, 계정패스워드
	String url = "jdbc:oracle:thin:@192.168.0.195:1521:xe";
	String user = "jsp";
	String password ="1111";
	
	Connection conn = DriverManager.getConnection(url,user,password);
	System.out.println("DB 연동 잘됨.!");
	//================================================================
	// 실제 작업을 진행해보자	
	// 사용자가 => 닉네임, 이름, 나이 이정보를 보낸 상황이고, 그것을
	//DB info 테이블에 등록하는 작업
	String okmj = "사안수1";
	String name = "김명종2";
	int age = 26;
	
	//수행해야될 명령문을 문자열로 준비 - 변수부분을 바인드처리해두고, 나중에 채우거나
	String sql = "insert into info values(?,?,?)";
	//String sql2 = "insert into info values('"+okmj+"','"')"
			
	//연결통로에다가 올려두고 
	PreparedStatement ps = conn.prepareStatement(sql);
	//수행해야될 명령문에 ??? 처리해둔 부분이 있다면, 값을 설정해주자.
	ps.setString(1, okmj); //문자설정 ps.setint 숫자
	ps.setString(2, name); //숫자설정
	ps.setDouble(3, age);
			
			
	out.println("준비 끝!..");
	//준비가 끝났다면..
	int m = ps.executeUpdate(); // 숫자가 하나 발생..조작된 데이터 행의 갯수
	
	out.println("완료!");
}catch(Exception e){
	e.printStackTrace();
	System.out.println("DB 작업중 문제 발생..!");
}
%>