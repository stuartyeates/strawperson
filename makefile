#The three different schemas for each of the main variants of TEI
DIRS=schema transforms styles build  documents 


all: download validate build

download: 
	set -e; for dir in ${DIRS} ; do  ${MAKE} -C $$dir download; done

validate:
	set -e; for dir in ${DIRS} ; do  ${MAKE} -C $$dir validate; done

build:
	set -e; for dir in ${DIRS} ; do  ${MAKE} -C $$dir build; done

allclean: 
	set -e; for dir in ${DIRS} ; do  ${MAKE} -C $$dir allclean; done

clean:
	set -e; for dir in ${DIRS} ; do  ${MAKE} -C $$dir clean; done

.PHONY: all clean allclean validate download

#processing rules for individual files
document.teip5.xml: document.teip4.xml
	xsltproc  --novalid  ./p4top5.xsl ./document.teip4.xml | xmllint --format - > ./document.teip5.xml

