package com.niit.utk.project_backend.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.utk.project_backend.dao.CartDAO;
import com.niit.utk.project_backend.model.Cart;

@Repository("cartDAO")
public class CartImpl implements CartDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	

	public void insert(Cart cart) {

		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.persist(cart);
		session.getTransaction().commit();
	}
	
	
	public List<Cart> findCartById(String userId){
		
		Session session=sessionFactory.openSession();
		List<Cart> p=null;
		try{
			session.beginTransaction();
		
		p=	(List<Cart>) session.createQuery(" from Cart  where emailId = :emailId")
	           .setString("emailId", userId).list();
			session.getTransaction().commit();
			
			
		}catch(HibernateException ex){
			ex.printStackTrace();
			session.getTransaction().rollback();
		}
		return  p;
	
		
		
		
	}




	public void delete(int cartId) {
		Session session=sessionFactory.openSession();
		session.beginTransaction();

		Cart cart=(Cart)session.get(Cart.class,cartId);
		session.delete(cart);
		session.getTransaction().commit();
		
	}




	public void update(Cart cart) {
		Session session=sessionFactory.openSession();
		
		
		session.beginTransaction();


		session.update(cart);
		session.getTransaction().commit();
	
	
	}




	public Cart getCartById(int pid, String userId) {
		Session session=sessionFactory.openSession();
		
		Query q=session.createQuery("from Cart where emailId=:emailId and cartProductId=:cartProductId");
		q.setParameter("emailId", userId);
		q.setParameter("cartProductId",pid);
		Cart c=(Cart)q.uniqueResult();
		
		return c;
	}

}
