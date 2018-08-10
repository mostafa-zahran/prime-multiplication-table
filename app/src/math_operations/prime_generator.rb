module MathOperations
  class PrimeGenerator
    def initialize(size)
      @size = size.to_i
    end

    def primes
      @primes ||= (1..Float::INFINITY).lazy.select{|num| prime?(num)}.first(@size)
    end

    private

    def prime?(num)
      2.upto(Math.sqrt(num).to_i) { |n| return false if num % n == 0 }
      return true
    end
  end
end
