package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<Product> items;
	// list of items in cart

	public Cart() {
		items = new ArrayList<>();
	}

	// add a new product to cart
	public void add(Product product) {
		for (Product item : items) {
			if (item.getId() == product.getId()) {
				item.setNumber(item.getNumber() + 1);
				return;
			}
		}
		items.add(product);
	}
	
	// remove a product from cart
	public void remove(int id) {
		for (Product item : items) {
			if (item.getId() == id) {
				items.remove(item);
				return;
			}
		}
	}
	
	// return total amount of cart
	public double getAmount() {
		double sum = 0.0;
		for (Product item : items) {
			sum += item.getPrice() * item.getNumber();
		}
		return Math.round(sum * 100.0) / 100.0;
	}
	
	// return sum of quantity of items in cart
	public int getQuantity() {
		int ret = 0;
		for (Product item : items) {
			ret += item.getNumber();
		}
		return ret;
	}
	
	// return list of products in the cart
	public List<Product> getItems() {
		return items;
	}
}
