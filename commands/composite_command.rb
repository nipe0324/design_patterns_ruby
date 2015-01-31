require 'command'

class CompositeCommand < Command
  def initialize
    @commands = []
  end

  def add_command(cmd)
    @commands << cmd
  end

  def execute
    @commands.each { |cmd| cmd.execute }
  end

  def description
    @commands.inject("") { |description, cmd| description << "#{cmd.description}\n" }
  end
end