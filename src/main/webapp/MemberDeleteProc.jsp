<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*"></jsp:setProperty>
	</jsp:useBean>

	<%
	String id = request.getParameter("id");
	MemberDAO md = new MemberDAO();

	String pw1 = md.getPw1(id);
	if (mbean.getPw1().equals(pw1)) {
		md.deleteMember(mbean.getId());
		response.sendRedirect("MemberList.jsp");// 
	} else {
	%>
	<script type="text/javascript">
		alert("패스워드가 맞지 않습니다.다시 확인해 주세요");
		history.go(-1);
	</script>
	<%
	}
	%>
</body>
</html>