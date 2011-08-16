FILES=transform.xsl

all: 

download: ${FILES}

transform.xsl:
	wget --output-document=transform.xsl "http://tei.svn.sourceforge.net/viewvc/tei/trunk//P5/Test/tei2kml.xsl"

validate:

build:

allclean: 
	rm -f  ${FILES}

clean:

.PHONY: all clean allclean validate download
