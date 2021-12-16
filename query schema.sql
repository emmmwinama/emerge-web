CREATE DATABASE POS;

SET default_storage_engine=INNODB;

CREATE TABLE category(
	id int(11) NOT NULL,
    category_description VARCHAR(100) NOT NULL,
    parent_category_id int(11) NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE product (
	id int(11) NOT NULL,
    supplier_id int(11) NOT NULL,
    category_id int(11) NOT NULL,
    brand_Name VARCHAR(50) NOT NULL,
    model_number VARCHAR(50) NOT NULL,
    description VARCHAR(50) NOT NULL,
    isTaxable boolean NOT NULL,
    isActive boolean NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE productdetail(
    id int(11) NOT NULL,
    detail_name VARCHAR(50) NOT NULL,
    detail_value VARCHAR(50) NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE pricehistory(
	id int(11) NOT NULL,
    product_id int(11) NOT NULL,
    price_date DATE NOT NULL,
    price_bought FLOAT(15) NOT NULL,
    price_sold FLOAT(15) NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE customer(
	id int(11) NOT NULL,
    customer_name VARCHAR(50) NOT NULL,
    isCompany boolean NOT NULL,
    customer_since DATE NOT NULL,
    address_1 VARCHAR(50) NOT NULL,
    address_2 VARCHAR(50) NOT NULL,
    district VARCHAR(50) NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id) 
);

CREATE TABLE INVOICE(
	id int(11) NOT NULL,
    date DATE NOT NULL,
    customer_id int(11) NOT NULL,
    invoice_total FLOAT(15) NOT NULL,
    sales_tax_rate FLOAT(5) NOT NULL,
    sales_tax_amount FLOAT(15) NOT NULL,
    grand_total FLOAT(15) NOT NULL,
    isPaid boolean NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE INVOICE_DETAIL(
	id int(11) NOT NULL,
    invoice_id int(11) NOT NULL,
    product_id int(11) NOT NULL,
    quantity int(5) NOT NULL,
    line_total FLOAT(15) NOT NULL,
    isTaxable boolean NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE customerHistory(
	id int(11) NOT NULL,
    customer_id int(11) NOT NULL,
    invoice_id int(11) NOT NULL,
    balance FLOAT(15) NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE supplier(
	id int(11) NOT NULL,
    supplier_name VARCHAR(50) NOT NULL,
    supplier_since DATE NOT NULL,
    address_1 VARCHAR(50) NOT NULL,
    address_2 VARCHAR(50) NOT NULL,
    district VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    website VARCHAR(50) NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE purchase_order(
	id int(11) NOT NULL,
    order_date DATE NOT NULL,
    supplier_id int(11) NOT NULL,
    order_total FLOAT(15) NOT NULL,
    tax_rate FLOAT(5) NOT NULL,
    tax_amount FLOAT(15) NOT NULL,
    grand_total FLOAT(15) NOT NULL,
    isPaid boolean NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE purchaseorderdetail(
	id int(11) NOT NULL,
    purchase_order_id int(11) NOT NULL,
    product_id int(11) NOT NULL,
    quantity int(5) NOT NULL,
    line_total FLOAT(15) NOT NULL,
    isTaxable boolean NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE supplierHistory(
	id int(11) NOT NULL,
    supplier_id int(11) NOT NULL,
    payment_date DATE NOT NULL,
    purchase_order_id int(11) NOT NULL,
    payment_amount FLOAT(15) NOT NULL,
    balance_due DATE NOT NULL,
    paidInFull boolean NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY(id)
);
