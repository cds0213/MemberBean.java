<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.MemberDAO"%>
<%@ page import="model.MemberBean"%>
<%@ page import=" java.util.Vector"%>
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

	<%
	String id = request.getParameter("id");
	MemberDAO md = new MemberDAO();
	MemberBean mbean = new MemberBean();

	MemberDAO manager = MemberDAO.getInstance();
	MemberBean sid = manager.searchId(id);
	%>


	<div align="center">
		<h2>모든 회원 보기</h2>
		<table width="800" border="1">
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td align="center" width="250">이메일</td>
				<td align="center" width="200">전화번호</td>
				<td align="center" width="200">취미</td>
			</tr>

			<%
			try {
				if (sid != null) {
			%>
			<tr height="50">
				<td align="center" width="150"><a
					href="MemberInfo.jsp?id=<%=mbean.getId()%>"> <%=mbean.getId()%>
				</a></td>
				<td align="center" width="250"><%=mbean.getEmail()%></td>
				<td align="center" width="200"><%=mbean.getTel()%></td>
				<td align="center" width="200"><%=mbean.getHobby()%></td>
			</tr>
			<%
			} 
				else {
					System.out.print("0000");
			%>

				<%
				}
				%>
			
		</table>
	</div>

</body>
<%
} catch (Exception e) {
}
%>


</html>