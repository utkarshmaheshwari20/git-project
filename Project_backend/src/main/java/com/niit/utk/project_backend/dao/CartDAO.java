package com.niit.utk.project_backend.dao;

import java.util.List;

import com.niit.utk.project_backend.model.Cart;

public interface CartDAO {
	
	public void insert(Cart cart);
	public List<Cart> findCartById(String userId);
	public void delete(int cart);
	public void update(Cart cart);
	public Cart getCartById(int pid,String userEmail);

}
