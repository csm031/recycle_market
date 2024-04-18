<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dto" class="dto.MemberDTO"/>
<jsp:setProperty name="dto" property="*"/>
<jsp:useBean id="dao" class="dao.MemberDAO"/>

<c:set var="result" value="${dao.}"