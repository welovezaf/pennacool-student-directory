<?php
$host = 'db';
$db   = 'studentsdb';
$user = 'studentuser';
$pass = 'studentpw';

try {
    $pdo = new PDO(
        "mysql:host=$host;dbname=$db;charset=utf8mb4",
        $user,
        $pass,
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
} catch (PDOException $e) {
    die("Database connection failed");
}

$search = $_GET['search'] ?? '';

if ($search !== '') {
    $stmt = $pdo->prepare(
        "SELECT * FROM students WHERE last_name LIKE ?"
    );
    $stmt->execute(["%$search%"]);
} else {
    $stmt = $pdo->query("SELECT * FROM students");
}

$students = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
    <title>Student Directory</title>
</head>
<body>

<h2>Student Directory</h2>

<form method="get">
    <input type="text" name="search" placeholder="Search by last name"
           value="<?php echo htmlspecialchars($search); ?>">
    <button type="submit">Search</button>
</form>

<br>

<table border="1" cellpadding="6">
    <tr>
        <th>ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Class</th>
        <th>Email</th>
    </tr>

    <?php foreach ($students as $s): ?>
        <tr>
            <td><?= htmlspecialchars($s['id']) ?></td>
            <td><?= htmlspecialchars($s['first_name']) ?></td>
            <td><?= htmlspecialchars($s['last_name']) ?></td>
            <td><?= htmlspecialchars($s['class']) ?></td>
            <td><?= htmlspecialchars($s['email']) ?></td>
        </tr>
    <?php endforeach; ?>
</table>

</body>
</html>
