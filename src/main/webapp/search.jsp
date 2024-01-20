<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search</title>
<%@ include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #f0f1f2;
}
</style>
</head>
<body>
	<%
	User u = (User) session.getAttribute("userobj");
	%>

	<%@ include file="all_component/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row p-3">
			<%
			String ch = request.getParameter("ch");
			
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getBookbySearch(ch);

			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 100; height: 150px;" class="img-thubbnail">
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
								class="btn btn-outline-info btn-sm">View Details</a> <a href=""
								class="btn btn-outline-success btn-sm ml-1"><%=b.getPrice()%>
								&#8377;</a>
						</div>
						<%
						} else {
						%>
						<p>
							Category:
							<%=b.getBookCategory()%>
						</p>
						<div class="text-center">

							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-outline-warning btn-sm ml-2"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							} else {
							%>
							<a
								href="recentbookcart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-outline-warning btn-sm ml-2"><i
								class="fas fa-cart-plus"></i> Add Cart</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-outline-info btn-sm ml-1">View Details</a>
							<div class="text-center mt-1">
								<a href="" class="btn btn-outline-success btn-sm ml-1"><%=b.getPrice()%>
									&#8377;</a>
							</div>
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
	</div>
</body>
</html>