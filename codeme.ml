open Html
open Head
open String2

let codeme =
  html 
    head
    ([title " &gt; CodeMe"; 
      menu ] @ (inc "main.c") @ (inc "server.c"))

let _ = 
  print_string codeme
