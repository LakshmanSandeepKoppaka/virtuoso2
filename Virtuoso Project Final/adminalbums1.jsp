<%@include file="dbconnection.jsp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%
PreparedStatement ps;
int res;
MultipartRequest m = new MultipartRequest(request, "C:/Tomcat/webapps/Virtuoso/audios/");
ps = con.prepareStatement("INSERT INTO album (al_name, al_artist_name, al_price, al_desc, al_image, al_img_blob, al_audio, al_aud_blob, al_category) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
ps.setString(1, m.getParameter("al_name"));
ps.setString(2, m.getParameter("al_artist_name"));
ps.setString(3, m.getParameter("al_price"));
ps.setString(4, m.getParameter("al_desc"));
ps.setString(5, "");
ps.setString(6, "");
ps.setString(7, m.getFilesystemName("al_audio"));
ps.setString(8, "");
ps.setString(9, m.getParameter("al_category"));
res = ps.executeUpdate();
if(res > 0) {
	response.sendRedirect("adminviewalbums.jsp?Audio_Details_Upload_Success");
} else {
	response.sendRedirect("adminaddalbum.jsp?Audio_Details_Upload_Failed");
}
%>
