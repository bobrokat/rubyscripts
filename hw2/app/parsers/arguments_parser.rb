class ArgumentsParser
  def parse
    arguments = {}

    print_usage_and_exit if ARGV.size.zero?

    arguments[:command] = ARGV[0] if ARGV.size > 0
    arguments[:date]    = ARGV[1] if ARGV.size > 1
    arguments[:text]    = ARGV[2..-1].join(" ") if ARGV.size > 2

    arguments
  end

  def print_usage_and_exit
    puts "Usage: task [add:list:remove] [today:tomorrow] Task text here"
    exit
  end
end
