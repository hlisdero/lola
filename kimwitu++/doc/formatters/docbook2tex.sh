#! /bin/sh

set -e
set -x

# Use XSLT processor to make XML into LaTeX
if [ -f docbook2tex.xsl ]
then
    xsltproc docbook2tex.xsl $1 > .kkkk_kkkk 2> .kkkk_eeee || cat .kkkk_eeee
else
    xsltproc formatters/docbook2tex.xsl $1 > .kkkk_kkkk 2> .kkkk_eeee || cat .kkkk_eeee
fi


# Use Saxon processor to make XML into LaTeX (if current xsltproc fails)
#if [ -f docbook2tex.xsl ]
#then
#    saxoncat -S $1 docbook2tex.xsl > .kkkk_kkkk 2> .kkkk_eeee || cat .kkkk_eeee
#else
#    saxoncat -S $1 formatters/docbook2tex.xsl > .kkkk_kkkk 2> .kkkk_eeee || cat .kkkk_eeee
#fi

echo Errors:
cat .kkkk_eeee

# Finally convert UTF8 (the XML standard encoding)
# to Latin 1 (our standard encoding)
iconv -f utf8 -t latin1 .kkkk_kkkk -o $2
