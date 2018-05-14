package com.niit.utk.project_backend.dao;

import java.util.List;
import com.niit.utk.project_backend.model.Product;

public interface ProductDAO {
	
	public boolean addProduct(Product product);
	public Product getProduct(int productId);
	public boolean deleteProduct(int productId);
	public boolean updateProduct(Product product);
	public List<Product> getProducts();
	public List<Product> getProductsByCategory(int categoryId);	
}
