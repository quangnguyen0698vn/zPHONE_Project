package model;

public class Product {
	private int id;
	private String name;
	private String description;
	private double price;
	private String src; // location of image of product
	private String type; // type of product (for future purpose)
	private String brand; // product's category (for future's use)
	private int number;
	
	public Product() {}
	public Product(int id, String name, String description, double price, String src, String type, String brand) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.price = price;
		this.src = src;
		this.type = type;
		this.brand = brand;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", description=" + description + ", price=" + price + ", src="
				+ src + ", type=" + type + ", brand=" + brand + ", number=" + number + "]";
	}
	
	public static Product oneItemOf(Product item) {
		Product ret = new Product();
		ret.id = item.id;
		ret.name = item.name;
		ret.description = item.description;
		ret.price = item.price;
		ret.src = item.src;
		ret.type = item.type;
		ret.brand = ret.brand;
		ret.number = 1;
		return ret;
	}
	
	
}
