<%@ page import="java.sql.*" %>

<% 
String firstName = request.getParameter("firstName"); 
String lastName = request.getParameter("lastName"); 
String gender = request.getParameter("gender"); 
String email = request.getParameter("email"); 
String password = request.getParameter("password"); 
String mobile = request.getParameter("mobile");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://18.212.60.171:3306/medicuredb","admin","admin12345");
	PreparedStatement ps = conn.prepareStatement("insert into doctor_registration(firstName, lastName, gender, email, password, mobile)values(?,?,?,?,?,?);");
	ps.setString(1,firstName);
	ps.setString(2,lastName);
	ps.setString(3,gender);
	ps.setString(4,email);
	ps.setString(5,password);
	ps.setString(6,mobile);
	int x = ps.executeUpdate();

	if(x > 0){
	  out.println("Resgistration done successfully");
	}else{
	  out.println("Registration Failed...");
	}

}catch(Exception e){
	out.println(e);
} 
%>
