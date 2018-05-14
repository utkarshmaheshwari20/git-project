package com.niit.utk.project_backend.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Orders {
	
	@Id@GeneratedValue
	private int orderId;
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="userId")
	private User user;
	
	@OneToOne(targetEntity=Card.class, fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name="cardNumber")
	private Card payment;
	private long total;
	
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Card getPayment() {
		return payment;
	}
	public void setPayment(Card payment) {
		this.payment = payment;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}

}
