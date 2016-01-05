require 'test_helper'

include AwesomePreloader

class AwesomePreloaderTest < ActiveSupport::TestCase
	setup do 
		10.times do 
			writer = PreloadWriterTest.create()
			10.times do 
				writer.preloadable_item_examples.create!(value: rand(10))
			end
		end
	end
		

	test "truth" do
		assert_kind_of Module, AwesomePreloader
	end

	test "preloader does its job" do 
		writers = PreloadWriterTest.where("id IS NOT NULL").preloads(:sum_of_items_values)
		assert_writers writers
	end

	test "::preload(name) without block loads assciation" do 
		writers = PreloadWriterTest.preloads(:sum_of_items_values)
		assert_writers writers
	end	
	
	def assert_writers(writers)
		writers.each do |writer|
			assert_equal(writer.sum_of_items_values, writer.preloadable_item_examples.sum(:value))
		end
	end
end
