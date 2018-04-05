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
    }
    
    else {
        echo "pas d'erreur";
    }
}

else {
    echo "je ne viens pas du formulaire";
    include "frmRegistration.php";
}
