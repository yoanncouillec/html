open Html
open Head

let home =
  html
    head
    [title " &gt; Home";
     menu ; 
     p [] ["blablabla"]]

let _ = 
  print_string home
