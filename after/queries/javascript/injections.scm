; extends
(
 (comment) @_comment
 (#match?@_comment "^\\/[*]")
 (#match?@_comment "sql")
 (#match?@_comment "[*]\\/$")
 (template_string) @sql
 (#offset! @sql 0 1 0 -1)
)
