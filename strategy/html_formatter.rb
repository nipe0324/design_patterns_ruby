class HTMLFormatter
  def output_report(title, text)
    puts '<html>'
    puts '  <head>'
    puts "    <title>#{@title}</title>"
    puts '  </head>'
    puts '  <body>'
    text.each do |line|
      puts "    <p>#{line}</p>"
    end
    puts '  </body>'
    puts '</html>'
  end
end