class PreloadWriterTest < ActiveRecord::Base
	has_many :preloadable_item_examples

	attr_accessor :sum_of_items_values

	preloads :sum_of_items_values do |collection|
		items_values = PreloadableItemExample.where(preload_writer_test_id: collection.map(&:id)).group(:preload_writer_test_id).pluck(:preload_writer_test_id, 'SUM(value) as value').to_h
		collection.each do |item|
			item.sum_of_items_values = items_values[item.id]
		end
	end
end
