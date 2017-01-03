require 'test_helper'
require 'benchmark'

class WordListParserTest < ActiveSupport::TestCase
	test "slow method should return an array of results" do
	  parser = WordListParser.create(name: "test", wordlist: File.new(File.join(Rails.root, "wordlist.txt")))
          time = Benchmark.measure do
	    result = parser.process_word_list(6)
	  end
          $stdout.puts "SLOW: #{time}"
          assert !parser.result.nil? && parser.result.size > 0
	end

	test "fast method should return and array of results" do
	  parser = WordListParser.create(name: "test", wordlist: File.new(File.join(Rails.root, "wordlist.txt")))
          time = Benchmark.measure do
	    result = parser.quick_process_word_list(6)
	  end
	  $stdout.puts "FAST #{time}"
          assert !parser.result.nil? && parser.result.size > 0
	end
end
