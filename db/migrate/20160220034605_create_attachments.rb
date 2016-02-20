class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.string :name
      t.string :file
      t.integer :paper_id

      t.timestamps
    end
  end
end
