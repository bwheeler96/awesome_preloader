class CreatePreloadableItemExamples < ActiveRecord::Migration
  def change
    create_table :preloadable_item_examples do |t|
      t.belongs_to :preload_writer_test, index: true, foreign_key: true
      t.integer :value

      t.timestamps null: false
    end
  end
end
