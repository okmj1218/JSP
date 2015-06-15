<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>    
<%  
//conn.jsp�� ��û�� ���� ��Ȳ�̰�,
//������ db������ �۾��� �ؾߵǴ� ��Ȳ�̴�.

//db������ ������ �Ǵ������� Ȯ���� �ؾ��Ѵ�.

//db�����۾���[�� ���Ǵ� Ŭ�������� �ִµ� java.sql.��Ű���� ���ԵǾ� �ִ�.
//throws Exception�� �ɷ��ִ� �޼��尡 ��κ��̴�(��������)
//->try~catch �ϰ� �۾��� �ʼ��̴�.
try{
	//�ش� DBMS�� ������ �������ִ� ����̹� �ε�
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//DB�� ������� Ȯ���غ���.
	//DB ���� ���, ������, �����н�����
	String url = "jdbc:oracle:thin:@192.168.0.195:1521:xe";
	String user = "jsp";
	String password ="1111";
	
	Connection conn = DriverManager.getConnection(url,user,password);
	System.out.println("DB ���� �ߵ�.!");
	//================================================================
	// ���� �۾��� �����غ���	
	// ����ڰ� => �г���, �̸�, ���� �������� ���� ��Ȳ�̰�, �װ���
	//DB info ���̺� ����ϴ� �۾�
	String okmj = "��ȼ�1";
	String name = "�����2";
	int age = 26;
	
	//�����ؾߵ� ��ɹ��� ���ڿ��� �غ� - �����κ��� ���ε�ó���صΰ�, ���߿� ä��ų�
	String sql = "insert into info values(?,?,?)";
	//String sql2 = "insert into info values('"+okmj+"','"')"
			
	//������ο��ٰ� �÷��ΰ� 
	PreparedStatement ps = conn.prepareStatement(sql);
	//�����ؾߵ� ��ɹ��� ??? ó���ص� �κ��� �ִٸ�, ���� ����������.
	ps.setString(1, okmj); //���ڼ��� ps.setint ����
	ps.setString(2, name); //���ڼ���
	ps.setDouble(3, age);
			
			
	out.println("�غ� ��!..");
	//�غ� �����ٸ�..
	int m = ps.executeUpdate(); // ���ڰ� �ϳ� �߻�..���۵� ������ ���� ����
	
	out.println("�Ϸ�!");
}catch(Exception e){
	e.printStackTrace();
	System.out.println("DB �۾��� ���� �߻�..!");
}
%>