<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
</head>
<body>

// 정보를 확보 후 클라이언트에






//2. 작업 준비 (명령문을 전달할수있는 형태로 만들어두기)
String sql = "select * from info order by id asc";
PreparedStatement ps = conn.prepareStatement(sql);


//3. 작업 수행
//executeUpdate() : - > int 값을 반환 : 영향을 받은 행의 갯수" 
//데이터 베이스에 조작이 일어나는 Create, Update, Delete
//excuteQuery() : ->ResultSet 를 반환 : 결과값을 확인할수있게 해둔
//데이터 베이스에 있는 결과물을 확보하는 Read
ResultSet rs = ps.executeQuery();
out.println("결과집합 발생");

//4. 결과값을 통한 작업

//5. DB 작업시 사용했던 자원을 반환
rs.close();
ps.close();
conn.close();

} catch (Exception e){
	e.printStackTrace();
}	
%>







</body>
</html>