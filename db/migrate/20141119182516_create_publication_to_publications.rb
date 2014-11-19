class CreatePublicationToPublications < ActiveRecord::Migration
  def change
    create_table :publication_to_publications do |t|
      t.integer :publication_from_id
      t.integer :publication_to_id
    end
  end
end
