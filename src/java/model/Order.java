package model;

import java.util.Date;
import java.util.List;

public class Order {
	private int orderId;
	private double total; // total amount of order
	private int status;
	
	// 0 - pending
	// 1 - finished payment
	// 2 - processing
	// 3 - shipped
	// 4 - received
	
	private Date orderDate;
	private String address; // buyer's address
	private String phoneNumber;
	private List<OrderDetail> listProducts;
	private String userEmail; // buyer's email
	private Date receivedDate;
	private String discountCode;
	
	public Order() {}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public double getPrice() {
		return total;
	}

	public void setPrice(double price) {
		this.total = price;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public List<OrderDetail> getListProducts() {
		return listProducts;
	}

	public void setListProducts(List<OrderDetail> listProducts) {
		this.listProducts = listProducts;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userMail) {
		this.userEmail = userMail;
	}

	public Date getReceivedDate() {
		return receivedDate;
	}

	public void setReceivedDate(Date receivedDate) {
		this.receivedDate = receivedDate;
	}

	public String getDiscountCode() {
		return discountCode;
	}

	public void setDiscountCode(String discount) {
		this.discountCode = discount;
	}
}
