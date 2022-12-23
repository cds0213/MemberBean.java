<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.MemberDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	String[] hobby = request.getParameterValues("hobby");
	// 배열에 있는 내용을 하나의 스트링으로 저장
	String texthobby = "";

	for (int i = 0; i < hobby.length; i++) {
		texthobby += hobby[i] + " ";
	}
	%>
	<!-- 액션태그를 사용하여 객체 생성, id="mbean", setProperty 액션태그를 사용하여 데이터 값을 설정 -->
	<jsp:useBean id="mbean" class="model.MemberBean"></jsp:useBean>
	<jsp:setProperty name="mbean" property="*"></jsp:setProperty>
	
	<%
	
	mbean.setHobby(texthobby);
	MemberDAO md=new MemberDAO();
	md.insertMember(mbean);
	
	// 회원 가입이 돼있다면 회원 정보를 보여주는 페이지로 이동
	response.sendRedirect("MemberList.jsp");
	%>
	
	OK! MemberJoinProc!
</body>
</html>