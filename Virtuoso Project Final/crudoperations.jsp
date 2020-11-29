<%@include file="dbconnection.jsp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Mail.mail" %>
<%
PreparedStatement ps;
ResultSet rs;
int res;

String role = request.getParameter("role");
String username = request.getParameter("username");
String password = request.getParameter("password");

if(role.equals("admin_login")) {
	if(username.equals("admin") && password.equals("admin")) {
		response.sendRedirect("adminhome.jsp?Admin_Login_Success");
	} else {
		response.sendRedirect("admin.jsp?Admin_Login_Failed");
	}
} else if(role.equals("user_login")) {
	ps = con.prepareStatement("SELECT * FROM reg WHERE email = ? AND password = ?");
	ps.setString(1, username);
	ps.setString(2, password);
	rs = ps.executeQuery();
	if(rs.next()) {
		session.setAttribute("user_uname", username);
		session.setAttribute("u_name", rs.getString(2));
		session.setAttribute("user_id", rs.getString(1));
		response.sendRedirect("userhome.jsp?User_Login_Success");
	} else {
		response.sendRedirect("userwrongcredentials.jsp?User_Login_Failed");
	}
} else if(role.equals("user_reg")) {
	ps = con.prepareStatement("INSERT INTO reg (name, email, password, mobile, dob, gender) VALUES (?, ?, ?, ?, ?, ?)");
	ps.setString(1, request.getParameter("name"));
	ps.setString(2, request.getParameter("email"));
	ps.setString(3, request.getParameter("password"));
	ps.setString(4, request.getParameter("mobile"));
	ps.setString(5, request.getParameter("dob"));
	ps.setString(6, request.getParameter("gender"));
	res = ps.executeUpdate();
	if(res > 0) {
		response.sendRedirect("userlogin.jsp?User_Registration_Success");
	} else {
		response.sendRedirect("userreg.jsp?User_Registration_Failed");
	}
} else if(role.equals("event_reg")) {
	ps = con.prepareStatement("INSERT INTO event_reg (ev_name, ev_price, ev_date, ev_time, ev_location, ev_coord_name, ev_coord_mobile, status, ev_total_tickets) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
	ps.setString(1, request.getParameter("ev_name"));
	ps.setString(2, request.getParameter("ev_price"));
	ps.setString(3, request.getParameter("ev_date"));
	ps.setString(4, request.getParameter("ev_time"));
	ps.setString(5, request.getParameter("ev_location"));
	ps.setString(6, request.getParameter("ev_coord_name"));
	ps.setString(7, request.getParameter("ev_coord_mobile"));
	ps.setString(8, "In Progress");
	ps.setString(9, request.getParameter("ev_total_tickets"));
	res = ps.executeUpdate();
	if(res > 0) {
		response.sendRedirect("adminviewevents.jsp?Event_Details_Upload_Success");
	} else {
		response.sendRedirect("adminevents.jsp?Event_Details_Upload_Failed");
	}
} else if(role.equals("event_stop_book")) {
	ps = con.prepareStatement("UPDATE event_reg SET status = ? WHERE id = ?");
	ps.setString(1, "Bookings Closed");
	ps.setString(2, request.getParameter("eid"));
	res = ps.executeUpdate();
	if(res > 0) {
		response.sendRedirect("adminviewevents.jsp?Booking_Close_Success");
	} else {
		response.sendRedirect("adminviewevents.jsp?Booking_Close_Failed");
	}
} else if(role.equals("event_delete")) {
	ps = con.prepareStatement("DELETE FROM event_reg WHERE id = ?");
	ps.setString(1, request.getParameter("eid"));
	res = ps.executeUpdate();
	if(res > 0) {
		response.sendRedirect("adminviewevents.jsp?Booking_Deletion_Success");
	} else {
		response.sendRedirect("adminviewevents.jsp?Booking_Deletion_Failed");
	}
} else if(role.equals("event_details_edit")) {
	ps = con.prepareStatement("UPDATE event_reg SET ev_name = ?, ev_price = ?, ev_date = ?, ev_time = ?, ev_location = ?, ev_coord_name = ?, ev_coord_mobile = ?, ev_total_tickets = ? WHERE id = ?");
	ps.setString(1, request.getParameter("ev_name"));
	ps.setString(2, request.getParameter("ev_price"));
	ps.setString(3, request.getParameter("ev_date"));
	ps.setString(4, request.getParameter("ev_time"));
	ps.setString(5, request.getParameter("ev_location"));
	ps.setString(6, request.getParameter("ev_coord_name"));
	ps.setString(7, request.getParameter("ev_coord_mobile"));
	ps.setString(8, request.getParameter("ev_total_tickets"));
	ps.setString(9, request.getParameter("eid"));
	res = ps.executeUpdate();
	if(res > 0) {
		response.sendRedirect("adminviewevents.jsp?Event_Details_Update_Success");
	} else {
		response.sendRedirect("adminviewevents.jsp?Event_Details_Update_Failed");
	}
} else if(role.equals("product_delete")) {
	ps = con.prepareStatement("DELETE FROM product WHERE id = ?");
	ps.setString(1, request.getParameter("pid"));
	res = ps.executeUpdate();
	if(res > 0) {
		response.sendRedirect("adminviewproducts.jsp?Product_Deletion_Success");
	} else {
		response.sendRedirect("adminviewproducts.jsp?Product_Deletion_Failed");
	}
} else if(role.equals("remove_stock")) {
	ps = con.prepareStatement("UPDATE product SET pr_stock = ? WHERE id = ?");
	ps.setString(1, "Out of Stock");
	ps.setString(2, request.getParameter("pid"));
	res = ps.executeUpdate();
	if(res > 0) {
		response.sendRedirect("adminviewproducts.jsp?Product_Stock_Update_Success");
	} else {
		response.sendRedirect("adminviewproducts.jsp?Product_Stock_Update_Failed");
	}
} else if(role.equals("add_to_stock")) {
	ps = con.prepareStatement("UPDATE product SET pr_stock = ? WHERE id = ?");
	ps.setString(1, "In Stock");
	ps.setString(2, request.getParameter("pid"));
	res = ps.executeUpdate();
	if(res > 0) {
		response.sendRedirect("adminviewproducts.jsp?Product_Stock_Update_Success");
	} else {
		response.sendRedirect("adminviewproducts.jsp?Product_Stock_Update_Failed");
	}
} else if(role.equals("product_detail_edit")) {
	ps = con.prepareStatement("UPDATE product SET pr_name = ?, pr_price = ?, pr_quantity = ?, pr_desc = ? WHERE id = ?");
	ps.setString(1, request.getParameter("pr_name"));
	ps.setString(2, request.getParameter("pr_price"));
	ps.setString(3, request.getParameter("pr_quantity"));
	ps.setString(4, request.getParameter("pr_desc"));
	//ps.setString(4, "");
	ps.setString(5, request.getParameter("pid"));
	res = ps.executeUpdate();
	if(res > 0) {
		response.sendRedirect("adminviewproducts.jsp?Product_Details_Update_Success");
	} else {
		response.sendRedirect("adminviewproducts.jsp?Product_Details_Update_Failed");
	}
} else if(role.equals("album_detail_edit")) {
	ps = con.prepareStatement("UPDATE album SET al_name = ?, al_artist_name = ?, al_price = ?, al_desc = ? WHERE id = ?");
	ps.setString(1, request.getParameter("al_name"));
	ps.setString(2, request.getParameter("al_artist_name"));
	ps.setString(3, request.getParameter("al_price"));
	ps.setString(4, request.getParameter("al_desc"));
	ps.setString(5, request.getParameter("aid"));
	res = ps.executeUpdate();
	if(res > 0) {
		response.sendRedirect("adminviewalbums.jsp?Product_Details_Update_Success");
	} else {
		response.sendRedirect("adminviewalbums.jsp?Product_Details_Update_Failed");
	}
} else if(role.equals("album_delete")) {
	ps = con.prepareStatement("DELETE FROM album WHERE id = ?");
	ps.setString(1, request.getParameter("aid"));
	res = ps.executeUpdate();
	if(res > 0) {
		response.sendRedirect("adminviewalbums.jsp?Album_Deletion_Success");
	} else {
		response.sendRedirect("adminviewalbums.jsp?Album_Deletion_Failed");
	}
} else if(role.equals("user_event_book")) {
	ps = con.prepareStatement("INSERT INTO user_event (eid, e_price, user_name, user_id, total_amount, card_type, acc_holder_name, acc_number, cvv, exp_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
	ps.setString(1, request.getParameter("eid"));
	ps.setString(2, request.getParameter("e_price"));
	ps.setString(3, session.getAttribute("u_name").toString());
	ps.setString(4, session.getAttribute("user_id").toString());
	ps.setString(5, request.getParameter("total_amount"));
	ps.setString(6, request.getParameter("card_type"));
	ps.setString(7, request.getParameter("acc_holder_name"));
	ps.setString(8, request.getParameter("acc_number"));
	ps.setString(9, request.getParameter("cvv"));
	ps.setString(10, request.getParameter("exp_date"));
	res = ps.executeUpdate();
	if(res > 0) {
		int total_tickets = 0;
		PreparedStatement ps1 = con.prepareStatement("SELECT * FROM event_reg WHERE id = ?");
		ps1.setString(1, request.getParameter("eid"));
		ResultSet rs1 = ps1.executeQuery();
		if(rs1.next()) {
			total_tickets = Integer.parseInt(rs1.getString("ev_total_tickets"));
		}
		
		int remain_tickets = total_tickets - Integer.parseInt(request.getParameter("user_ticket_count"));
		PreparedStatement ps2 = con.prepareStatement("UPDATE event_reg SET ev_total_tickets = ? WHERE id = ?");
		ps2.setString(1, String.valueOf(remain_tickets));
		ps2.setString(2, request.getParameter("eid"));
		ps2.executeUpdate();
		
		response.sendRedirect("userpaymentsuccess.jsp?Event_Booking_Success");
	} else {
		response.sendRedirect("userevents.jsp?Event_Booking_Failed");
	}
} else if(role.equals("user_edit_password")) {
	ps = con.prepareStatement("UPDATE reg SET password = ? WHERE id = ?");
	ps.setString(1, request.getParameter("new_pwd"));
	ps.setString(2, request.getParameter("u_id"));
	res = ps.executeUpdate();
	if(res > 0) {
		response.sendRedirect("userlogin.jsp?Password_Updation_Success");
	} else {
		response.sendRedirect("userviewprofile.jsp?Password_Updation_Failed");
	}
} else if(role.equals("user_edit_profile")) {
	ps = con.prepareStatement("UPDATE reg SET name = ?, email = ?, mobile = ?, dob = ?, gender = ? WHERE id = ?");
	ps.setString(1, request.getParameter("name"));
	ps.setString(2, request.getParameter("email"));
	ps.setString(3, request.getParameter("mobile"));
	ps.setString(4, request.getParameter("dob"));
	ps.setString(5, request.getParameter("gender"));
	ps.setString(6, request.getParameter("uid"));
	res = ps.executeUpdate();
	if(res > 0) {
		response.sendRedirect("userviewprofile.jsp?Profile_Details_Update_Success");
	} else {
		response.sendRedirect("userviewprofile.jsp?Profile_Details_Update_Failed");
	}
} else if(role.equals("product_add_to_cart")) {
	ps = con.prepareStatement("INSERT INTO user_product (product_id, user_id, user_qnty, pr_status, card_no, card_type, pr_total_amount, acc_name, cvv, expiry_date, total_price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
	ps.setString(1, request.getParameter("p_id"));
	ps.setString(2, session.getAttribute("user_id").toString());
	ps.setString(3, request.getParameter("user_qnty"));
	ps.setString(4, "In Cart");
	ps.setString(5, "DNP");
	ps.setString(6, "DNP");
	ps.setString(7, "DNP");
	ps.setString(8, "DNP");
	ps.setString(9, "DNP");
	ps.setString(10, "DNP");
	String tprice = String.valueOf(Integer.parseInt(request.getParameter("user_qnty")) * Integer.parseInt(request.getParameter("pr_cost")));
	ps.setString(11, tprice);
	res = ps.executeUpdate();
	if(res > 0) {
		response.sendRedirect("usercart.jsp?Product_Added_To_Cart_Success");
	} else {
		response.sendRedirect("userproduct.jsp?Product_Added_To_Cart_Failed");
	}
} else if(role.equals("cart_product_delete")) {
	ps = con.prepareStatement("DELETE FROM user_product WHERE id = ?");
	ps.setString(1, request.getParameter("pr_id"));
	res = ps.executeUpdate();
	if(res > 0) {
		response.sendRedirect("usercart.jsp?Product_Deletion_Success");
	} else {
		response.sendRedirect("usercart.jsp?Product_Deletion_Failed");
	}
} else if(role.equals("cart_product_save_later")) {
	ps = con.prepareStatement("UPDATE user_product SET pr_status = ? WHERE id = ?");
	ps.setString(1, "Save For Later");
	ps.setString(2, request.getParameter("pr_id"));
	res = ps.executeUpdate();
	if(res > 0) {
		response.sendRedirect("userbuylater.jsp?Product_Saved_For_Later_Success");
	} else {
		response.sendRedirect("usercart.jsp?Product_Saved_For_Later_Failed");
	}
} else if(role.equals("later_product_add_cart")) {
	ps = con.prepareStatement("UPDATE user_product SET pr_status = ? WHERE id = ?");
	ps.setString(1, "In Cart");
	ps.setString(2, request.getParameter("pr_id"));
	res = ps.executeUpdate();
	if(res > 0) {
		response.sendRedirect("usercart.jsp?Product_Add_To_Cart_Success");
	} else {
		response.sendRedirect("userbuylater.jsp?Product_Add_To_Cart_Failed");
	}
} else if(role.equals("user_product_purchase")) {
	ps = con.prepareStatement("UPDATE user_product SET pr_status = ?, card_no = ?, card_type = ?, acc_name = ?, cvv = ?, expiry_date = ?, shipping_address = ? " + request.getParameter("pr_query"));
	ps.setString(1, "Purchased");
	ps.setString(2, request.getParameter("acc_number"));
	ps.setString(3, request.getParameter("card_type"));
	ps.setString(4, request.getParameter("acc_holder_name"));
	ps.setString(5, request.getParameter("cvv"));
	ps.setString(6, request.getParameter("exp_date"));
	ps.setString(7, request.getParameter("shipping_address"));
	res = ps.executeUpdate();
	if(res > 0) {
		response.sendRedirect("userpaymentsuccess.jsp?Product_Purchase_Success");
	} else {
		response.sendRedirect("usercart.jsp?Product_Purchase_Failed");
	}
} else if(role.equals("user_album_purchase")) {
	ps = con.prepareStatement("INSERT INTO user_song (song_id, user_id, aud_status, card_no, card_type, acc_name, cvv, expiry_date, song_price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
	ps.setString(1, request.getParameter("al_id"));
	ps.setString(2, request.getParameter("u_id"));
	ps.setString(3, "Purchased");
	ps.setString(4, request.getParameter("acc_number"));
	ps.setString(5, request.getParameter("card_type"));
	ps.setString(6, request.getParameter("acc_holder_name"));
	ps.setString(7, request.getParameter("cvv"));
	ps.setString(8, request.getParameter("exp_date"));
	ps.setString(9, request.getParameter("total_amount"));
	res = ps.executeUpdate();
	if(res > 0) {
		response.sendRedirect("userpaymentsuccess.jsp?Album_Purchase_Success");
	} else {
		response.sendRedirect("useralbums.jsp?Album_Purchase_Failed");
	}
} else if(role.equals("user_forgot_password")) {
	ps = con.prepareStatement("SELECT * FROM reg WHERE email = ? LIMIT 1");
	ps.setString(1, request.getParameter("fp_email"));
	rs = ps.executeQuery();
	if(rs.next()) {
		String fp_password = rs.getString("password");
		//String msg="Your Password: " + fp_password;
		String msg = "";
		msg += "Hi " + rs.getString("name") + ", \n\n";
		msg += "Your account password is " + fp_password + ". \n";
		msg += "If you did not request for the password, kindly ignore or you can change your password in profile after you login. \n\n";
		msg += "Regards, \nVirtuoso Music Services.";
		mail.mailsend(msg, request.getParameter("fp_email"));
		response.sendRedirect("usermessagepage.jsp?Password_Sent_To_Mail");
	} else {
		response.sendRedirect("userforgotpassword.jsp?Enter_Valid_Email_ID");
	}
}
%>
