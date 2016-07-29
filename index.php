<?php

if(!isHeaderSet() || !isCorrectPassword()) {
    header('HTTP/1.0 403 Forbidden', true, 403);
    exit();
}

include '../config/config.php';

if(!isset($websites) || !is_array($websites)) {
    exit();
}

$data = json_decode(file_get_contents("php://input"));
$project = $data->project;

foreach($websites as $website) {
    if(!isset($website['path']) || !isset($website['directory'])) {
        continue;
    }

    $path = $website['path'];
    $directory = $website['directory'];
    $branch = isset($website['branch']) ? $website['branch'] : 'master';

    if($project->path_with_namespace != $path || $data->ref != 'refs/heads/' . $branch) {
        continue;
    }

    updateWebSite($project->git_ssh_url, $branch, $directory);
    break;
}

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

function updateWebSite($sshUrl, $branch, $directory) {
    mkdir($directory, 0777, true);

    writeLog('git clone -b ' . $branch . ' ' . $sshUrl . ' ' . $directory);
    exec('git clone -b ' . $branch . ' ' . $sshUrl . ' ' . $directory);
}

function writeLog($data) {
    file_put_contents('log.txt', $data . "\n", FILE_APPEND);
}