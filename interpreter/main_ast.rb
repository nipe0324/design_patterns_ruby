require 'parser'

# AST:Abstract Syntax Tree 抽象構文木

# パーサーを使う場合
parser = Parser.new "and (and(not(bigger 1024)) (filename *.mp3)) writable"
parser_ast = parser.expression
parser_ast_files = parser_ast.evaluate('test_dir')
p "parser ast files: #{parser_ast_files}"
