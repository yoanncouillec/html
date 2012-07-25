open Html
open Head

let home = wrapper 
  [h2 [] ["Home"] ;
   menu ; 
   p [] ["blablabla"]]

let _ = 
  print_string home
