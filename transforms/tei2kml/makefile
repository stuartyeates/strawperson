FILES=transform.xsl10.xsl

all: 

download: ${FILES}

transform.xsl10.xsl:
	wget --output-document=transform.xsl10.xsl "http://tei.svn.sourceforge.net/viewvc/tei/trunk//P5/Test/tei2kml.xsl"

validate:

build:

allclean: 
	rm -f  ${FILES}

clean:

.PHONY: all clean allclean validate download
