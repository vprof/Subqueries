/*2*/
CREATE SCHEMA `myjoinsdb`;
/*3*/
  CREATE TABLE `employees` (
  `e_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`e_id`));
  
  CREATE TABLE `salary` (
  `e_id` INT NOT NULL,
  `salary` INT NOT NULL,
  `job_title` VARCHAR(30) NULL,
  PRIMARY KEY (`e_id`));
  
  CREATE TABLE `personalinfo` (
  `e_id` INT NOT NULL,
  `marital_status` VARCHAR(30) NULL,
  `birthday` DATE NULL,
  `address` VARCHAR(100) NULL,
  PRIMARY KEY (`e_id`));
  
  /*insert into employees
  (name, phone)
  values
  ('John', '555-963-147');
  
  insert into salary
  (e_id, salary, job_title)
  values
  (3, 59000, 'QA');
  
  insert into personalinfo
  (e_id, marital_status, birthday, address)
  values
  (3, 'single', '1997-02-28', 'NY');*/
  
  /*4.1*/
  select employees.name, employees.phone, 
	  (select personalinfo.address 
	   from personalinfo 
	   where personalinfo.e_id = employees.e_id) as address
  from employees;

  /*4.2*/
  select employees.e_id as ID, employees.name Name, personalinfo.birthday
  from employees
  join personalinfo on employees.e_id = personalinfo.e_id
	WHERE employees.e_id IN (
	  SELECT e_id
	  FROM personalinfo
	  WHERE marital_status = 'single'
	);

  /*4.3*/
  select employees.name, personalinfo.birthday, employees.phone
  from employees
  inner join personalinfo on employees.e_id = personalinfo.e_id
  where employees.e_id in 
    (select e_id 
     from salary 
     where job_title = 'PM');