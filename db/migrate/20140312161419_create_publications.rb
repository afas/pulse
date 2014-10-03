class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      # t.integer :scale
      t.integer :region
      t.string :address
      t.float :latitude
      t.float :longitude
      # t.datetime :date_start
      # t.datetime :date_end
      t.date :date_start
      t.time :time_start, :default => nil
      t.integer :author_id
      t.datetime :date_publish
      t.datetime :date_archive
      t.integer :publication_status, :default => 4
      t.integer :publisher_id
      t.integer :publication_type
      t.integer :category
      t.string :title
      t.string :subtitle
      t.text :body
      t.text :comment

      t.timestamps
    end
  end
end
