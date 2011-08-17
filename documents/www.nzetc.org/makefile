#The three different schemas for each of the main variants of TEI


download: document.teip5.xml

document.teip5.xml:
	wget --output-document=document.teip5.xml "http://www.nzetc.org/tei-source/GorLaws.xml"
	wget "http://www.nzetc.org/etexts/GorLaws/GorLawsFCo.jpg"
	wget "http://www.nzetc.org/etexts/GorLaws/GorLawsBCo.jpg"
	wget "http://www.nzetc.org/etexts/GorLaws/GorLawsTit.jpg"


validate:

build:

allclean: clean
	rm -f document.teip5.xml *.jpg

clean:

.PHONY: all clean allclean validate download
