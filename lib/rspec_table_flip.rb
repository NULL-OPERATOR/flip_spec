class FlipFormatter
  RSpec::Core::Formatters.register self, :example_started
#
# class CustomFormatter
#   # This registers the notifications this formatter supports, and tells
#   # us that this was written against the RSpec 3.x formatter API.
#   RSpec::Core::Formatters.register self, :example_started

  def initialize(output)
    @output = output
  end

  def example_started(notification)
    @output << "example: " << notification.example.description
  end
end



#   def initialize(output)
#     @output = output
#   end
#
#   def example_started(notification)
#     @output << "STAAAAAAARTING: " << notification.example.description
#   end
#
#   def example_passed(example)
#    super(example)
#    output.print("WASSUP ")
#  end

 # def example_pending(example)
 #   super(example)
 #   output.print(self.class::EMOJI[2] + " ")
 # end
 #
 # def example_failed(example)
 #   super(example)
 #   output.print("test test tesssst ")
 # end
# end
