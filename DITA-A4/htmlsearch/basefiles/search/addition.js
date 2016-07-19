/*----------------------------------------------------------------------------
 * NexWave javascript for NSI search
 *----------------------------------------------------------------------------
  This file is part of the htmlsearch plugin for the DITA-OT
  adapted for NSI documentation.
  Copyright (c) 2007-2008 NexWave Solutions All Rights Reserved. 
   www.nexwave.biz Nadege Quaine
*/
var w = new Object();

var mzBrowser;
var IEBrowser;

if (navigator.appName.indexOf("Netscape") >= 0) {
    mzBrowser = true;
    IEBrowser = false;

}else if (navigator.appName.indexOf("Internet Explorer") >=0) {
    mzBrowser = false;
    IEBrowser = true;
}else {
    alert("browser not supported")
}

