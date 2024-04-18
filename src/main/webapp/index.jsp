<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
<head>
    <title>재활용 마켓</title>
    <link rel="icon" href="${pageContext.request.contextPath}/resources/img/title_logo.png" type="image/png">
</head>
<body>
<header>
    <div>
        <a href="index.jsp"><img src="${pageContext.request.contextPath}/resources/img/로고.png" id="logo" alt="로고"></a>
        <input type="text" class="search_bar" placeholder="상품명 입력" value="">
        <p>
            <c:choose>
                <c:when test="${not empty member}">
                    <p id="nickname">${member.nickname}님 반갑습니다.</p>
                    <a href="${pageContext.request.contextPath}/member/logoutProcess.jsp" class="Sign_Login">로그아웃</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/member/login.jsp" class="Sign_Login">로그인</a>&nbsp;&nbsp;
                    <a href="${pageContext.request.contextPath}/member/join.jsp" class="Sign_Login">회원가입</a>
                </c:otherwise>
            </c:choose>
        </p>
    </div>
</header>
<hr>
<footer>
    <p>Copyright<span id="copyright"> © 재활용마켓</span> All Rights Reserved.</p>
</footer>
<script>
    window.onload = function() {
        let joinSuccess = "${param.join_success}";
        if (joinSuccess) {
            alert(joinSuccess);
        }
    }
</script>
</body>
</html>