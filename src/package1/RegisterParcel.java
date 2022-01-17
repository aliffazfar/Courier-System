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


@WebServlet(name ="R3", urlPatterns = {"/RegisterParcel"})
public class RegisterParcel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter();
		
		String n = request.getParameter("recName"); 
		String i = request.getParameter("recIC"); 
		String a = request.getParameter("recAdd"); 
		String pc = request.getParameter("itemPostCode");
		String p = request.getParameter("recPhone");
		String t = request.getParameter("itemType");
		String c = request.getParameter("itemComment");
		String ic = request.getParameter("cust_ic");;
		String l = "nulll";
		String pid = null;
		
		try {
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con = DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/servlet", "root", "root1234");
		
		PreparedStatement ps = con.prepareStatement("insert into item values(?,?,?,?,?,?,?,?,?)");
		PreparedStatement ps2 = con.prepareStatement("insert into ship values(?,?,?,?,?,?,?)");

		
		ps.setString(1, null); 
		ps.setString(2, n); 
		ps.setString(3, i); 
		ps.setString(4, a);
		ps.setString(5, pc);
		ps.setString(6, p);
		ps.setString(7, t);
		ps.setString(8, c);
		ps.setString(9, ic);
		ps2.setString(1, null); 
		ps2.setString(2, l); 
		ps2.setString(3, l); 
		ps2.setString(4, l); 
		ps2.setString(5, l); 
		ps2.setString(6, l); 
		ps2.setString(7, l); 

		Statement st = con.createStatement();
		


		
		int i1 = ps.executeUpdate(); if (i1 > 0)
		ps2.executeUpdate();
		
		ResultSet rs=st.executeQuery("select * from item");
		if(rs.last()){
			pid = rs.getString("item_id");
		}
		request.setAttribute("recIC", pid);
		request.getRequestDispatcher("ship3.jsp").forward(request, response);

		} 
		
		catch (Exception e2) {
		System.out.println(e2); }
		out.close();	
		
	}

}
