<?php

$password = getenv('PASSWORD');

if($password !== false && !empty($password) && (!isset($_GET['password']) || $_GET['password'] != $password)) {
  header('HTTP/1.0 403 Forbidden', true, 403);
  exit();
}

include '../config/config.php';
