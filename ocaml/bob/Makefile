test: test.native
	@./test.native

test.native: *.ml *.mli
	@corebuild -r -quiet -pkg oUnit -pkg str test.native

clean:
	rm -rf _build

.PHONY: clean
