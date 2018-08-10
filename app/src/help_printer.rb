class HelpPrinter
  HELP_TEXT = <<-HELP
      Usage:
        ruby prime_multiplier.rb [-h] [--size table_size]
        -h, --help  Show this help
        -s, --size  the table size (default is 10) Should be higher than 0
        -pp         For pretty print mode on
    HELP

  attr_reader :help_message

  def initialize(help_message=HELP_TEXT)
    @help_message = help_message
  end
end
