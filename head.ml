open Html

let homefile = "home.html"
let codemefile = "codeme.html"

let head = 
  (head 
     [style [".code {color:yellow ; background:black}";
	    "html {font-weight:bold}" ; 
	    "li {display:inline}"]])

let menu = 
  ul 
    []
    [li [] [a [("href",homefile)] ["Home"]];
     li [] [a [("href",codemefile)] ["CodeMe"]]]

let header = 
  h1 [] ["MySite"]

let wrapper content = 
  (html 
     head
     (body ([header] @ content)))
