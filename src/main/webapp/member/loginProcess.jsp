<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="common.CookieManager" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="member_id" value="${param.member_id}"/>
<c:set var="member_pw" value="${param.member_pw}"/>
<c:set var="save_id" value="${param.save_id}"/>
<jsp:useBean id="dao" class="dao.MemberDAO"/>
<c:set var="result" value="${dao.login(member_id, member_pw)}"/>

<c:choose>
    <c:when test="${result eq 1}">
        <c:set var="member" value="${dao.getMember(member_id)}" scope="session"/>
        <c:if test="${(save_id == 'Y') and (empty cookie.val)}">
            ${CookieManager.createCookie(pageContext.response,"val",member_id,120)}
        </c:if>
        <c:redirect url="../index.jsp"/>
    </c:when>
    <c:otherwise>
        <jsp:forward page="login.jsp">
            <jsp:param name="msg" value="아이디나 비밀번호가 일치하지 않습니다."/>
        </jsp:forward>
    </c:otherwise>
</c:choose>
