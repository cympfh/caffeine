###
ast = parse buf
###

is_white = (c) ->
  c is ' ' or c is '\n' or c is '\t'

# "(= a 2) c (= b 0)" -> ["(= a 2)", "c", "(= b 0)"]
split_sexp = (code) ->
  ret = []
  len = code.length
  n = 0
  j = 0
  for i in [0 ... len]
    switch code[i]
      when '(' then ++n
      when ')' then --n
    if n is 0 and code[i] is ')'
      ret .push code[j .. i]
      j = i + 1
    else if n is 0 and is_white code[i]
      ret .push code[j ... i]
      j = i + 1

  ret .push code[j ... len]
  ret = ret.filter (a) ->
    a isnt '' and a isnt ' '
  return ret

# "(= a 2)" -> {list: ['=', 'a', '2']}
parse_sexp = (code) ->
  return code if code[0] isnt '('
  inner = code.slice 1, code.length - 1
  list: parse inner

parse = (code) ->
  code = code.trim()
  for a in split_sexp code
    parse_sexp a

parse_start = (code) ->
  code = code.replace(/;[^"\'\n]*\n/g, '')
  code = code.replace(/;[^"\'\n]*$/g, '')
  parse code

module.exports = parse_start

#console.log JSON.stringify parse "(= a 2) c (= b 'str') (let ((i 3)) (print (* i i)))"
