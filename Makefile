all: coloring.cmo

%.cmo: %.ml
	ocamlc -c $<

%.cmi: %.mli
	ocamlc -c $<

clean:
	rm -f *.cmo *.cmi