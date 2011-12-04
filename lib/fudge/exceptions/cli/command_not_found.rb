module Fudge
  module Exceptions
    module Cli
      # An exception to show that the command was not found on the command line
      #
      class CommandNotFound < StandardError
        def initialize(command)
          @command = command
        end

        def to_s
          "No command found with name '#{@command}'"
        end
      end
    end
  end
end
