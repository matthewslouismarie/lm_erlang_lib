<?php

$text = file_get_contents('hamlet.txt');
if (false === $text) {
    throw new exception();
}
var_dump(mb_detect_encoding($text, mb_detect_order(), true));