#The three different schemas for each of the main variants of TEI

all: 

download: document.teip5.xml 

document.teip5.xml:
	wget --output-document=document.teip5.xml "http://archimedespalimpsest.net/Data/0000-100r/0000-100r_Arch53v_TEI_Netz-Wilson.xml"
	wget --no-directories --wait=1 --no-parent --accept='jpg' --recursive  http://archimedespalimpsest.net/Data/0000-100r/

validate:

build:

allclean: clean
	rm document.teip5.xml
	rm *.jpg

clean:

.PHONY: all clean allclean validate download
