# Add our customer reporter to the Minitest module.
module Minitest
  # Define our custom reporter.
  class SummarizeReporter < Minitest::StatisticsReporter
    SUMMARY_LABELS = {
      '.' => 'Passed:',
      'F' => 'Failed',
      'E' => 'Error:',
      'S' => 'Skipped:'
    }.freeze

    CODE_TO_COLOR = {
      '.' => :green,
      'F' => :red,
      'E' => :red,
      'S' => :blue
    }.freeze

    COLOR_CODE = {
      red:    31,
      green:  32,
      blue:   34,
      none:   0
    }.freeze

    STATS_FORMAT = 'Finished in %.6fs, %.4f runs/s, %.4f assertions/s.'.freeze

    def self.color!
      @color = true
    end

    def self.no_color!
      @color = false
    end

    def self.color?
      @color ||= true
    end

    def initialize(io)
      super io

      @io          = io
      @summary     = {}
      @last_length = 0

      SUMMARY_LABELS.keys.each { |key| @summary[key] = 0 }
    end

    def record(result)
      super

      code = result.result_code

      @summary[code] += 1

      summarize_clear

      @io.print generate_output
    end

    def report
      super

      io.puts "\n\n"
      io.puts statistics
      io.puts aggregated_results
      io.puts "\n\n"
    end

    def statistics
      format(STATS_FORMAT,
             total_time, count / total_time,
             assertions / total_time)
    end

    def aggregated_results
      filtered_results = results.sort_by { |result| result.skipped? ? 1 : 0 }

      filtered_results.each_with_index.map do |result, idx|
        color = result.skipped? ? :yellow : :red
        text  = format("\n%3d) %s", idx + 1, result)

        self.class.color? ? colorize(color, text) : text
      end.join + "\n"
    end

    def generate_output
      list = []

      SUMMARY_LABELS.each do |key, label|
        value = @summary[key]

        list.push format_string(key, label, value)
      end

      @last_format = list.join(' ')
      @last_length = @last_format.length

      @last_format + "\r"
    end

    def format_string(key, label, value)
      str = "#{label} #{value}"

      self.class.color? ? "[#{colorize_by_key(key, str)}]" : "[#{str}]"
    end

    def colorize_by_key(key, str)
      code = CODE_TO_COLOR[key]

      colorize(code, str)
    end

    def colorize(code, str)
      "\e[#{COLOR_CODE[code]}m#{str}\e[0m"
    end

    def summarize_clear
      @io.print ' ' * @last_length if @last_length
      @io.print "\r"
      @io.flush
    end
  end
end
