<?php
    include "./functions/callPage.php";
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="./assets/css/style.css" type="text/css" rel="stylesheet" />
    <title>Site Dieppe</title>
</head>
<body>
    <div id="container">
    <?php include "./includes/header.php"; ?>
    <main>
<?php 
callPage();
?>
    </main>

    <?php include "./includes/footer.php"; ?> 
    </div>
</body>
</html>


