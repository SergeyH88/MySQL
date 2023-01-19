			--Home_work_2_SQL

-- 1)Создать таблицу employees

create table employees(
 id serial primary key,
employee_name varchar(50) not null
);

--2)Наполнить таблицу employee 70 строками.
insert into employees (employee_name)
values ('Adams'), ('Adderiy'), ('Aldridge'),('Anderson'),('Andrews'),('Austin'),('Backer'),('Baldwin'),('Barnes'),('Barrington'),('Becker'),('Bishop'),('Black'),('Bradberry'),('Brooks'),('Brown'), 
('Butler'),('Campbell'),('Carter'),('Chesterton'),('Coleman'),('Collins'),('Cooper'),('Dalton'),('Day'),('Dickinson'),('Donovan'),('Edwards'),('Ellis'),('Ferguson'),('Fitzgerald'),('Ford'), 
('Foster'),('Gilbert'),('Gilmore'),('Goodman'),('Green'),('Hancock'),('Harris'),('Harrysoln'),('Hill'),('Howard'),('Hughes'),('Jackson'),('Jones'),('Kelly'),('King'),('Lewis'),('Little'), 
('MacDonald'),('Miller'),('Mollygan'),('Nelson'),('Oliver'),('Paterson'),('Phillips'),('Rogers'),('Salomon'),('Scott'),('Sheldon'),('Simpson'),('Smith'),('Taylor'),('Thomas'),('Walker'), 
('Wesley'),('White'),('Williams'),('Wilson'),('Yang');

--3)Создать таблицу salary
create table salary(
id serial primary key,
monthly_salary int not null);

--4)Наполнить таблицу salary 15 строками:
insert into salary (monthly_salary)
values ('1000'),('1100'),('1200'),('1300'),('1400'),('1500'),('1600'),('1700'),('1800'),
('1900'),('2000'),('2100'),('2200'),('2300'),('2400'),('2500');

--5)Создать таблицу employee_salary
create table employee_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null);

--6)Наполнить таблицу employee_salary 40 строками:
-- в 10 строк из 40 вставить несуществующие employee_id:

insert into employee_salary (employee_id, salary_id)
values (1, 3),(2, 4),(3, 5),(4, 10),(10, 6),(68, 9),(16, 2),
(30, 14),(5, 8),(6, 3),(9,3),(11, 8),
(28, 15),(34, 7),(45, 4),(35, 9),(55, 7),(23,14),(44, 6),
(65, 8),(51, 11),(39, 15),(41, 1),(33, 2),(25, 7),(42, 6),(70, 5),
(66, 4),(59, 3),(61, 10),(72, 16),(86, 10),(78, 11),(87, 2),(77, 6),
(75, 3),(79, 7),(88, 9),(81, 6),(74, 2);

-- 7) Создать таблицу roles
create table roles(
id serial primary key,
role_name int not null unique);

-- 8)Поменять тип столба role_name с int на varchar(30)
alter table roles alter column role_name type varchar(30);

--9)Наполнить таблицу roles 20 строками:
insert into roles (role_name) values ('Junior Python developer'),('Middle Python developer'),
('Senior Python developer'),('Junior Java developer'),('Middle Java developer'),
('Senior Java developer'),('Junior JavaScript dveloper'),('Middle JavaScript developer'),
('Senior JavaScript developer'), ('Junior Manual QA engineer'), ('Middle Manual QA engineer'),
('Senior Manual QA engineer'), ('Project Manager'), ('Dsigner'),('HR'),('CEO'),('Sales Manager'),
('Junior Auyomation QA engineer'), ('Middle Automation QA engineer'), ('Senior Automation QA engineer');

--10)Создать таблицу roles_employee
create table roles_employee(
id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id) references employees(id),
foreign key (role_id) references roles(id)
);

--11)Наполнить таблицу roles_employee 40 строками:

insert into roles_employee(employee_id,role_id)
values (3, 8),(8, 2),(4,4),(34,7),(68,11),(54,19),(66,20),(51,17),(44,12),(22,6),(7,9),(37,15),
(59,16),(52,18),(69,5),(57,10),(23,4),(60,14),(30,13),(50,6),(33,4),(13,17),(12,11),(29,6),
(38,2),(67,1),(49,9),(31,4),(32,7),(61,20),(28,3),(25,15),(39,16),(21,11),(20,11),(47,7),(58,2),
(62,5),(41,8),(65,17);



	
select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee;


                         THE__AND

                     --Home work_3 SQL
                         
--1) Вывести имена всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employees.employee_name, salary.monthly_salary
from employees join employee_salary
on employees.id = employee_salary.employee_id
join salary
on salary.id = employee_salary.salary_id;


--2) Вывести всех работников у которых ЗП меньше 2000.
select employees.employee_name, salary.monthly_salary
from employees join employee_salary
on employees.id = employee_salary.employee_id
join salary
on salary.id = employee_salary.salary_id
where salary.monthly_salary <2000;

--3) Вывести все зарплатные позиции, но работник по ним не назначен.
 --(ЗП есть, но не понятно кто её получает.)

select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee;

select employee_salary.employee_id, salary.monthly_salary 
from employee_salary right join salary
on employee_salary.salary_id = salary.id
where employee_salary.salary_id is null;

--4)Вывести все зарплатные позиции больше 2000 но работник по ним не назначен. 
--(ЗП есть, но не понятно кто её получает.)

select employee_salary.employee_id, salary.monthly_salary 
from employee_salary right join salary
on employee_salary.salary_id = salary.id
where employee_salary.salary_id is null and salary.monthly_salary >2000;

--5)Найти всех работников кому не начислена ЗП.

select employees.employee_name, employee_salary.salary_id, salary.monthly_salary
from employees left join employee_salary
on employees.id = employee_salary.employee_id
left join salary
on salary.id = employee_salary.salary_id
where employee_salary.salary_id is null and salary.monthly_salary is null;

select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee;


--6)  Вывести всех работников с названиями их должности

select employees.employee_name, roles.role_name
from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id;

--7) Вывести имена и должность только Java разработчиков

select employees.employee_name, roles.role_name
from employees join roles_employee
on employees.id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id
where roles.role_name like '%Java_developer';

--8)Вывести имена и должность только Python разработчиков

select employees.employee_name, roles.role_name 
from roles join  roles_employee
on roles_employee.role_id  = roles.id
join employees
on employees.id = roles_employee.role_id
where  roles.role_name like '%Python%';

--9)Вывести имена и должность всех QA инженеров.

 select employees.employee_name, roles.role_name 
from roles join  roles_employee
on roles_employee.role_id  = roles.id
join employees
on employees.id = roles_employee.role_id
where  roles.role_name like '%QA%';

select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee;

--10)Вывести имена и должность ручных QA инженеров

select employees.employee_name, roles.role_name 
from roles join  roles_employee
on roles_employee.role_id  = roles.id
join employees
on employees.id = roles_employee.role_id
where  roles.role_name like '%QA%';

--11) Вывести имена и должность автоматизаторов QA

select employees.employee_name, roles.role_name 
from roles join  roles_employee
on roles_employee.role_id  = roles.id
join employees
on employees.id = roles_employee.role_id
where  roles.id = 18 or  roles.id = 19 or  roles.id = 20;

--12)  *Вывести имена и зарплаты Junior специалистов

select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee;

select employees.employee_name, employee_salary.salary_id, roles.role_name, salary.monthly_salary
from employees join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like 'Junior%';


select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee;

--13)  Вывести имена и зарплаты Middle специалистов

select salary.monthly_salary, roles.role_name
from employees join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like '%Middle%';

--13) Вывести имена и зарплаты Senior специалистов
 select salary.monthly_salary, roles.role_name
from employees join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like 'Senior%';


--15) Вывести зарплаты Java разработчиков

select salary.monthly_salary, roles.role_name
from employee_salary join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like '%Java_developer';


--16) Вывести зарплаты Python разработчиков

select salary.monthly_salary, roles.role_name
from employee_salary  join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like '%Python%';

--17) Вывести имена и зарплаты Junior Python разработчиков

select salary.monthly_salary, roles.role_name
from employees join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like 'Junior_Python%';

--18)  Вывести имена и зарплаты Middle JS разработчиков

select salary.monthly_salary, roles.role_name
from employees join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like 'Middle_JavaScript%';

--19)  Вывести имена и зарплаты Senior Java разработчиков

select salary.monthly_salary, roles.role_name
from employees join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like 'Senior Java%';

--20)Вывести зарплаты Junior QA инженеров

select salary.monthly_salary, roles.role_name
from employee_salary join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like 'Junior_QA%';


--21) Вывести среднюю зарплату всех Junior специалистов 

select avg(monthly_salary)
from employee_salary join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like 'Junior%';

--22)Вывести сумму зарплат JS разработчиков

select sum(monthly_salary)
from employee_salary join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like '%JavaScript%';

--23)Вывести минимальную ЗП QA инженеров

select min(monthly_salary)
from employee_salary join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like '%QA%';

--24)  Вывести максимальную ЗП QA инженеров

select max(monthly_salary)
from employee_salary join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like '%QA%';

--25) Вывести количество QA инженеров

select * from employees;
select * from salary;
select * from employee_salary;
select * from roles;
select * from roles_employee;


select count(role_name)
from roles join roles_employee
on roles.id = roles_employee.role_id
where roles.role_name like '%QA%';


--26)Вывести количество Middle специалистов.

select count(role_name) 
from employees join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like 'Middle%';

--27) Вывести количество разработчиков

select count(role_name) 
from employees join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like '%developer%';

--28)Вывести фонд (сумму) зарплаты разработчиков

select sum(monthly_salary)
from employees join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id
join salary
on salary.id = employee_salary.salary_id
where roles.role_name like '%developer%';

--29)Вывести имена, должности и ЗП всех специалистов по возрастанию

select employees.employee_name, roles.role_name, salary.monthly_salary
from employees join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id 
join salary 
on salary.id = employee_salary.salary_id
order by monthly_salary;

--30) Вывести имена, должности и ЗП всех специалистов по возрастанию
-- у специалистов у которых ЗП от 1700 до 2300

select employees.employee_name, roles.role_name, salary.monthly_salary
from employees join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id 
join salary 
on salary.id = employee_salary.salary_id
where monthly_salary >1700 and monthly_salary <2300
order by monthly_salary;

--31) Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employees.employee_name, roles.role_name, salary.monthly_salary
from employees join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id 
join salary 
on salary.id = employee_salary.salary_id
where monthly_salary <2300
order by monthly_salary;

--32) Вывести имена, должности и ЗП всех специалистов по возрастанию
-- у специалистов у которых ЗП равна 1100, 1500, 2000

select employees.employee_name, roles.role_name, salary.monthly_salary
from employees join employee_salary
on employees.id = employee_salary.employee_id 
join roles_employee
on employee_salary.employee_id = roles_employee.employee_id
join roles
on roles.id = roles_employee.role_id 
join salary 
on salary.id = employee_salary.salary_id
where monthly_salary = 1100 or monthly_salary = 1500 or monthly_salary = 2000
order by monthly_salary;

                        THE__AND

