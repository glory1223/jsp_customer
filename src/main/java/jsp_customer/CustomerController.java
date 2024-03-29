package jsp_customer;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;




@WebServlet("/")
@MultipartConfig(maxFileSize=1024*1024*2, location="c:/Temp/img") //파일업로드하려면 필수적으로 어노테이션해줘야함.
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private CustomerDAO dao;
	private ServletContext ctx;
	
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // request객체에서 넘어온 데이터의 한글깨짐 방지.
		
		String command = request.getServletPath(); // 경로: 프로젝트명 뒤
		
		String site = null;
		
		switch(command) {
			case "/index" : site = getList(request); break;	
			case "/view" : site = getView(request); break;
			case "/write" : site = "write.jsp"; break;
			case "/insert" : site = insertCustomer(request); break;
			case "/edit" : site = getViewForEdit(request); break; //edit.jsp로 이동
			case "/update" : site = updateCustomer(request); break;
			case "/delete" : site = deleteCustomer(request); break;
		}
		
		if(site.startsWith("redirect:/")) {//site의 문자열이 ()로 시작하냐 //redirect 처리
			
			String rview = site.substring("redirect:/".length()); //10부터 끝까지
			response.sendRedirect(rview); //rview: "/index"
			
		} else  { //forward 처리
			
			ctx.getRequestDispatcher("/" + site).forward(request, response); //request객체, response객체전달
		}
	}
	
	
	//CustomerDAO객체의 getList 메소드 실행하여 고객리스트 전체를 가져온후 request객체에 넣어준다.
	public String getList(HttpServletRequest request) {
		List<Customer> list;
		
		try {
			list = dao.getList();
			request.setAttribute("customerList", list);
		} catch (Exception e) {

			e.printStackTrace();
		}
		return "index.jsp";
	}
	
	//고객리스트의 고객상세정보 페이지를 가져와서 request객체에 넣어준다.
	public String getView(HttpServletRequest request) {
		//쿼리파라메터에 있는 id값을 가져온다.
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			Customer c = dao.getView(id);
			request.setAttribute("customer", c);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return "view.jsp";
	}
	
	
	//고객정보를 등록해준다.
	public String insertCustomer(HttpServletRequest request) {
		Customer c = new Customer();
		
		
		try {
			//BeanUtils: write의 name에 해당하는 값들을 Customer 객체의 속성에 넣어준다.
			BeanUtils.populate(c, request.getParameterMap());
			
			//1. 이미지 파일 서버(c:/Temp/img) 컴퓨터에 저장
			Part part = request.getPart("file"); //Part:파일을 받기위한 클래스타입 / 파일은 getPart()로 가져옴 / 파일에 대한 정보
			String fileName = getFilename(part); //파일명을 구하자
			
			//업로드된 파일이 있는지 확인
			if(fileName != null && !fileName.isEmpty()) { //fileName이 null이 아니고 length()도 0이 아니라면
				part.write(fileName); //write(): 파일을 서버에 업로드함
				
				//2. 경로를 포함한 이미지 파일 이름을 Customer객체에 저장
				c.setImg("/img/" + fileName);
			} else {
				c.setImg("/img/default.png"); //업로드한 이미지가 없을 경우 빈문자열 저장
			}
			
			dao.insertCustomer(c);
				
			
		} catch (Exception e) {
	
			e.printStackTrace();
		}
		return "redirect:/index";
	}
	
	// ※※※ 파일에서 이미지명을 추출하는 메소드
		private String getFilename(Part part) {
			String fileName = null;
			//파일이름이 들어있는 헤더영역을 가지고옴(헤더영역에 파일데이터들이 있음)
			String header = part.getHeader("content-disposition");
			
			//form-data; name="img"; filename="사진5.jpg"
			System.out.println("Header: " + header); 
			
			//파일 이름이 들어있는 속성부분의 시작위치(인덱스)를 가지고옴
			int start = header.indexOf("filename=");
			//쌍따옴표 사이의 값 부분만 가지고 옴
			fileName = header.substring(start + 10, header.length() - 1);
			
			return fileName;
		}
	
		
	//고객정보을 수정해준다.
	public String updateCustomer(HttpServletRequest request) {
		Customer c = new Customer();
		
		/*
		 HTTP 요청에서 "origin_file"이라는 이름의 파라미터 값을 가져와서 origin_file이라는 변수에 저장합니다. 
		 이는 기존에 업로드된 파일의 경로를 가리키는 값입니다. 
		 보통은 수정할 때, 새로운 파일을 업로드하지 않는 경우를 대비하여 이전에 업로드된 파일의 경로를 유지하기 위한 것입니다.
		 */
		String origin_file = request.getParameter("origin_file");
		
		try {
			/*
			 BeanUtils.populate() 메서드를 사용하여 HTTP 요청에서 받은 파라미터 값을 Customer 객체에 설정합니다. 이를 통해 고객정보의 제목, 내용 등을 업데이트할 수 있습니다.
			 */
			BeanUtils.populate(c, request.getParameterMap());
			
			//1. 이미지 파일 서버(c:/Temp/img) 컴퓨터에 저장
			Part part = request.getPart("file"); //Part:파일을 받기위한 클래스타입 / 파일은 getPart()로 가져옴 / 파일에 대한 정보
			String fileName = getFilename(part); //파일명을 구하자
			
			//업로드된 파일이 있는지 확인
			if(fileName != null && !fileName.isEmpty()) { //fileName이 null이 아니고 length()도 0이 아니라면
				part.write(fileName); //write(): 파일을 서버에 업로드함
				
				//2. 경로를 포함한 이미지 파일 이름을 Customer객체에 저장
				c.setImg("/img/" + fileName); //이미지가 없는 기존의 업로드된 파일이 있는데 이미지수정할때
					
			}else { //업로드된 파일이 없을때
					if(origin_file == null || origin_file.equals("")) {
						c.setImg(null);
					} else {
						c.setImg(origin_file);
					}
			}
			
			dao.updateCustomer(c);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				
				//쿼리스트링의 한글깨짐을 방지하기위해 UTF-8로 인코딩
				String encodeName = URLEncoder.encode("게시물이 정상적으로 수정되지 않았습니다!", "UTF-8");
				return "redirect:/view?id=" + c.getId() +"&error=" + encodeName;
				
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}
		
		return "redirect:/view?id=" + c.getId();
	}
	
		
	//수정할 게시물의 기존 데이터를 가지고 와서 request 객체에 넣어준다.
	public String getViewForEdit (HttpServletRequest request) {
		
		//쿼리 파라메터에 있는 id값을 가져온다.
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			Customer c = dao.getView(id);
			request.setAttribute("customer", c);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "edit.jsp";
	}
	
	
	//고객정보를 삭제해준다.
	public String deleteCustomer(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			dao.deleteCustomer(id);
		} catch (Exception e) {
			e.printStackTrace();
			try {
				
				//쿼리스트링의 한글깨짐을 방지하기위해 UTF-8로 인코딩
				String encodeName = URLEncoder.encode("게시물이 정상적으로 삭제되지 않았습니다!", "UTF-8");
				return "redirect:/index?error=" + encodeName;
				
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
		}
		
		return "redirect:/index";
	}
	
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		
		//init은 서블릿 객체 생성시 딱 한번만 실행되므로 객체를 한번만 생성해 공유한다.
		dao = new CustomerDAO();
		ctx = getServletContext(); //ServletContext: 웹 어플리케이션의 자원관리를 한다.
	}
   
	
	
}
