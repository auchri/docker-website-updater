<?php

function isCorrectPassword() {
    $password = getenv('PASSWORD');

    if($password === false || empty($password)) {
        return true;
    }

    if(!isset($_GET['password']) || $_GET['password'] != $password) {
        return false;
    }

    return true;
}

function isHeaderSet() {
    if(!isset($_SERVER['HTTP_X_GITLAB_EVENT'])) {
        return false;
    }

    if($_SERVER['HTTP_X_GITLAB_EVENT'] != 'Push Hook') {
        return false;
    }

    return true;
}

if(!isHeaderSet() || !isCorrectPassword()) {
    header('HTTP/1.0 403 Forbidden', true, 403);
    exit();
}

file_put_contents('log.txt', print_r($_SERVER, true), FILE_APPEND);

include '../config/config.php';
