require 'test/unit'
require_relative '../../../app/src/formatters/table_formatter.rb'

class TableFormatterTest < Test::Unit::TestCase
  def setup
    random_size = (1..10).to_a.sample
    @table = (0..random_size).map{(1..10).to_a.sample(random_size)}
    @foramtter_obj = Formatters::TableFormatter.new(@table)
  end

  def test_format
    assert_equal(@foramtter_obj.format.split("\n").map{|row| row.split('|').map{|ele| ele.to_i}.flatten}, @table)
  end
end
