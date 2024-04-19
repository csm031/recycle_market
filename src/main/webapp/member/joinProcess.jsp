<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dto" class="dto.MemberDTO"/>
<jsp:setProperty name="dto" property="*"/>
<jsp:useBean id="dao" class="dao.MemberDAO"/>

<c:set var="result" value="${dao.join(dto)}"/>

<c:choose>
    <c:when test="${result eq 1}">
        <jsp:forward page="../index.jsp">
            <jsp:param name="join_success" value="회원가입에 성공하였습니다."/>
        </jsp:forward>
    </c:when>
    <c:otherwise>
        <c:redirect url="join.jsp">
            <c:param name="joinfail" value="회원가입에 실패하셨습니다."/>
        </c:redirect>
    </c:otherwise>
</c:choose>