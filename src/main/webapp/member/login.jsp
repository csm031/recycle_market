<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/login.js"></script>
    <title>로그인</title>
    <link rel="icon" href="../resources/img/title_logo.png" type="image/png">

</head>
<body>
<div class="login-form">
    <a href="../index.jsp"><img src="../resources/img/로고.png" id="logo"></a>
    <form method="post" action="loginProcess.jsp" name="login_form">
        <c:choose>
            <c:when test="${not empty cookie.val}">
                <input type="text" name="member_id" value="${cookie.val.value}">
                <input type="password" name="member_pw" placeholder="비밀번호">
                <label>
                    <input type="checkbox" name="save_id" value="Y" checked>아이디 유지
                </label>
                <input type="submit" value="로그인">
            </c:when>
            <c:otherwise>
                <input type="text" name="member_id" placeholder="아이디">
                <input type="password" name="member_pw" placeholder="비밀번호">
                <label id="auto_login">
                    <input type="checkbox" name="save_id" value="Y">아이디 유지
                </label>
                <br>
                <input type="submit" value="로그인">
            </c:otherwise>
        </c:choose>
    </form>
    <div class="links">
        <a href="join.jsp">회원가입</a> <a href="terms_of_Use.jsp">이용약관</a>
    </div>
    <c:if test="${not empty param.msg}">
        <p>${param.msg}</p>
    </c:if>
    <div class="footer">
        <p>Copyright<span id="copyright"> © 재활용마켓</span> All Rights Reserved.</p>
    </div>
</div>
</body>
</html>