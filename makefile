#The three different schemas for each of the main variants of TEI
DIRS=schema transforms styles documents 
export TRANSFORMS=identity-xsl-10 identity-xsl-20 tei2html5 p4top5 tei2kml
export LOCAL_DOCUMENTS=simple simple-name-header simple-name-header simple-name-multiple simple-corpus 
export REMOTE_DOCUMENTS=www.oss-watch.ac.uk archimedespalimpsest.net idp.data dspace.nitle.org www.nzetc.org freedict
export DOCUMENT=${LOCAL_DOCUMENTS} ${REMOTE_DOCUMENTS}


DATESTAMP=$(shell date "+%Y-%m-%d-%H-%M-%N")

all: download validate build

download: 
	set -e; for dir in ${DIRS} ; do  ${MAKE} -C $$dir download; done

validate:
	set -e; for dir in ${DIRS} ; do  ${MAKE} -C $$dir validate; done


build:
	set -e; for dir in ${DIRS} ; do  ${MAKE} -C $$dir build; done
	set -e; for document in ${DOCUMENTS}; do     \
         for transform in ${TRANSFORMS};  do          \
           mkdir -p build/$$document/$$transform;                    \
           saxonb-xslt -o:build/$$document/$$transform/output.xml  ./documents/$$document/document.teip5.xml ./transforms/$$transform/transform.xsl;   \
         done;                      \
	 saxonb-xslt -o:build/$$document/tei2html5/output.html5  ./documents/$$document/document.teip5.xml ./transforms/tei2html5/transform.xsl;   \
                                        \
        done; 
	set -e; for file in `find ./build* -name '*.xml'` ; do  xmllint --noout $$file  2> $$file.xmllint.error ; done || true
	for file in `find ./build* -name '*.html5'` ; do  tidy -utf8 -errors $$file  2> $$file.tidy.error ; done || true
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

#processing rules for individual files
document.teip5.xml: document.teip4.xml
	xsltproc  --novalid  ./p4top5.xsl ./document.teip4.xml | xmllint --format - > ./document.teip5.xml

