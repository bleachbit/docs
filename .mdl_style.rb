all

rule 'MD004', :style => :dash
rule 'MD007', :indent => 2
rule 'MD024', :allow_different_nesting => true
# Question headings are fine
rule 'MD026', :punctuation => '.,;:!'
rule 'MD029', :style => :ordered

# The layout renders page.title as the h1
exclude_rule 'MD002'
exclude_rule 'MD041'
# Long lines are not rewrapped
exclude_rule 'MD013'
# kramdown keeps blockquotes split by a blank line separate
exclude_rule 'MD028'
# Raw HTML, like the video embed
exclude_rule 'MD033'
# "*New in BleachBit x.y.z*" notes
exclude_rule 'MD036'
