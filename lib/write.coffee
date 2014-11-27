###
write ast, console.log
###

tabs = (idt) ->
  r = ''
  for k in [0 ... idt * 2]
    r += ' '
  return r

debug = (ast) ->
  console.warn "\n% ", JSON.stringify ast

write = (ast, print, idt = 0) ->
  # begin
  if ast instanceof Array
    for a in ast
      write a, print, idt
      write '\n', print
    return

  # atom
  if not ast.list?
    if ast is ';'
      if idt is 0
        print "# "
      else
        print " # "
    else
      print "#{tabs idt}#{ast}"
    return

  ls = ast.list
  car = ls[0]

  switch car
    when '='
      if ls[1].list?
        print "#{tabs idt}#{ls[1].list[0]} = (#{ls[1].list.slice(1).join ','}) ->\n"
        write ls[2], print, idt + 1
      else
        print "#{tabs idt}#{ls[1]} =\n"
        write ls[2], print, idt + 1
    when 'fn'
      print "#{tabs idt}(#{ls[1].list.slice(1).join ','}) ->\n"
      write ls.slice(2), print, idt + 1
    when '..'
      print "#{tabs idt}["
      write ls[1], print, 0
      print " .. "
      write ls[2], print, 0
      print "]"
    when '...'
      print "#{tabs idt}["
      write ls[1], print, 0
      print " ... "
      write ls[2], print, 0
      print "]"

    when '+'
      print "#{tabs idt}("
      for k in [1 ... ls.length]
        write ls[k], print, idt + 1
        if k < ls.length - 1
          print '+\n'
      print ")"

    when '*'
      print "#{tabs idt}("
      for k in [1 ... ls.length]
        write ls[k], print, idt + 1
        if k < ls.length - 1
          print '*\n'
      print ")"

    when '-'
      len = ls.length
      if len is 2
        print "#{tabs idt}(-"
        write ls[1], print, idt+1
        print ")"
      else
        print "#{tabs idt}("
        for k in [1 ... ls.length]
          write ls[k], print, idt + 1
          if k < ls.length - 1
            print '-\n'
        print ")"

    when '/'
      len = ls.length
      if len is 2
        print "#{tabs idt}(1/"
        write ls[1], print, idt+1
        print ")"
      else
        print "#{tabs idt}("
        for k in [1 ... ls.length]
          write ls[k], print, idt + 1
          if k < ls.length - 1
            print '/\n'
        print ")"


    else
      print "#{tabs idt}#{ls[0]}("
      for k in [1 ... ls.length]
        write ls[k], print, idt + 1
        if k < ls.length - 1
          print ',\n'
      print ")"

module.exports = write
