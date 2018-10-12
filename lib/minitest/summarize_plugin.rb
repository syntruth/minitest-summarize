require 'minitest'

require_relative './summarize_reporter'

Minitest::SummarizeReporter.color!

# Update Minitest with Plugin data.
module Minitest
  def self.plugin_summarize_init(options)
    Minitest.reporter.reporters.clear

    io = options[:io]

    Minitest.reporter << SummarizeReporter.new(io)
  end
end
