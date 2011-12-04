require 'spec_helper'
require 'fudge/fudge_file/task_registry'

class TestInDirectoryTask
  attr_accessor :pwd
  def run
    self.pwd = FileUtils.pwd
  end
end
Fudge::FudgeFile::TaskRegistry.register(:test_in_directory, TestInDirectoryTask)

describe Fudge::FudgeFile::Tasks::InDirectory do
  subject { described_class.new 'spec' }
  it { should be_registered_as :in_directory }

  describe :initialize do
    it "should take a directory as first argument" do
      expect { described_class.new }.to raise_error ArgumentError
    end
  end

  describe :run do
    it "should change to the given directory and run child tasks" do
      subject.task :test_in_directory

      subject.run

      subject.tasks.first.pwd.should == File.expand_path('spec', FileUtils.pwd)
    end
  end
end
