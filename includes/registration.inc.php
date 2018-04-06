<h1>Registration</h1>
<?php
if (isset($_POST['frmRegistration'])){
    
    //syntaxe classique
    /*if (isset($_POST['nom'])) {
        $nom = $_POST['nom'];
    }

    else {
        $nom = "";
    }*/

    //operateur ternaire
    //$nom = isset($_POST['nom']) ? $_POST['nom'] : ""; 

    //operateur null coalescent php 7
    $nom= $_POST['nom'] ?? "";

    //tableau
    $prenom = $_POST['prenom'] ?? "";
    $mail = $_POST['mail'] ?? "";
    $mdp = $_POST['mdp'] ?? "";

    //erreur si rien n'est remplie
    $erreurs = array();
    if ($nom == "") array_push($erreurs, "Veuillez saisir votre nom");
    if ($prenom == "") array_push($erreurs, "Veuillez saisir votre prenom");
    if ($mail == "") array_push($erreurs, "Veuillez saisir votre mail");
    if ($mdp == "") array_push($erreurs, "Veuillez saisir votre mot de passe");

    /* autre methode 
    if (count($erreurs) > 0) {
        $message = "<ul>;

        foreach($erreurs as $ligneMessage) {
            $message .= "<li>";
            $message .= $ligneMessage;
            $message .= "</li>;
        }
        $message .= "</ul>";
        echo $message;
        include "frmRegistration.php";
    }
    */
     

    //afficher les erreurs
    if(count($erreurs) > 0){
        
        $message = "<ul>";
        //-----------
        for ($i = 0 ; $i < count($erreurs) ; $i++) {
        $message .= "<li>";
        $message .= $erreurs[$i];
        $message .= "</li>";
        }

        $message .= "</ul>"; 
        echo $message;
        include "frmRegistration.php";
    }
    
    else {

        $mdp = sha1($mdp);

        $token = uniqid(sha1(date('Y-m-d|H:m:s')), false);

        //adresse serveur / nom utilisateur / mdp / nom basse de donne
        $connection = mysqli_connect("localhost", "christopher", "talen", "phpdieppe");
        $requete = "INSERT INTO T_USERS
                    (USENAME, USEFIRSTNAME, USEMAIL, USEPASSWORD, ID_ROLE, USETOKEN)
                    VALUES ('$nom', '$prenom', '$mail', '$mdp', 3, '$token')";



        if (!$connection) {
            die("erreur MySQL" . mysqli_connect_errno() . " | " . mysqli_connect_error());
        }

        else{
            if(mysqli_query($connection, $requete)) {
                echo "donnée enregistrees";
                $id = mysqli_insert_id($connection);


                $messageMail = "<h1>wunderbar !!!</h1>";
                $messageMail .= "<p>vous etes inscrit !</p>";
                $messageMail .= "<p>mais vous devez valider votre inscription</p>";
                //envoie sur serveur
                $messageMail .= "<p><a href='http://localhost/php/index.php?page=mailValidation&amp;id=$id&amp;token=$token'>";
                $messageMail .= "clicque moi grand fou";
                $messageMail .= "</a></p>";
                
                

                $headers = "From: manu@elysees.fr" . "\r\n" .
                            "Reply-to: edouard@matignon.com" . "\r\n" .
                            "X-Mailer: PHP/" . phpversion();

                mail($mail, 'inscription compte', $messageMail, $headers);




            }
                else {
                    echo "erreur";
                    include "frmRegistration.php";
                }
                mysqli_close($connection);
        
        }
    }
}

else {
    echo "je ne viens pas du formulaire";
    include "frmRegistration.php";
}
