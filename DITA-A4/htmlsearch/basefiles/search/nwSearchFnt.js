﻿//string initialization
/* We initialized this strings in navstrigs.js
Edited by Oleg Alekseev o_alekseev@mail.ru
txt_filesfound = "Results";
txt_enter_at_least_1_char = "You must enter at least one character."
txt_browser_not_supported = "Your browser is not supported. Use Internet Explorer or Mozilla."
txt_please_wait = "Please wait. Search in progress..."
txt_search_result = "Search Results for :";
txt_results_for = "Results for:"      
*/
htmlfileList="htmlFileList.js";
htmlfileinfoList="htmlFileInfoList.js";

/* Cette fonction verifie la validite de la recherche entrre par l utilisateur */
function Verifie (ditaSearch_Form) {
    
    // Check browser compatibitily
    if (window.opera || navigator.userAgent.indexOf("Konquerer")>-1) {
        
        alert(txt_browser_not_supported);
        return ;
    }

    
    expressionInput=parent.frames['searchwin'].document.ditaSearch_Form.textToSearch.value

    if (expressionInput.length < 1) {

        // expression invalide (vide)       
        alert(txt_enter_at_least_1_char);
        // reactive la fenetre de search (utile car cadres)
        parent.frames['searchwin'].document.ditaSearch_Form.textToSearch.focus() ;
    }
    else {

        // Effectuer la recherche
        Effectuer_recherche(expressionInput);

        // reactive la fenetre de search (utile car cadres)
       parent.frames['searchwin'].document.ditaSearch_Form.textToSearch.focus() ;
    }
}


/* This function parses the search expression, loads the indices and displays the results*/
function Effectuer_recherche(expressionInput) {
      
      /* Display a waiting message */
      //DisplayWaitingMessage();

      /*data initialisation*/
        searchFor=""       // expression en lowercase et sans les caracteres speciaux
        //w = new Object();  // hashtable, key=word, value = list of the index of the html files
        scriptLetterTab = new scriptfirstchar(); // Array containing the first letter of each word to look for
        var scriptsarray =new Array(); // Array with the name of the scripts to load
        var wordsList = new Array(); // Array with the words to look for
        var cleanwordsList = new Array(); // Array with the words to look for after removing spaces
        var listNumerosDesFicStr = "";
        var ou_recherche = true;
        var linkTab = new Array();
        var et_recherche = false;
        var fileAndWordList = new Array();
        var txt_wordsnotfound = "";

        /*nqu: expressionInput, la recherche est lower cased, plus remplacement des char speciaux*/
        searchFor = expressionInput.toLowerCase().replace(/<\//g,"_st_").replace(/\$_/g,"_di_").replace(/\.|%2C|%3B|%21|%3A|@|\/|\*/g," ").replace(/(%20)+/g," ").replace(/_st_/g,"</").replace(/_di_/g,"%24_")
		
        searchFor = searchFor.replace(/  +/g," ")
        searchFor = searchFor.replace(/ $/,"").replace(/^ /,"")
        wordsList = searchFor.split(" ")
        wordsList.sort();
        
        /* wordsList est la liste des mots de la recherhces separes par des espaces*/
        for (t in wordsList) {
            wordsList[t]=wordsList[t].replace(/(%22)|^-/g,"")
            if (wordsList[t] != "%20") {
                scriptLetterTab.add(wordsList[t].charAt(0));
                cleanwordsList.push(wordsList[t]);
            }
        }
 
        //load the scripts with the indices: the following lines do not work on the server. To be corrected
        /*if (IEBrowser) {
            scriptsarray = loadTheIndexScripts (scriptLetterTab);
        } */


        var tempTab = new Array();
        for (t in cleanwordsList) {
            if (w[cleanwordsList[t].toString()] == undefined) {
                txt_wordsnotfound +=  cleanwordsList[t] + " ";
            }     else {
                tempTab.push(cleanwordsList[t]);
            }
        }
        cleanwordsList = tempTab;
        
     
        if (cleanwordsList.length) {

            // recherche 'et' et 'ou' en une fois
            fileAndWordList = SortResults(cleanwordsList);
            
            cpt = fileAndWordList.length;
            for (i = cpt-1;i>=0;i--) {
                if (fileAndWordList[i] != undefined) {

                    linkTab.push("<p>" + txt_results_for + " " + "<span class=\"searchExpression\">" + fileAndWordList[i][0].motsliste + "</span>" + "</p>");
					
					linkTab.push("<ul class='searchresult'>");
                    for (t in fileAndWordList[i]) {
                        //DEBUG: alert(": "+ fileAndWordList[i][t].filenb+" " +fileAndWordList[i][t].motsliste);
                        //linkTab.push("<li><a href=\"../"+fl[fileAndWordList[i][t].filenb]+"\">"+fl[fileAndWordList[i][t].filenb]+"</a></li>");


                        tempInfo = fil[fileAndWordList[i][t].filenb];
                        pos1 = tempInfo.indexOf("@@@");
                        pos2 = tempInfo.lastIndexOf("@@@");
                        tempPath = tempInfo.substring(0, pos1);
                        tempTitle = tempInfo.substring(pos1+3, pos2);
                        tempShortdesc =  tempInfo.substring(pos2+3, tempInfo.length);
                        
                        linkString = "<li><a href=\"../"+tempPath+"\">"+tempTitle+"</a>";
                        if ((tempShortdesc!="null")) {
                            linkString += "\n<div class=\"shortdesclink\">"+tempShortdesc+"</div>" ;
                        }
                        linkString += "</li>";
                        
                        linkTab.push(linkString);

                    }
					linkTab.push("</ul>");
                }
            }
        }

      /* Display results */
        with (parent.frames['contentwin'].document) {
                writeln("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">\n<html><head>");
                writeln("<meta http-equiv=\"content-type\" content=\"text/html; charset=utf-8\">");
                writeln("<link href=\"css/commonltr.css\" type=\"text/css\" rel=\"stylesheet\">" );
                writeln("<link rel=\"stylesheet\" type=\"text/css\" href=\"../css/search.css\">") ;
                writeln("<title>"+txt_filesfound+"</title></head>");
                writeln("<body onload = \"self.focus()\">");
                //writeln("<h2>" + txt_search_result + " " + "<i>" + wordsList + "</i>" + "</h2>");
                
                // If no results, display a message
              if ( txt_wordsnotfound != "" ) {writeln("<p>"+ txt_no_results + "<span class=\"searchExpression\">" + txt_wordsnotfound + "</span>" +"</p>")}		
                
                // If results: display them
                if (linkTab.length > 0  ) { 
                
                    /*writeln ("<p>" + txt_results_for + " " + "<span class=\"searchExpression\">"  + cleanwordsList + "</span>" + "<br/>"+"</p>");*/
                    write("<p>");
                    //write("<ul class='searchresult'>");
                    for (t in linkTab) {
                           writeln(linkTab[t].toString())
                    }
                    writeln("</p>");
                }
                
                writeln ("</body></html>");
                close() ;
 
        }
}


/* scriptfirstchar: to gather the first letter of index js files to upload */
function scriptfirstchar () {
    this.strLetters="";
    this.add = addLettre ;
}

function addLettre (caract) {

        if (this.strLetters == 'undefined') {
            this.strLetters = caract;
        } else if (this.strLetters.indexOf(caract) < 0) {
            this.strLetters += caract;
        }
        
        return 0;
}
/* end of scriptfirstchar */

/*main loader function*/
/*tab contains the first letters of each word looked for*/
function loadTheIndexScripts (tab) {
        
        //alert (tab.strLetters);
        scriptsarray = new Array();
        
        for (i=0; i<tab.strLetters.length; i++) {

            scriptsarray[i]= "..\/search" + "\/" +tab.strLetters.charAt(i)+ ".js";
        }
        // add the list of html files
        i++;
        scriptsarray[i] = "..\/search" + "\/" + htmlfileList;

        //debug 
        for (t in scriptsarray) {
            //alert (scriptsarray[t]);
        }

        tab = new scriptLoader ();
        for (t in scriptsarray) {
          tab.add(scriptsarray[t]);
        }
        tab.load();
        //alert ("scripts loaded");
        return (scriptsarray);
}

/* scriptloader: to load the scripts and wait that it's finished */
function scriptLoader(aScriptList){
    this.cpt = 0;
    this.scriptTab = new Array();
    this.add = addAScriptInTheList ;
    this.load = loadTheScripts ;
    this.onScriptLoaded = onScriptLoadedFunc;
}

function addAScriptInTheList (scriptPath) {
    this.scriptTab.push(scriptPath);
}

function loadTheScripts () {
    var script;
    var head;
     
    head = parent.frames['searchwin'].document.getElementsByTagName('head').item(0);
    
    //script = document.createElement('script');
    
    for (el in this.scriptTab) {
        //alert (el+this.scriptTab[el]);
        script = parent.frames['searchwin'].document.createElement('script');
        script.src = this.scriptTab[el];
        script.type = 'text/javascript';
        script.defer = false;
        
        head.appendChild(script);
    }

}

function onScriptLoadedFunc (e) {
  e = e || window.event;
  var target = e.target || e.srcElement;
  var isComplete = true;
  if (typeof target.readyState != undefined) {

    isComplete = (target.readyState == "complete" || target.readyState == "loaded"); 
  }
  if (isComplete) {
    ScriptLoader.cpt++;
    if (ScriptLoader.cpt == ScriptLoader.scripts.length) {
        ScriptLoader.onLoadComplete();
    }
  }
}

function onLoadComplete () {
    alert("loaded !!");
}

/* End of scriptloader functions */

/* Array functions */
/*function unique (tab){
	for(var y=0;y<tab.length;++y){
		for(var z=(y+1);z<=tab.length;++z){
			if(tab[y]==tab[z]){
				tab.splice(z,1)
			}
		}
	}
    return tab;
} */
// Array.unique( strict ) - Remove duplicate values
function unique ( tab ) {
     var a = new Array();
     var i;
     var l = tab.length;

     if (tab[0] != undefined) {a[0]=tab[0];}
     else {return -1}
     
     for( i=1; i<l; i++ ) {
          if( indexof(a, tab[i], 0 ) < 0 ) { 
              a.push( tab[i] ); 
          }
     }
     return a;
};


function indexof(tab,element,begin) {
    for (i = begin; i<tab.length; i++) {
        if (tab[i] == element) {
            return i;
        }
    }
    return -1;

}
/* end of Array functions */


/*
Param: mots= list of words to look for.
This function creates an hashtable:
- The key is the index of a html file which contains a word to look for.
- The value is the list of all words contained in the html file.

Return value: the hashtable fileAndWordList
*/
function SortResults (mots) {
    
    var fileAndWordList = new Object();
    var fileAndWordList2 = new Object();

    if (mots.length == 0) {
        return null;
    }

    for (t in mots) {
        // get the list of the indices of the files.
        listNumerosDesFicStr = w[mots[t].toString()];
        //alert ("listNumerosDesFicStr "+listNumerosDesFicStr);
        tab = listNumerosDesFicStr.split(",");

        //for each file (file's index): 
        for (t2 in tab) {
            temp = tab[t2].toString();
            if (fileAndWordList[temp] == undefined) {
                
                fileAndWordList[temp] = ""+mots[t];
            } else {
                  
                fileAndWordList[temp] += ","+mots[t];
            }
        }
    }

    fileAndWordListValuesOnly = new Array();
    
     // sort results according to values
    var temptab = new Array();
    for (t in fileAndWordList) {
        tab = fileAndWordList[t].split(',');
        temptab.push(new resultPerFile(t,fileAndWordList[t],tab.length));
        fileAndWordListValuesOnly.push(fileAndWordList[t]);
    }
    
    
    //alert("t"+fileAndWordListValuesOnly.toString()); 
        
    fileAndWordListValuesOnly = unique(fileAndWordListValuesOnly);
    fileAndWordListValuesOnly = fileAndWordListValuesOnly.sort(compare_nbMots);
    //alert("t: "+fileAndWordListValuesOnly.join(';')); 

    var listToOutput = new Array();

    for (j in fileAndWordListValuesOnly) {
        for (t in temptab) {
            if (temptab[t].motsliste == fileAndWordListValuesOnly[j]) {
                if (listToOutput[j] == undefined) {
                   listToOutput[j] = new Array(temptab[t]);
                }else {
                   listToOutput[j].push(temptab[t]); 
                }

            }
        }
    }

    return listToOutput;
}

function resultPerFile (filenb, motsliste, motsnb) {
    this.filenb = filenb;
    this.motsliste = motsliste;
    this.motsnb = motsnb;
}

function compare_nbMots (s1, s2){
    var t1 = s1.split(','); 
    var t2 = s2.split(','); 
    //alert ("s1:"+t1.length + " " +t2.length)
    if (t1.length == t2.length) {
        return 0;
    }else if (t1.length > t2.length) {
        return 1;
    }else {
        return -1;
    }
    //return t1.length - t2.length);
}
/* User interfaces functions */
function DisplayWaitingMessage () {

    with (parent.frames['contentwin'].document) {
            writeln("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html><head>");
            writeln("<meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\" />");
            writeln("<link rel=\"stylesheet\" type=\"text/css\" href=\"../css/commonltr.css\">") ;
            writeln("<link rel=\"stylesheet\" type=\"text/css\" href=\"../css/search.css\">");
            writeln("<title>"+ txt_please_wait +"</title></head>");
            writeln("<body onload = \"self.focus()\">");
            writeln("<h2>"+ txt_please_wait +"</h2></body></html>");
            close();
    }

}
