
$(function () {
    let form_join = $("#form_join");
    $("#check_id").on("click", () => {
        let member_id = $("#member_id").val();
        if (member_id.length === 0) {
            alert("아이디가 입력되지 않았습니다.")
            form_join.find("#member_id").focus();
        } else {
            $.ajax({
                type: "post",
                url: "checkId.jsp",
                data: {"member_id": member_id},
                success: function (result) {
                    const resultCheck = $("#result_checkId");
                    resultCheck.show();
                    if (result.trim() === "PASS") {
                        resultCheck.html("사용 가능한 아이디입니다.").css("color", "green");
                    } else {
                        resultCheck.html("이미 사용중인 아이디입니다.").css("color", "red");
                        $("member_id").val("").trigger("focus");
                    }
                },
                error: function (error) {
                    console.log("아이디 중복검사 에러")
                },
            })
        }
    })

    $("#form_join").on("submit", (e) => {
        let valid = false

        const regexp_pw = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[~!@#$%^&*()_+|])[0-9A-Za-z~!@#$%^&*()+]{8,16}$/;
        const regexp_phone = /^010-\d{4}-\d{4}$/;

        if($("#member_id").val().length === 0) {
            alert("아이디가 입력되지 않았습니다.");
            $("#member_id").focus();
        } else if($("#member_pw").val().length === 0) {
            alert("비밀번호가 입력되지 않았습니다.");
            $("#member_pw").focus();
        } else if(!regexp_pw.test($("#member_pw").val())) {
            alert("비밀번호는 8글자 이상 16글자 이하로 영문자,숫자,특수문자를 1개 이상 포함해야 합니다.");
            $("#member_pw").focus();
        } else if($("#member_name").val().length === 0) {
            alert("이름이 입력되지 않았습니다.");
            $("#member_name").focus();
        } else if($("#nickname").val().length === 0) {
            alert("닉네임이 입력되지 않았습니다.");
            $("#nickname").focus();
        } else if($("#handphone").val().length === 0) {
            alert("핸드폰번호가 입력되지 않았습니다.");
            $("#handphone").focus();
        } else if(!regexp_phone.test($("#handphone").val())) {
            alert("전화번호가 010-숫자4자리-숫자4자리로 입력해야 합니다");
            $("#handphone").focus();
        } else if($("#email").val().length === 0) {
            alert("이메일이 입력되지 않았습니다.");
            $("#email").focus();
        } else if($("#result_confirm").val().length === "FAIL" || $("#result_confirm").val().length === 0) {
            alert("이메일 인증이 필요합니다.");
            $("#email").focus();
        } else if(!$("#save_id").prop('checked')) {
            alert("이용약관 동의가 필요합니다.");
        }

        else{//유효성 검사를 통과한 경우
            valid = true;
        }
        if(!valid){
            e.preventDefault();
            e.stopPropagation();
        }
    })

    let code;
    const checkInput = $("#auth_num_input");

    $("#email_auth_btn").on("click",() => {
        const email = $("#email").val();

        let regExp_email = /^[0-9A-Za-z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
        if (regExp_email.test(email)) {

            $.ajax({
                type:"get",
                url:"checkEmail.jsp?email="+email,
                success: (data) => {
                    checkInput.attr("disabled", false);
                    code = data.trim();
                    alert("인증번호가 전송되었습니다.")
                },
            })
        } else {
            alert("입력하신 내용이 이메일 형식에 맞지 않습니다.");
            form_join.$("#email").focus();
        }
    })

    $("#confirm_email_btn").on("click", () => {
        const inputCode = checkInput.val();
        const resultMsg = $("#mail-check-result")
        resultMsg.show();
        const resultEmailAuth = $("#result_confirm");//인증결과를 넘겨줄 input hidden 태그

        if (inputCode === code) {
            resultMsg.html("정상적으로 인증되었습니다.");
            resultMsg.css("color", "green");
            resultEmailAuth.val("PASS");
        } else {
            resultMsg.html("인증번호가 맞지 않습니다. 다시 확인해주세요");
            resultMsg.css("color", "red");
            resultEmailAuth.val("FAIL");
        }
    })
})