open Html
open Head
open String2

let codeme = wrapper
  [h2 [] ["CodeMe"] ;
   menu ;  
   pre [] [get_content "main.c"]]

let _ = 
  print_string codeme
