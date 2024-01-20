package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderDAOImp;
import com.DAO.CartDAOImpl;
import com.DB.Cart;
import com.DB.DBConnect;
import com.entity.BookDtls;
import com.entity.Book_Order;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			HttpSession session = req.getSession();

			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");

			String fullAddress = address + ", " + landmark + ", " + city + ", " + state + ", " + pincode;

//			System.out.println(name+email+phno+fullAddress+paymentType);

			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());

			List<Cart> blist = dao.getBookByUser(id);

			if (blist.isEmpty()) {
				session.setAttribute("failedMsg", "Add Item To Cart");
				resp.sendRedirect("checkout.jsp");
				
			} else {

				BookOrderDAOImp dao2 = new BookOrderDAOImp(DBConnect.getConn());
				int i = dao2.getOrderNo();

				Book_Order o = null;

				ArrayList<Book_Order> orderList = new ArrayList<Book_Order>();

				for (Cart c : blist) {

					o = new Book_Order();

					o.setOrderId("BOOK-ORD-00" + i);
					o.setUserName(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAddress);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice() + "");
					o.setPaymentType(paymentType);
					i++;
					orderList.add(o);

				}

				if ("noselect".equals(paymentType)) {
					session.setAttribute("failedMsg", "Choose Payment Method");
					resp.sendRedirect("checkout.jsp");
				} else {
					Boolean f = dao2.saveOrder(orderList);
					if (f) {
						resp.sendRedirect("order_success.jsp");
					} else {
						session.setAttribute("failedMsg", "Yuor Order Failed");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
