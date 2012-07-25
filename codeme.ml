open Html
open Head
open String2

let codeme = wrapper
  ([h2 [] ["CodeMe"] ;
   menu ] @ (inc "main.c"))

let _ = 
  print_string codeme
