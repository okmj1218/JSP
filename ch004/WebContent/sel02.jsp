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
			String sql = "select * from info where nick = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			String word = "길똥이"; // getParameter()로 확보됐을수도 있고
			
			ps.setString(1, word);

			ResultSet rs = ps.executeQuery();
			out.println("<h2>결과집합 발생</h2>");
			//4. 결과값을 통한 작업
			if(rs.next() ){
			//rs.getString(열이름); ||	rs. getInt(); ||rs.getDouble();
				String ni = rs.getString("nick");
				String na = rs.getString("name");
				int ag = rs.getInt("age");
				out.println(ni +"("+ na+"/"+ag+"세)<br/>");
			}else{
				out.println("검색 결과가 존재치 않습니다.");
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