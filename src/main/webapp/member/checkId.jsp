<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id ="dao" class="dao.MemberDAO" />
<c:set var="result" value="${dao.checkId(param.member_id)}" />
<c:choose>
    <c:when test="${result eq 0}">
        <c:out value="PASS" />
    </c:when>
    <c:otherwise>
        <c:out value="FAIL" />
    </c:otherwise>
</c:choose>