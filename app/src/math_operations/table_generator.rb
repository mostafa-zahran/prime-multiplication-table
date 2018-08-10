require 'matrix'

module MathOperations
  class TableGenerator
    def initialize(numbers, operation)
      @numbers = numbers
      @operation = operation
    end

    def format(formatter)
      formatter.new(table.to_a).format
    end

    def generate!
      table
      self
    end

    private

    def table
      @table ||= send(@operation)
    end

    def *
      Matrix.column_vector(@numbers) * Matrix.row_vector(@numbers)
    end
  end
end
