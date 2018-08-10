require 'test/unit'
require_relative '../../../app/src/math_operations/table_generator.rb'
require_relative '../../../app/src/formatters/default_formatter.rb'

class TableGeneratorTest < Test::Unit::TestCase
  def setup
    @random_numbers = (1..10).to_a.sample(3).insert(0, 1)
    @generator_obj = MathOperations::TableGenerator.new(@random_numbers, :*)
  end

  def table_tests(table)
    assert_equal(table[0], @random_numbers)
    assert_equal(table.map{|r| r[0]}, @random_numbers)
    assert_block do
      @random_numbers.each_with_index{ |r, r_i|
        @random_numbers.each_with_index{ |c, c_i|
          table[r_i][c_i] == table[c_i][r_i] && table[r_i][c_i] == r * c
        }
      }.all?
    end
  end

  def test_generate
    assert_nil(@generator_obj.instance_variable_get(:@table))
    assert_kind_of(@generator_obj.class, @generator_obj.generate!)
    table = @generator_obj.instance_variable_get(:@table).to_a
    table_tests(table)
  end

  def test_format
    assert_kind_of(String, @generator_obj.format(Formatters::DefaultFormatter))
  end
end
