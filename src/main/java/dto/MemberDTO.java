package dto;

import java.util.Date;

public class MemberDTO {

    private int m_idx;
    private Date reg_date;
    private Date update_date;
    private int grade;
    private int status;
    private String member_id;
    private String member_pw;
    private String member_name;
    private String nickname;
    private String handphone;
    private String email;


    public int getM_idx() {
        return m_idx;
    }

    public void setM_idx(int m_idx) {
        this.m_idx = m_idx;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }

    public Date getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(Date update_date) {
        this.update_date = update_date;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMember_id() {
        return member_id;
    }

    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }

    public String getMember_pw() {
        return member_pw;
    }

    public void setMember_pw(String member_pw) {
        this.member_pw = member_pw;
    }

    public String getMember_name() {
        return member_name;
    }

    public void setMember_name(String member_name) {
        this.member_name = member_name;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getHandphone() {
        return handphone;
    }

    public void setHandphone(String handphone) {
        this.handphone = handphone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
