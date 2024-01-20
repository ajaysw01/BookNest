<%@page import="java.util.List"%>
<%@page import="com.DB.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<%@ include file="all_component/allCss.jsp"%>

</head>
<body style="background-color: #f7f7f7">
	<%@ include file="all_component/navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">
		${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	
	<c:if test="${not empty failedMsg }">
		<div class="alert alert-danger text-center" role="alert"><i class="fas fa-exclamation-circle"></i> ${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<div class="container">
		<div class="row p-5">
			<div class="col-md-6">

				<div class="card bg-light">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Item</h3>
						<table class="table table">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								User u = (User) session.getAttribute("userobj");
								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());

								double totalPrice = 0.00;
								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a href="remove_book?cid=<%=c.getCid()%>&&uid=<%=c.getUserId() %>"
										class="btn btn-sm btn-outline-danger">Remove</a></td>
								</tr>
								<%
								}
								%>

								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details For Order</h3>
						
						<form action="order" method="post">
						
							<input type="hidden" value="${userobj.id }" name="id">
						
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" id="inputEmail4" value="<%= u.getName()%>" name="username" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										class="form-control" id="inputPassword4" value="<%= u.getEmail()%>" name="email" required="required">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input
										type="number" class="form-control" id="inputEmail4" value="<%= u.getPhno()%>" name="phno" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4" name="address" required="required">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4" name="landmark" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4" name="city" required="required">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" name="state" required="required">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pin-Code</label> <input type="text"
										class="form-control" id="inputPassword4" name="pincode" required="required">
								</div>
							</div>

							<div class="form-group">
								<label for="pay-mode">Payment mode</label> <select
									class="form-control" id="pay-mode" name="payment">
									<option value="noselect">--- select ---</option>
									<option value="COD">--- Cash on delivery ---</option>
								</select>
							</div>

							<div class="">
								<button type="submit" class="btn btn-warning">Order Now</button> <button
									class="btn btn-success ml-2">Continue Shopping</button>
							</div>

						</form>
					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>