package board.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.model.RequestWriting;

public class BoardDao {

	private BoardDao() {
	};

	private static BoardDao dao = new BoardDao();

	public static BoardDao getInstance() {
		return dao;
	}

	// 전체 게시물 수
	public int selectTotalCount(Connection conn) throws SQLException {

		int requestTotalCount = 0;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select COUNT(*) from project.request_list as rl join project.member as m on rl.req_writer=m.member_idx";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			// 검색 한 회원 전체 개수
			if (rs.next()) {
				requestTotalCount = rs.getInt(1);
			}

		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}

		return requestTotalCount;

	}

	/*
	 * public List<RequestWriting> selectRequestList(Connection conn, int startRow,
	 * int countPage) throws SQLException {
	 * 
	 * List<RequestWriting> requestList = new ArrayList<>();
	 * 
	 * PreparedStatement pstmt = null; ResultSet rs = null;
	 * 
	 * String sql =
	 * "select * from project.request_list as rl join project.member as m on rl.req_writer=m.member_idx limit ?,?"
	 * ;
	 * 
	 * 
	 * try { pstmt = conn.prepareStatement(sql); pstmt.setInt(1, startRow);
	 * pstmt.setInt(2, countPage);
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * while (rs.next()) {
	 * 
	 * RequestWriting rw = new RequestWriting();
	 * 
	 * rw.setReq_idx(rs.getInt("req_idx"));
	 * rw.setReq_writer(rs.getString("member_id"));
	 * rw.setReq_title(rs.getString("req_title")); // 게시글 제목
	 * rw.setReq_price(rs.getInt("req_price")); // 가격 rw.setReq_regdate(
	 * rs.getDate("req_regdate")); // 등록날자 rw.setReq_term(rs.getDate("req_term"));
	 * // 렌탈기간 rw.setReq_loc(rs.getString("req_loc")); // 지역 rw.setReq_text(
	 * rs.getString("req_text")); // 상세내용
	 * rw.setReq_readcnt(rs.getInt("req_readcnt")); // 조회수
	 * rw.setReq_status(rs.getInt("req_status")); // 현재상태
	 * rw.setReq_img(rs.getString("req_img")); // 사진
	 * 
	 * // 리스트에 member 객체를 담음 requestList.add(rw); }
	 * 
	 * } finally { if (rs != null) { rs.close(); } if (pstmt != null) {
	 * pstmt.close(); } } return requestList;
	 * 
	 * }
	 */

	public List<RequestWriting> selectRequestList(Connection conn) throws SQLException {
	  
	  List<RequestWriting> requestList = new ArrayList<>();
	  
	  PreparedStatement pstmt = null; ResultSet rs = null;
	  
	  String sql ="select * from project.request_list as rl join project.member as m on rl.req_writer=m.member_idx";
	  
	  
	  try {
	  
	  pstmt= conn.prepareStatement(sql);
	  rs = pstmt.executeQuery();
	  
	  while (rs.next()) {
	  
	  RequestWriting rw = new RequestWriting();
	  
		
		rw.setReq_idx(rs.getInt("req_idx"));
		rw.setReq_writer(rs.getString("member_id"));
		rw.setReq_title(rs.getString("req_title")); // 게시글 제목
		rw.setReq_price(rs.getInt("req_price")); // 가격
		rw.setReq_regdate( rs.getDate("req_regdate")); // 등록날자
		rw.setReq_term(rs.getDate("req_term")); // 렌탈기간
		rw.setReq_loc(rs.getString("req_loc")); // 지역
		rw.setReq_text( rs.getString("req_text")); // 상세내용
		rw.setReq_readcnt(rs.getInt("req_readcnt")); // 조회수
		rw.setReq_status(rs.getInt("req_status")); // 현재상태
		rw.setReq_img(rs.getString("req_img")); // 사진
		
		requestList.add(rw);
	  
	  
	  }
	  
	  
	  
	  } finally { 
				  if (rs != null) { 
					  rs.close(); 
					  } 
				  if (pstmt != null) {
					  pstmt.close(); 
				  
				  } 
		  } 
	  
	  
	  return requestList;
	  
	  }
	 
	

}
