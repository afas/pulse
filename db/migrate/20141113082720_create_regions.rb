class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.integer :number
      t.string :name
      t.integer :code
    end
  end
end
