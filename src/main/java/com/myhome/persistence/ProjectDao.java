package com.myhome.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.myhome.domain.Project;

public class ProjectDao {
	public List<Project> select(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from project";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Project> result = new ArrayList<Project>();

			while (rs.next()) {
				Project project = new Project(rs.getString("name"), rs.getString("content"), rs.getDate("start_date"),
						rs.getDate("end_date"), rs.getInt("progression"));

				project.setNo(rs.getInt("project_no"));
				result.add(project);
			}

			return result;
		} finally {
			/*JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);*/
		}

	}

	private Date toDate(Timestamp timestamp) {
		return new Date(timestamp.getTime());
	}

	public void insert(Connection conn, Project project) throws SQLException {
		PreparedStatement pstmt = null;

		try {
			String sql = "insert into project (name, content, start_date, end_date, progression) values(?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, project.getName());
			pstmt.setString(2, project.getContent());
			pstmt.setTimestamp(3, new Timestamp(project.getSdate().getTime()));
			pstmt.setTimestamp(4, new Timestamp(project.getEdate().getTime()));
			pstmt.setInt(5, project.getProgress());

			pstmt.executeUpdate();
		} finally {

			//JdbcUtil.close(pstmt);
		}

	}

	public Project selectById(Connection conn, int no) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "select * from project where project_no=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();
			Project pro = null;
			if (rs.next()) {
				pro = new Project(rs.getString("name"), rs.getString("content"), rs.getDate("start_date"),
						rs.getDate("end_date"), rs.getInt("progression"));
			}
			pro.setNo(rs.getInt("project_no"));
			return pro;
		} finally {
			/*JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);*/
		}

	}

	public void delete(Connection conn, int no) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			String sql = "delete from project where project_no=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();

		} finally {
			//JdbcUtil.close(pstmt);
		}
	}

	public void update(Connection conn, Project project) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			String sql = "update project set name=?, content=?, start_date=?, end_date=?, progression=? where project_no=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, project.getName());
			pstmt.setString(2, project.getContent());
			pstmt.setTimestamp(3, new Timestamp(project.getSdate().getTime()));
			pstmt.setTimestamp(4, new Timestamp(project.getEdate().getTime()));
			pstmt.setInt(5, project.getProgress());
			pstmt.setInt(6, project.getNo());
			int cknum = pstmt.executeUpdate();
			
			if (cknum > 0) {
				System.out.println("데이터 업데이트 성공");
			} else {
				System.out.println("데이터 업데이트 실패");
			}
		} finally {
			//JdbcUtil.close(pstmt);
		}
	}
}
