module Validators
  class SizeValidator
    NOT_NUMBER = 'Size should be a number'.freeze
    NOT_INTEGER = 'Size should be a integer'.freeze
    NOT_HIGTHER_THAN_ZERO = 'Size should be higher than zero'.freeze

    attr_reader :error_messages
    def initialize(size)
      @size = size
      @error_messages = []
    end

    def valid?
      should_be_number
      should_be_integer
      should_be_higher_than_zero
      error_messages.empty?
    end

    private

    def should_be_number
      @error_messages << NOT_NUMBER unless @size.is_a? Numeric
    end

    def should_be_integer
      @error_messages << NOT_INTEGER unless @size.to_f == @size.to_i
    end

    def should_be_higher_than_zero
      @error_messages << NOT_HIGTHER_THAN_ZERO unless @size.to_i > 0
    end
  end
end
