<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
</head>
<body>

// ������ Ȯ�� �� Ŭ���̾�Ʈ��






//2. �۾� �غ� (��ɹ��� �����Ҽ��ִ� ���·� �����α�)
String sql = "select * from info order by id asc";
PreparedStatement ps = conn.prepareStatement(sql);


//3. �۾� ����
//executeUpdate() : - > int ���� ��ȯ : ������ ���� ���� ����" 
//������ ���̽��� ������ �Ͼ�� Create, Update, Delete
//excuteQuery() : ->ResultSet �� ��ȯ : ������� Ȯ���Ҽ��ְ� �ص�
//������ ���̽��� �ִ� ������� Ȯ���ϴ� Read
ResultSet rs = ps.executeQuery();
out.println("������� �߻�");

//4. ������� ���� �۾�

//5. DB �۾��� ����ߴ� �ڿ��� ��ȯ
rs.close();
ps.close();
conn.close();

} catch (Exception e){
	e.printStackTrace();
}	
%>







</body>
</html>