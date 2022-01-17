package package1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager; import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest; import javax.servlet.http.HttpServletResponse;

@WebServlet(name ="R7", urlPatterns = {"/RegisterShip"})
public class RegisterShip extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter();
		
		String n = request.getParameter("idd"); 
		
		try {
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con = DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/servlet", "root", "root1234");
		
		PreparedStatement ps2 = con.prepareStatement("insert into ship values(?,?,?,?,?,?,?)");

		
		ps2.setString(1, n); 
		ps2.setString(2, null); 
		ps2.setString(3, null); 
		ps2.setString(4, null); 
		ps2.setString(5, null); 
		ps2.setString(6, null); 
		ps2.setString(7, null); 


		int i1 = ps2.executeUpdate(); if (i1 > 0)

		request.setAttribute("idd", n);
		request.getRequestDispatcher("tracking2.jsp").forward(request, response);

		} 
		
		catch (Exception e2) {
		System.out.println(e2); }
		out.close();	
		
	}

}
