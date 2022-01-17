package package1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager; import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest; import javax.servlet.http.HttpServletResponse;


@WebServlet(name ="R11", urlPatterns = {"/editPAR"})
public class editPAR extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter();
		
		String i = request.getParameter("rname"); 
		String a = request.getParameter("radd"); 
		String p = request.getParameter("rphone");
		String t = request.getParameter("rpostcode");
		String tt = request.getParameter("itype");
		String c = request.getParameter("cmmnt");
		String sn = request.getParameter("sname");
		String sp = request.getParameter("sphone");
		
		String cIC=request.getParameter("idd");
		String cIC2=request.getParameter("id2");
		try {
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection con = DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/servlet", "root", "root1234");
		
		PreparedStatement ps = con.prepareStatement("UPDATE item SET  recName ='" + i + "' , recAdd ='" + a + "' , recPhone ='" + p + "' , recPostcode ='" + t + "' , itemType ='" + tt + "'  , comment ='" + c + "' WHERE item_id ='" + cIC + "'");
		PreparedStatement ps2 = con.prepareStatement("UPDATE customer SET  cust_name ='" + sn + "' , cust_phone ='" + sp + "' WHERE cust_ic ='" + cIC2 + "'");
		
		int i1 = ps.executeUpdate(); if (i1 > 0)
			ps2.executeUpdate();
		response.setContentType("text/html");
		out.println("<script type=\"text/javascript\">");  
		out.println("alert('Parcel Updated Successfully');");  
		out.println("window.location.assign('pending.jsp');");  
		out.println("</script>");
		} catch (Exception e2) {
		System.out.println(e2); }
		out.close();	
		
	}

}
