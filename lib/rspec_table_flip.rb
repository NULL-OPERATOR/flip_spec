class FlipFormatter < RSpec::Core::Formatters::DocumentationFormatter
  METHODS = [:start, :example_started, :example_failed, :example_passed]
  RSpec::Core::Formatters.register self, *METHODS#:start, :example_started, :example_failed

  def initialize(output)
    @output = output
    super
  end

  def start(notification)
    @output << '¯\_(ツ)_/¯ HELLO ' #<< notification.example.description
    super
  end
  def example_started(notification)
    @output << ' ┻━┻ ︵ヽ(`Д´)ﾉ︵﻿ ┻━┻  ' #<< notification.example.description
    # super
  end

  def example_failed(notification)
    @output << ' NOOOO'
    # @body
  end

  def example_passed(*)
  # newline_or_addup
  output.print " ".freeze, success_color(
    "\u2714"
  )
end

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
