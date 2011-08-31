#The three different schemas for each of the main variants of TEI
DIRS=schema transforms styles documents 
export XSL10_TRANSFORMS=identity-xsl-10 p4top5 tei2kml
export XSL20_TRANSFORMS=identity-xsl-20 tei2html5 sbl-site
export TRANSFORMS=${XSL10_TRANSFORMS} ${XSL20_TRANSFORMS}
export LOCAL_DOCUMENTS=simple simple-name-header simple-name-header simple-name-multiple simple-corpus simple-notes
export REMOTE_DOCUMENTS=www.oss-watch.ac.uk archimedespalimpsest.net idp.data dspace.nitle.org www.nzetc.org freedict sbl-site indology ducange tbe.kantl.be
export DOCUMENTS=${LOCAL_DOCUMENTS} ${REMOTE_DOCUMENTS}


DATESTAMP=$(shell date "+%Y-%m-%d-%H-%M-%N")

all: download validate build

download: 
	set -e; for dir in ${DIRS} ; do  ${MAKE} -C $$dir download; done

validate:
	set -e; for dir in ${DIRS} ; do  ${MAKE} -C $$dir validate; done


build: new-dir all-transforms all-xmllint all-htmltidy move-dir
	set -e; for dir in ${DIRS} ; do  ${MAKE} -C $$dir build; done

new-dir:
	mkdir -p ./build/

all-transforms:
	set -e; for document in ${DOCUMENTS}; do     \
         for transform in ${XSL20_TRANSFORMS};  do          \
           echo doing: $$document / $$transform ;    \
           mkdir -p ./build/$$document/$$transform;                    \
              saxonb-xslt -o:./build/$$document/$$transform/output.xml  ./documents/$$document/document.teip5.xml ./transforms/$$transform/transform.xsl20.xsl; \
         done;                      \
         for transform in ${XSL10_TRANSFORMS};  do          \
           echo doing: $$document / $$transform ;    \
           mkdir -p ./build/$$document/$$transform;                    \
              xsltproc  --novalid --output  ./build/$$document/$$transform/output.xml ./transforms/$$transform/transform.xsl10.xsl ./documents/$$document/document.teip5.xml;  \
         done;                      \
        done; 

all-xmllint:
	set -e; for file in `find ./build* -name '*.xml'` ; do  xmllint --noout $$file  2> $$file.xmllint.error ; done || true

all-htmltidy:
	for file in `find ./build* -name '*.html5'` ; do  tidy -utf8 -errors $$file  2> $$file.tidy.error ; done || true

move-dir:
	mv build ./build-${DATESTAMP}


#	set -e; for doc in ${DOCS} ; do \
#                   for transform in  ${TRANSFORMS} ; do \
#                      mkdir -p ./${DATESTAMP}/$$doc/$$transform; \
#                      saxonb-xslt  ./documents/$$doc/document.teip5.xml ./transforms/$$transform/transform.xsl  > ./${DATESTAMP}/$$doc/$$transform/output.xml ; \
#                   done	; \
#                done;

allclean: clean
	set -e; for dir in ${DIRS} ; do  ${MAKE} -C $$dir allclean; done

clean:
	set -e; for dir in ${DIRS} ; do  ${MAKE} -C $$dir clean; done
	rm -rf build-20*

.PHONY: all clean allclean validate download build

