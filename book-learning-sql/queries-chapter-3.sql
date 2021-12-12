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