<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
    <title>회원가입</title>
    <link rel="icon" href="../resources/img/title_logo.png" type="image/png">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/join.js"></script>

</head>
<body>
<div class="form">
    <a href="../index.jsp"><img src="../resources/img/로고.png" alt="로고"></a>
    <h3>본인 정보를 입력해주세요</h3>
    <form method="post" action="joinProcess.jsp" name="form_join" id="form_join">
        <input type="text" name="member_id" id="member_id" placeholder="아이디">
        <input type="button" id="check_id" value="중복검사">
        <div id="result_checkId"></div>
        <input type="password" name="member_pw" id ="member_pw" placeholder="비밀번호"><br>
        <input type="text" name="member_name" id="member_name" placeholder="이름"><br>
        <input type="text" name="nickname" id ="nickname" placeholder="닉네임"><br>
        <input type="text" name="handphone" id="handphone" placeholder="핸드폰번호">
        <select id="news_agency">
            <option value="" selected disabled>통신사</option>
            <option value="SKT">SKT</option>
            <option value="KT">KT</option>
            <option value="LG_U+">LG U+</option>
        </select>
        <div class="div-email">
            <input type="email" name="email" id="email" placeholder="이메일">
            <input type="button" id="email_auth_btn" value="메일인증">
        </div>
        <div class="div-email">
            <input type="text" id="auth_num_input" placeholder="인증번호 6자리를 입력해주세요"
                   disabled="disabled" maxlength="6">
            <input type="button" id="confirm_email_btn" value="인증확인">
        </div>
        <input type="hidden" name="result_confirm" id="result_confirm" >
        <div id="mail-check-result"></div>
        <br>
        <div id="terms_of_use"
             style="width: 100%; height: 300px; overflow: auto;border: 1px solid gray; padding-left:10px">
            <h2>이용약관</h2>
            <h3>
                <li>제1조(목적)</li>
            </h3>
            <p class="content">본 약관은 재활용마켓 (이하 “회사”라 합니다)가 제공하는 모바일 및 온라인 서비스(이하 “서비스”라 합니다)의 이용과 관련하여 회사와 회원 사이의 권리, 의무
                및
                책임사항, 기타 제반사항을 규정함을 목적으로 합니다.</p>
            <h3>
                <li>제2조 (정의)</li>
            </h3>
            <p class="content">본 약관에서 사용하는 용어의 정의는 다음 각 호와 같으며, 정의되지 않은 본 약관상 용어의 해석은 관련 법령, 본 이용약관 및 서비스상 공지사항, 기타 일반적인
                거래
                관행에 의합니다.</p>
            <ol>
                <li class="content">회원: 본 약관에 동의하고 회사와 서비스 이용계약을 체결하여 서비스를 이용하는 자를 말합니다.</li>
                <li class="content">판매자: 서비스에 물품(재화 또는 용역, 이하 같습니다)을 등록하여 판매하거나 판매할 의사로 서비스를 이용하는 회원을 말합니다. 다만, 회사가 특정
                    물품을
                    직접 판매하거나, 위탁판매서비스를 통해 특정 물품의 판매를 위탁 받아 판매하는 경우에는 회사를 지칭합니다.
                </li>
                <li class="content">구매자: 판매자가 판매하는 물품을 구매하거나 구매할 의사로 서비스를 이용하는 회원을 말합니다.</li>
            </ol>
            <h3>
                <li>제3조 (약관 등의 명시와 개정 및 효력)</li>
            </h3>
            <ol>
                <li class="content">회사는 본 약관의 내용을 회원이 쉽게 확인할 수 있도록 웹사이트 및 어플리케이션 화면에 게시합니다.</li>
                <li class="content">회사는 전자상거래 등에서의 소비자보호에 관한 법률(이하 “전자상거래법”), 약관의 규제에 관한 법률(이하 “약관법”), 전자문서 및 전자거래기본법,
                    정보통신망
                    이용촉진 및 정보보호 등에 관한 법률(이하 “정보통신망법”), 소비자기본법 등 관련 법령을 위반하지 않는 범위 내에서 본 약관을 개정할 수 있습니다.
                </li>
                <li class="content">회사는 약관을 개정할 경우에 적용 일자, 개정 내용 및 개정 사유를 명시하여 그 적용 일자로부터 최소한 7일 이전부터 서비스 내 전자게시판에
                    공지합니다.
                    다만, 개정 약관의 내용이 회원에게 불리한 경우에는 개정 약관 적용 일자 30일 전부터 공지합니다.
                </li>
                <li class="content">회사가 전항에 따라 개정 약관을 공지하면서 ‘회원에게 개정 약관 시행일전까지 회원이 거부 의사를 표시하지 아니할 경우 회원이 개정 약관에 동의한 것으로
                    본다는
                    뜻’을 고지하였음에도 회원이 명시적으로 거부 의사표시를 하지 아니한 경우 회원이 개정 약관에 동의한 것으로 봅니다.
                </li>
            </ol>
            <h3>
                <li> 제4조 (약관의 해석)</li>
            </h3>
            <ol>
                <li class="content">회사는 개별 서비스에 대해서 별도의 이용약관 및 정책 등(이하 "개별 약관 등")을 수립할 수 있으며, 개별 서비스에 대한 내용이 본 약관과 상충할
                    경우에는
                    개별 약관 등이 우선하여 적용됩니다.
                </li>
                <li class="content">본 약관에 명시되지 않은 사항은 약관법, 전자상거래법, 정보통신망법, 전자상거래 등에서의 소비자보호지침(이하 "소비자보호지침") 등 관련 법령 또는
                    상관례에
                    따릅니다.
                </li>
            </ol>
            </ul>
        </div>
        <br>
        <label>
            <input type="checkbox" name="agreement" value="Y" id ="save_id">
            <span style="color: green; font-size: 13px">[필수]</span> 이용약관 동의<br>
        </label>
        <input type="submit" value="가입하기">
        <input type="reset" value="취소하기">
    </form>

    <div class="footer">
        <p>Copyright<span id="copyright"> © 재활용마켓</span> All Rights Reserved.</p>
    </div>

</div>
<script>
    window.onload = function () {
        let joinfail = "${param.joinfail}";
        if (joinfail) {
            alert(joinfail);
        }
    }
</script>
</body>
</html>

