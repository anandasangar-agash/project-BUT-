<!-- Formulaire permettant d'ajouter un nouveau prestataire  -->

<?php
require 'view_begin.php';
require 'view_header.php';
?>
    <div class="add-container">
        <div class="form-abs">
            <h1>Ajout Prestataire</h1>
            <form action="?controller=<?=$_GET['controller']?>&action=<?='ajout_prestataire'?>" method="post">
                <h2>Informations personnelles</h2>
                <div class="form-names">
                    <input type="text" placeholder="Prénom" name="prenom" class="input-case">
                    <input type="text" placeholder="Nom" name="nom" class="input-case">
                </div>
                <input type="email" placeholder="Adresse email" name="email-prestataire" id='mail-1' class="input-case">
                <h2>Informations professionnelles</h2>
                <?php if (!isset($_GET['id'])): ?>
                    <input type="text" placeholder="Société" name="client" id='sté' class="input-case">
                <?php else: ?>
                    <input type="text" placeholder="Nom mission" name="mission" id='sté' class="input-case">
                <?php endif; ?>
                <div class="buttons" id="create">
                    <button type="submit">Créer</button>
                </div>
            </form>
        </div>
    </div>
<?php
require 'view_end.php';
?>
