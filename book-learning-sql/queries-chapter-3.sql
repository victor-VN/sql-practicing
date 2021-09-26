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