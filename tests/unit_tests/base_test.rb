require 'test/unit'
require_relative '../../app/src/base.rb'

class BaseTest < Test::Unit::TestCase

  def setup
    @base_obj = Base.new
  end

  def test_constants
    assert_equal(Base.const_get(:DEFAULT_FORMATTER).name, 'Formatters::DefaultFormatter')
    assert_equal(Base.const_get(:DEFAULT_SIZE), 10)
    assert_equal(Base.const_get(:NOT_VALID_SIZE), 'Not valid size')
  end

  def test_default_size
    assert_equal(@base_obj.instance_variable_get(:@size), Base.const_get(:DEFAULT_SIZE))
  end

  def test_default_formatter
    assert_equal(@base_obj.instance_variable_get(:@formatter), Base.const_get(:DEFAULT_FORMATTER))
  end

  def test_set_table_formatter
    @base_obj.set_table_formatter
    assert_equal(@base_obj.instance_variable_get(:@formatter).name, 'Formatters::TableFormatter')
  end

  def test_validation_success_with_defaults
    assert(@base_obj.send(:validate_size!))
  end

  def test_validation_failed
    @base_obj.size = -1
    exception = assert_raise do RuntimeError
      @base_obj.send(:validate_size!)
    end
    assert_equal(exception.message, Base.const_get(:NOT_VALID_SIZE))
  end

  def test_generate_table_raise_if_not_valid
    @base_obj.size = -1
    exception = assert_raise do RuntimeError
      @base_obj.generate_table
    end
    assert_equal(exception.message, Base.const_get(:NOT_VALID_SIZE))
  end

  def test_generate_table_when_success
    @base_obj.generate_table
    assert_kind_of(@base_obj.class, @base_obj.generate_table)
  end
end
