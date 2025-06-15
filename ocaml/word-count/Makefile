DUNE = opam exec -- dune

default: clean test

test:
	dune runtest

clean:
	dune clean

.PHONY: clean

.PHONY: format
format: ## Format the codebase with ocamlformat
	$(DUNE) build @fmt --auto-promote
