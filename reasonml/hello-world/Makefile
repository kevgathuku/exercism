default: clean test

init:
	opam switch create . 5.3.0 -y --deps-only

install:
	opam install . --deps-only --yes

test: 
	dune runtest

clean:
	dune clean

.PHONY: clean
