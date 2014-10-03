class CreateServiceData < ActiveRecord::Migration
  def change
    create_table :service_data do |t|
      t.integer :publication_id
      t.string :title
      t.string :image
      t.timestamps
    end
  end
end
