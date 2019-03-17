<?php

header("Access-Control-Allow-Origin: *");

$target_rel = $_POST["target"];
$args = $_POST["data"];
$target_root = "/var/www/ezdb/scripts";
$target_path = $target_root . "/" . $target_rel;

$arg_rel = mt_rand(0,1000) . "";
$arg_root = "/var/www/ezdb/args";
$arg_path = $arg_root . "/" . $arg_rel;
while (file_exists($arg_path) == true) {
	$arg_path = $arg_root . "/" . mt_rand(0, 1000);
}

file_put_contents($arg_path, json_encode($args));
$shell_command = "ruby " . $target_path." ".$arg_path;
$result = shell_exec($shell_command);
echo $result;

?>
