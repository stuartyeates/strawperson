#The three different schemas for each of the main variants of TEI


download: document.teip5.xml

document.teip4.xml:
	wget --output-document=document.teip4.xml "http://dspace.nitle.org/bitstream/handle/10090/11695/service.jpg?sequence=1"
	wget --output-document=document.jpg "http://dspace.nitle.org/bitstream/handle/10090/11695/service.jpg?sequence=2"


document.teip5.xml: document.teip4.xml
	xsltproc  --novalid  ../../transforms/p4top5/transform.xsl10.xsl ./document.teip4.xml | xmllint --format - > ./document.teip5.xml

validate:

build:

allclean: clean
	rm -f document.teip4.xml document.jpg

clean:
	rm -f document.teip5.xml 

.PHONY: all clean allclean validate download
