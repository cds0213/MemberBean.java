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

	MemberBean search_id = md.oneSelectMember(id);
	Vector<MemberBean> vec = md.allSelectMember();
	%>
	
	<%-- <%
	if (id.equals(search_id)) {
	%>
	<tr height="50">
		<td align="center" width="150"><a
			href="MemberInfo.jsp?id=<%=search_id.getId()%>"> <%=search_id.getId()%>
		</a></td>
		<td align="center" width="250"><%=search_id.getEmail()%></td>
		<td align="center" width="200"><%=search_id.getTel()%></td>
		<td align="center" width="200"><%=search_id.getHobby()%></td>
	</tr>
	<%
	}
	%> --%>


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
			for (int i = 0; i < vec.size(); i++) {
				MemberBean mbean1 = vec.get(i);
			%>
			<tr height="50">
				<td align="center" width="150"><a
					href="MemberInfo.jsp?id=<%=mbean1.getId()%>"> <%=mbean.getId()%>
				</a></td>
				<td align="center" width="250"><%=mbean1.getEmail()%></td>
				<td align="center" width="200"><%=mbean1.getTel()%></td>
				<td align="center" width="200"><%=mbean1.getHobby()%></td>
			</tr>
			<%
			}
			%>
			
			
		</table>
	</div>

</body>
</html>