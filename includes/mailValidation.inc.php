<?php
    if(isset($_GET['id']) && isset($_GET['token'])) {
        $id = $_GET['id'];
        $token = $_GET['token'];

    //connection base de donnes
    $connection = mysqli_connect("localhost", "christopher", "talen", "phpdieppe");
        if (!$connection) {
            die("erreur MySQL" . mysqli_connect_errno() . " | " . mysqli_connect_error());
        }

        else {
            $requeteVerif = "SELECT * FROM T_USERS
                            WHERE ID_USERS=$id
                            AND USETOKEN='$token'";

            die($requeteVerif);
        }

}
    else {

    }
