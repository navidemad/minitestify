require "minitestify"
require "minitestify/version"
require "minitestify/spec"
require "optparse"

module Minitestify
  module CLI
    module_function

    def run
      OptionParser
        .new do |parser|
          parser.banner = "Usage: minitestify [options] <spec_files>"

          parser.on("-v", "--version", "Print version") do |_v|
            puts(Minitestify::VERSION)
            exit
          end

          parser.on("-h", "--help", "Prints this help") do
            puts(parser)
            exit
          end
        end
        .parse!

      ARGV.each do |file|
        spec = Minitestify::Spec.new(file: file)
        puts("# #{spec.to_test_filepath}")
        puts(spec.to_test_code)
        puts
      end
    end
  end
end
