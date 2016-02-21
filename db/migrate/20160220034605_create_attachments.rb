class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.string :name
      t.string :description
      t.string :file
      t.integer :paper_id
      t.integer :downloads, default: 0

      t.timestamps
    end
  end
end
