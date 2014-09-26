class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.integer :pulse_id
      t.string :name
      t.string :fullname
      t.string :address
      t.text :description

      t.timestamps
    end
  end
end
