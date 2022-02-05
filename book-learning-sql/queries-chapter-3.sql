#Exercise 3-1
#Retrieve the employee ID, first name, and last name for all bank employees. Sort by last
#name and then by first name.

SELECT e.emp_id, e.fname, e.lname FROM employee AS e ORDER BY e.lname, fname;


#+--------+----------+-----------+
#| emp_id | fname    | lname     |
#+--------+----------+-----------+
#|      2 | Susan    | Barker    |
#|     13 | John     | Blake     |
#|      6 | Helen    | Fleming   |
#|     17 | Beth     | Fowler    |
#|      5 | John     | Gooding   |
#|      9 | Jane     | Grossman  |
#|      4 | Susan    | Hawthorne |
#|     12 | Samantha | Jameson   |
#|     16 | Theresa  | Markham   |
#|     14 | Cindy    | Mason     |
#|      8 | Sarah    | Parker    |
#|     15 | Frank    | Portman   |
#|     10 | Paula    | Roberts   |
#|      1 | Michael  | Smith     |
#|      7 | Chris    | Tucker    |
#|     18 | Rick     | Tulman    |
#|      3 | Robert   | Tyler     |
#|     11 | Thomas   | Ziegler   |
#+--------+----------+-----------+

#Exercise 3-2
#Retrieve the account ID, customer ID, and available balance for all accounts whose
#status equals 'ACTIVE' and whose available balance is greater than $2,500.

SELECT a.account_id, a.cust_id, a.avail_balance FROM account a WHERE a.status = 'ACTIVE' AND a.avail_balance > 2500;

#+------------+---------+---------------+
#| account_id | cust_id | avail_balance |
#+------------+---------+---------------+
#|          3 |       1 |       3000.00 |
#|         12 |       4 |       5487.09 |
#|         15 |       6 |      10000.00 |
#|         17 |       7 |       5000.00 |
#|         18 |       8 |       3487.19 |
#|         22 |       9 |       9345.55 |
#|         24 |      10 |      23575.12 |
#|         27 |      11 |       9345.55 |
#|         28 |      12 |      38552.05 |
#|         29 |      13 |      50000.00 |
#+------------+---------+---------------+


#Exercise 3-3
#Write a query against the account table that returns the IDs of the employees who
#opened the accounts (use the account.open_emp_id column). Include a single row for
#each distinct employee.

SELECT DISTINCT account.open_emp_id from account;

#+-------------+
#| open_emp_id |
#+-------------+
#|           1 |
#|          10 |
#|          13 |
#|          16 |
#+-------------+


#Exercise 3-4
#Fill in the blanks (denoted by <#>) for this multi-data-set query to achieve the results
#shown here:
#mysql> SELECT p.product_cd, a.cust_id, a.avail_balance
#-> FROM product p INNER JOIN account <1>
#-> ON p.product_cd = <2>
#-> WHERE p.<3> = 'ACCOUNT'
#-> ORDER BY <4>, <5>;
#+------------+---------+---------------+
#| product_cd | cust_id | avail_balance |
#+------------+---------+---------------+
#| CD | 1 | 3000.00 |
#| CD | 6 | 10000.00 |
#| CD | 7 | 5000.00 |
#| CD | 9 | 1500.00 |
#| CHK | 1 | 1057.75 |
#| CHK | 2 | 2258.02 |
#| CHK | 3 | 1057.75 |
#| CHK | 4 | 534.12 |
#| CHK | 5 | 2237.97 |
#| CHK | 6 | 122.37 |
#| CHK | 8 | 3487.19 |
#| CHK | 9 | 125.67 |
#| CHK | 10 | 23575.12 |
#| CHK | 12 | 38552.05 |
#| MM | 3 | 2212.50 |

 SELECT p.product_cd, a.cust_id, a.avail_balance 
 	FROM product p INNER JOIN account a ON p.product_cd = a.product_cd 
 	WHERE p.product_type_cd = 'ACCOUNT' 
 	ORDER BY product_cd, cust_id;

#+------------+---------+---------------+
#| product_cd | cust_id | avail_balance |
#+------------+---------+---------------+
#| CD         |       1 |       3000.00 |
#| CD         |       6 |      10000.00 |
#| CD         |       7 |       5000.00 |
#| CD         |       9 |       1500.00 |
#| CHK        |       1 |       1057.75 |
#| CHK        |       2 |       2258.02 |
#| CHK        |       3 |       1057.75 |
#| CHK        |       4 |        534.12 |
#| CHK        |       5 |       2237.97 |
#| CHK        |       6 |        122.37 |
#| CHK        |       8 |       3487.19 |
#| CHK        |       9 |        125.67 |
#| CHK        |      10 |      23575.12 |
#| CHK        |      12 |      38552.05 |
#| MM         |       3 |       2212.50 |
#| MM         |       4 |       5487.09 |
#| MM         |       9 |       9345.55 |
#| SAV        |       1 |        500.00 |
#| SAV        |       2 |        200.00 |
#| SAV        |       4 |        767.77 |
#| SAV        |       8 |        387.99 |
#+------------+---------+---------------+

#Txn_id Txn_date Account_id Txn_type_cd Amount
#1 2005-02-22 101 CDT 1000.00
#2 2005-02-23 102 CDT 525.75
#3 2005-02-24 101 DBT 100.00
#4 2005-02-24 103 CDT 55
#5 2005-02-25 101 DBT 50
#6 2005-02-25 103 DBT 25
#7 2005-02-25 102 CDT 125.37
#8 2005-02-26 103 DBT 10
#9 2005-02-27 101 CDT 75

#Exercise 4-1
#Which of the transaction IDs would be returned by the following filter conditions?
#txn_date < '2005-02-26' AND (txn_type_cd = 'DBT' OR amount > 100)

#ANSWER: 1,2,3,5,6 and 7 will be returned

#Exercise 4-2
#Which of the transaction IDs would be returned by the following filter conditions?
#account_id IN (101,103) AND NOT (txn_type_cd = 'DBT' OR amount > 100)

#ANSWER: 9 and 4 will be returned


#Exercise 4-3
#Construct a query that retrieves all accounts opened in 2002.
SELECT * FROM account WHERE open_date BETWEEN '2002-01-01' AND '2002-12-31';


#Exercise 4-4
#Construct a query that finds all nonbusiness customers whose last name contains an
#a in the second position and an e anywhere after the a.
SELECT * FROM individual WHERE lname LIKE '_a%e%';


#Exercise 5-1
#Fill in the blanks (denoted by <#>) for the following query to obtain the results that
#follow:
#mysql> SELECT e.emp_id, e.fname, e.lname, b.name
#-> FROM employee e INNER JOIN <1> b
#-> ON e.assigned_branch_id = b.<2>;
#+--------+----------+-----------+---------------+
#| emp_id | fname | lname | name |
#--------+----------+-----------+---------------+
#| 1 | Michael | Smith | Headquarters |
#| 2 | Susan | Barker | Headquarters |
#| 3 | Robert | Tyler | Headquarters |
#| 4 | Susan | Hawthorne | Headquarters |
#Test Your Knowledge | 97
#D l d t W B k C
#| 5 | John | Gooding | Headquarters |
#| 6 | Helen | Fleming | Headquarters |
#| 7 | Chris | Tucker | Headquarters |
#| 8 | Sarah | Parker | Headquarters |
#| 9 | Jane | Grossman | Headquarters |
#| 10 | Paula | Roberts | Woburn Branch |
#| 11 | Thomas | Ziegler | Woburn Branch |
#| 12 | Samantha | Jameson | Woburn Branch |
#| 13 | John | Blake | Quincy Branch |
#| 14 | Cindy | Mason | Quincy Branch |
#| 15 | Frank | Portman | Quincy Branch |
#| 16 | Theresa | Markham | So. NH Branch |
#| 17 | Beth | Fowler | So. NH Branch |
#| 18 | Rick | Tulman | So. NH Branch |
#+--------+----------+-----------+---------------+
#18 rows in set (0.03 sec)

SELECT e.emp_id, e.fname, e.lname, b.name FROM employee e INNER JOIN branch b ON e.assigned_branch_id = b.branch_id;

#Exercise 5-2
#Write a query that returns the account ID for each nonbusiness customer
#(customer.cust_type_cd = 'I') with the customer’s federal ID (customer.fed_id) and
#the name of the product on which the account is based (product.name).

SELECT a1.account_id, c.fed_id, p.name FROM customer c 
INNER JOIN account a1 
ON a1.cust_id = c.cust_id 
INNER JOIN product p 
ON a1.product_cd = p.product_cd 
WHERE c.cust_type_cd = 'I';

#+------------+-------------+------------------------+
#| account_id | fed_id      | name                   |
#+------------+-------------+------------------------+
#|          1 | 111-11-1111 | checking account       |
#|          2 | 111-11-1111 | savings account        |
#|          3 | 111-11-1111 | certificate of deposit |
#|          4 | 222-22-2222 | checking account       |
#|          5 | 222-22-2222 | savings account        |
#|          7 | 333-33-3333 | checking account       |
#|          8 | 333-33-3333 | money market account   |
#|         10 | 444-44-4444 | checking account       |
#|         11 | 444-44-4444 | savings account        |
#|         12 | 444-44-4444 | money market account   |
#|         13 | 555-55-5555 | checking account       |
#|         14 | 666-66-6666 | checking account       |
#|         15 | 666-66-6666 | certificate of deposit |
#|         17 | 777-77-7777 | certificate of deposit |
#|         18 | 888-88-8888 | checking account       |
#|         19 | 888-88-8888 | savings account        |
#|         21 | 999-99-9999 | checking account       |
#|         22 | 999-99-9999 | money market account   |
#|         23 | 999-99-9999 | certificate of deposit |
#+------------+-------------+------------------------+


#Exercise 5-3
#Construct a query that finds all employees whose supervisor is assigned to a different
#department. Retrieve the employees’ ID, first name, and last name.

SELECT e.emp_id, e.fname, e.lname FROM employee e 
INNER JOIN employee e_mgr  
ON e.superior_emp_id = e_mgr.emp_id 
AND e.dept_id != e_mgr.dept_id;

#+--------+-------+-----------+
#| emp_id | fname | lname     |
#+--------+-------+-----------+
#|      4 | Susan | Hawthorne |
#|      5 | John  | Gooding   |
#+--------+-------+-----------+


#Exercise 6-1

#If set A = {L M N O P} and set B = {P Q R S T}, what sets are generated by the following
#operations?
#• A union B
#• A union all B
#• A intersect B
#• A except B

# A union B = {L M N O P Q R S T}
# A union all B = {L M N O P P Q R S T}
# A intersect B = {P}
# A except B = {L M N O}


#Exercise 6-2
#Write a compound query that finds the first and last names of all individual customers
#along with the first and last names of all employees.

SELECT c.fname, c.lname FROM individual c
UNION
SELECT e.fname, e.lname FROM employee e;

#+----------+-----------+
#| fname    | lname     |
#+----------+-----------+
#| James    | Hadley    |
#| Susan    | Tingley   |
#| Frank    | Tucker    |
#| John     | Hayward   |
#| Charles  | Frasier   |
#| John     | Spencer   |
#| Margaret | Young     |
#| Louis    | Blake     |
#| Richard  | Farley    |
#| Michael  | Smith     |
#| Susan    | Barker    |
#| Robert   | Tyler     |
#| Susan    | Hawthorne |
#| John     | Gooding   |
#| Helen    | Fleming   |
#| Chris    | Tucker    |
#| Sarah    | Parker    |
#| Jane     | Grossman  |
#| Paula    | Roberts   |
#| Thomas   | Ziegler   |
#| Samantha | Jameson   |
#| John     | Blake     |
#| Cindy    | Mason     |
#| Frank    | Portman   |
#| Theresa  | Markham   |
#| Beth     | Fowler    |
#| Rick     | Tulman    |
#+----------+-----------+
#27 rows in set (0.01 sec)


#Exercise 6-3
#Sort the results from Exercise 6-2 by the lname column.


SELECT c.fname, c.lname FROM individual c
UNION
SELECT e.fname, e.lname FROM employee e
ORDER BY lname;

#+----------+-----------+
#| fname    | lname     |
#+----------+-----------+
#| Susan    | Barker    |
#| John     | Blake     |
#| Louis    | Blake     |
#| Richard  | Farley    |
#| Helen    | Fleming   |
#| Beth     | Fowler    |
#| Charles  | Frasier   |
#| John     | Gooding   |
#| Jane     | Grossman  |
#| James    | Hadley    |
#| Susan    | Hawthorne |
#| John     | Hayward   |
#| Samantha | Jameson   |
#| Theresa  | Markham   |
#| Cindy    | Mason     |
#| Sarah    | Parker    |
#| Frank    | Portman   |
#| Paula    | Roberts   |
#| Michael  | Smith     |
#| John     | Spencer   |
#| Susan    | Tingley   |
#| Chris    | Tucker    |
#| Frank    | Tucker    |
#| Rick     | Tulman    |
#| Robert   | Tyler     |
#| Margaret | Young     |
#| Thomas   | Ziegler   |
#+----------+-----------+
#27 rows in set (0.00 sec)


#Exercise 7-1
#Write a query that returns the 17th through 25th characters of the string 'Please find
#the substring in this string'.
SELECT SUBSTRING('Please find the substring in this string', 17, 25);

#+---------------------------------------------------------------+
#| SUBSTRING('Please find the substring in this string', 17, 9) |
#+---------------------------------------------------------------+
#| substring                                    |
#+---------------------------------------------------------------+


#Exercise 7-2
#Write a query that returns the absolute value and sign (−1, 0, or 1) of the number −25.
#76823. Also return the number rounded to the nearest hundredth.
SELECT ABS(-25.76823), SIGN(-25.76823), ROUND(-25.76823, 2);

#+----------------+-----------------+---------------------+
#| ABS(-25.76823) | SIGN(-25.76823) | ROUND(-25.76823, 2) |
#+----------------+-----------------+---------------------+
#| 25.76823 | −1 | −25.77 |
#+----------------+-----------------+---------------------+


#Exercise 7-3
#Write a query to return just the month portion of the current date.
SELECT EXTRACT(MONTH FROM CURRENT_DATE);

#+----------------------------------+
#| EXTRACT(MONTH FROM CURRENT_DATE) |
#+----------------------------------+
#|                               12 |
#+----------------------------------+


#Exercise 8-1
#Construct a query that counts the number of rows in the account table.
SELECT COUNT(*) FROM account;

#+----------+           
#| COUNT(*) |           
#+----------+           
#|       72 |           
#+----------+           
#1 row in set (0.01 sec)

#Exercise 8-2
#Modify your query from Exercise 8-1 to count the number of accounts held by each
#customer. Show the customer ID and the number of accounts for each customer.
SELECT cust_id, COUNT(*) how_many FROM account GROUP BY (cust_id);

#+---------+----------+
#| cust_id | how_many |
#+---------+----------+
#|       1 |        6 |
#|       2 |        4 |
#|       3 |        4 |
#|       4 |        6 |
#|       5 |        2 |
#|       6 |        4 |
#|       7 |        2 |
#|       8 |        4 |
#|       9 |        6 |
#|      10 |        4 |
#|      11 |        2 |
#|      12 |        2 |
#|      13 |        2 |
#|      14 |        3 |
#|      15 |        2 |
#|      16 |        2 |
#|      17 |        3 |
#|      18 |        1 |
#|      19 |        2 |
#|      20 |        1 |
#|      21 |        2 |
#|      22 |        3 |
#|      23 |        2 |
#|      24 |        1 |
#|      25 |        1 |
#|      26 |        1 |
#+---------+----------+
#26 rows in set (0.01 sec)


#Exercise 8-3
#Modify your query from Exercise 8-2 to include only those customers having at least
#two accounts.
SELECT cust_id, COUNT(*) how_many FROM account GROUP BY (cust_id) HAVING COUNT(*) >= 2;

#+---------+----------+   
#| cust_id | how_many |   
#+---------+----------+   
#|       1 |        6 |   
#|       2 |        4 |   
#|       3 |        4 |   
#|       4 |        6 |   
#|       5 |        2 |   
#|       6 |        4 |   
#|       7 |        2 |   
#|       8 |        4 |   
#|       9 |        6 |   
#|      10 |        4 |   
#|      11 |        2 |   
#|      12 |        2 |   
#|      13 |        2 |   
#|      14 |        3 |   
#|      15 |        2 |   
#|      16 |        2 |   
#|      17 |        3 |   
#|      19 |        2 |   
#|      21 |        2 |   
#|      22 |        3 |   
#|      23 |        2 |   
#+---------+----------+   
#21 rows in set (0.00 sec)

#Exercise 8-4 (Extra Credit)
#Find the total available balance by product and branch where there is more than one
#account per product and branch. Order the results by total balance (highest to lowest).


#Exercise 9-1
#Construct a query against the account table that uses a filter condition with a noncorrelated
#subquery against the product table to find all loan accounts (product.prod
#uct_type_cd = 'LOAN'). Retrieve the account ID, product code, customer ID, and available
#balance.

SELECT account_id, product_cd, cust_id, avail_balance 
FROM account 
WHERE product_cd IN (SELECT product_cd FROM product WHERE product_type_cd = 'LOAN');

#+------------+------------+---------+---------------+
#| account_id | product_cd | cust_id | avail_balance |
#+------------+------------+---------+---------------+
#|         25 | BUS        |      10 |          0.00 |
#|         27 | BUS        |      11 |       9345.55 |
#|         85 | BUS        |      10 |          0.00 |
#|         87 | BUS        |      23 |          0.00 |
#|         92 | BUS        |      11 |       9345.55 |
#|         93 | BUS        |      24 |       9345.55 |
#|         29 | SBL        |      13 |      50000.00 |
#|         98 | SBL        |      13 |      50000.00 |
#|         99 | SBL        |      26 |      50000.00 |
#+------------+------------+---------+---------------+
#9 rows in set (0.01 sec)


#Exercise 9-2
#Rework the query from Exercise 9-1 using a correlated subquery against the product
#table to achieve the same results.

SELECT a.account_id, a.product_cd, a.cust_id, a.avail_balance
FROM account a
WHERE EXISTS (SELECT 1
FROM product p
WHERE p.product_cd = a.product_cd
AND p.product_type_cd = 'LOAN');

#+------------+------------+---------+---------------+
#| account_id | product_cd | cust_id | avail_balance |
#+------------+------------+---------+---------------+
#|         25 | BUS        |      10 |          0.00 |
#|         27 | BUS        |      11 |       9345.55 |
#|         85 | BUS        |      10 |          0.00 |
#|         87 | BUS        |      23 |          0.00 |
#|         92 | BUS        |      11 |       9345.55 |
#|         93 | BUS        |      24 |       9345.55 |
#|         29 | SBL        |      13 |      50000.00 |
#|         98 | SBL        |      13 |      50000.00 |
#|         99 | SBL        |      26 |      50000.00 |
#+------------+------------+---------+---------------+
#9 rows in set (0.01 sec)

#Exercise 9-3
#Join the following query to the employee table to show the experience level of each
#employee:
#SELECT 'trainee' name, '2004-01-01' start_dt, '2005-12-31' end_dt
#UNION ALL
#SELECT 'worker' name, '2002-01-01' start_dt, '2003-12-31' end_dt
#UNION ALL
#SELECT 'mentor' name, '2000-01-01' start_dt, '2001-12-31' end_dt
#Give the subquery the alias levels, and include the employee ID, first name, last name,
#and experience level (levels.name). (Hint: build a join condition using an inequality
#condition to determine into which level the employee.start_date column falls.)

SELECT e.emp_id, e.fname, e.lname, levels.name
FROM employee e INNER JOIN
(SELECT 'trainee' name, '2004-01-01' start_dt, '2005-12-31' end_dt
UNION ALL
SELECT 'worker' name, '2002-01-01' start_dt, '2003-12-31' end_dt
UNION ALL
SELECT 'mentor' name, '2000-01-01' start_dt, '2001-12-31' end_dt) levels
ON e.start_date BETWEEN levels.start_dt AND levels.end_dt;

#+--------+----------+-----------+---------+
#| emp_id | fname | lname | name |
#+--------+----------+-----------+---------+
#| 6 | Helen | Fleming | trainee |
#| 7 | Chris | Tucker | trainee |
#| 2 | Susan | Barker | worker |
#| 4 | Susan | Hawthorne | worker |
#| 5 | John | Gooding | worker |
#| 8 | Sarah | Parker | worker |
#| 9 | Jane | Grossman | worker |
#| 10 | Paula | Roberts | worker |
#| 12 | Samantha | Jameson | worker |
#| 14 | Cindy | Mason | worker |
#| 15 | Frank | Portman | worker |
#| 17 | Beth | Fowler | worker |
#| 18 | Rick | Tulman | worker |
#| 1 | Michael | Smith | mentor |
#| 3 | Robert | Tyler | mentor |
#| 11 | Thomas | Ziegler | mentor |
#| 13 | John | Blake | mentor |
#| 16 | Theresa | Markham | mentor |
#+--------+----------+-----------+---------+
#18 rows in set (0.00 sec)


#Exercise 9-4
#Construct a query against the employee table that retrieves the employee ID, first name,
#and last name, along with the names of the department and branch to which the employee
#is assigned. Do not join any tables.


SELECT e.emp_id, e.fname, e.lname,
(SELECT d.name FROM department d
WHERE d.dept_id = e.dept_id) dept_name,
(SELECT b.name FROM branch b
WHERE b.branch_id = e.assigned_branch_id) branch_name
FROM employee e;

#| emp_id | fname | lname | dept_name | branch_name |
#+--------+----------+-----------+----------------+---------------+
#| 1 | Michael | Smith | Administration | Headquarters |
#| 2 | Susan | Barker | Administration | Headquarters |
#| 3 | Robert | Tyler | Administration | Headquarters |
#| 4 | Susan | Hawthorne | Operations | Headquarters |
#| 5 | John | Gooding | Loans | Headquarters |
#| 6 | Helen | Fleming | Operations | Headquarters |
#| 7 | Chris | Tucker | Operations | Headquarters |
#| 8 | Sarah | Parker | Operations | Headquarters |
#| 9 | Jane | Grossman | Operations | Headquarters |
#| 10 | Paula | Roberts | Operations | Woburn Branch |
#| 11 | Thomas | Ziegler | Operations | Woburn Branch |
#| 12 | Samantha | Jameson | Operations | Woburn Branch |
#| 13 | John | Blake | Operations | Quincy Branch |
#| 14 | Cindy | Mason | Operations | Quincy Branch |
#| 15 | Frank | Portman | Operations | Quincy Branch |
#| 16 | Theresa | Markham | Operations | So. NH Branch |
#| 17 | Beth | Fowler | Operations | So. NH Branch |
#| 18 | Rick | Tulman | Operations | So. NH Branch |
#+--------+----------+-----------+----------------+---------------+
#18 rows in set (0.12 sec)



#Exercise 10-1
#Write a query that returns all product names along with the accounts based on that
#product (use the product_cd column in the account table to link to the product table).
#Include all products, even if no accounts have been opened for that product.

SELECT p.name, a.account_id, a.status, a.avail_balance FROM product p LEFT OUTER JOIN account a ON a.product_cd = p.product_cd;

#+-------------------------+------------+--------+---------------+
#| name                    | account_id | status | avail_balance |
#+-------------------------+------------+--------+---------------+
#| auto loan               |       NULL | NULL   |          NULL |
#| business line of credit |         25 | ACTIVE |          0.00 |
#| business line of credit |         27 | ACTIVE |       9345.55 |
#| certificate of deposit  |          3 | ACTIVE |       3000.00 |
#| certificate of deposit  |         15 | ACTIVE |      10000.00 |
#| certificate of deposit  |         17 | ACTIVE |       5000.00 |
#| certificate of deposit  |         23 | ACTIVE |       1500.00 |
#| checking account        |          1 | ACTIVE |       1057.75 |
#| checking account        |          4 | ACTIVE |       2258.02 |
#| checking account        |          7 | ACTIVE |       1057.75 |
#| checking account        |         10 | ACTIVE |        534.12 |
#| checking account        |         13 | ACTIVE |       2237.97 |
#| checking account        |         14 | ACTIVE |        122.37 |
#| checking account        |         18 | ACTIVE |       3487.19 |
#| checking account        |         21 | ACTIVE |        125.67 |
#| checking account        |         24 | ACTIVE |      23575.12 |
#| checking account        |         28 | ACTIVE |      38552.05 |
#| money market account    |          8 | ACTIVE |       2212.50 |
#| money market account    |         12 | ACTIVE |       5487.09 |
#| money market account    |         22 | ACTIVE |       9345.55 |
#| home mortgage           |       NULL | NULL   |          NULL |
#| savings account         |          2 | ACTIVE |        500.00 |
#| savings account         |          5 | ACTIVE |        200.00 |
#| savings account         |         11 | ACTIVE |        767.77 |
#| savings account         |         19 | ACTIVE |        387.99 |
#| small business loan     |         29 | ACTIVE |      50000.00 |
#+-------------------------+------------+--------+---------------+
#26 rows in set (0.00 sec)


#Exercise 10-2
#Reformulate your query from Exercise 10-1 to use the other outer join type (e.g., if you
#used a left outer join in Exercise 10-1, use a right outer join this time) such that the
#results are identical to Exercise 10-1.

SELECT p.name, a.account_id, a.status, a.avail_balance FROM account a RIGHT OUTER JOIN product p ON a.product_cd = p.product_cd;

#+-------------------------+------------+--------+---------------+
#| name                    | account_id | status | avail_balance |
#+-------------------------+------------+--------+---------------+
#| auto loan               |       NULL | NULL   |          NULL |
#| business line of credit |         25 | ACTIVE |          0.00 |
#| business line of credit |         27 | ACTIVE |       9345.55 |
#| certificate of deposit  |          3 | ACTIVE |       3000.00 |
#| certificate of deposit  |         15 | ACTIVE |      10000.00 |
#| certificate of deposit  |         17 | ACTIVE |       5000.00 |
#| certificate of deposit  |         23 | ACTIVE |       1500.00 |
#| checking account        |          1 | ACTIVE |       1057.75 |
#| checking account        |          4 | ACTIVE |       2258.02 |
#| checking account        |          7 | ACTIVE |       1057.75 |
#| checking account        |         10 | ACTIVE |        534.12 |
#| checking account        |         13 | ACTIVE |       2237.97 |
#| checking account        |         14 | ACTIVE |        122.37 |
#| checking account        |         18 | ACTIVE |       3487.19 |
#| checking account        |         21 | ACTIVE |        125.67 |
#| checking account        |         24 | ACTIVE |      23575.12 |
#| checking account        |         28 | ACTIVE |      38552.05 |
#| money market account    |          8 | ACTIVE |       2212.50 |
#| money market account    |         12 | ACTIVE |       5487.09 |
#| money market account    |         22 | ACTIVE |       9345.55 |
#| home mortgage           |       NULL | NULL   |          NULL |
#| savings account         |          2 | ACTIVE |        500.00 |
#| savings account         |          5 | ACTIVE |        200.00 |
#| savings account         |         11 | ACTIVE |        767.77 |
#| savings account         |         19 | ACTIVE |        387.99 |
#| small business loan     |         29 | ACTIVE |      50000.00 |
#+-------------------------+------------+--------+---------------+
#26 rows in set (0.00 sec)                                        


#Exercise 10-3
#Outer-join the account table to both the individual and business tables (via the
#account.cust_id column) such that the result set contains one row per account. Columns
#to include are account.account_id, account.product_cd, individual.fname,
#individual.lname, and business.name

SELECT a.account_id, a.product_cd, i.fname, i.lname, b.name 
FROM account a LEFT OUTER JOIN individual i ON a.cust_id = i.cust_id 
LEFT OUTER JOIN business b ON a.cust_id = b.cust_id;

#+------------+------------+----------+---------+------------------------+
#| account_id | product_cd | fname    | lname   | name                   |
#+------------+------------+----------+---------+------------------------+
#|          1 | CHK        | James    | Hadley  | NULL                   |
#|          2 | SAV        | James    | Hadley  | NULL                   |
#|          3 | CD         | James    | Hadley  | NULL                   |
#|          4 | CHK        | Susan    | Tingley | NULL                   |
#|          5 | SAV        | Susan    | Tingley | NULL                   |
#|          7 | CHK        | Frank    | Tucker  | NULL                   |
#|          8 | MM         | Frank    | Tucker  | NULL                   |
#|         10 | CHK        | John     | Hayward | NULL                   |
#|         11 | SAV        | John     | Hayward | NULL                   |
#|         12 | MM         | John     | Hayward | NULL                   |
#|         13 | CHK        | Charles  | Frasier | NULL                   |
#|         14 | CHK        | John     | Spencer | NULL                   |
#|         15 | CD         | John     | Spencer | NULL                   |
#|         17 | CD         | Margaret | Young   | NULL                   |
#|         18 | CHK        | Louis    | Blake   | NULL                   |
#|         19 | SAV        | Louis    | Blake   | NULL                   |
#|         21 | CHK        | Richard  | Farley  | NULL                   |
#|         22 | MM         | Richard  | Farley  | NULL                   |
#|         23 | CD         | Richard  | Farley  | NULL                   |
#|         24 | CHK        | NULL     | NULL    | Chilton Engineering    |
#|         25 | BUS        | NULL     | NULL    | Chilton Engineering    |
#|         27 | BUS        | NULL     | NULL    | Northeast Cooling Inc. |
#|         28 | CHK        | NULL     | NULL    | Superior Auto Body     |
#|         29 | SBL        | NULL     | NULL    | AAA Insurance Inc.     |
#+------------+------------+----------+---------+------------------------+
#24 rows in set (0.00 sec)

#Exercise 10-4 (Extra Credit)
#Devise a query that will generate the set {1, 2, 3,..., 99, 100}. (Hint: use a cross join
#with at least two from clause subqueries.)

SELECT ones.num + tens.num FROM  
(SELECT 1 num UNION ALL 
	SELECT 2 num UNION ALL 
	SELECT 3 num UNION ALL 
	SELECT 4 num UNION ALL 
	SELECT 5 num UNION ALL 
	SELECT 6 num UNION ALL 
	SELECT 7 num UNION ALL 
	SELECT 8 num UNION ALL 
	SELECT 9 num UNION ALL 
	SELECT 10 num) ones 
CROSS JOIN 
(SELECT 0 num UNION ALL 
	SELECT 10 num UNION ALL 
	SELECT 20 num UNION ALL 
	SELECT 30 num UNION ALL 
	SELECT 40 num UNION ALL 
	SELECT 50 num UNION ALL 
	SELECT 60 num UNION ALL 
	SELECT 70 num UNION ALL 
	SELECT 80 num UNION ALL 
	SELECT 90 num) tens;

#+---------------------+   
#| ones.num + tens.num |   
#+---------------------+   
#|                  10 |   
#                   9 |   
#|                   8 |   
#|                   7 |   
#|                   6 |   
#|                   5 |   
#|                   4 |   
#|                   3 |   
#|                   2 |   
#|                   1 |   
#|                  20 |   
#|                  19 |   
#|                  18 |   
#|                  17 |   
#|                  16 |   
#|                  15 |   
#|                  14 |   
#|                  13 |   
#|                  12 |   
#|                  11 |   
#|                  30 |   
#|                  29 |   
#|                  28 |   
#|                  27 |   
#|                  26 |   
#|                  25 |   
#|                  24 |   
#|                  23 |   
#|                  22 |   
#|                  21 |   
#|                  40 |   
#|                  39 |   
#|                  38 |   
#|                  37 |   
#|                  36 |   
#|                  35 |   
#|                  34 |   
#|                  33 |   
#|                  32 |   
#|                  31 |   
#|                  50 |   
#|                  49 |   
#|                  48 |   
#|                  47 |   
#|                  46 |   
#|                  45 |   
#|                  44 |   
#|                  43 |   
#|                  42 |   
#|                  41 |   
#|                  60 |   
#|                  59 |   
#|                  58 |   
#|                  57 |   
#|                  56 |   
#|                  55 |   
#|                  54 |   
#|                  53 |   
#|                  52 |   
#|                  51 |   
#|                  70 |   
#|                  69 |   
#|                  68 |   
#|                  67 |   
#|                  66 |   
#|                  65 |   
#|                  64 |   
#|                  63 |   
#|                  62 |   
#|                  61 |   
#|                  80 |   
#|                  79 |   
#|                  78 |   
#|                  77 |   
#|                  76 |   
#|                  75 |   
#|                  74 |   
#|                  73 |   
#|                  72 |   
#|                  71 |   
#|                  90 |   
#|                  89 |   
#|                  88 |   
#|                  87 |   
#|                  86 |   
#|                  85 |   
#|                  84 |   
#|                  83 |   
#|                  82 |   
#|                  81 |   
#|                 100 |   
#|                  99 |   
#|                  98 |   
#|                  97 |   
#|                  96 |   
#|                  95 |   
#|                  94 |   
#|                  93 |   
#|                  92 |   
#|                  91 |   
#+---------------------+   
#100 rows in set (0.00 sec)


#Exercise 11-1
#Rewrite the following query, which uses a simple case expression, so that the same
#results are achieved using a searched case expression. Try to use as few when clauses as
#possible.

SELECT emp_id, 
	CASE 
		WHEN title IN ("Teller", "Head Teller", "Operations Manager") THEN "Operations" 
		WHEN title IN ("President", "Vice President", "Treasurer", "Load Manager") THEN "Manager" 
		ELSE "Unknown" 
	END 
FROM employee;

#+--------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
#|      1 | Manager
#                                                 |
#|      2 | Manager
#                                                 |
#|      3 | Manager
#                                                 |
#|      4 | Operations
#                                                 |
#|      5 | Unknown
#                                                 |
#|      6 | Operations
#                                                 |
#|      7 | Operations
#                                                 |
#|      8 | Operations
#                                                 |
#|      9 | Operations
#                                                 |
#|     10 | Operations
#                                                 |
#|     11 | Operations
#                                                 |
#|     12 | Operations
#                                                 |
#|     13 | Operations
#                                                 |
#|     14 | Operations
#                                                 |
#|     15 | Operations
#                                                 |
#|     16 | Operations
#                                                 |
#|     17 | Operations
#                                                 |
#|     18 | Operations
#                                                 |
#+--------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
#18 rows in set (0.00 sec)

#Exercise 11-2
#Rewrite the following query so that the result set contains a single row with four columns
#(one for each branch). Name the four columns branch_1 through branch_4.

#mysql> SELECT open_branch_id, COUNT(*)
#-> FROM account
#-> GROUP BY open_branch_id;
#+----------------+----------+
#| open_branch_id | COUNT(*) |
#+----------------+----------+
#| 1 | 8 |
#| 2 | 7 |
#| 3 | 3 |
#| 4 | 6 |
#+----------------+----------+
#4 rows in set (0.00 sec)


SELECT
	SUM(CASE WHEN open_branch_id = 1 THEN 1 ELSE 0 END) branch_1,
	SUM(CASE WHEN open_branch_id = 2 THEN 1 ELSE 0 END) branch_2,
	SUM(CASE WHEN open_branch_id = 3 THEN 1 ELSE 0 END) branch_3,
	SUM(CASE WHEN open_branch_id = 4 THEN 1 ELSE 0 END) branch_4
FROM account;
#+----------+----------+----------+----------+
#| branch_1 | branch_2 | branch_3 | branch_4 |
#+----------+----------+----------+----------+
#| 8       | 7        | 3        | 6        |
#+----------+----------+----------+----------+