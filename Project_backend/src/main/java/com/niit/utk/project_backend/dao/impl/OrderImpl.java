package com.niit.utk.project_backend.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.utk.project_backend.dao.OrderDAO;
import com.niit.utk.project_backend.model.Orders;

@Repository("orderDAO")
public class OrderImpl implements OrderDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	
	public void addOrder(Orders order) {
		
		Session session=sessionFactory.openSession();
		session.beginTransaction();
         
		session.saveOrUpdate(order);
		session.getTransaction().commit();
	}

}
