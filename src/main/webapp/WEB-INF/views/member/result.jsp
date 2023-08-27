<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<p>아이디 : ${memberVOBackup.userId}</p>
<p>이름 : ${memberVOBackup.userName}</p>
<p>비밀번호 : ${memberVOBackup.password}</p>
<pre>소개글 : ${memberVOBackup.introduction}</pre>
<p>취미 : 
	<!-- String[] hobbys -->
	<c:forEach var="hobby" items="${memberVOBackup.hobbys}">
		<p>${hobby}</p>
	</c:forEach>
</p>
<p>
	성별 : ${memberVOBackup.gender}
</p>
<p>
	국적 : ${memberVOBackup.nationality}
</p>
<p>
	보유자동차 : 
	<!-- String[] cars -->
	<c:forEach var="car" items="${memberVOBackup.cars}">
		<p>${car}<p>		
	</c:forEach>
</p>




