<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Success</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
	
	<%@ include file="all_component/navbar.jsp"%>

	<div class="container text-center mt-3">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank You</h1>
		<h2>Your Order Placed Successfully</h2>
		<h5>Within 7 Days, Your Product Will Be Delivered In Your Address.</h5>
		<a href="index.jsp" class="btn btn-primary mt-3"><i class="fas fa-home"></i> Home</a> <a
			href="order.jsp" class="btn btn-warning mt-3 text-white"><i class="fas fa-cart-plus"></i> View Order</a>
	</div>


</body>
</html>