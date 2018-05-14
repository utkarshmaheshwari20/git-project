package com.niit.utk.project_backend.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.utk.project_backend.dao.CategoryDAO;
import com.niit.utk.project_backend.model.Category;

@Repository("categoryDAO")
public class CategoryImpl implements CategoryDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Transactional
	public boolean addCategory(Category category) {
		try {
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			session.save(category);
			session.getTransaction().commit();
			session.close();
			return true;
		} catch (Exception e) {
			System.out.println("Exception Arised:" + e);
			return false;
		}
	}

	public Category getCategory(int categoryId) {
		Session session = sessionFactory.openSession();
		Category category = (Category) session.get(Category.class, categoryId);
		session.close();
		return category;
	}

	@Transactional
	public boolean deleteCategory(int categoryId) {
		try {
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			Category c = session.get(Category.class, categoryId);
			session.delete(c);
			session.getTransaction().commit();
			session.close();
			return true;
		} catch (Exception e) {
			System.out.println("Exception Arised:" + e);
			return false;
		}

	}

	public boolean updateCategory(Category category) {
		try {
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			session.update(category);
			session.getTransaction().commit();
			session.close();
			return true;
		} catch (Exception e) {
			System.out.println("Exception Arised:" + e);
			return false;
		}
	}

	public List<Category> getCategories() {
		Session session = sessionFactory.openSession();
		List<Category> listCategories = session.createQuery("from Category").getResultList();
		return listCategories;
	}

}
