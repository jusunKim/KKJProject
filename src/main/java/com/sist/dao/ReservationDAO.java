package com.sist.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.sist.db.ConnectionProvider;
import com.sist.vo.ReservationVO;

public class ReservationDAO {
	
	public static ReservationDAO dao = null;
	private ReservationDAO() { }
	public static ReservationDAO getInstance() {
		if( dao == null ) {
			dao = new ReservationDAO();
		}
		return dao;
	}
	
	// 예약번호로 예약취소 - 정말 취소하시겠습니까?(확인절차)
	public int deleteReservation(int rno) {
		int re = -1;
		String sql = "delete reservation where rno = " + rno;
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			re = pstmt.executeUpdate();
			ConnectionProvider.close(conn, pstmt);
		} catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}
		return re;
	}
	
	// 예약하기
	public int insertReservation(ReservationVO r) {
		int re = -1;
		String sql = "insert into Reservation values (?, sysdate, ?, ?, ?, ?, ?, ?, ?)";
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getRno());
			pstmt.setString(2, r.getCardno());
			pstmt.setString(3, r.getCheckin_date());
			pstmt.setString(4, r.getCheckout_date());
			pstmt.setInt(5, r.getGuest_cnt());
			pstmt.setInt(6, r.getSaleprice());
			pstmt.setInt(7, r.getUno());
			pstmt.setInt(8, r.getPno());
			
		} catch (Exception e) {
			System.out.println("예외발생 : " + e.getMessage());
		}
		return re;
	}
	
	// 회원번호를 가지고 자신을 예약 조회 - 내림차순 정렬
	public ArrayList<HashMap<String, Object>> listMyReservation(int uno){
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql = "select rno, cardno, checkin_date, checkout_date, guest_cnt, saleprice, p.p_name"
				+ " from reservation r, product p"
				+ " where r.pno = p.pno and uno = "+ uno
				+ " order by rno desc";
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("rno", rs.getInt(1));
				map.put("cardno", rs.getInt(2));
				map.put("checkin_date", rs.getDate(3));
				map.put("checkout_date", rs.getDate(4));
				map.put("guest_cnt", rs.getInt(5));
				map.put("saleprice", rs.getInt(6));
				map.put("p_name", rs.getString(7));
				list.add(map);
			}
			ConnectionProvider.close(conn, stmt, rs);
		} catch (Exception e) {
			System.out.println("예외발생 : " + e.getMessage());
		}
		return list;
	}
	
	// 전체 예약 조회 - 내림차순 정렬
	public ArrayList<HashMap<String, Object>> listReservation(){
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql = "select rno, cardno, checkin_date, checkout_date, guest_cnt, saleprice, u.u_name, p.p_name"
				+ "from reservation r, product p, users u"
				+ "where r.pno = p.pno"
				+ "and r.uno = u.uno"
				+ "order by rno desc";
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("rno", rs.getInt(1));
				map.put("cardno", rs.getInt(2));
				map.put("checkin_date", rs.getDate(3));
				map.put("checkout_date", rs.getDate(4));
				map.put("guest_cnt", rs.getInt(5));
				map.put("saleprice", rs.getInt(6));
				map.put("u_name", rs.getString(7));
				map.put("p_name", rs.getString(8));
				list.add(map);
			}
			ConnectionProvider.close(conn, stmt, rs);
		} catch (Exception e) {
			System.out.println("예외발생 : " + e.getMessage());
		}
		return list;
	}
	
	// 상품 등록시 번호 부여
		public int getNextNo() {
			int no = 0;
			String sql  = "select nvl(max(no),0) + 1 from Reservation";
			try {
				Connection conn = ConnectionProvider.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				if(rs.next()) {
					no = rs.getInt(1);
				}
				ConnectionProvider.close(conn, stmt, rs);
			} catch (Exception e) {
				System.out.println("예외발생 : " + e.getMessage());
			}
			return no;
		}
	
}
