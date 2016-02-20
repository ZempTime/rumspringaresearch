class CreatePapers < ActiveRecord::Migration[5.0]
  def change
    create_table :papers do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
