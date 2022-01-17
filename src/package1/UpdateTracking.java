package package1;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager; import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest; import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name ="R6", urlPatterns = {"/UpdateTracking"})
public class UpdateTracking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		response.setContentType("text/html"); 
		PrintWriter out = response.getWriter();
		

		String a = (String)session.getAttribute("idd");
		String b = request.getParameter("pick"); 
		String c = request.getParameter("depart"); 
		String d = request.getParameter("arrive"); 
		String e = request.getParameter("sort"); 
		String f = request.getParameter("outt"); 
		String g = request.getParameter("delivered"); 
		String pid = "";
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); 
			Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/servlet?useSSL=false", "root", "root1234");

			PreparedStatement ps2 = con.prepareStatement("UPDATE ship SET ship_pick ='" + b + "' , ship_depart ='" + c + "' , ship_arrive ='" + d + "' , ship_sort ='" + e + "' , ship_out ='" + f + "' , ship_delivered ='" + g + "'  WHERE item_id ='" + a + "'");
			ps2.executeUpdate();
			Statement stmt2 = con.createStatement();
			
			String sql2 = "SELECT * FROM manage ";
			ResultSet rs2 = stmt2.executeQuery(sql2);
			while(rs2.next()) {
				 String pid2 = rs2.getString("item_id");
				 if (pid2.equals(a)) {
					 pid = pid2;
				 }
				 else {
					 pid = "";
				 }
			}
			if (pid.equals(a)){
					out.println("<script type=\"text/javascript\">");  
					out.println("alert('Tracking ID Updated Successfully');");  
					out.println("window.location.assign('tracking.jsp');");  
					out.println("</script>");}
				
			else if (f.equals("[ninjaLAJU CDC METRO]Parcel out for delivery. (Dispatcher Tel:*)") && g.equals("nulll")){
				
				
				Statement stmt = con.createStatement();
				
				String sql = "SELECT * FROM item where item_id = '"+a+"'";
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()) {
					String pstcd = rs.getString("recPostcode");
					request.setAttribute("pstcd", pstcd);}
				
				request.setAttribute("iddd", a);
				request.setAttribute("alertMsg", "Tracking ID Updated, Please assign courrier men!");
				RequestDispatcher rd=request.getRequestDispatcher("assign.jsp");
				rd.forward(request, response);
			}
			else {
					out.println("<script type=\"text/javascript\">");  
					out.println("alert('Tracking ID Updated Successfully');");  
					out.println("window.location.assign('tracking.jsp');");  
					out.println("</script>");}
			
			}
		catch (Exception e2) {
		System.out.println(e2); }
		out.close();	
		
	}

}
