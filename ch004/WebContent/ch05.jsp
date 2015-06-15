<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="java.sql.*"%>
<html>
<body>
	<%
		// 사용자 측에서 이 페이지를 요청시, DB와 연결하여 info 테이블에 있는
		// 정보를 확보 후 클라이언트에 보여주게 해보자.
		try {
			//1. 드라이버에 검색 후 연결 작업
			Class.forName("oracle.jdbc.driver.OracleDriver");

			Connection conn = DriverManager
					.getConnection(
							"jdbc:oracle:thin:@192.168.10.1:1521:xe",
							"jsp", "1111");
			//2. 작업 준비 (명령문을 전달할수있는 형태로 만들어두기)
			String sql = "select * from info order by nick asc";
			PreparedStatement ps = conn.prepareStatement(sql);

			//3. 작업 수행
			//executeUpdate() : - > int 값을 반환 : 영향을 받은 행의 갯수" 
			//데이터 베이스에 조작이 일어나는 Create, Update, Delete
			//excuteQuery() : ->ResultSet 를 반환 : 결과값을 확인할수있게 해둔
			//데이터 베이스에 있는 결과물을 확보하는 Read
			ResultSet rs = ps.executeQuery();
			out.println("결과집합 발생");

			//4. 결과값을 통한 작업
			while(rs.next() ){
				//rs.getString(열이름); ||	rs. getInt(); ||rs.getDouble();
				String ni = rs.getString("nick");
				String na = rs.getString("name");
				int ag = rs.getInt("age");
				
				out.println(ni +"("+ na+"/"+ag+"세)<br/>");
				
			}

			//5. DB 작업시 사용했던 자원을 반환
			rs.close();
			ps.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	%>



</body>
</html>