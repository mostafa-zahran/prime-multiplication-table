module Formatters
  class DefaultFormatter
    def initialize(table)
      @table = table
    end

    def format
      @table.map { |row| format_row(row).join(' | ') }.join("\n")
    end

    protected

    def format_row(row)
      row
    end
  end
end
