<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<title>inform</title>
</head>
<body>
<h2>�հ���ȸ</h2>
<hr/>

<!--  
form �±׿� post�� �����ؼ� ���� ���޹ް� �����ϴ� ��Ȳ
1. ���ް��� url�� �巯���� �ʱ� ���Ҷ� (�α���)
2. ���ް��� ������ (ȸ������ ���� ���)
3. ���� ���ε� 
4. �ѱ۰��� ���޹ޱ� ���� ��Ȳ 
 -->
<form action="inproc.jsp"method="post">
id : <input type="text" name="id"/><br/>
���� : <input type="text" name="kor"/><br/>
���� : <input type="text" name="eng"/><br/>
���� : <input type="text" name="eng"/><br/>
<input type="submit" value="register">
</form>
</body>
</html>