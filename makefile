#The three different schemas for each of the main variants of TEI
DIRS=schema documents engine styles build test

all: download validate build

download: 
	set -e; for dir in ${DIRS} ; do  ${MAKE} -C $$dir download; done

validate:
	set -e; for dir in ${DIRS} ; do  ${MAKE} -C $$dir validate; done

build:
	set -e; for dir in ${DIRS} ; do  ${MAKE} -C $$dir build; done

allclean: 
	set -e; for dir in ${DIRS} ; do  ${MAKE} -C $$dir allclean; done

clean:
	set -e; for dir in ${DIRS} ; do  ${MAKE} -C $$dir clean; done

.PHONY: all clean allclean validate download
