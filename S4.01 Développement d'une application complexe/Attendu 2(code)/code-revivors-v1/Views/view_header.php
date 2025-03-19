<!-- Vue stockant le header personnalisé pour chaque fonction -->
<header>
    <div class="menu-hamburger" onclick="hamburger()">
        <img src="Content/images/hamburger.png" alt="hamburger" id="menu_img">
    </div>
    <nav class="header-navbar">
        <div class="logo">Perform Vision</div>
        <?php if (isset($menu)): ?>
            <ul class="menu-list">
                <?php foreach ($menu as $m): ?>
                    <li><a href=<?= $m['link'] ?>><?= $m['name'] ?></li></a>
                <?php endforeach; ?>
            </ul>
        <?php endif; ?>
        <ul class="credentials">
            <li>
                <a class='right-elt' href="?controller=gestionnaire&action=infos" id="username">
                    <i class="fa fa-user-circle" aria-hidden="true"></i>
                    <?php if (isset($_SESSION)):
                        echo '&nbsp;' . $_SESSION['nom'];
                    endif; ?>
                    <br>
                    <?php if (isset($_SESSION)):
                        echo '&nbsp;' . $_SESSION['prenom'];
                    endif; ?>
                </a>
            </li>
            <li>
                <a href="?controller=login&action=deconnexion" class='right-elt'>
                    <i class="fa fa-sign-out" aria-hidden="true"></i>
                </a>
            </li>
        </ul>
    </nav>
</header>

<script>
    let menu_hamburger = document.querySelector('.menu-hamburger');
    let img = document.getElementById('menu_img');
    let header = document.querySelector('header');

    header.style.left = '-40%';

    function hamburger() {
        if (header.style.left === '0px' || header.style.left === '0' || header.style.left === '0vw') {
            header.style.left = '-40vw';
            img.src = 'Content/images/hamburger.png';
        } else {
            header.style.left = '0';
            img.src = 'Content/images/croix.png';
        }
    }

    // Fonction pour vérifier la taille de l'écran et ajuster le style du header
    function checkScreenSize() {
        if (window.matchMedia("(min-width: 768px)").matches) {
            header.style.left = '0';
            img.src = 'Content/images/hamburger.png'; // Remettre l'image du hamburger
        } else {
            // Laisser la gestion de la position au script hamburger
        }
    }

    // Vérifier la taille de l'écran au chargement de la page
    checkScreenSize();

    // Écouter les changements de taille de la fenêtre
    window.addEventListener('resize', checkScreenSize);
</script>