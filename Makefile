EXEC = home

site: home.html codeme.html

%.cmo: %.ml
	ocamlc $^ -o $@

%.out: html.ml head.ml %.ml
	ocamlc str.cma string2.cma $^ -o $@

%.html: %.out
	./$^ > $@

clean:
	rm -rf *.cm* *~ *.html $(EXEC)
