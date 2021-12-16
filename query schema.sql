CREATE DATABASE POS;

CREATE TABLE PRODUCT (
	id int(11),
    supplier_id int(11),
    category_id int(11),
    brandName varchar(50),
    modelNumber varchar(50),
    description varchar(50),
    isTaxable boolean,
    isActive boolean,
    PRIMARY KEY(id)
);

CREATE TABLE CATEGORY(
	id int(11),
    category_description varchar(100),
    parent_category_id int(11),
    primary key(id)
);

CREATE TABLE priceHistory(
	id int(11),
    product_id int(11),
    price_date date,
    price_bought float(15),
    price_sold float(15),
    primary key(id)
);

CREATE TABLE CUSTOMER(
	id int(11),
    customer_name varchar(50),
    isCompany boolean,
    customer_since date,
    address_1 varchar(50),
    address_2 varchar(50),
    district varchar(50),
    primary key(id)
    
);

CREATE TABLE INVOICE(
	id int(11),
    date date,
    customer_id int(11),
    invoice_total float(15),
    sales_tax_rate float(5),
    sales_tax_amount float(15),
    grand_total float(15),
    isPaid boolean,
    primary key(id)
);

CREATE TABLE INVOICE_DETAIL(
	id int(11),
    invoice_id int(11),
    product_id int(11),
    quantity int(5),
    line_total float(15),
    isTaxable boolean,
    primary key(id)
);

CREATE TABLE customerHistory(
	id int(11),
    customer_id int(11),
    invoice_number int(11),
    balance float(15),
    primary key(id)
);

CREATE TABLE supplier(
	id int(11),
    supplier_name varchar(50),
    supplier_since date,
    address_1 varchar(50),
    address_2 varchar(50),
    district varchar(50),
    phone varchar(50),
    email varchar(50),
    website varchar(50),
    primary key(id)
);

CREATE TABLE purchase_order(
	id int(11),
    order_date date,
    supplier_id int(11),
    order_total float(15),
    tax_rate float(5),
    tax_amount float(15),
    grand_total float(15),
    isPaid boolean,
    primary key(id)
);

CREATE TABLE purchase_order_detail(
	id int(11),
    purchase_order_id int(11),
    product_id int(11),
    quantity int(5),
    line_total float(15),
    isTaxable boolean,
    primary key(id)
);

CREATE TABLE supplierHistory(
	id int(11),
    supplier_id int(11),
    payment_date date,
    purchase_order_id int(11),
    payment_amount float(15),
    balance_due date,
    paidInFull boolean,
	primary key(id)
);
