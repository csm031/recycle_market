<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
    <title>로그인</title>
    <link rel="icon" href="../resources/img/title_logo.png" type="image/png">
</head>
<body>
<div class="login-form">
    <img src="../resources/img/로고.png" id="logo">
    <input type="text" placeholder="아이디">
    <input type="password" placeholder="비밀번호">
    <label id="auto_login">
        <input type="checkbox">로그인 상태 유지
    </label>

    <div class="footer">
        <p>Copyright<span id="copyright"> © 재활용마켓</span> All Rights Reserved.</p>
    </div>
</div>
</body>
</html>

