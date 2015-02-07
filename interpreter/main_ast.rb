require 'parser'

# AST:Abstract Syntax Tree 抽象構文木

# パーサーを使う場合
# 文字列をパーサーして検索を行う
parser = Parser.new "and (and(not(bigger 1024)) (filename *.mp3)) writable"
parser_ast = parser.expression
parser_ast_files = parser_ast.evaluate('test_dir')
p "parser ast files: #{parser_ast_files}"

# パーサーを使わない場合
not_parser_ast = ( Not.new( Bigger.new(1024) ) ) & FileName.new('*.mp3') & Writable.new
not_parser_files = not_parser_ast.evaluate('test_dir')
p "not parser ast files: #{not_parser_files}"
