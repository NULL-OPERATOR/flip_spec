require "stringio"
require_relative "../lib/flip_spec"

describe FlipFormatter do

  let(:output)    { StringIO.new }
  let(:formatter) { described_class.new(output) }
  let(:example)   { RSpec::Core::ExampleGroup.describe }

  before(:each) do
    formatter.start(2)
  end

  it "has a welcome message with cake" do
    output.seek(0)
    expect(output.read).to include "🍰  F 🍰  L 🍰  I 🍰  P  -   S 🍰  P 🍰  E 🍰  C 🍰"
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
end
