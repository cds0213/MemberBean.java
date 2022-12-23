<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.MemberDAO"%>
<%@ page import="model.MemberBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	MemberDAO md = new MemberDAO();
	MemberBean mbean = md.oneSelectMember(id);
	%>

	<div align="center">
		<h2>개인 회원 보기</h2>
		<table width="400" border="1">

			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td width="250"><%=mbean.getId()%></td>
			</tr>

			<tr height="50">
				<td align="center" width="150">이메일</td>
				<td width="250"><%=mbean.getEmail()%></td>
			</tr>

			<tr height="50">
				<td align="center" width="150">전화</td>
				<td width="250"><%=mbean.getTel()%></td>
			</tr>

			<tr height="50">
				<td align="center" width="150">취미</td>
				<td width="250"><%=mbean.getHobby()%></td>
			</tr>

			<tr height="50">
				<td align="center" width="150">직업</td>
				<td width="250"><%=mbean.getJob()%></td>
			</tr>

			<tr height="50">
				<td align="center" width="150">나이</td>
				<td width="250"><%=mbean.getAge()%></td>
			</tr>

			<tr height="50">
				<td align="center" width="150">자기소개</td>
				<td width="250"><%=mbean.getInfo()%></td>
			</tr>

			<tr height="50">
				<td align="center" colspan="2">
					<button type="button"
						onclick="location.href='MemberUpdateForm.jsp?id=<%=mbean.getId()%>'">회원
						수정</button>
					<button type="button"
						onclick="location.href='MemberDeleteForm.jsp?id=<%=mbean.getId()%>'">회원
						삭제</button>
					<button type="button" onclick="location.href='MemberList.jsp'">목록보기</button>
					<button type="button" onclick="location.href='MemberJoin.html'">회원
						가입</button>
				</td>
			</tr>

		</table>
	</div>
</body>
</html>