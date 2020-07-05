class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.integer :member_id, null: false
      t.integer :article_id, null: false

      t.timestamps
    end
  end
end
