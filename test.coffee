parse = require './lib/parse'
write = require './lib/write'

es = [
  "(= (f x) x) ; id"
  "(= f (fn (x) x)) ; this is also id"
  "(lst.map (fn (x) x))"
  "(= print console.log) (= lst (.. 0 10)) (lst.map (fn (x) x))"
]

for e in es
  ast = parse e
  console.warn "\n# #{e}"
  console.warn JSON.stringify ast
  write ast, ((a) -> process.stdout.write a)
  console.log()
