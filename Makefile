EXEC = home

site: home.html codeme.html

%.cmo: %.ml
	ocamlc $^ -o $@

%.out: html.ml head.ml string2.ml %.ml
	ocamlc $^ -o $@

%.html: %.out
	./$^ > $@

clean:
	rm -rf *.cm* *~ *.html $(EXEC)
