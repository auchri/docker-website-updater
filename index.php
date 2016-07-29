<?php

$password = getenv('PASSWORD');

if($password !== false && $_GET['password'] != $password) {
  header('HTTP/1.0 403 Forbidden', true, 403);
  exit();
}

include '../config/config.php';
