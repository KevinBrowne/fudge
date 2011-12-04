require 'spec_helper'
require 'fudge/exceptions/cli/command_not_found'

describe Fudge::Exceptions::Cli::CommandNotFound do
  subject { described_class.new :foo }

  it { should be_a StandardError }

  it "should take a command name as a parameter" do
    expect { described_class.new }.to raise_error ArgumentError
  end

  describe :to_s do
    it "should return a human readable description of the error" do
      subject.to_s.should == "No command found with name 'foo'"
    end
  end
end
