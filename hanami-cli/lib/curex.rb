require "hanami/cli"

module Curex
  require "curex/version"

  class CLI
    def call(*args)
      Hanami::CLI.new(Commands).call(*args)
    end

    module Commands
      extend Hanami::CLI::Registry

      class Convert < Hanami::CLI::Command
        def call(*)
          puts "converting.."
        end
      end

      register "convert", Convert
    end
  end
end
