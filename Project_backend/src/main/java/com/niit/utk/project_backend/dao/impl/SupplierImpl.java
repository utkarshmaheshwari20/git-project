package com.niit.utk.project_backend.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.utk.project_backend.dao.SupplierDAO;
import com.niit.utk.project_backend.model.Supplier;

@Repository("supplierDAO")
public class SupplierImpl implements SupplierDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	@Transactional
	public boolean addSupplier(Supplier supplier) {
		try
		{
			Session session=sessionFactory.openSession();
			session.beginTransaction();
			session.save(supplier);
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

	public Supplier getSupplier(int supplierId) {
		Session session=sessionFactory.openSession();
		Supplier supplier=(Supplier)session.get(Supplier.class,supplierId);
		session.close();
		return supplier;
	}

	@Transactional
	public boolean deleteSupplier(int supplierId) {
		try
		{
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			Supplier s=this.getSupplier(supplierId);
			
			session.delete(s);
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

	public boolean updateSupplier(Supplier supplier) {
		try
		{
			Session session = sessionFactory.openSession();
			session.beginTransaction();
			session.update(supplier);
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

	public List<Supplier> getSuppliers() {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Supplier");
		List<Supplier> listSuppliers=(List<Supplier>)query.list();
		return listSuppliers;
	}

}
