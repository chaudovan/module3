use classicmodels;
explain select * from customers where customerName = 'Land of Toys Inc.'; 

create index i_customerName on customers(customerName);

alter table customers add index i_full_name(contactFirstName,contactLastName);

explain select * from customers where contactFirstName = 'king' or contactFirstName ='jean';
delimiter //
create procedure findallCustomer()
begin
	select * from customers;
end //
delimiter ;

delimiter //
create procedure findallCustomer1()
begin
	select * from customers where customerNumber=175;
end //
delimiter ;

call findallCustomer1();