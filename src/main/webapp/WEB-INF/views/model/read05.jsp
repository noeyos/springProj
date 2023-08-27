<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>Result</h1>
<h4>주소</h4>
<!-- model.addAttribute("memberVOBackup", memberVOBackup); -->
<!-- memberVOBackup.setAddressVO(addressVO); -->
<p>${memberVOBackup.addressVO.zonecode}</p>
<p>${memberVOBackup.addressVO.address}</p>
<p>${memberVOBackup.addressVO.buildingName}</p>
<h4>보유카드</h4>
<!-- memberVOBackup.setCardVOList(cardVOList);
memberVOBackup.cardVOList => List<CardVO>
 -->
<c:forEach var="cardVO" items="${memberVOBackup.cardVOList}">
	<p>${cardVO.no} / ${cardVO.validMonth}</p>
</c:forEach>




