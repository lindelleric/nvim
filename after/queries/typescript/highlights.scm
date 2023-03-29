;; extends

; "package" @MyHightlight

; Variable declaration
(variable_declarator
    name : (identifier)
    @variable.declaration)

; Function declaration
(function_declaration
    name : (identifier)
    @function.declaration)

; Object key
(pair
    key : (property_identifier)
    @object.key)

; Object key - string format
(pair
    key : (string)
    @object.key)

; Object brace
(object
    ["{" "}"]
    @object.brace)

; Array bracket
value : (array)
    ["[" "]"]
    @array.bracket

; literal => 
(arrow_function
    "=>"
    @arrowfunction.arrow)

; meh<>()
(type_arguments 
    ["<" ">"]
    @type.enclosingtags
)

; meh<this.type>
; Make it higher in prio then @type etc
(
    (nested_type_identifier) @type.identifier
    (#set! "priority" 110)
)

; Object colon
(pair
    ":"
    @object.colon)

; Export keyword
; Doesn't applies due to less priority than default rule
(export_statement
    "export"
    @keyword.export)

; export keyword in secondary keyword group
(export_statement
    "export"
    @keyword.secondary)

; Import keyword
(import_statement
    "import"
    @keyword)

; Import keyword
(import_statement
    "import"
    @keyword.import)

; From keyword
(import_statement
    "from"
    @keyword.from)

; async keyword
"async"
    @keyword.async

; await keyword
"await"
    @keyword.await

; Boolean - false
value : (false)
    @boolean.false

; Boolean - false
right : (false)
    @boolean.false

; Boolean - false
; false @boolean.false

; Object identifier - [obj].key.key.key
object : (identifier)
    @object.identifier

; Catch clause
handler : (catch_clause)
    "catch"
    @exception.error

; Throw keyword
(throw_statement "throw"
    @exception.error)

; Secondary keyword group
["async" "await" "from"]
    @keyword.secondary
