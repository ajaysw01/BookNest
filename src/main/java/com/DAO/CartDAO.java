package com.DAO;

import java.util.List;

import com.DB.Cart;
import com.entity.BookDtls;

public interface CartDAO {
	
	public boolean addCart(Cart c);
	
	public List<Cart> getBookByUser(int userId);
	
	public boolean deleteBook(int cid, int uid);
	

}
