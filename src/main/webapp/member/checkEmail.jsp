<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="emailManager" class="common.EmailManager"/>
<c:set var="authNumber" value="${emailManager.checkEmail(param.email)}"/>
<c:out value="${authNumber}"/>