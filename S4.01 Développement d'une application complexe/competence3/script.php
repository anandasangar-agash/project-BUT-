<?php
// générateur.php

// Génère du contenu dynamique
$pageTitle = "Code Revivors";
$nom = $argv[1];
$link = "https://jupyter.univ-paris13.fr/~12213097/";
$equipe = ["Anandasangar Agash", "Antoine David", "Belmessaoud Imran", "Jedorowicz Tom", "Vilvarajah Vithurzen"];

// Commence à générer la page
ob_start();
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title><?= $pageTitle ?></title>
</head>
<body>
    <h1 style="text-align:center">Bonjour <?= $nom ?></h1>
    <p style="text-align:center"> Nous sommes l'équipe <strong>Code Revivors</strong> et notre mission est de réparer un code qui semble fonctionner mais en réalité cachent beaucoup de problèmes. Nous sommes un peu les médecins de l’informatique ! </br>
    Pour cette SAE, l’équipe <strong>Code Revivors</strong> a pour objectif d’effectuer un audit du projet Perform_Vision. Celui-ci a été développé en PHP par WebMica, pour l’entreprise SAS Perform Vision. </br>
    C'est un site extranet dynamique qui a pour but de moderniser la gestion des bons de livraisons et faciliter l'assistance technique des clients en proposant une plateforme interactive. </br>
    </p>
    <div style="text-align:center">
        <h3>Voici les membres de l'équipe Code Revivors:</h3>
        <ul>
	        <?php foreach($equipe as $membre): ?>
	        <li><?=$membre?></li>
	        <?php endforeach; ?>
        </ul>
        <p><h3>Voici la version final du site audité:</h3> <a href=<?=$link?>>https://jupyter.univ-paris13.fr/~12213097/</a></p>
    </div>
</body>
</html>
<?php
$pageContent = ob_get_clean();

// Sortie du contenu de la page
echo $pageContent;
?>

