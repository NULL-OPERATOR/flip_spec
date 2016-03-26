require "stringio"
require_relative "../lib/rspec_table_flip"

describe FlipFormatter do

  let(:output)    { StringIO.new }
  let(:formatter) { described_class.new(output) }
  let(:example)   { RSpec::Core::ExampleGroup.describe }

  before(:each) do
    formatter.start(2)
  end

  it "has a welcome message with cake" do
    output.seek(0)
    expect(output.read).to include "🍰  F 🍰  L 🍰  I 🍰  P 🍰"
  end


  context "passing, failing, pending" do

    describe "example passed" do
      before do
        formatter.example_passed(example)
        output.seek(0)
      end

      it "prints a passed sparkling table" do
        expect(output.read).to include "*･ﾟ✧  ┬──┬  ･*ﾟ✧･ : "
      end

      it "prints in green" do
        expect(output.read).to include "32m"
      end
    end

    describe "example failed" do
      before do
        formatter.example_failed(example)
        output.seek(0)
      end

      it "prints a flipped table" do
        expect(output.read).to include "(╯°□°)╯ ︵﻿ ┻━━┻  : "
      end

      it "prints in red" do
        expect(output.read).to include "31m"
      end
    end

    describe

  end

  # describe "tick" do
  #
  #   before do
  #     allow(@formatter).to receive(:current).and_return(1)
  #     allow(@formatter).to receive(:example_count).and_return(2)
  #     @formatter.tick
  #   end
  #
  #   it "should increment the current" do
  #     expect(@formatter.current).to eql(1)
  #   end
  #
  #   it "should store the marks in an array" do
  #     expect(@formatter.example_results).to include("=")
  #   end
  #
  # end

  # describe "rainbowify" do
  #
  #   it "should increment the color index count" do
  #     expect {
  #       @formatter.rainbowify("=")
  #     }.to change(@formatter, :color_index).by(1)
  #   end
  #
  # end

  # describe "highlight" do
  #
  #   it "should rainbowify passing examples" do
  #     expect(@formatter.highlight("=")).to eq("\e[38;5;154m-\e[0m")
  #   end
  #
  #   it "should mark failing examples as red" do
  #     expect(@formatter.highlight("*")).to eq("\e[31m*\e[0m")
  #   end
  #
  #   it "should mark pending examples as yellow" do
  #     expect(@formatter.highlight("!")).to eq("\e[33m!\e[0m")
  #   end
  #
  # end

  # describe "start" do
  #
  #   it "should set the total amount of specs" do
  #     expect(@formatter.example_count).to eq(2)
  #   end
  #
  #   it "should set the current to 0" do
  #     expect(@formatter.current).to eq(0)
  #   end
  #
  # end

  # describe "#format_duration" do
  #   it "should return just seconds for sub 60 seconds" do
  #     expect(@formatter.format_duration(5.3)).to eq("5.3 seconds")
  #   end
  #
  #   it "should remove that extra zero if it is not needed" do
  #     expect(@formatter.format_duration(1.0)).to eq("1 second")
  #   end
  #
  #   it "should plurlaize seconds" do
  #     expect(@formatter.format_duration(1.1)).to eq("1.1 seconds")
  #   end
  #
  #   it "add a minute if it is just over 60 seconds" do
  #     expect(@formatter.format_duration(63.2543456456)).to eq("1 minute and 3.25 seconds")
  #   end
  #
  #   it "should pluralize minutes" do
  #     expect(@formatter.format_duration(987.34)).to eq("16 minutes and 27.34 seconds")
  #   end
  # end
end
