package com.niit.utk.project_backend.dao;

import java.util.List;
import com.niit.utk.project_backend.model.Category;

public interface CategoryDAO {
	
	public boolean addCategory(Category category);
	public Category getCategory(int categoryID);
	public boolean deleteCategory(int categoryId);
	public boolean updateCategory(Category category);
	public List<Category> getCategories();
	
}
