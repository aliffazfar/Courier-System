package package1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager; import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest; import javax.servlet.http.HttpServletResponse;


@WebServlet(name ="R5", urlPatterns = {"/Assign"})
public class Assign extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter();
		
		String i = request.getParameter("selected_dept_id"); 
		String n = request.getParameter("idd"); 
		
		try {
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con = DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/servlet", "root", "root1234");
		
		Statement stmt = con.createStatement();
		
		String sql = "SELECT * FROM courier WHERE courier_name='"+i+"'";
		ResultSet rs = stmt.executeQuery(sql);
		
		
		while(rs.next()) {
		String ic = rs.getString("courier_ic");
		
		
		PreparedStatement ps = con.prepareStatement("insert into manage values(?,?,?)");
		
		ps.setString(1, null); 
		ps.setString(2, ic); 
		ps.setString(3, n); 
		
		int i1 = ps.executeUpdate(); if (i1 > 0)
		out.println("<script type=\"text/javascript\">");  
		out.println("alert('Courier Assigned Successfully');");  
		out.println("window.location.assign('tracking.jsp');");  
		out.println("</script>");
		}
		} catch (Exception e2) {
		System.out.println(e2); }
		out.close();	
		
	}

}
