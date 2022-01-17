package package1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager; import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest; import javax.servlet.http.HttpServletResponse;


@WebServlet(name ="R12", urlPatterns = {"/deleteparc2"})
public class deleteparc2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter();
		
		String cIC=request.getParameter("idd");
		String cIC2=request.getParameter("icc");
		try {
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con = DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/servlet", "root", "root1234");
		
		PreparedStatement ps = con.prepareStatement("DELETE FROM item WHERE item_id ='" + cIC + "'");
		PreparedStatement ps2 = con.prepareStatement("DELETE FROM ship WHERE item_id ='" + cIC + "'");
		PreparedStatement ps3 = con.prepareStatement("DELETE FROM manage WHERE item_id ='" + cIC + "'");
		PreparedStatement ps4 = con.prepareStatement("DELETE FROM customer WHERE cust_ic ='" + cIC2 + "'");
		
		int i1 = ps.executeUpdate(); if (i1 > 0)
			ps2.executeUpdate();
			ps3.executeUpdate();
			ps4.executeUpdate();
		response.setContentType("text/html");
		out.println("<script type=\"text/javascript\">");  
		out.println("alert('Parcel Deleted Successfully');");  
		out.println("window.location.assign('pending.jsp');");  
		out.println("</script>");
		} catch (Exception e2) {
		System.out.println(e2); }
		out.close();	
		
	}

}
