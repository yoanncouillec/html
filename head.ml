open Html

let homefile = "home.html"
let codemefile = "codeme.html"

let head = 
  (head 
     [style ["html {font-weight:bold}" ; 
	     "li {display:inline}" ; 
	     "span.keyword {color:green}";
	     "div.code {width:500px}";
	     "h3.filename {background:lightblue;padding:1px 5px}"
	    ]])

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
