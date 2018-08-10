require 'test/unit'
require 'securerandom'
require_relative '../../app/src/help_printer.rb'

class HelpPrinterTest < Test::Unit::TestCase
  def setup
    @help_printer_obj = HelpPrinter.new
  end

  def test_constants
    help_text = <<-HELP
      Usage:
        ruby prime_multiplier.rb [-h] [--size table_size]
        -h, --help  Show this help
        -s, --size  the table size (default is 10) Should be higher than 0
        -pp         For pretty print mode on
    HELP
    assert_equal(HelpPrinter.const_get(:HELP_TEXT), help_text)
  end

  def test_default_help_message
    assert_equal(@help_printer_obj.help_message, HelpPrinter.const_get(:HELP_TEXT))
  end

  def test_assign_help_message
    message = SecureRandom.hex
    assert_equal(HelpPrinter.new(message).help_message, message)
  end
end
