/* Write your PL/SQL query statement below */
SELECT u.name, t.balance
FROM Users u, (SELECT account, sum(amount) balance
                FROM Transactions
                GROUP BY account
                HAVING sum(amount) > 10000) t
WHERE u.account = t.account;