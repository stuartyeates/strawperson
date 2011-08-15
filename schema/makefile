
#The three different schemas for each of the main variants of TEI
FILES_ALL=tei_all.dtd tei_all.rng tei_all.xsd 
FILES_LITE=teilite.dtd teilite.rng teilite.xsd 
FILES_MS=tei_ms.dtd tei_ms.rng tei_ms.xsd 
FILES_BARE=tei_bare.dtd tei_bare.rng tei_bare.xsd 
FILES_SPEECH=tei_speech.dtd tei_speech.rng tei_speech.xsd 
FILES_DRAMA=tei_drama.dtd tei_drama.rng tei_drama.xsd 
FILES_EXTRA=xml.xsd

# All the files at once
FILES=${FILES_ALL} $(FILES_LITE) $(FILES_MS) $(FILES_BARE) $(FILES_SPEECH) $(FILES_DRAMA)  $(FILES_EXTRA)  

all: validate

download: ${FILES}

validate: download
	for file in *.rng *.xsd; do xmllint --noout $$file; echo validated $$file; done

%.dtd:
	wget http://www.tei-c.org/release/xml/tei/custom/schema/dtd/$@ 
%.rng:
	wget http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/$@ 
%.xsd:
	wget http://www.tei-c.org/release/xml/tei/custom/schema/xsd/$@ 

xml.xsd:
	wget http://www.w3.org/2001/03/xml.xsd

allclean: clean
	rm -f ${FILES}

clean:

build:

.PHONY: clean allclean validate build
