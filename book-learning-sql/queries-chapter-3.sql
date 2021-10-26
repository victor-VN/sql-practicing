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