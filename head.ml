open Html

let homefile = "home.html"
let codemefile = "codeme.html"

let head = 
  (head 
     [style ["html {font-weight:bold}" ; 
	     "li {display:inline}" ; 
	     "span.keyword {color:green}";
	     "h3.filename {background:lightblue;padding:1px 5px}" ;
	     "h4.menu {background:lightblue;padding: 1px 5px}" ; 
	     "h4.menu span {margin-right:5px}" ;
	     "div.code {box-shadow: 8px 8px 12px #aaa}"
	    ]])

let menu = 
  h4 
    [("class","menu")]
    [span [] [a [("href",homefile)] ["Home"]];
     span [] [a [("href",codemefile)] ["CodeMe"]]]

let title sub = 
  h1 [("class","title")]
    ["MySite" ^ sub]

(*
let header = 
  h1 [] ["MySite"]

let wrapper content = 
  (html 
     head
     (body ([header] @ content)))
*)
