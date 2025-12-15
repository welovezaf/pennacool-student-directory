# Pennacool Software & Systems Intern – Take-Home Exercise

Thank you for applying to the Pennacool.com Caribbean Limited Internship Programme.

This exercise is designed to see how you approach a **very simple LAMP (Linux, Apache, MySQL, PHP) web app** using **Docker**. It is intentionally small – we are not testing advanced frameworks or deep Docker/Docker Compose expertise.

You have **1 week** to complete this exercise and prepare to demo it to us.

---

## 1. Goal of the Exercise

Use the provided Docker configuration to run a small **PHP + MySQL** application and build a simple **Student Directory** with:

1. A list of students loaded from the database  
2. A basic search/filter  
3. (Bonus) A form to add new students  

We are interested in how you:

- Read and follow instructions  
- Organise your code  
- Connect a PHP app to a MySQL database  
- Handle simple UI and interactions  

---

## 2. What We Provide

In this folder you will find:

- `docker-compose.yml` – defines the `web` (PHP/Apache) and `db` (MySQL) services  
- `Dockerfile` – builds the PHP/Apache image used by the `web` service  
- `db/init_students.sql` – creates a `students` table and inserts sample data  
- `app/` – an empty directory that will be served as the web root

You will write your code inside the `app/` directory.

---

## 3. Prerequisites

You will need:

- **Docker** and **Docker Compose** installed on your machine  
- A text editor or IDE (VS Code, PHPStorm, etc.)  
- Basic familiarity with PHP and SQL

Helpful intros (optional):

- Intro to WSL: https://www.youtube.com/watch?v=5RQbdMn04Oc  
- Intro to Docker basics: https://www.youtube.com/watch?v=r6J0RqhxpA8

You do **not** need to:

- Modify the Dockerfile  
- Use any frameworks (Laravel, Symfony, etc.)  
- Use JavaScript frameworks (React, Vue, etc.)  

Plain PHP + HTML is fine.

---

## 4. How to Run the Environment

From the root of this project (where `docker-compose.yml` is located), run:

```bash
docker-compose up --build
```

The first run may take a few minutes while images are built and downloaded.

Once everything is running:

* Open your browser at: **http://localhost:8080**

The `web` container serves files from the `app/` folder:

* `app/index.php` → http://localhost:8080/index.php
* `app/styles.css` → http://localhost:8080/styles.css

The `db` container automatically:

* Creates a database (e.g. `studentsdb`)
* Runs `db/init_students.sql` to create and populate the `students` table

> If you run into issues starting the containers, make a note of the error and mention it in your README or presentation.

To stop the containers:

```bash
docker-compose down
```

---

## 5. Your Task

### 5.1 Required Features

1. **Display Student List**

   * Create an `index.php` file in the `app/` directory.
   * Connect to the MySQL database using the credentials from `docker-compose.yml`.
   * Query the `students` table and display the results in an HTML table.
   * Show at least:

     * ID
     * First Name
     * Last Name
     * Class
     * Email

2. **Search / Filter**

   Add a simple way to filter the list of students:

   * A text input to search **by last name** or **by class** (you may choose one, or do both).
   * When the user submits the search, show only matching rows.
   * Simple `LIKE` searches are fine (e.g. `%searchtext%`).

You may implement the search using either:

* `GET` parameters (e.g. `index.php?search=...`) or
* A `POST` form that reloads the page

Both approaches are acceptable.

---

### 5.2 Bonus (Optional, Not Required)

These are **nice to have**, but not required to pass:

1. **Add New Student Form**

   * Create a form (on the same page or separate page) to add a new student.
   * Validate that required fields are not empty.
   * On successful submission, insert into the `students` table and show the updated list.

2. **Basic Styling**

   * Add a simple CSS file or include Bootstrap.
   * Improve readability (spacing, table styling, labels, etc.).

3. **Basic Security / Good Practices**

   * Use prepared statements for database queries.
   * Escape output where appropriate (e.g. `htmlspecialchars()`).

Do not worry if you cannot do all the bonus parts. Focus on getting the **required** parts working first.

---

## 6. Database Connection Details

From `docker-compose.yml` (do not change these unless absolutely necessary):

* **Host:** `db`
* **Database:** `studentsdb`
* **User:** `studentuser`
* **Password:** `studentpw`

Example PHP connection using PDO:

```php
<?php
$host = 'db';
$db   = 'studentsdb';
$user = 'studentuser';
$pass = 'studentpw';
$dsn = "mysql:host=$host;dbname=$db;charset=utf8mb4";

try {
    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    ]);
} catch (PDOException $e) {
    die('Database connection failed: ' . $e->getMessage());
}
```

You may use `mysqli` instead of PDO if you prefer.

---

## 7. What to Submit

Within **1 week**, please send us EITHER:

* A **GitHub repository link**, or
* A **.zip file** of the project

Your submission should include:

* The `app/` directory with your PHP/CSS files
* The root files (`docker-compose.yml`, `Dockerfile`, `db/init_students.sql`)
* A short `NOTES.txt` or an update to this `README.md` describing:

  * How to run the app (commands you use)
  * Any changes you made to `docker-compose.yml`
  * Anything you were not able to complete
  * Anything you would improve with more time

---

## 8. Interview Demo

In the second-round interview (10–15 minutes), you will be asked to:

1. Run `docker-compose up` and show the app working in your browser.
2. Walk us through your code:

   * How you connect to the database
   * How you fetch and display the students
   * How your search or filter works
3. Briefly explain:

   * Any challenges you faced
   * What you would do next if you had more time

We are not expecting perfection. We are looking at your **approach, clarity, and willingness to learn**.

Good luck, and thank you for your time!
