class CreateEntitiesPublications < ActiveRecord::Migration
  def change
    create_table :entities_publications do |t|
      t.integer :entity_id
      t.integer :publication_id
    end
  end
end
