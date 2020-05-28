## Use Ruby on Rails, Haml.

## Build a form that contains the following fields:
```
o   Name
o   Email
o   Company
o   Message
```
Upon submission, make sure to sanitize & validate the fields submitted. The email should not exist in the database and please use the services method for retrieve/create. 

Design a database table to store the above information and insert the record, together with date and time submitted. Draw out the database structure and indicate field type of each field.

Based on the database table you have created, and the Member table provided below, without modifying the Member table, write an SQL to pull out the latest 10 records from your database that fulfill the following conditions:
o   Are submitted by a member
o   Are submitted from start of the year till date
o   With email address that ends with gmail.com
```
Member
memberID email
1 xxyyzz@gmail.com
2 aabbcc@ezy.com.au
3 wwyyaa@ntu.edu.sg
4 uuttcc@gmail.com
5 funnymeh@yahoo.com.sg
6 pinkpikachu@buzz.sg
7 englishtea@gmail.com
````
