<?php

set_include_path(get_include_path() . PATH_SEPARATOR . '/usr/share/xml/docbook/stylesheet/nwalsh');

// Load the XML source
$xml = new DOMDocument;
$xml->load('src/set.xml');

//print_r($xml->saveXML());
$xml->xinclude();

//print_r($xml->saveXML());


$xsl = new DOMDocument;
//$xsl->load('xsl/html-set.xsl');
//$xsl->load('/usr/share/xml/docbook/stylesheet/nwalsh/html/docbook.xsl');
$xsl->load('http://docbook.sourceforge.net/release/xsl/current/html/docbook.xsl');
//print_r($xsl->saveXML());

// Configure the transformer
$proc = new XSLTProcessor;
$proc->importStyleSheet($xsl); // attach the xsl rules


//file_put_contents('test.html', $proc->transformToXml($xml));



$book = $xml->getElementById('tm');

print_r($book);

print_r(gettype($book));

file_put_contents('test-book.html', $proc->transformToXml($book));


//new ReflectionClass($book);



