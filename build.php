<?php

//set_include_path(get_include_path() . PATH_SEPARATOR . '/usr/share/xml/docbook/stylesheet/nwalsh');

define('SCRIPT_DIR', dirname(__FILE__));
define('SRC_DIR', SCRIPT_DIR . '/src');
define('STYLESHEET_DIR', SCRIPT_DIR . '/xsl');
define('DOCBOOK_STYLESHEET_DIR', STYLESHEET_DIR . '/docbook');

function process() {

  // Load the XML source
  $xml = new DOMDocument;
  $xml->load(SRC_DIR . '/set.xml');
  
  // Interpolate all XInclude directives.
  $xml->xinclude();
  
  // Load the XSLT stylesheet.
  $xsl = new DOMDocument;
  $xsl->load(DOCBOOK_STYLESHEET_DIR . '/html/docbook.xsl');
  
  // Configure the transformer
  $proc = new XSLTProcessor;
  if (!$proc->hasExsltSupport()) {
    throw new Exception('EXSLT Support not available.');
  }
  $proc->importStyleSheet($xsl); // attach the xsl rules
  
  
  //file_put_contents('test.html', $proc->transformToXml($xml));
  
  
  
  $book = $xml->getElementById('tm');
  
  var_dump($book);
  
  var_dump(gettype($book));
  
  file_put_contents('test-book.html', $proc->transformToXml($book));
  

}


process();

print number_format(memory_get_peak_usage()) . PHP_EOL;


