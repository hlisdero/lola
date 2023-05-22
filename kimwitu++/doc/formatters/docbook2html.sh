#! /bin/sh

set -x

# Use XSLT processor to make XML into XHTML
STYLESHEET=/usr/share/sgml/docbook/stylesheet/xsl/nwalsh/xhtml/docbook.xsl

if [ -f $STYLESHEET ]
then
    xsltproc $STYLESHEET $1 > $2 2> .kkkk_eeee || cat .kkkk_eeee
else
    echo Error: stylesheet not found: $STYLESHEET
    exit
fi

echo Errors:
cat .kkkk_eeee
