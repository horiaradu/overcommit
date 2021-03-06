# frozen_string_literal: true

module Overcommit::Hook::PrePush
  # Runs `rspec` test suite before push
  #
  # @see http://rspec.info/
  class RSpec < Base
    def run
      result = execute(command, live_output: config['live_output'])
      return :pass if result.success?

      output = result.stdout + result.stderr
      [:fail, output]
    end
  end
end
