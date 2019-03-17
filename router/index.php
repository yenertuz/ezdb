<?php

$target_rel = $_POST["target"];
$args = $_POST["data"];
$target_root = "/Users/yenertuz/Desktop/ruby_test/scripts";
$target_path = $target_root . "/" . $target_rel;

$arg_rel = mt_rand(0,1000) . "";
$arg_root = "/Users/yenertuz/Desktop/ruby_test/args";
$arg_path = $arg_root . "/" . $arg_rel;
while (file_exists($arg_path) == true) {
	$arg_path = $arg_root . "/" . mt_rand(0, 1000);
}

file_put_contents($arg_path, json_encode($args));
$result = shell_exec($target_path." ".$arg_path);
echo $result;

?>
