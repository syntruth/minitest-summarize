require 'minitest/autorun'

require_relative '../lib/minitest/summarize'

describe 'do some tests' do
  30.times do |i|
    it 'has some successes' do
      100.must_equal 100
    end
  end

  2.times do |i|
    it 'has some fails' do
      i.must_equal(i + 1)
    end
  end

  it 'has some skips' do
    3.times do |i|
      skip "Skip ##{i}"
    end
  end
end
