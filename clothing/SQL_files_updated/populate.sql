INSERT INTO tags
(tag_name)
VALUES ('dress');

INSERT INTO tags
(tag_name)
VALUES ('lace');

INSERT INTO tags
(tag_name)
VALUES ('short');

INSERT INTO tags
(tag_name)
VALUES ('blazer');

INSERT INTO tags
(tag_name)
VALUES ('long');

INSERT INTO tags
(tag_name)
VALUES ('ruffle');

INSERT INTO tags
(tag_name)
VALUES ('jumpsuit');

INSERT INTO tags
(tag_name)
VALUES ('gown');

INSERT INTO tags
(tag_name)
VALUES ('blouse');

INSERT INTO tags
(tag_name)
VALUES ('skirt');

INSERT INTO tags
(tag_name)
VALUES ('plaid');



INSERT INTO products
(product_name, product_category, product_price)
VALUES ('Mary', 'Bottom', 1399);

INSERT INTO products
(product_name, product_category, product_price)
VALUES ('X', 'Top', 1399);

INSERT INTO products
(product_name, product_category, product_price)
VALUES ('Jade', 'Dress', 1499);

INSERT INTO products
(product_name, product_category, product_price)
VALUES ('Aira', 'Top', 1399);

INSERT INTO products
(product_name, product_category, product_price)
VALUES ('Miel', 'Bottom', 1399);

INSERT INTO products
(product_name, product_category, product_price)
VALUES ('Miel', 'Dress', 1399);

INSERT INTO products
(product_name, product_category, product_price)
VALUES ('Krisda', 'Top', 1499);

INSERT INTO products
(product_name, product_category, product_price)
VALUES ('Aila', 'Bottom', 1399);

INSERT INTO products
(product_name, product_category, product_price)
VALUES ('Kris', 'Dress', 1499);

INSERT INTO products
(product_name, product_category, product_price)
VALUES ('Petra', 'Top', 1399);

INSERT INTO products
(product_name, product_category, product_price)
VALUES ('Cleopetra', 'Bottom', 1499);

INSERT INTO products
(product_name, product_category, product_price)
VALUES ('Hope', 'Dress', 1499);

INSERT INTO products
(product_name, product_category, product_price)
VALUES ('Lynega', 'Top', 1499);

INSERT INTO products
(product_name, product_category, product_price)
VALUES ('Classica', 'Bottom', 1499);

INSERT INTO products
(product_name, product_category, product_price)
VALUES ('Tiffany', 'Dress', 1399);

INSERT INTO products
(product_name, product_category, product_price)
VALUES ('Chin', 'Dress', 1299);

INSERT INTO products
(product_name, product_category, product_price)
VALUES ('Megan', 'Top', 1299);

INSERT INTO products
(product_name, product_category, product_price)
VALUES ('Shiloh Polka', 'Bottom', 1499);

INSERT INTO types
(product_id, type_color, type_size, type_quantity)
VALUES (1, 'Black', 'S', 12);

INSERT INTO types
(product_id, type_color, type_size, type_quantity)
VALUES (1, 'Maroon', 'M', 15);

INSERT INTO types
(product_id, type_color, type_size, type_quantity)
VALUES (1, 'Navy Blue', 'S', 12);

INSERT INTO types
(product_id, type_color, type_size, type_quantity)
VALUES (2, 'Black', 'M', 7);

INSERT INTO types
(product_id, type_color, type_size, type_quantity)
VALUES (2, 'Beige', 'M', 7);

INSERT INTO types
(product_id, type_color, type_size, type_quantity)
VALUES (2, 'Navy', 'M', 7);

INSERT INTO types
(product_id, type_color, type_size, type_quantity)
VALUES (3, 'Pink', 'XL', 9);

INSERT INTO types
(product_id, type_color, type_size, type_quantity)
VALUES (3, 'Black', 'XL', 9);

INSERT INTO types
(product_id, type_color, type_size, type_quantity)
VALUES (3, 'Blue', 'XL', 9);

INSERT INTO types
(product_id, type_color, type_size, type_quantity)
VALUES (4, 'Red', 'M', 8);

INSERT INTO types
(product_id, type_color, type_size, type_quantity)
VALUES (4, 'Black', 'M', 8);

INSERT INTO types
(product_id, type_color, type_size, type_quantity)
VALUES (4, 'Violet', 'M', 8);

INSERT INTO product_tags
(product_id, tag_id)
VALUES (3, 1);

INSERT INTO product_tags
(product_id, tag_id)
VALUES (6, 1);

INSERT INTO product_tags
(product_id, tag_id)
VALUES (2, 4);

INSERT INTO product_tags
(product_id, tag_id)
VALUES (4, 2);

INSERT INTO product_tags
(product_id, tag_id)
VALUES (5, 9);

INSERT INTO product_tags
(product_id, tag_id)
VALUES (6, 2);

INSERT INTO product_tags
(product_id, tag_id)
VALUES (7, 8);

INSERT INTO product_tags
(product_id, tag_id)
VALUES (1, 4);

INSERT INTO product_tags
(product_id, tag_id)
VALUES (6, 5);

INSERT INTO product_tags
(product_id, tag_id)
VALUES (2, 3);

-- INSERT INTO orders
-- (customer_name, customer_address, street, city, province, zip, contact_number, email, date_entered, shipping_fee, payment_method, total_amount, order_status)
-- VALUES ()








