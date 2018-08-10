require_relative './default_formatter.rb'

class Formatters::TableFormatter < Formatters::DefaultFormatter
  def initialize(table)
    super(table)
    @max_width = @table[-1].map{ |ele| ele.to_s.length }
  end

  protected

  def format_row(row)
    row.each_with_index.map{ |ele, index| "%-#{@max_width[index]}s" % ele.to_s}
  end
end
