class FlipFormatter #< RSpec::Core::Formatters::DocumentationFormatter
  COLOURS = { red: 31, green: 32, blue: 34, magenta: 35, cyan: 36, bold: 1 }
  METHODS = [:start, :example_failed, :example_passed]
  # METHODS = [:start, :example_failed, :example_passed, :dump_summary]

  RSpec::Core::Formatters.register self, *METHODS

  def initialize(output)
    @output = output
    # super
  end

  def start(notification)
    @output << colour_text('🍰  F 🍰  L 🍰  I 🍰  P  -   S 🍰  P 🍰  E 🍰  C 🍰', 35) #[@color_index%2] #<< notification.example.description
  end

  def example_failed(notification)
    @output << colour_text(' (╯°□°)╯ ︵﻿ ┻━━┻  : ' + notification.example.description.upcase, 31)
  end

  def example_passed(notification)
    @output << colour_text('*･ﾟ✧  ┬──┬  ･*ﾟ✧･ : ' + notification.example.description.upcase, 32)
  end

  # def dump_summary(notification)
  #   duration = notification.duration
  #   summary = "\nFLIPPED OUT IN #{duration} SECONDS\n"
  #   output.puts colour_text(summary, 34)
  #   output.puts colour_text(notification.fully_formatted, 36)
  # end

  private

  def colour_text(string, colour)
    "\033[#{colour}m#{string}\033[0m\n"
  end

end
