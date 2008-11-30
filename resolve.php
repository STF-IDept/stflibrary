<?php

define('SCRIPT_DIR', dirname(__FILE__));
define('SRC_DIR', SCRIPT_DIR . '/src');
define('STYLESHEET_DIR', SCRIPT_DIR . '/xsl');
define('DOCBOOK_STYLESHEET_DIR', STYLESHEET_DIR . '/docbook');


function process($book = NULL) {

  if (!empty($book)) {
    // Load the XML source
    $xml = new DOMDocument;
    $xml->load(SRC_DIR . "/{$book}/book.xml");

    // Interpolate all XInclude directives.
    $xml->xinclude();

    // Save it back out.
    $xml->save(SCRIPT_DIR ."/resolved/{$book}.xml");
  }
  else {
    // Load the XML source
    $xml = new DOMDocument;
    $xml->load(SRC_DIR . '/set.xml');

    // Interpolate all XInclude directives.
    $xml->xinclude();

    // Save it back out.
    $xml->save(SCRIPT_DIR .'/resolved/set.xml');
  }

}

$book = NULL;
if (!empty($argv[1])) {
  $book = $argv[1];
}

process($book);

//print number_format(memory_get_peak_usage()) . PHP_EOL;
