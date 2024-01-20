<%@page import="com.entity.User"%>
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
<title>BookNest: index</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url(https://source.unsplash.com/random//?library,books,online);
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #f0f1f2;
}
</style>
</head>
<body style="background-color: #f7f7f7">

	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@ include file="all_component/navbar.jsp"%>

	<div class="container-fluid back-img">
		<h1 class="text-center text-light"><i class="fas fa-book"></i>BookNest</h1>
	</div>

	<!-- Start Recent Book -->

	<div class="container">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBooks();

			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150; height: 200px;" class="img-thubbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>

						<p>
							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							Category:
							<%=b.getBookCategory()%></p>
						<div class="text-center">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-info btn-sm">View Details</a> <a href="#"
								class="btn btn-outline-success btn-sm ml-1"><%=b.getPrice()%>
								&#8377;</a>
						</div>
					
					<%
					} else {
					%>
					<p>
					Category:
					<%=b.getBookCategory()%></p>
					<div class="text-center">

						<%
						if (u == null) {
						%>
						<a href="login.jsp" class="btn btn-outline-warning btn-sm ml-2"><i
							class="fas fa-cart-plus"></i> Add Cart</a>
						<%
						} else {
						%>
						<a href="recentbookcart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
							class="btn btn-outline-warning btn-sm ml-2"><i
							class="fas fa-cart-plus"></i> Add Cart</a>
						<%
						}
						%>

						<a href="view_books.jsp?bid=<%=b.getBookId()%>"
							class="btn btn-outline-info btn-sm ml-1">View Details</a>
					</div>
					<div class="text-center mt-1">
						<a href="#" class="btn btn-outline-success btn-sm ml-1"><%=b.getPrice()%>
							&#8377;</a>
					</div>
					<%
					}
					%>


				</div>
			</div>
		</div>

		<%
		}
		%>

	</div>
	<div class="text-center mt-2">
		<a href="all_recent_book.jsp"
			class="btn btn-primary btn-sm text-white">View All <i
			class="fas fa-arrow-alt-circle-right"></i></a>
	</div>

	</div>

	<!-- End Recent Book -->

	<hr>

	<!-- Start New Book -->

	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150; height: 200px;" class="img-thubbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:
							<%=b.getBookCategory()%></p>
						<div class="text-center">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-outline-warning btn-sm ml-2"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							} else {
							%>
							<a href="allbookcart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-outline-warning btn-sm ml-2"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-info btn-sm ml-1">View Details</a>
							<div class="text-center mt-1">
								<a href="#" class="btn btn-outline-success btn-sm ml-1"><%=b.getPrice()%>
									&#8377;</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>




		</div>
		<div class="text-center mt-1">
			<a href="all_new_book.jsp" class="btn btn-primary btn-sm text-white">View All <i
			class="fas fa-arrow-alt-circle-right"></i></a>
		</div>

	</div>

	<!-- End New Book -->

	<hr>

	<!-- Start Old Book -->

	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">

			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBooks();

			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150; height: 200px;" class="img-thubbnail">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category:
							<%=b.getBookCategory()%></p>

						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-info btn-sm ml-5">View Details</a> <a
								href="#" class="btn btn-outline-success btn-sm ml-1"><%=b.getPrice()%>
								&#8377;</a>
						</div>
					</div>
				</div>
		</div>

		<%
		}
		%>


	</div>
	<div class="text-center mt-1">
		<a href="all_old_book.jsp" class="btn btn-primary btn-sm text-white">View All <i
			class="fas fa-arrow-alt-circle-right"></i></a>
	</div>

	</div>

	<!-- End Old Book -->

	<%@ include file="all_component/footer.jsp"%>
</body>
</html>