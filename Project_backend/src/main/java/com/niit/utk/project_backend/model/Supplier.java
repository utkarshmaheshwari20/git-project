package com.niit.utk.project_backend.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table

public class Supplier {
	
	@Id @GeneratedValue
	private int supplierId;
	private String supplierName;
	private String supplierNo;
	private String supplierAdd;
	
	@OneToMany(targetEntity=Product.class, fetch=FetchType.EAGER, mappedBy="supplier")
	private Set<Product> products=new HashSet<Product>(0);
	
	public int getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getSupplierAdd() {
		return supplierAdd;
	}
	public void setSupplierAdd(String supplierAdd) {
		this.supplierAdd = supplierAdd;
	}
	public String getSupplierNo() {
		return supplierNo;
	}
	public void setSupplierNo(String supplierNo) {
		this.supplierNo = supplierNo;
	}

	
}
