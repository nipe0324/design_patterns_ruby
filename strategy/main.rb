require 'report'
require 'html_formatter'
require 'plain_text_formatter'

puts "Report with HTMLFormatter"
report = Report.new(HTMLFormatter.new)
report.output_report

puts "Report with PlainTextFormatter"
report.formatter = PlainTextFormatter.new
report.output_report
