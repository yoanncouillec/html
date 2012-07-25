open String2
let tag ta attrs children = 
  "<" ^ ta ^ " " ^ 
    (List.fold_left (fun acc (attr,value) -> acc ^ attr ^ "=\"" ^ value ^ "\" ") 
       "" attrs) ^
    ">" ^ 
    (List.fold_left (fun acc child -> acc ^ child) "" children) ^ 
    "</" ^ ta ^ ">"

let html head body = tag "html" [] [head;body]
let head = tag "head" []
let style = tag "style" [("type","text/css")]
let body = tag "body" []
let p = tag "p"
let h1 = tag "h1"
let h2 = tag "h2"
let h3 = tag "h3"
let ul = tag "ul"
let li = tag "li"
let table = tag "table"
let tr = tag "tr"
let th = tag "th"
let td = tag "td"
let a = tag "a"
let pre = tag "pre"
let inc file = 
  [a [("href", "main.c")] ["main.c"] ; 
   pre [("class","code")] [html_entities (get_content "main.c")]]
