package jsp_customer;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CustomerDAO {
	//DB connection
	final static String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver"; 
	final static String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	
	//데이터 베이스를 연결하는 open
	public Connection open() {
		Connection conn = null;
		
		try {
			Class.forName(JDBC_DRIVER);
			
			conn = DriverManager.getConnection(JDBC_URL, "test", "test1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn; // 데이터베이스 연결 객체를 리턴
	}
	
	//고객리스트르 가져오는 메소드
	public ArrayList<Customer> getList() throws Exception {
		Connection conn = open(); //DB 커넥션 열기
		
		ArrayList<Customer> customerList = new ArrayList<>(); //Customer객체를 저장할 ArrayList
		
		String sql ="SELECT id, name, gender, grade FROM customer order by id";
		
		PreparedStatement pstmt = conn.prepareStatement(sql); //쿼리문 등록
		
		ResultSet rs = pstmt.executeQuery(); // 쿼리문 실행 -> 데이터베이스에 결과저장.
		
		//리소스 자동닫기
		try(conn; pstmt; rs) { //try문이 다끝나면 이 리소스들을 자동으로 close
			
			while(rs.next()) {//쿼리문을 한행씩 가져옴.
				Customer c = new Customer();
				
				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setGender(rs.getString("gender"));
				c.setGrade(rs.getString("grade"));
				
				customerList.add(c);
			}
		}
		return customerList;
	}
	
	
	//고객 상세정보가져오는 메소드
		public Customer getView(int id) throws Exception {
			Connection conn = open();
			
			Customer c = new Customer();
			
			String sql = "select id, name, address, phone, gender, age, img, point, grade from customer where id= ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql); //쿼리문 등록
			
			pstmt.setInt(1, id);
			
			ResultSet rs = pstmt.executeQuery();  // 쿼리문 실행 -> 데이터베이스에 결과저장
			
			try(conn; pstmt; rs) { // try문이 끝나면 이 리소스들을 자동으로 close
				while(rs.next()) { //쿼리문을 한행씩
					c.setId(rs.getInt("id")); // id필드에 값가져와서 설정?
					c.setName(rs.getString("name"));
					c.setAddress(rs.getString("address"));
					c.setPhone(rs.getString("phone"));
					c.setGender(rs.getString("gender"));
					c.setAge(rs.getInt("age"));
					c.setImg(rs.getString("img"));
					c.setPoint(rs.getInt("point"));
					c.setGrade(rs.getString("grade"));
				}
			}
			return c;
		}
		
		//고객정보 등록 메소드
		public void insertCustomer(Customer c) throws Exception {
			Connection conn = open();
			
			String sql ="insert into customer values(customer_seq.nextval, ?,?,?,?,?,?,?,?)";
			
			PreparedStatement pstmt = conn.prepareStatement(sql); //쿼리문 등록
			
			try(conn; pstmt) {
				pstmt.setString(1, c.getName());
				pstmt.setString(2, c.getAddress());
				pstmt.setString(3, c.getPhone());
				pstmt.setString(4, c.getGender());
				pstmt.setInt(5, c.getAge());
				pstmt.setString(6, c.getImg());
				pstmt.setInt(7, c.getPoint());
				pstmt.setString(8, c.getGrade());
				
				pstmt.executeUpdate();
			}
		}
		
		
		//고객정보를 수정하는 메소드
		public void updateCustomer(Customer c) throws Exception {
			Connection conn = open();
			
			String sql = "update customer set name=?, address=?, phone=?, gender=?, age=?, img=?, point=?, grade=? WHERE id=?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			try (conn; pstmt) { //try 문을 실핸한후에 이 리소스들은 자동으로 close된다
				pstmt.setString(1, c.getName());
				pstmt.setString(2, c.getAddress());
				pstmt.setString(3, c.getPhone());
				pstmt.setString(4, c.getGender());
				pstmt.setInt(5, c.getAge());
				pstmt.setString(6, c.getImg());
				pstmt.setInt(7, c.getPoint());
				pstmt.setString(8, c.getGrade());
				pstmt.setInt(9, c.getId());
				
				//수정된 내용이 없을경우
				if(pstmt.executeUpdate() != 1) {
					throw new Exception("수정된 글이 없습니다.");
				}
			}
			
		}
		
		
		//고객정보를 삭제하는 메소드
		public void deleteCustomer(int id) throws Exception {
			Connection conn = open();
			
			String sql = "delete from customer where id=?"; //쿼리문
			PreparedStatement pstmt = conn.prepareStatement(sql); //쿼리문 실행
			
			try(conn; pstmt) { // try문을 실행한후에 이리소스들을 자동으로 닫아준다.
				pstmt.setInt(1, id);
				
				if(pstmt.executeUpdate() != 1) {//삭제된 글이 없다는 뜻
					throw new Exception ("삭제된 글이 없서");
				}
			}
		}
	
}
	

