class Report
  def initialize
    @title = '月次報告'
    @text  = %w(順調 最高の調子)
  end

  def output_report
    puts '<html>'
    puts '  <head>'
    puts "    <title>#{@title}</title>"
    puts '  </head>'
    puts '  <body>'
    @text.each do |line|
      puts("    <p>#{line}</p>")
    end
    puts '  </body>'
    puts '</html>'
  end
end