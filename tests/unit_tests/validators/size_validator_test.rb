require 'test/unit'
require 'securerandom'
require_relative '../../../app/src/validators/size_validator.rb'

class SizeValidatorTest < Test::Unit::TestCase

  def test_constants
    assert_equal(Validators::SizeValidator.const_get(:NOT_NUMBER), 'Size should be a number')
    assert_equal(Validators::SizeValidator.const_get(:NOT_INTEGER), 'Size should be a integer')
    assert_equal(Validators::SizeValidator.const_get(:NOT_HIGTHER_THAN_ZERO), 'Size should be higher than zero')
  end

  def test_success_validation
    random_number = (1 + rand * 10).to_i
    validator_obj = Validators::SizeValidator.new(random_number)
    assert(validator_obj.valid?)
  end

  def test_not_number_validation
    bad_size = SecureRandom.hex
    validator_obj = Validators::SizeValidator.new(bad_size)
    assert(!validator_obj.valid?)
    assert(validator_obj.error_messages.include?(Validators::SizeValidator.const_get(:NOT_NUMBER)))
  end

  def test_not_integer_validation
    bad_size = rand
    validator_obj = Validators::SizeValidator.new(bad_size)
    assert(!validator_obj.valid?)
    assert(validator_obj.error_messages.include?(Validators::SizeValidator.const_get(:NOT_INTEGER)))
  end

  def test_not_higher_than_zer_validation
    bad_size = (1 + rand * 10).to_i * -1
    validator_obj = Validators::SizeValidator.new(bad_size)
    assert(!validator_obj.valid?)
    assert(validator_obj.error_messages.include?(Validators::SizeValidator.const_get(:NOT_HIGTHER_THAN_ZERO)))
  end
end
