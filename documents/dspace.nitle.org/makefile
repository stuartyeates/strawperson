#The three different schemas for each of the main variants of TEI


download: document.teip5.xml

document.teip4.xml:
	wget --output-document=document.teip4.xml "http://dspace.nitle.org/bitstream/handle/10090/11695/service.jpg?sequence=1"
	wget --output-document=document.jpg "http://dspace.nitle.org/bitstream/handle/10090/11695/service.jpg?sequence=2"
	wget --output-document=p4top5.xsl "http://tei.svn.sourceforge.net/viewvc/tei/trunk/P4toP5/p4top5.xsl?revision=9184"


document.teip5.xml: document.teip4.xml
	xsltproc  --novalid  ./p4top5.xsl ./document.teip4.xml | xmllint --format - > ./document.teip5.xml

validate:

build:

allclean: clean
	rm  document.teip4.xml p4top5.xsl document.jpg

clean:
	rm document.teip5.xml 

.PHONY: all clean allclean validate download
