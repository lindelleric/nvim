;; extends


; {} within a jsx tag
(jsx_expression 
    ["{" "}"]
    @jsx.expression.brace)

; Braces around jsx props: prop={these braces}
(jsx_attribute (jsx_expression 
    ["{" "}"]
    @jsx.prop.brace))
