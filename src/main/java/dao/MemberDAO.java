package dao;

import common.DBCP;
import dto.MemberDTO;

public class MemberDAO extends DBCP {

    public int login(String member_id, String member_pw) {
        int result = 0;
        try {
            String sql = "select count(*) from RECYCLE_MEMBER where member_id=? and member_pw=? and status=1";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member_id);
            pstmt.setString(2, member_pw);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public MemberDTO getMember(String member_id) {
        MemberDTO dto = null;
        try {
            String sql = "select * from RECYCLE_MEMBER where member_id=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member_id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                dto = new MemberDTO();
                dto.setM_idx(rs.getInt("m_idx"));
                dto.setMember_id(rs.getString("member_id"));
                dto.setMember_pw(rs.getString("member_pw"));
                dto.setMember_name(rs.getString("member_name"));
                dto.setNickname(rs.getString("nickname"));
                dto.setHandphone(rs.getString("handphone"));
                dto.setEmail(rs.getString("email"));
                dto.setGrade(rs.getInt("grade"));
                dto.setReg_date(rs.getDate("reg_date"));
                dto.setUpdate_date(rs.getDate("update_date"));
                dto.setStatus(rs.getInt("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return dto;
    }


}

