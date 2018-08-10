require_relative './validators/size_validator.rb'
require_relative './math_operations/prime_generator.rb'
require_relative './math_operations/table_generator.rb'
require_relative './formatters/table_formatter.rb'
require_relative './formatters/default_formatter.rb'

class Base
  DEFAULT_SIZE = 10
  DEFAULT_FORMATTER = Formatters::DefaultFormatter
  NOT_VALID_SIZE = 'Not valid size'.freeze

  attr_writer :size

  def initialize
    @size = DEFAULT_SIZE
    @formatter = DEFAULT_FORMATTER
  end

  def generate_table
    validate_size!
    @table = MathOperations::TableGenerator.new(MathOperations::PrimeGenerator.new(@size).primes, :*).generate!
    self
  end

  def set_table_formatter
    @formatter = Formatters::TableFormatter
  end

  def to_s
    @table.format(@formatter)
  end

  private

  def validate_size!
    validator = Validators::SizeValidator.new(@size)
    return true if validator.valid?
    puts validator.error_messages.join(', ')
    raise NOT_VALID_SIZE
  end
end
