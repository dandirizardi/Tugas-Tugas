<?php 
session_start();

unset($_SESSION['MEMBER']);
header('Location:/WebNativ/index.php?hal=Admin/login_form');


?>