FILES_ALL=tei_all.dtd tei_all.rng tei_all.xsd 
FILES_LITE=teilite.dtd teilite.rng teilite.xsd 
FILES_TITE=tei_tite.dtd tei_tite.rng tei_tite.xsd 
FILES_MS=tei_ms.dtd tei_ms.rng tei_ms.xsd 
FILES_BARE=tei_bare.dtd tei_bare.rng tei_bare.xsd 
FILES_SPEECH=tei_speech.dtd tei_speech.rng tei_speech.xsd 
FILES_DRAMA=tei_drama.dtd tei_drama.rng tei_drama.xsd 
FILES=$(FILES_ALL) $(FILES_LITE) $(FILES_TITE) $(FILES_MS) $(FILES_BARE) $(FILES_SPEECH) $(FILES_DRAMA)  

all: $(FILES)

%.dtd:
	wget http://www.tei-c.org/release/xml/tei/custom/schema/dtd/$@ 
%.rng:
	wget http://www.tei-c.org/release/xml/tei/custom/schema/relaxng/$@ 
%.xsd:
	wget http://www.tei-c.org/release/xml/tei/custom/schema/xsd/$@ 

clean:
	rm $(FILES)

.PHONY: clean