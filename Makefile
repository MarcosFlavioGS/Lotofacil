all: build
	@echo "hello, Lotofacil will be installed to your system !"
	@sudo cp _build/default/bin/lotofacil /usr/bin/

build:
	@opam exec -- dune build --profile=release
	@mv _build/default/bin/main.exe _build/default/bin/lotofacil
