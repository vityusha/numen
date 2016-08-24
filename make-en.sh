#!/bin/bash

# Get the absolute path of DITAOT's home directory
DITA_DIR=$HOME/opt/DITA-OT2.0

ANT_OPTS=-Xmx512m $ANT_OPTS
ANT_OPTS="$ANT_OPTS -Djavax.xml.transform.TransformerFactory=net.sf.saxon.TransformerFactoryImpl"
ANT_HOME=$DITA_DIR/tools/ant
PATH=$DITA_DIR/tools/ant/bin:$PATH
CLASSPATH=$DITA_DIR/lib:$DITA_DIR/lib/dost.jar:$DITA_DIR/lib/commons-codec.jar:$DITA_DIR/lib/dost.jar:$DITA_DIR/lib/resolver.jar:$DITA_DIR/lib/icu4j.jar:$CLASSPATH
CLASSPATH=$DITA_DIR/lib/saxon/saxon9.jar:$DITA_DIR/lib/saxon/saxon9-dom.jar:$CLASSPATH
CLASSPATH=$DITA_DIR/lib/saxon/saxon9-dom4j.jar:$DITA_DIR/lib/saxon/saxon9-jdom.jar:$CLASSPATH
CLASSPATH=$DITA_DIR/lib/saxon/saxon9-s9api.jar:$DITA_DIR/lib/saxon/saxon9-sql.jar:$CLASSPATH
CLASSPATH=$DITA_DIR/lib/saxon/saxon9-xom.jar:$DITA_DIR/lib/saxon/saxon9-xpath.jar:$DITA_DIR/lib/saxon/saxon9-xqj.jar:$CLASSPATH
CLASSPATH=$DITA_DIR/demo/fo/fop/lib/fop-hyph.jar:$CLASSPATH

#echo DITA_DIR=$DITA_DIR
#echo ANT_OPTS=$ANT_OPTS
#echo ANT_HOME=$ANT_HOME
#echo PATH=$PATH
#echo CLASSPATH=$CLASSPATH

ant -f nibelung-en.xml pdf

