FILES=transform.xsl10.xsl

all: 

download: ${FILES}

transform.xsl10.xsl:
	wget --output-document=transform.xsl10.xsl "http://tei.svn.sourceforge.net/viewvc/tei/trunk/P4toP5/p4top5.xsl"

validate:

build:

allclean: 
	rm -f  ${FILES}

clean:

.PHONY: all clean allclean validate download
