EXEC = home

site: home.html codeme.html

%.cmo: %.ml
	ocamlc $^ -o $@

%.out: string2.ml html.ml head.ml %.ml
	ocamlc str.cma $^ -o $@

%.html: %.out
	./$^ > $@

clean:
	rm -rf *.cm* *~ *.html $(EXEC)
