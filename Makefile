# -*- mode: makefile; coding: utf-8 -*-
# A sample Makefile for building your résumé using the
# xml-resume-library.  Requirements: xsltproc, xmlto, xmltex
# Copyright © 2002 Colin Walters <walters@debian.org>
# Copyright © 2008 Francesco Poli <frx@firenze.linux.it>

FOP = ~/Applications/fop-0.20.5/fop.sh
RESUMELIB=resume-1_5_1
# This should be the name of your résumé file, but without the .xml
# extension.
resume    ?= resume

# Parametric country and papersize values
country   ?= us
papersize ?= letter

# The styles you want to use, for your country and papersize.
FO_STYLE   = ${RESUMELIB}/xsl/output/${country}-${papersize}.xsl
HTML_STYLE = ${RESUMELIB}/xsl/output/${country}-html.xsl
TXT_STYLE  = ${RESUMELIB}/xsl/output/${country}-text.xsl

.PHONY: all clean check
.SUFFIXES: .html .fo .pdf .xml .xsl .txt

all: $(resume).pdf

clean:
	-rm -f $(resume).fo $(resume).pdf *~



$(resume).pdf: $(resume).fo
	$(FOP) $(resume).fo $(resume).pdf

