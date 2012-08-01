open String2
let tag ta attrs children = 
  "<" ^ ta ^ " " ^ 
    (List.fold_left (fun acc (attr,value) -> acc ^ attr ^ "=\"" ^ value ^ "\" ") 
       "" attrs) ^
    ">" ^ 
    (List.fold_left (fun acc child -> acc ^ child) "" children) ^ 
    "</" ^ ta ^ ">"

let html head body = tag "html" [] ([head] @ body)
let head = tag "head" []
let style = tag "style" [("type","text/css")]
let body = tag "body" []
let p = tag "p"
let h1 = tag "h1"
let h2 = tag "h2"
let h3 = tag "h3"
let h4 = tag "h4"
let h5 = tag "h5"
let h6 = tag "h6"
let ul = tag "ul"
let li = tag "li"
let table = tag "table"
let tr = tag "tr"
let th = tag "th"
let td = tag "td"
let a = tag "a"
let pre = tag "pre"
let span = tag "span"
let div = tag "div"

let c_keywords = ["auto";"break";"case";"char";"const";"continue";"default";
"do";"double";"else";"enum";"extern";"float";"for";"goto";"if";"int";"long";
"register";"return";"short";"signed";"sizeof";"static";"struct";"switch";"typedef";
"union";"unsigned";"void";"volatile";"while"]

let format kws s = 
  List.fold_left 
    (fun s kw -> 
       Str.global_replace 
	 (Str.regexp kw) 
	 ((span [("class","keyword")] [kw])^"</span>")
	 s)
    s
    kws

let inc file = 
  [div [("class","code")]
     [h3 [("class","filename")] [a [("href", file)] [file]] ; 
      pre [("class","code")] 
	[(html_entities (get_content file))]]]

