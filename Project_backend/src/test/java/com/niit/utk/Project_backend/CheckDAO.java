package com.niit.utk.Project_backend;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.utk.project_backend.dao.CategoryDAO;
import com.niit.utk.project_backend.dao.SupplierDAO;
import com.niit.utk.project_backend.model.Category;
import com.niit.utk.project_backend.model.Supplier;

public class CheckDAO {

	@Autowired
	static AnnotationConfigApplicationContext context;

	static CategoryDAO categoryDAO;
	//static SupplierDAO supplierDAO;

	@BeforeClass
	public static void initialize() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.niit");
		context.refresh();

		// get the userDAO from context
		categoryDAO = (CategoryDAO) context.getBean("categoryDAO");
		//supplierDAO = (SupplierDAO) context.getBean("supplierDAO");
		// get the user from context

	}
	
	@Ignore
	@Test
	public void updateUserTestCase() {

		Category c = new Category();
		c.setCategoryId(11);
		c.setCategoryName("c1");
		categoryDAO.addCategory(c);
		assertEquals(c.getCategoryId(), c.getCategoryId());

	}
	
	@Test
	public void deleteUserTestCase() {
		categoryDAO.deleteCategory(33);
	}
}
