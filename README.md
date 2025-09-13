# SQL-Developer-Internship
Designed a relational database schema for a library schema and applied normalization 3nf.


Designed a database for a Library System that supports:
Managing books and authors
Tracking members (borrowers)
Handling book loans
Tracking due dates, returns, and fines

🔶 Step 1: Identify Key Entities
We identify the following entities:
Book
Author
Member (library users)
Loan (book borrowing records)
Copy (physical copies of books)
Staff (who issue/return books)
Publisher (optional but realistic)

🔷 Step 2: Define Attributes for Each Entity

✅ Step 3: Apply Normalization (1NF → 3NF)

<img width="507" height="577" alt="image" src="https://github.com/user-attachments/assets/304fb2dc-3c30-4d83-9c17-2f5321817161" />

Interview Questions

**What is database normalization?**
Database normalization is the process of organizing the fields and tables of a database to minimize redundancy and dependency. The main goal is to divide large tables into smaller, manageable ones and define relationships between them to improve data integrity and reduce anomalies.
Normalization involves applying a series of rules called Normal Forms (NF) to the database schema. The most common forms are:

1NF (First Normal Form)

2NF (Second Normal Form)

3NF (Third Normal Form)

Each higher normal form eliminates a specific type of redundancy or dependency.
**Explain the difference between primary and foriegn keys.**
A primary key is a unique identifier for each record in a database table.
It ensures that each record can be uniquely identified.
A table can only have one primary key, and it cannot contain NULL values.
Example: UserID in a Users table.

A foreign key is a field in one table that uniquely identifies a row of another table.
It is used to establish a relationship between two tables.
Foreign keys may have duplicate values and can also accept NULL values.
Example: AuthorID in a Books table referencing AuthorID in an Authors table.
**What are the anomalies that normalization helps to prevent?**
Normalization helps to prevent three major anomalies that can arise in an unnormalized database:
**Insert Anomaly:**
Occurs when new records cannot be added without including unnecessary data. For example, trying to add a new book to a system before the author exists.
**Update Anomaly:**
Occurs when an update to one record requires changes to multiple rows. For example, if an author's information is stored in multiple places, updating their phone number in one row and forgetting others would create inconsistencies.
**Delete Anomaly:**
Occurs when deleting data causes unintended loss of other important data. For example, deleting a book from a library system might also inadvertently delete information about an author, even though the author might still have other books in the system.
Normalization reduces these anomalies by ensuring each piece of data is stored in only one place.
**What is the purpose of the ER diagram?**
An **Entity-Relationship Diagram (ERD)** visually represents the entities (tables) in a database, along with their attributes and the relationships between them. The purpose of an ERD is to:
Visualize the database structure: It helps in understanding how different entities in the system are related.
Design the database schema: It aids in the database design phase by identifying key relationships and constraints.
Communication: It’s an excellent tool for explaining and documenting the database design to non-technical stakeholders or team members.
Identify potential problems: It helps identify redundant relationships or possible design flaws early on.
**What are three normal forms?**
The three common normal forms in database design are:
**First Normal Form (1NF):**
Ensures atomicity — each column contains only atomic (indivisible) values.
Each row is unique, and there are no repeating groups of columns (e.g., no multiple phone numbers in a single column).
**Second Normal Form (2NF):**
Achieved by ensuring that the table is in 1NF and that all non-key attributes are fully dependent on the primary key.
It eliminates partial dependencies, where a non-key column is dependent on only part of a composite primary key.
**Third Normal Form (3NF):**
Achieved by ensuring the table is in 2NF and that no transitive dependencies exist (i.e., non-key attributes should depend only on the primary key).
For example, a table should not store information that can be derived from other attributes.
**What is the importance of using foreign keys.**
**Data Integrity:**
Foreign keys ensure that data between related tables remains consistent. For example, if you try to insert a record with a foreign key that does not exist in the referenced table, the database will reject the operation.
**Enforce Referential Integrity:**
A foreign key constraint ensures that relationships between tables are valid. For instance, an order in a Sales table must correspond to a valid customer in the Customers table.
**Cascade Actions**:
Foreign keys can also trigger cascading actions (like ON DELETE CASCADE) that automatically delete or update related rows, which helps to maintain data consistency.
**What is surrogate key v/s natural key?**
In SQL, a many-to-many relationship is typically implemented using a junction (or linking) table.
Example: Many-to-Many Relationship Between Books and Authors
Books and Authors tables have a many-to-many relationship because a book can have multiple authors, and an author can write multiple books.
**Junction Table:**
Create a third table (e.g., BookAuthor) that stores the BookID and AuthorID, where both are foreign keys pointing to their respective tables.
**Why should redundant data be avoided?**
Surrogate Key:
A surrogate key is a system-generated unique identifier, often an auto-incrementing integer, that has no business meaning.
Example: UserID (auto-incremented integer) in a Users table.
Natural Key:
A natural key is a real-world attribute or set of attributes that uniquely identifies a record and already has business meaning
Example: Email in a Users table (since email is unique to each person).
**How do you represent relationships in ER diagram.**
In an ER diagram, relationships between entities are represented by lines that connect the relevant entities (tables). The type of relationship is usually indicated by cardinality:
One-to-One (1:1):
A line connects two entities with a 1 on each side.
Example: One User can have one Passport.
One-to-Many (1:N):
A line with a 1 on one side and a N (or ∞) on the other side.
Example: One Customer can have many Orders.
Many-to-Many (M:N):
A line connecting two entities with N on both sides, often with a junction table.
Example: A Student can be enrolled in many Courses, and a Course can have many Students.

///
