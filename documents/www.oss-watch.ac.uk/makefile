#The three different schemas for each of the main variants of TEI


download: document.teip5.xml

document.teip4.xml:
	wget --output-document=document.teip4.xml "http://www.oss-watch.ac.uk/resources/eupl.xml?style=raw"

document.teip5.xml: document.teip4.xml
	xsltproc  --novalid  ../../transforms/foreign-xsl/p4top5.xsl ./document.teip4.xml | xmllint --format - > ./document.teip5.xml

validate:

build:

allclean: clean
	rm -f document.teip4.xml

clean:
	rm -f document.teip5.xml

.PHONY: all clean allclean validate download
