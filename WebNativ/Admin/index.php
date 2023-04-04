<?php 
//memanggil dan memproses file bagian atas
include_once 'top.php';
//memanggil dan memproses file bagian menu
require_once 'menu.php';


?>

<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <?php 
                        $url = $_GET['url'];
                        if($url == 'dashboard'){
                            include_once 'dashboard.php';
                        } else if  (!empty($url)){
                            include_once ''.$url.'.php';
                        } else { 'dashboard.php';
                            
                        }
                        ?>
                    </div>
                </main>
</div>


<?php 
//memanggil file bagian bawah
include_once 'bottom.php';

?>