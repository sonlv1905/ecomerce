package com.example.demo.entity;

import java.io.Serializable;

public class CartItem implements Serializable {
	private Item item;
	private int quantity;
		
	public CartItem() {
		super();
	}

	public CartItem(Item item, int quantity) {
		super();
		this.item = item;
		this.quantity = quantity;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "CartItem [item=" + item + ", quantity=" + quantity + "]";
	}

	
	
}
