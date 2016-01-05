class CreatePreloadWriterTests < ActiveRecord::Migration
  def change
    create_table :preload_writer_tests do |t|

      t.timestamps null: false
    end
  end
end
