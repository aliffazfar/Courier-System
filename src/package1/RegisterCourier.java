package package1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager; import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest; import javax.servlet.http.HttpServletResponse;


@WebServlet(name ="R4", urlPatterns = {"/RegisterCourier"})
public class RegisterCourier extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter();
		
		String n = request.getParameter("courierName"); 
		String i = request.getParameter("courierIC"); 
		String a = request.getParameter("courierAdd"); 
		String p = request.getParameter("courierPhone");
		String t = request.getParameter("courierPostcode");
		String tt = request.getParameter("courierType");
		
		try {
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con = DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/servlet", "root", "root1234");
		
		PreparedStatement ps = con.prepareStatement("insert into courier values(?,?,?,?,?,?)");
		
		ps.setString(1, n); 
		ps.setString(2, i); 
		ps.setString(3, a); 
		ps.setString(4, p);
		ps.setString(5, t);
		ps.setString(6, tt);
		
		int i1 = ps.executeUpdate(); if (i1 > 0)
		response.setContentType("text/html");
		out.println("<script type=\"text/javascript\">");  
		out.println("alert('Courier Registered Successfully');");  
		out.println("window.location.assign('couriertable.jsp');");  
		out.println("</script>");
		} catch (Exception e2) {
		System.out.println(e2); }
		out.close();	
		
	}

}
