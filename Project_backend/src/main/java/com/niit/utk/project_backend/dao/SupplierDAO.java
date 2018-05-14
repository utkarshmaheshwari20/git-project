package com.niit.utk.project_backend.dao;


import java.util.List;

import com.niit.utk.project_backend.model.Supplier;

public interface SupplierDAO {

	public boolean addSupplier(Supplier supplier);
	public Supplier getSupplier(int supplierId);
	public boolean deleteSupplier(int supplierId);
	public boolean updateSupplier(Supplier supplier);
	public List<Supplier> getSuppliers();

}
