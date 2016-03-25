class FlipFormatter < RSpec::Core::Formatters::DocumentationFormatter
  METHODS = [:start, :example_started, :example_failed, :example_passed]
  RSpec::Core::Formatters.register self, *METHODS#:start, :example_started, :example_failed

  def initialize(output)
    @output = output
    super
  end

  def start(notification)

    @output << "\033[32m#{'¯\_(ツ)_/¯ HELLO '}\033[0m"#[@color_index%2] #<< notification.example.description
    super
  end
  def example_started(notification)
    @output << ' ┻━┻ ' #<< notification.example.description
    # super
  end

  def example_failed(notification)
    @output << 'AAARRGH ヽ(`Д´)ﾉ︵﻿ ┻━┻   '<< notification.example.description
    # @body
    super
  end

#   def example_passed(*)
#   # newline_or_addup
#   output.print " ".freeze, success_color(
#     "\u2714"
#   )
# end

  # def example_failed(failure)
  #   @failed_examples ||= []
  #   @failed_examples << failure
  # end
end


#   class FlipFormatter < RSpec::Core::Formatters::DocumentationFormatter
#     RSpec::Core::Formatters.register self, :example_passed, :example_pending, :example_failed
#   def initialize(output)
#     super(output)
#     @test_results = { :failures => [], :successes => [], :skipped => [] }
#   end
#
#   def example_passed(example)
#     super(example)
#     @test_results[:successes].push("hello")
#   end
#
#   def example_pending(example)
#     super(example)
#     @test_results[:skipped].push("example")
#   end
#
#   def example_failed(example)
#     super(example)
#     @test_results[:failures].push(example)
#   end
# end
