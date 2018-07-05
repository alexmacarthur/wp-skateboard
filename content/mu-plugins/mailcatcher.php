<?php

if ( ! defined( 'ABSPATH' ) ) die( header( 'HTTP/1.0 403 Forbidden' ) );

add_action( 'phpmailer_init', function( $phpmailer ) {
    $phpmailer->Host = 'mailcatcher';
    $phpmailer->Port = 1025;
    $phpmailer->SMTPAuth = false;
    $phpmailer->isSMTP();
});