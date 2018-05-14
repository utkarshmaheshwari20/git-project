package com.niit.utk.project_backend.dao.impl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.utk.project_backend.dao.UserDAO;
import com.niit.utk.project_backend.model.Cart;
import com.niit.utk.project_backend.model.User;
@Repository
public class UserImpl implements UserDAO {

	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public boolean addUser(User user) {
		try {
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			session.save(user);
			session.getTransaction().commit();
			session.close();
			return true;
		} catch (Exception e) {
			System.out.println("Exception Arised:" + e);
			return false;
		}
	}

	public User getUser(int userId) {
		Session session = sessionFactory.openSession();
		User user = (User) session.get(User.class, userId);
		session.close();
		return user;
	}

	@Transactional
	public boolean deleteUser(int userId) {
		try {

			Session session = sessionFactory.openSession();
			session.beginTransaction();
			session.delete(userId);
			session.getTransaction().commit();
			session.close();
			return true;
		} catch (Exception e) {
			System.out.println("Exception Arised:" + e);
			return false;
		}
	}

	@Transactional
	public boolean updateUser(User user) {
		try {
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			session.update(user);
			session.getTransaction().commit();
			session.close();
			return true;
		} catch (Exception e) {
			System.out.println("Exception Arised:" + e);
			return false;
		}
	}

	public User findbyUserId(String emailId) {

		Session session=sessionFactory.openSession();
		User p=null;
		try{
			session.beginTransaction();
		 p=	(User)session.createQuery("from User where emailId = :emailId")
		           .setString("emailId", emailId).uniqueResult();
		session.getTransaction().commit();
			
		}catch(HibernateException ex){
			ex.printStackTrace();
			session.getTransaction().rollback();
		}
		return p;
	
	}
}