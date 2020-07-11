Drop database megclothing;
create database megclothing;
use megclothing; 

CREATE TABLE tags (
	tag_id SMALLINT(4) UNSIGNED NOT NULL AUTO_INCREMENT,
	tag_name VARCHAR(20) NOT NULL,
	CONSTRAINT tag_pk PRIMARY KEY (tag_id)
);

CREATE TABLE products (
	product_id SMALLINT(4) UNSIGNED NOT NULL AUTO_INCREMENT, 
	product_name VARCHAR(30) NOT NULL,
	product_category ENUM('Top', 'Bottom', 'Dress', 'Accessory') NOT NULL, 
	product_price DECIMAL(8,2) NOT NULL,
	total_quantity TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
	CONSTRAINT product_pk PRIMARY KEY (product_id)
);

CREATE TABLE types (
	type_id INTEGER AUTO_INCREMENT, 
	product_id SMALLINT(4) UNSIGNED NOT NULL,
	type_color VARCHAR(20) NOT NULL,
	type_size ENUM('S', 'M', 'L', 'XL') NOT NULL DEFAULT 'S',
	type_quantity TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
	CONSTRAINT type_pk PRIMARY KEY (type_id, product_id),
	CONSTRAINT type_fk FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

CREATE TABLE product_tags (
	product_id SMALLINT(4) UNSIGNED NOT NULL,
	tag_id SMALLINT(4) UNSIGNED NOT NULL,
	CONSTRAINT product_tag_pk PRIMARY KEY (product_id, tag_id),
	CONSTRAINT product_tag_fk1 FOREIGN KEY (tag_id) REFERENCES tags(tag_id),
	CONSTRAINT product_tag_fk2 FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE orders (
	order_id SMALLINT(6) UNSIGNED NOT NULL, #random generate
	customer_name VARCHAR(40) NOT NULL,
	customer_address VARCHAR(10) NOT NULL,
	street VARCHAR(40) NOT NULL,
	zip CHAR(4) NOT NULL,
	contact_number VARCHAR(15) NOT NULL,
	email VARCHAR(50) NOT NULL,
	date_entered TIMESTAMP NOT NULL DEFAULT NOW(),
	shipping_fee DECIMAL(8,2) NOT NULL,
	payment_method ENUM('Paypal', 'Cash on Delivery', 'Bank Deposit') NOT NULL DEFAULT 'Cash on Delivery',
	total_amount DECIMAL(8,2) NOT NULL,
	order_status ENUM('Pending', 'Processed', 'Shipped', 'Delivered') NOT NULL DEFAULT 'Pending',
	CONSTRAINT order_pk PRIMARY KEY (order_id)
);

CREATE TABLE order_lines (
	order_id SMALLINT(6) UNSIGNED NOT NULL,
	type_id INTEGER NOT NULL,
	ordered_quantity TINYINT(3) UNSIGNED NOT NULL DEFAULT 1,
	CONSTRAINT order_line_pk PRIMARY KEY (order_id, type_id),
	CONSTRAINT order_line_fk1 FOREIGN KEY (order_id) REFERENCES orders(order_id),
	CONSTRAINT order_line_fk2 FOREIGN KEY (type_id) REFERENCES types(type_id)
);
