<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook: index</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@ include file="all_component/navbar.jsp"%>
	
	<%
		int bid = Integer.parseInt(request.getParameter("bid"));
		BookDAOImpl dao= new BookDAOImpl(DBConnect.getConn());
		BookDtls b = dao.getBookById(bid);
		
	%>
	
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-light">
				<img src="book/<%= b.getPhotoName() %>" style="height: 200px; width: 150px"><br><hr>
				<h4 class="mt-3"><span class="text-secondary">Book Name: </span><%= b.getBookName() %></h4>
				<h4><span class="text-secondary">Author Name: </span><%= b.getAuthor() %></h4>
				<h4><span class="text-secondary">Category: </span><%= b.getBookCategory() %></h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-light">
				<h2><%= b.getBookName() %></h2>
				<hr>
				
				<%
					if("Old".equals(b.getBookCategory())) {
						%>
						<h5 class="text-secondary">Contact To Seller</h5>
						<h5><span class="text-danger"><i class="fas fa-envelope"></i></span> Email : <span class="text-primary"><%= b.getEmail()%></span></h5>
						<%
					}
				%>
				
				<div class="row">
					<div class="col-md-4 text-secondary text-center p-2">
						<span class="text-success"><i class="fas fa-money-bill-wave fa-2x"></i></span>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-secondary text-center p-2">
						<span class="text-secondary"><i class="fas fa-undo-alt fa-2x"></i></span>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-secondary text-center p-2">
						 <span class="text-info"><i class="fas fa-truck-moving fa-2x"></i></span>
						 <p>Free Shipping</p>
					</div>
				</div>
				
				<%
					if("Old".equals(b.getBookCategory())) {
						%>
							<div class="text-center p-3">
				<a href="index.jsp" class="btn btn-outline-success">Continue Shopping</a>
				<a href="" class="btn btn-outline-primary">200 &#8377;</a>
				</div>
						<%
					}
					else {
						%>
						<div class="text-center p-3">
				<a href="" class="btn btn-outline-warning"><i
							class="fas fa-cart-plus"></i> Add Cart</a>
				<a href="" class="btn btn-outline-primary ml-2">200 &#8377;</a>
				</div>
						<%
					}
				%>
				
			</div>
		</div>
	</div>

</body>
</html>