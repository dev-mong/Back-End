package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import dao.EmpDao;
import jdbc.ConnectionProvider;
import model.Emp;

public class EmpListService {
	
	//싱글톤 처리
	private EmpListService () {
	}

	private static EmpListService service=new EmpListService();
	
	public static EmpListService getInstance() {
		return service;
	}
	
	
	EmpDao dao;
	
	//예외처리, 트랜잭션 처리
	public List<Emp> getEmpList(){
		
		//사용할 Dao 인스턴스
		dao=EmpDao.getInstance();
		//Connection
		Connection conn=null;
		List<Emp> list=null;
		
		try {
			//connection 객체 생성
			conn=ConnectionProvider.getConnection();
			list = dao.getEmpList(conn);
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		return list;
	}

}
