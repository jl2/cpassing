# Build cpassing

cpassing: manifest.txt *.lisp *.asd clib.so
	buildapp --output cpassing \
             --manifest-file manifest.txt \
             --load-system asdf \
             --load-system sb-posix \
             --load-system alexandria \
             --load-system cpassing\
             --entry 'cpassing:main'

test: t/*.lisp *.lisp *.asd
	sbcl --eval "(ql:quickload :cpassing.test)" \
		 --eval "(setf 5am::*on-error* :debug)" \
		 --eval "(5am:run-all-tests :summary :suite)" \
		 --eval "(quit)"

manifest.txt: *.asd
	sbcl --no-userinit \
         --no-sysinit \
         --non-interactive \
         --load ~/quicklisp/setup.lisp \
         --eval '(ql:quickload :alexandria)' \
		 --eval '(ql:write-asdf-manifest-file "manifest.txt")'

clib.so: clib/clib.c clib/clib.h
	$(MAKE) -C clib

clean:
	rm -Rf manifest.txt  *.fasl

.PHONY: clean test
