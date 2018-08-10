require 'test/unit'
require_relative '../../../app/src/math_operations/prime_generator.rb'

class PrimeGeneratorTest < Test::Unit::TestCase

  KNOWN_PRIMES = [1, 2, 3, 5, 7, 11, 13, 17, 19, 23]

  def test_primes
    random_size = (1 + rand * 10).to_i
    generator_obj = MathOperations::PrimeGenerator.new(random_size)
    assert_equal(generator_obj.primes, KNOWN_PRIMES.first(random_size))
  end
end
