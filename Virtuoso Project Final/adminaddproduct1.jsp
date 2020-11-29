<%@include file="dbconnection.jsp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%
PreparedStatement ps;
int res;
MultipartRequest m = new MultipartRequest(request, "C:/Tomcat/webapps/Virtuoso/images/");
ps = con.prepareStatement("INSERT INTO product (pr_name, pr_price, pr_quantity, pr_desc, pr_stock, pr_image, blob_img) VALUES (?, ?, ?, ?, ?, ?, ?)");
ps.setString(1, m.getParameter("pr_name"));
ps.setString(2, m.getParameter("pr_price"));
ps.setString(3, m.getParameter("pr_quantity"));
ps.setString(4, m.getParameter("pr_desc"));
//ps.setString(4, "");
ps.setString(5, m.getParameter("pr_stock"));
ps.setString(6, m.getFilesystemName("pr_image"));
/*File file = new File("C:/Tomcat/webapps/VirtuosoMusicServices/images/" + m.getFilesystemName("pr_image"));
FileInputStream fis = new FileInputStream(file);
ps.setBinaryStream(7, fis, (int) file.length());*/
ps.setString(7, "");
res = ps.executeUpdate();
if(res > 0) {
	response.sendRedirect("adminviewproducts.jsp?Product_Details_Upload_Success");
} else {
	response.sendRedirect("adminproducts.jsp?Product_Details_Upload_Failed");
}
%>
