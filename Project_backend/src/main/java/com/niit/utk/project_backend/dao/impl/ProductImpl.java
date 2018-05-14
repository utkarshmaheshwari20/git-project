package com.niit.utk.project_backend.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.utk.project_backend.dao.ProductDAO;
import com.niit.utk.project_backend.model.Product;

@Repository("ProductDAO")
public class ProductImpl implements ProductDAO {

	@Autowired
	SessionFactory sessionFactory;

	public boolean addProduct(Product product) {
		try
		{
			Session session=sessionFactory.openSession();
			session.beginTransaction();
			session.save(product);
			session.getTransaction().commit();
			session.close();
		return true;
		}
		catch(Exception e)
		{
		System.out.println("Exception Arised:"+e);
		return false;
		}
	}

	public Product getProduct(int productId) {
		Session session=sessionFactory.openSession();
		Product product=(Product)session.get(Product.class,productId);
		session.close();
		return product;
	}

	@Transactional
	public boolean deleteProduct(int productId) {
		try
		{
			Session session=sessionFactory.openSession();
            session.beginTransaction(); 
            Product p=session.get(Product.class,productId);
            session.delete(p);
            session.getTransaction().commit();
            session.close();  
			return true;
		}
		catch(Exception e)
		{
			System.out.println("Exception Arised:"+e);
			return false;
		}
	}

	public boolean updateProduct(Product product) {
		try
		{

			Session session=sessionFactory.openSession();
	        session.beginTransaction(); 
	        session.update(product);
		    session.getTransaction().commit();
		    session.close();
		    return true;
		}
		catch(Exception e)
		{
			System.out.println("Exception Arised:"+e);
			return false;
		}
	}

	public List<Product> getProducts() {
		Session session=sessionFactory.openSession();
		List<Product> listProducts=session.createQuery("from Product").getResultList();
		return listProducts;
	}

	public List<Product> getProductsByCategory(int categoryId) {
		Session session=sessionFactory.openSession();
		List<Product> products =null;
		session.beginTransaction();
		products= session.createQuery("from Product where categoryId="+categoryId).list();   
		session.getTransaction().commit();
		 return products;
		}
	
}
