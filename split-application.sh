#! /bin/bash
# --------------------------------------------------------------------
# Usage: split-application.sh [file] [pgcount]
#        where file is the input PDF (with references), and pgcount
#        is the number of the first page of references (i.e. where
#        to split).
# --------------------------------------------------------------------
inputfile=$1
pagecount=$2
pagecountm1=$((pagecount-1))
pdftk A=$inputfile cat A1-$pagecountm1 output application-text.pdf
pdftk A=$inputfile cat A$pagecount-end output application-references.pdf
