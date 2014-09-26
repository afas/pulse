class CreatePublicationAttachments < ActiveRecord::Migration
  def change
    create_table :publication_attachments do |t|
      t.integer :publication_id
      t.string :title
      t.string :image

      t.timestamps
    end
  end
end
