require 'optparse'
require_relative './src/help_printer.rb'
require_relative './src/base.rb'

@help_logic = proc do
    puts HelpPrinter.new.help_message
    exit(0)
  end
@base = Base.new

OptionParser.new do |opt|
  opt.on('-pp'){ @base.set_table_formatter }
  opt.on('-s', '--size SIZE'){ |size| @base.size = size }
  opt.on('-h', '--help', &@help_logic)
end.parse!

puts(@base.generate_table) rescue @help_logic.call()
