require_relative "parser"

class Console
  def initialize
    @parser = Parser.new
  end

  def read_input
    while true do
      puts "input:\n"
      input= gets
      puts "output:\n"
      parser_output=@parser.parse input     
      puts parser_output
    end
  end

end

Console.new.read_input