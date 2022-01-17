package package1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager; import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest; import javax.servlet.http.HttpServletResponse;


@WebServlet(name ="R2", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter();
		
		String n = request.getParameter("custName"); 
		String i = request.getParameter("custIC"); 
		String a = request.getParameter("custAdd"); 
		String p = request.getParameter("custPhone");
		String t = request.getParameter("CustNationality");

		
		try {
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con = DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/servlet", "root", "root1234");
		
		PreparedStatement ps = con.prepareStatement("insert into customer values(?,?,?,?,?)");
		
		ps.setString(1, n); 
		ps.setString(2, i); 
		ps.setString(3, a); 
		ps.setString(4, p);
		ps.setString(5, t);
		
		int i1 = ps.executeUpdate(); if (i1 > 0)
			
		request.setAttribute("custIC", i);
		request.getRequestDispatcher("ship2.jsp").forward(request, response);
		} catch (Exception e2) {
		System.out.println(e2); }
		out.close();	
		
	}

}
